--- ---

<h2>API Version</h2>

Testing for Improper Assets Management is all about discovering unsupported and non-production versions of an API. Often times an API provider will update services and the newer version of the API will be available over a new path like the following:

-   api.target.com/v3
-   /api/v2/accounts
-   /api/v3/accounts
-   /v2/accounts
-   /api/accounts?ver=2

API versioning could also be maintained as a header:

-   _Accept: version=2.0_
-   _Accept api-version=3_

In these instances, earlier versions of the API may no longer be patched or updated. Since the older versions lack this support, they may expose the API to additional vulnerabilities. For example, if v3 of an API was updated to fix a vulnerability to injection attacks, then there are good odds that requests that involve v1 and v2 may still be vulnerable.

---
<h2>Finding</h2>

Discover vulnerabilities (old parametters) in API documentation and then adding those parameters to requests. Look for parameters involved in user account properties, critical functions, and administrative actions. 

Intercepting API requests and responses could also reveal parameters worthy of testing. Additionally, you can guess parameters or fuzz them in API requests that accept user input. I recommend seeking out registration processes that allow you to create and/or edit account variables.

- Tool
	Postman ---> Find and replace (Usefull to replace API Versions (ex)) --> Replace  {{Varible}}
		Simply create a new Environnement variable (environment mean for all categories)

---

<h2>Testing With Postman</h2>

Now we can start by fuzzing requests across the entire API for the presence of other versions. Then we will pivot to focusing our testing based on our findings. When it comes to Improper Assets Management vulnerabilities, it is always a good idea to test from both unauthenticated and authenticated perspectives.

###### - Example
1.  Understand the baseline versioning information of the API you are testing. Make sure to check out the path, parameters, and headers for any versioning information.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/S72WcsuQbeN8lqXzc46C_IAM1.PNG)  
      
    
2.  To get better results from the Postman Collection Runner, we’ll configure a test using the Collection Editor. Select the crAPI collection options, choose Edit, and select the Tests tab. Add a test that will detect when a status code 200 is returned so that anything that does not result in a 200 Success response may stick out as anomalous. You can use the following test:  

        pm.test("Status code is 200", function ()
       { pm.response.to.have.status(200); })  
 [](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/8vpiMIOTSJCbTvYQywkr_IAM2.PNG)`

4.  Run an unauthenticated baseline scan of the crAPI collection with the Collection Runner. Make sure that "Save Responses" is checked as seen below.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/jUdhPEQdQymPkG21pimA_IAM6.PNG)

5.  Review the results from your unauthenticated baseline scan to have an idea of how the API provider responds to requests using supported production versioning.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/z5SzbIF0RkGh5tcV9b4m_IAM5.PNG)

6.  Next, use "Find and Replace" to turn the collection's current versions into a variable. Make sure to do this for all versions, in the case of crAPI that means **v2** and **v3**. Type the current version into "Find", update "Where" to the targeted collection, and update "Replace With" to a variable.  
     ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/bGq8FL27ST25xkG7YL3n_IAM3.PNG)

7.  Open Postman and navigate to the environmental variables (use the eye icon located at the top right of Postman as a shortcut). _Note, we are using environmental variables so that this test can be accessed and reused for other API collections._ Add a variable named "ver" to your Postman environment and set the initial value to "v1". Now you can update to test for various versioning-related paths such as v1, v2, v3, mobile, internal, test, and uat. As you come across different API versions expand this list of variables.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/RVVSH2FOTtWszQ1LyPze_IAM4.PNG)

8.  Now that the environmental variable is set to **v1** use the collection runner again and investigate the results. You can drill down into any of the requests by clicking on them. The "check-otp" request was getting a 500 response before and now it is 404. It is worth noting the difference, but when a resource does not exist, then this would actually be expected behaviour.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/ejK6mnsHT7GbCJqiKBw2_IAM7.PNG)  
      
    
9.  If requests to paths that do not exist result in Success 200 responses, we’ll have to look out for other indicators to use to detect anomalies. Update the environmental variable to v2. Although most of the requests were already set to v2, it is worth testing because check-otp was previously set to v3.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/Z8MlwBtQ6FblK9HoA7Mg_IAM8.PNG)  
    Once again, run the collection runner with the new value set and review the results.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/DzWdP3b7QK6dDmS6R6nZ_IAM9.PNG)  
    The **/v2** request for **check-otp** is now receiving the same response as the original baseline request. Since the request for **/v1** received a _404 Not Found_, this response is really interesting. This is the discovery of an Improper Assets Management vulnerability, but what is the full impact?

10.  Investigating the password reset request further will show that an HTTP 500 error is issued using the /v3 path because the application has a control that limits the number of times you can attempt to send the one-time passcode (OTP). Sending too many requests to **/v3** will result in a different 500 response.  
    As seen from the browser:  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/eTYLZDY9R3GlBhLy40BY_IAM10.PNG)  

As seen from Postman:  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/MDRNJQk4SyaIByCujc77_IAM11.PNG)  
      
Sending the same request to /v2 also results in an HTTP 500 error, but the response is slightly larger. It may be worth viewing the two responses back in Burp Suite Comparer to see the spot differences. Notice how the response on   
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/B6dwiXPTKx625GCmMGg8_IAM12.PNG)  
      
    The /v2 password reset request responds with the body (left):  
    {"message":"Invalid OTP! Please try again..","status":500}  
      
    The /v3 password reset request responds with the body (right):  
    {"message":"ERROR..","status":500}  
      
The impact of this vulnerability is that /v2 does not have a limitation on the number of times we can guess the OTP. With a four-digit OTP, we should be able to brute force the OTP within 10,000 requests.

11.  To test this it is recommended that you use WFuzz, since Burp Suite CE will be throttled. First, make sure to issue a password reset request to your target email address. On the crAPI landing page select "Forgot Password?". Then enter a valid target email address and click "Send OTP".  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/6Broj7xNSDOqiZfFYtmA_IAM13.PNG)

12.  Now an OTP is issued and we should be able to brute force the code using WFuzz. By brute forcing this request, you should see the successful code that was used to change the target's password to whatever you would like. In the attack below, I update the password to "NewPassword1". Once you receive a successful response, you should be able to login with the target's email address and the password that you choose.
       
    `$ wfuzz -d '{"email":"hapihacker@email.com", "otp":"FUZZ","password":"NewPassword1"}' -H 'Content-Type: application/json' -z file,/usr/share/wordlists/SecLists-master/Fuzzing/4-digits-0000-9999.txt -u http://crapi.apisec.ai/identity/api/auth/v2/check-otp --hc 500`  
  
 [](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/RWgS2x0SRSdu2GfFgouz_IAM14.PNG)  
  
Within 10,000 requests, you’ll receive a 200 response indicating your victory. Congrats, on taking this Improper Assets Management vulnerability to the next level! Since we got sidetracked with this interesting finding during unauthenticated testing, I recommend returning to the crAPI collection and performing the same tests as an authenticated user.
