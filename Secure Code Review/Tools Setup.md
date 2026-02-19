# SonarQube Community Edition – Windows Setup Guide (Updated 2026)

### Prerequisites

- **Java** → JDK 21 or later (required for SonarQube server in recent versions)  
  Download: [Oracle JDK 21 (Windows x64)](https://download.oracle.com/java/21/archive/jdk-21_windows-x64_bin.exe)  
  *Tip*: Install and add to PATH (or use embedded scanner JRE if using recent SonarScanner).

- **SonarQube Community Edition** → Download ZIP  
  Official page: [SonarQube Downloads](https://www.sonarsource.com/products/sonarqube/downloads/)  
  → Select **Community Build** (free & open-source)

- **SonarScanner CLI** → Download ZIP (recommended: version with embedded JRE)  
  Official docs: [SonarScanner CLI](https://docs.sonarsource.com/sonarqube-server/analyzing-source-code/scanners/sonarscanner)  
  Direct Windows x64: https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-8.0.1.6346-windows-x64.zip (or latest)

### Step-by-Step Installation (Windows)

1. **Download & Extract**

   - Download SonarQube ZIP → extract to:  
     Recommended: `C:\sonarqube` or `C:\TOOLS\sonarqube`  
     **Avoid**: `C:\Program Files` (permission issues with Elasticsearch & logs)

   - Download SonarScanner CLI ZIP → extract to:  
     Recommended: `C:\sonarqube` or `C:\TOOLS\sonarqube`

2. **Add to System PATH (so commands work from anywhere)**

   Add these folders to your **Environment Variables** → System → Path:

   | Path Example                                      | Purpose                          |
   |---------------------------------------------------|----------------------------------|
   | `C:\sonarqube\bin\windows-x86-64`                 | SonarQube server (StartSonar.bat)|
   | `C:\sonarqube\bin`                                | SonarScanner CLI                 |

   *Restart terminal/CMD* after updating PATH.

3. **Optional: Basic Configuration**

   Edit file:  
   `C:\sonarqube\conf\sonar.properties`

   Common settings (uncomment / add):

   ```properties
   # Web port (default is 9000)
   sonar.web.port=9000

   # Optional: change login message, ports, etc.
   # sonar.web.host=0.0.0.0
   # sonar.search.javaOpts=-Xmx512m
   ```

   Save file.

4. **Start SonarQube Server**

   Option A (recommended if PATH set):
   ```cmd
   StartSonar.bat
   ```

   Option B (direct):
   ```cmd
   cd C:\sonarqube\bin\windows-x86-64
   StartSonar.bat
   ```

   - Watch console logs (Elasticsearch starts, server initializes)  
   - Takes 30–90 seconds on first run

5. **Verify Server is Running**

   Open browser:  
   **http://localhost:9000**

   Default credentials:  
   - Username: `admin`  
   - Password: `admin`

   → You will be prompted to change the password immediately.

### Analyzing Your First Project

1. **Create Project in UI**

   - Login → Click **Create Project** (or + button)
   - **Project display name**: e.g., `Test` or `Vulnerable-Code-Examples`
   - **Project key**: e.g., `test` or `vulnerable-code` (unique, lowercase recommended)
   - Choose **Locally**
   - Generate token:  
     Token name: e.g., `Analyze Test`  
     Expires: 30 days (or custom)  
     → Copy token (example: `sqp_7cdc606081b7a436eb01b5f087ae9c27c7d4b67c`)

2. **Run Analysis (from your project folder)**

   Navigate to your code folder, e.g.:
   ```cmd
   cd C:\vulnerable-code-examples-main
   ```

   Run (replace with your values):
   ```cmd
   sonar-scanner.bat ^
     -D"sonar.projectKey=Test" ^
     -D"sonar.sources=." ^
     -D"sonar.host.url=http://localhost:9000" ^
     -D"sonar.token=sqp_7cdc606081b7a436eb01b5f087ae9c27c7d4b67c"
   ```

   - Use `^` for line continuation in CMD  
   - Or write as one line

   Alternative (cleaner): Create `sonar-project.properties` in project root:

   ```properties
   sonar.projectKey=Test
   sonar.sources=.
   sonar.host.url=http://localhost:9000
   sonar.token=your_token_here
   ```

   Then just run:
   ```cmd
   sonar-scanner.bat
   ```

### Troubleshooting

- Server won't start? → Check logs in `C:\sonarqube\logs`  
  Common: Java version mismatch, port 9000 in use, insufficient RAM (give 4GB+ free)
- Scanner errors? → Ensure Java 21+ or use embedded-JRE version of scanner
- Permission denied? → Run CMD as Administrator or avoid protected folders
- Analysis slow? → Small projects first; increase heap if needed
