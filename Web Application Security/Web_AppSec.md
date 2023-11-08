# HTTP status codes:

#### HTTP status 200 – Successful
- The HTTP 200 OK success status response code indicates that the request has succeeded. A 200 response is cacheable by default. 
- The meaning of a success depends on the HTTP request method: GET : The resource has been fetched and is transmitted in the message body.

#### HTTP status 301 – Moved Permanently
- The HTTP 301 Moved Permanently redirect status response code indicates that the requested resource has been definitively moved to the URL given by the Location headers. A browser redirects to the new URL and search engines update their links to the resource.

#### HTTP status 302 – Found
- The HTTP 302 Found redirect status response code indicates that the resource requested has been temporarily moved to the URL given by the Location header. A browser redirects to this page but search engines don't update their links to the resource (in 'SEO-speak', it is said that the 'link-juice' is not sent to the new URL).

#### HTTP status 303 - See Other
- The HTTP 303 See Other redirect status response code indicates that the redirects don't link to the requested resource itself, but to another page (such as a confirmation page, a representation of a real-world object — see HTTP range-14 — or an upload-progress page). This response code is often sent back as a result of PUT or POST. The method used to display this redirected page is always GET.

#### HTTP status 304 - Not Modified
- The HTTP 304 Not Modified client redirection response code indicates that there is no need to retransmit the requested resources. It is an implicit redirection to a cached resource. This happens when the request method is a safe method, such as GET or HEAD, or when the request is conditional and uses an If-None-Match or an If-Modified-Since header.

#### HTTP status 400 - Bad Request
- The server can't process the request due to clientside errors.

#### HTTP status 401 – Unauthorized
- The 401-status code indicates that the HTTP request has not been applied because it lacks valid authentication credentials (usually username and password) for the target resource.
- If the request included authentication credentials, the 401 response indicates that authorization has been refused for those credentials. Please check if your username and password are correct.

#### HTTP status 403 – Forbidden
- This is a permissions issue. You often encounter this error when no index file (.htm, .html or .php) is present and the directory listing is off for a folder in the Web space (Line "Options -Indexes" in a .htaccess file).
- Sometimes user authentication was provided, but the authenticated user is not permitted to view the content of the folder or file. Other times the operation is forbidden to all users. Sometimes this error occurs if there are too many connections at the same time. The easyname support team can explain you this issue in depth.

#### HTTP status 404 - Not Found
- This error message is shown when a site or folder on a server are requested but cannot be found at the given URL. Please check your input.
- Please note that this error can also appear if there is no start file (index.php or index.html).

#### HTTP status 406 - Not Acceptable
- This error often occurs with the application firewall (mod_security). To protect against attacks on web applications, incoming and outgoing data traffic is checked for rule violations. If an action violates one of these rules, the corresponding IP address is temporarily blocked, and the user receives the status message "406 - Not Acceptable".
- The IP address is automatically unblocked after some time and access to the web application is then possible again. The time period depends on the severity of the violation.
- Another possibility to make it accessible again is to deactivate the application firewall. It can be deactivated either for the entire web hosting or only for individual subdomains.

#### HTTP Error 408 - Request Timeout
- The server took longer than its allocated timeout window. In this case the server terminates the connection.

#### HTTP status 429 - Too Many Requests
- The HTTP 429 Too Many Requests response status code indicates the user has sent too many requests in a given amount of time.
- A Retry-After header might be included to this response indicating how long to wait before making a new request.

#### HTTP status 500 - Internal Server Error
- This is a "catch all" status for unexpected errors. The server-side error message is commonly caused by eg. misconfigured .htaccess files or PHP errors, which you you can check in the file php_error.log on your Webhost.
- You can find the php_error.log file in the /log/ directory - this directory can be found on the same level as your /html/ directory

#### HTTP status 502 - Bad Gateway
- This HTTP status code indicates that under the specified URL there's no content to be displayed.

#### HTTP status 503 - Service unavailable
- This means, that the server is currently unavailable, or the server is overallocated. You can check the file php_error.log as described for the status code 500.

#### HTTP status 504 - Gateway timeout
- This means, that the server has not responded within the specified time period.


### Clickjacking detection
```
<!DOCTYPE html>
<html>
<head>
    <title>Clickjacking detection</title>
    <style>
        body {
            background-image: url(https://irp-cdn.multiscreensite.com/ee90ae2b/dms3rep/multi/stock-vector-hacked-glitched-abstract-digital-background-vector-illustration-761155144.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            text-align: center; 
        }

        h1 {
            font-family: "Courier New", Courier, monospace;
            color: red;
        }

        iframe {
            display: block; 
            margin: 0 auto; 
            width: 1200px; 
            height: 520px;
        }
    </style>
</head>
<body>
    <h1>This web application is vulnerable to clickjacking!</h1>
    <iframe src="https://gteksd.github.io"></iframe>
</body>
</html>
```
