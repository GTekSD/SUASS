# HTTP in Detail

### HTTP|S = HyperText Transfer Protocol | Secure

HTTPS is the secure version of HTTP. HTTPS data is encrypted so it not only stops people from seeing the data you are receiving and sending, but it also gives you assurances that you're talking to the correct web server and not something impersonating it.

#### `http://user:password@example.com:80/artist?id=1#art4`

* **Scheme**: (http) This instructs on what protocol to use for accessing the resource such as HTTP, HTTPS, FTP (File Transfer Protocol).

* **User**: (user:password) Some services require authentication to log in, you can put a username and password into the URL to log in.

* **Host**: (example.com) The domain name or IP address of the server you wish to access.

* **Port**: (80) The Port that you are going to connect to, usually 80 for HTTP and 443 for HTTPS, but this can be hosted on any port between 1 - 65535.

* **Path**: (/artist) The file name or location of the resource you are trying to access.

* **Query String**: (?id=1) Extra bits of information that can be sent to the requested path. For example, /blog?id=1 would tell the blog path that you wish to receive the blog article with the id of 1.

* **Fragment**: (#art4) This is a reference to a location on the actual page requested. This is commonly used for pages with long content and can have a certain part of the page directly linked to it, so it is viewable to the user as soon as they access the page.

### HTTP methods
HTTP methods are a way for the client to show their intended action when making an HTTP request. There are a lot of HTTP methods but we'll cover the most common ones, although mostly you'll deal with the GET and POST method.

**GET Request** : 
This is used for getting information from a web server.

**POST Request** : 
This is used for submitting data to the web server and potentially creating new records

**PUT Request** : 
This is used for submitting data to a web server to update information

**DELETE Request** : 
This is used for deleting information/records from a web server.


### HTTP Status Codes:

In the previous task, you learnt that when a HTTP server responds, the first line always contains a status code informing the client of the outcome of their request and also potentially how to handle it. These status codes can be broken down into 5 different ranges:

100-199 - Information Response : These are sent to tell the client the first part of their request has been accepted and they should continue sending the rest of their request. These codes are no longer very common.

200-299 - Success : This range of status codes is used to tell the client their request was successful.

300-399 - Redirection : These are used to redirect the client's request to another resource. This can be either to a different webpage or a different website altogether.

400-499 - Client Errors : Used to inform the client that there was an error with their request.

500-599 - Server Errors : This is reserved for errors happening on the server-side and usually indicate quite a major problem with the server handling the request.

#### Common HTTP Status Codes:

There are a lot of different HTTP status codes and that's not including the fact that applications can even define their own, we'll go over the most common HTTP responses you are likely to come across:

200 - OK : The request was completed successfully.

201 - Created : A resource has been created (for example a new user or new blog post).

301 - Moved Permanently : This redirects the client's browser to a new webpage or tells search engines that the page has moved somewhere else and to look there instead.

302 - Found : Similar to the above permanent redirect, but as the name suggests, this is only a temporary change and it may change again in the near future.

400 - Bad Request : This tells the browser that something was either wrong or missing in their request. This could sometimes be used if the web server resource that is being requested expected a certain parameter that the client didn't send.

401 - Not Authorised : You are not currently allowed to view this resource until you have authorised with the web application, most commonly with a username and password.

403 - Forbidden : You do not have permission to view this resource whether you are logged in or not.

405 - Method Not Allowed : The resource does not allow this method request, for example, you send a GET request to the resource /create-account when it was expecting a POST request instead.

404 - Page Not Found : The page/resource you requested does not exist.

500 - Internal Service Error : The server has encountered some kind of error with your request that it doesn't know how to handle properly.

503 - Service Unavailable : This server cannot handle your request as it's either overloaded or down for maintenance.


### Headers 
Headers are additional bits of data you can send to the web server when making requests.

Although no headers are strictly required when making a HTTP request, you’ll find it difficult to view a website properly.

#### Common Request Headers

﻿These are headers that are sent from the client (usually your browser) to the server.

Host: Some web servers host multiple websites so by providing the host headers you can tell it which one you require, otherwise you'll just receive the default website for the server.

User-Agent: This is your browser software and version number, telling the web server your browser software helps it format the website properly for your browser and also some elements of HTML, JavaScript and CSS are only available in certain browsers.

Content-Length: When sending data to a web server such as in a form, the content length tells the web server how much data to expect in the web request. This way the server can ensure it isn't missing any data.

Accept-Encoding: Tells the web server what types of compression methods the browser supports so the data can be made smaller for transmitting over the internet.

Cookie: Data sent to the server to help remember your information (see cookies task for more information).

Common Response Headers

These are the headers that are returned to the client from the server after a request.

Set-Cookie: Information to store which gets sent back to the web server on each request (see cookies task for more information).

Cache-Control: How long to store the content of the response in the browser's cache before it requests it again.

Content-Type: This tells the client what type of data is being returned, i.e., HTML, CSS, JavaScript, Images, PDF, Video, etc. Using the content-type header the browser then knows how to process the data.

Content-Encoding: What method has been used to compress the data to make it smaller when sending it over the internet.


