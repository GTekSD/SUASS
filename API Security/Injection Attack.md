--- ---

<h2>Injection Attack</h2>

Fuzzing APIs is the process of sending various types of input to an endpoint to provoke an unintended response. The payloads used for fuzzing include symbols, numbers, system commands, SQL queries, NoSQL queries, emojis, hexadecimal, boolean statements, and more. Essentially, you want any payload that the API may not be programmed to handle to cause the API to send a verbose response or to cause the application to behave adversely. If an endpoint does not sanitize or validate user input then the right payload could cause a verbose response, a delay in processing time, an internal server error, or an error with the database.

You should attempt fuzzing against all potential inputs and especially within the following:

-   Headers
-   Query string parameters
-   Parameters in POST/PUT requests

After sending your fuzzing requests, search for responses that contain a verbose error message or some other failure to properly handle the request. In particular, look for any indication that your payload bypassed security controls and was interpreted as a command, either at the operating system, programming, or database level. This response could be as obvious as a message such as “SQL Syntax Error” or something more subtle like taking a little more time to process a request (SLEEP).

---

<h2>Discovering Injection Vulnerabilities</h2>

Start by casting a wide net across an entire API and then narrow in the focus of your attack. In this module, we will use Postman to fuzz wide across the entire API collection, and then we will use Burp Suite along with Wfuzz to fuzz deep into individual requests. Fuzzing is all about requesting the unexpected. When reviewing API documentation, if the API is expecting a certain type of input (number, string, boolean value) send:

-   A very large number
-   A very large string
-   A negative number
-   A string (instead of a number or boolean value)
-   Random characters
-   Boolean values
-   Meta characters

By sending over this input we are testing the limits of the target's input validation. If a certain type of input causes a verbose error or causes a delayed response then you could be on the trail of an injection vulnerability.

---

<h2>SQL Injection Metacharacters</h2>

SQL Metacharacters are characters that SQL treats as functions rather than data.

SQL injection, allows a remote attacker to interact with the application’s backend SQL database. With this access, an attacker could obtain or delete sensitive data

When looking for requests to target for database injections, seek out those that allow client input and can be expected to interact with a database. Here are some SQL metacharacters that can cause some issues:

```
'
''
;%00
--
-- -
""
;
' OR '1
' OR 1 -- -
" OR "" = "
" OR 1 = 1 -- -
' OR '' = '
OR 1=1
```

All of these symbols and queries are meant to cause problems for SQL queries. A null byte like ;%00 could cause a verbose SQL-related error to be sent as a response. The OR 1=1 is a conditional statement that literally means “or the following statement is true,” and it results in a true condition for the given SQL query. Single and double quotes are used in SQL to indicate the beginning and ending of a string, so quotes could cause an error or a unique state. Imagine that the backend is programmed to handle the API authentication process with a SQL query like the following, which is a SQL authentication query that checks for username and password:

```
SELECT * FROM userdb WHERE username = 'hAPI_hacker' AND password = 'Password1!'
```

The query retrieves the values hAPI_hacker and Password1! from the user input. If, instead of a password, we supplied the API with the value ' OR 1=1-- -, the SQL query might instead look like this:

```
SELECT * FROM userdb WHERE username = 'hAPI_hacker' OR 1=1-- -
```

This would be interpreted as selecting the user with a true statement and skipping the password requirement, as it has been commented out. The query no longer checks for a password at all, and the user is granted access. The attack can be performed to both the username and password fields. In a SQL query, the dashes (--) represent the beginning of a single-line comment. This turns everything within the following query line into a comment that will not be processed. Single and double quotes can be used to escape the current query to cause an error or to append your own SQL query.

---

# NoSQL Injection

APIs commonly use NoSQL databases due to how well they scale with the architecture designs common among APIs. Also, NoSQL injection techniques aren’t as well-known as their structured counterparts. Due to this one small fact, you might be more likely to find NoSQL injections.

As you hunt, remember that NoSQL databases do not share as many commonalities as the different SQL databases do. NoSQL is an umbrella term that means the database does not use SQL. Therefore, these databases have unique structures, modes of querying, vulnerabilities, and exploits. Practically speaking, you’ll conduct many similar attacks and target similar requests, but your actual payloads will vary. The following are common NoSQL metacharacters you could send in an API request to manipulate the database:

```
$gt 
{"$gt":""}
{"$gt":-1}
$ne
{"$ne":""}
{"$ne":-1}
$nin
{"$nin":1}
{"$nin":[1]}
{"$where":  "sleep(1000)"}
```

$gt is a MongoDB NoSQL query operator that selects documents that are greater than the provided value. The $ne query operator selects documents where the value is not equal to the provided value. The $nin operator is the “not in” operator, used to select documents where the field value is not within the specified array. Many of the others in the list contain symbols that are meant to cause verbose errors or other interesting behavior, such as bypassing authentication or waiting 10 seconds.

---

<h2>OS Injection</h2>

Operating system command injection is similar to the other injection attacks we’ve covered in this chapter, but instead of, say, database queries, you’ll inject a command separator and operating system commands. When you’re performing operating system injection, it helps a great deal to know which operating system is running on the target server. Make sure you get the most out of your Nmap scans during reconnaissance in an attempt to glean this information.

Characters such as the following all act as command separators, which enable a program to pair multiple commands together on a single line. If a web application is vulnerable, it would allow an attacker to add command separators to existing command and then follow it with additional operating system commands:

```
|
||
&
&&
'
"
;
'"
```

If you don’t know a target’s underlying operating system, put your API fuzzing skills to work by using two payload positions: one for the command separator followed by a second for the operating system command. The table below is a small list of potential operating system commands to use.

**Common Operating System Commands to Use in Injection Attacks**
```
Operating system

#Windows
ipconfig ---> shows the network configuration
dir      ---> prints the contents of a directory
ver      ---> prints the operating system and version
whoami   ---> prints the current user

#Linux
ifconfig ---> shows the network configuration
ls       ---> prints the contents of a directory
pwd      ---> prints the current working directory
whoami   ---> prints the current user
```

---

# Fuzzing Wide with Postman

Since there are so many places for an injection vulnerability to hide it helps to cast a wide net across a collection for weaknesses with Postman and then transition to other tools. We will be testing so many requests that I recommend duplicating the entire collection so that we can add variables throughout the collection.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/aA6AoJ0QzWfh0DK1k32g_Injection2.PNG)

I have renamed the duplicate collection to crAPI_Swagger Fuzz. We can create a fuzzing environment that can be reused from one collection to another.

---

<h2>Injection Targets</h2>

For injection targets, we will begin by casting a wide net and seeing which requests respond in interesting ways. Let's target many of the requests that include user input. With this in mind, I have selected the following requests.

-   PUT videos by id
-   GET videos by id
-   POST change-email
-   POST verify-email-token
-   POST login
-   GET location
-   POST check-otp
-   POST posts
-   POST validate-coupon
-   POST orders

- Example
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/sDzM7qtWSvKa6BNRL8K1_Injection8.PNG)
	
	In this baseline, we can see that there were:
	
	-   **Three** 200 Success responses
	-   **Three** requests received 500 Internal Server Error
	-   **Three** 404 Not Found
	-   **One** 403 Forbidden
	
	You can explore the variety of reasons that each response was sent, but if you have well-formed requests then proceed. Now that we have a baseline, let's update our environment with some fuzzing variables. 
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/Wpg8VfVJS5S3LRwUW2j6_Injection4.PNG)
	
	Now depending on information from reconnaissance, you may want to start with a specific fuzzing variable. However, it is easy enough to update the values of the variables, so I will stick with {{fuzz}}. Now go through the requests that you are targeting and add fuzzing variables where user input is found.
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/DJAB2Nl4Rz6i5UCMKth0_Injection3.PNG)
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/9oUm8Qz7SZmlPcrByvHC_Injection7.PNG)
	
	Now run the collection with the fuzz variable set throughout the targeted requests and investigate the results for anomalies.
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/scIfFU2ROa1TEWl8uU4L_Injection9.PNG)
	
	In this test the total count was:
	
	-   **One** 200 Success
	-   **Four** 500 Internal Server Error
	-   **Three** 404 Not Found
	-   **One** 400 Bad Request
	
	In this case, one request passed which should be interesting enough to explore the response. Sure enough, the community request did not have any issues, and posted the fuzzing variables in a community post. Also, make sure to explore the "Failed" results for anything anomalous or interesting. In the case of fuzzing you could find a verbose error message. Reviewing these results did not come up with anything interesting. Next, we will repeat this process with updated fuzzing variables. 
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/wz5nfYTTy2CgMDpggVJs_Injection10.PNG)
	
	Simply update the current value of fuzz with a new test, then use the collection runner, and review the results for anomalies.
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/AKQonp3dRciEz9BsvvFP_Injection11.PNG)
	
	Sure enough, we see very similar results. In this test the total count was:
	
	-   **One** 200 Success
	-   **Four** 500 Internal Server Error
	-   **Two** 404 Not Found
	-   **Three** 400 Bad Request
	
	The community post was successful while the others failed in similar ways. There was some deviation in the number of 400 Bad Requests, but after investigating those results the responses were expected. This is exactly what you would hope to see, a new baseline developing. When we fuzz with certain types of input the application behaves in an expected way. Therefore, if we see update our fuzz variable to the right value then any changes will be much more obvious. Up to this point, we have tried a SQL injection test and an OS injection test. Let's try a NoSQL injection test.
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/5GA2lmARRM6hok5xwtDy_Injection13.PNG)
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/sjMMlvTxTHKeqmORhwMZ_Injection14.PNG)
	
	At first glance, this test is slightly different. The community post was not successful and upon reviewing the failed results we see the count has changed:
	
	-   **One** 500 Internal Server Error
	-   **Eight** 400 Bad Request
	-   **One**  422 Unprocessable Entity
	
	The variation in the results here is worthy of investigation, especially with the new response. First, the request to the forum that was successful is now a 400 with the response body,
	
	{"error": "invalid character '$' after object key:value pair"}
	
	The POST validate-coupon request has the 422 Unprocessable Entity response and also contains the same error in the response body.
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/EojSxlYpQaW4xVdUgQrw_Injection15.PNG)
	
	These two requests are worth exploring further in Burp Suite. Proxy these two requests to Burp Suite and send the captured requests to Intruder.
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/file-uploads/site/2147573912/products/1347bf6-6115-120-45b2-bbb4ffab3352_injection18.PNG)
	
	Using Intruder, update the attack positions for the two requests that you are targeting. 
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/file-uploads/site/2147573912/products/7fca450-53ab-b1e-af13-6fa13fc6f2_injection17.PNG)
	
	Since the NoSQL payload was the one that triggered an anomaly, update Intruder with a NoSQL payload list. Try this attack with Payload Encoding turned on/off to see if you notice a difference in the responses. Send the attack.
	
	![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/file-uploads/site/2147573912/products/fb4e86a-2de2-1b6d-44ea-ef52402f3a_injection19.PNG)
	
	Now we are receiving several "200 Success" responses and we have obtained valid coupon codes for sending true statements to the database. We have successfully exploited a NoSQL vulnerability! Next, let's check out how this would be performed with WFuzz.
