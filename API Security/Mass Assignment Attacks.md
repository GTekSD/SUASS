--- ---

<h2>Mass Assignment vulnerabilities</h2>

Mass Assignment vulnerabilities are present when an attacker is able to overwrite object properties that they should not be able to (EX: adding parametters to the request). A few things need to be in play for this to happen. 

- An API must have requests that accept user input
- These requests must be able to alter values not available to the user,
- The API must be missing security controls that would otherwise prevent the user input from altering data objects. 

The classic example of a mass assignment is when an attacker is able to add parameters to the user registration process that escalate their account from a basic user to an administrator. The user registration request may contain key-values for username, email address, and password. An attacker could intercept this request and add parameters like "isadmin": "true". If the data object has a corresponding value and the API provider does not sanitize the attacker's input then there is a chance that the attacker could register their own admin account.

 example
	- ![[Pasted image 20221125192116.png]]

- Param Miner (Butp Suite Extension (Brute Froce to find parametters))
	- Go to you repeter request and select extension --> Param Miner and Wait for it to complete 
	- Possible to change dictionary (try other or custom (once you know name schema of param)






---

<h2>REVIEW</h2>
# Intro 

Mass Assignment vulnerabilities are present when an attacker is able to overwrite object properties that they should not be able to. A few things need to be in play for this to happen. An API must have requests that accept user input, these requests must be able to alter values not available to the user, and the API must be missing security controls that would otherwise prevent the user input from altering data objects. The classic example of a mass assignment is when an attacker is able to add parameters to the user registration process that escalate their account from a basic user to an administrator. The user registration request may contain key-values for username, email address, and password. An attacker could intercept this request and add parameters like "isadmin": "true". If the data object has a corresponding value and the API provider does not sanitize the attacker's input then there is a chance that the attacker could register their own admin account.

# Finding Mass Assignment Vulnerabilities

One of the ways that you can discover mass assignment vulnerabilities by finding interesting parameters in API documentation and then adding those parameters to requests. Look for parameters involved in user account properties, critical functions, and administrative actions.

Additionally, make sure to use the API as it was designed so that you can study the parameters that are used by the API provider. Doing this will help you understand the names and spelling conventions of the parameters that your target uses. If you find parameters used in some requests, you may be able to leverage those in your mass assignment attacks in other requests. 

You can also test for mass assignment blind by fuzzing parameter values within requests. Mass assignment attacks like this will be necessary when your target API does not have documentation available. Essentially, you will need to capture requests that accept user input and use tools to brute force potential parameters. I recommend starting out your search for mass assignment vulnerabilities by testing your target's account registration process if there is one. Account registration is normally one of the first components of an API that accept user input. Once registration has been tested then you will need to target other requests that accept user input. In the next few minutes, we will analyze our crAPI collection to see what other requests make for interesting targets.

The challenge with mass assignment attacks is that there is very little consistency in the parameters used between API providers. That being said, if the API provider has some method for, say, designating accounts as administrators, they may also have some convention for creating or updating variables to make a user an administrator. Fuzzing can speed up your search for mass assignment vulnerabilities, but unless you understand your target’s variables, this technique can be a shot in the dark. Let's target crAPI for mass assignment vulnerabilities.

# Testing Account Registration for Mass Assignment

Let's intercept the account registration request for crAPI.

1.  While using a browser, submit data for creating a new account. Enter your email and password into the form. Set FoxyProxy to proxy traffic to Burp Suite.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/bBPZiv9OQXe8IPvetw56_MA1.PNG)
2.  Submit the form to create an account and make sure the request was intercepted with Burp Suite.   
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/y4cAWxOLTCmWQglFjmSe_MA2.PNG)
3.  Send the intercepted request to Repeater. Before submitting any attacks, send a successful request to have a baseline understanding of how the API responds to an expected request.   
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/5Dx0FR19RG2qKhtyquOg_MA3.PNG)  
      
    
4.  Next, test the registration process for mass assignment. The simplest form of this attack is to upgrade an account to an administrator role by adding a variable that the API provider likely uses to identify admins. If you have access to admin documentation then there is a good chance that the parameters will be included in the registration requests. You can then use the discovered parameters to see if the API has any security controls preventing you from escalating a user account to an admin account. If you do not have admin docus, then you can do a simple test by including other key-values to the JSON POST body, such as:  
    "isadmin": true,  
    "isadmin":"true",  
    "admin": 1,  
    "admin": true,   
    Any of these may cause the API to respond in a unique way indicating success or failure.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/uyN67TJTNe36mLlcH6Tw_MA6.PNG)  
      
      
    
5.  Once you attempt to a mass assignment attack on your target, you will need to analyze how the API responds. In the case of crAPI, there is no unique response when additional parameters are added to the request. There are no indications that the user account was changed in any way. 
6.  Another way to test more options would be to send this over to Intruder and place attack positions around the new key and value that you want to test. In our case, this would be **isadmin** and **true**. Set the attack type to cluster bomb and add payloads for positions 1 and 2. Run this and review the results for anything unique.   
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/vO8TmsEPRwuXEImM3MNP_MA4.PNG)  
    In the case of crAPI, the registration process does not respond in any way that indicates it is vulnerable to mass assignment. There are several tools out there that can fuzz for mass assignment vulnerabilities, but since we are using Burp Suite it is worth checking out Param Miner.

# Fuzzing for Mass Assignment with Param Miner

1.  Make sure you have Param Miner installed as an extension to Burp Suite CE.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/1JzY2pCMQbmln51Omg3X_MA5.PNG)
2.  Right-click on a request that you would like to mine for parameters. Select Extensions > Param Miner > Guess params > Guess JSON parameter. Feel free to experiment with the other options!  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/O5NDlXkFScK12mcI3fYP_MA7.PNG)
3.  Set the Param Miner options that you would like and click OK when you are done. Check out the unofficial documentation for an additional explanation of the options ([https://github.com/nikitastupin/param-miner-doc](https://github.com/nikitastupin/param-miner-doc)).  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/Zmv85unbTMmSzlraULBg_MA8.PNG)
4.  Navigate back to Extender-Extensions and select Parm Miner. Next, select the Output tab and wait for results to populate this area.  
    ![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/5PtTnKVNQpez4cOTgdup_MA9.PNG)
5.  If any new parameters are detected, insert them back into the original request and fuzz for results.

# Other Mass Assignment Vectors

Mass assignment attacks go beyond making attempts to become an administrator. You could also use mass assignment to gain unauthorized access to other organizations, for instance. If your user objects include an organizational group that allows access to company secrets or other sensitive information, you can attempt to gain access to that group. In this example, we’ve added an "org" variable to our request and turned its value into an attack position we could then fuzz in Burp Suite:

```
POST /api/v1/register

--snip--

{

"username":"hAPI_hacker",

"email":"hapi@hacker.com",

"org": "§CompanyA§",

"password":"Password1!"

}
```

If you can assign yourself to other organizations, you will likely be able to gain unauthorized access to the other group’s resources. To perform such an attack, you’ll need to know the names or IDs used to identify the companies in requests. If the "org" value was a number, you could brute-force its value, like when testing for BOLA, to see how the API responds.

Do not limit your search for mass assignment vulnerabilities to the account registration process. Other API functions are capable of being vulnerable. Test other endpoints used for updating accounts, updating group information, user profiles, company profiles, and any other requests where you may be able to assign yourself additional access.

# Hunting for Mass Assignment

As with many other API attacks, we will start hunting for this vulnerability by analyzing the target API collection. Remember, mass assignment is all about binding user input to data objects. So, when you analyze a collection that you are targeting you will need to find requests that:

-   Accept user input
-   Have the potential to modify objects

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/jNSLM1n3RonguO5mcPtP_MA10.PNG)

After reviewing the crAPI collection, two requests stick out to me as interesting. 

**POST /workshop/api/merchant/contact_mechanic**

**POST /workshop/api/shop/orders**

Both of these requests involve user input and have the potential to modify objects.

Similar to authorization testing, I recommend creating a new collection just for mass assignment testing. This way we can test out interesting requests without damaging the original collection. Make sure when duplicating requests to update unresolved variables. 

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/xcmJPdWT2WVNq0P4FOQ2_MA11.PNG)

 You can update unresolved variables at the collection level or by selecting "Add new variable". In this case, add the base URL variable value and select the collection that this is relevant to.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/jCYGcViJTxalESgrS8Gc_MA12.PNG)

Get a better understanding of the requests that you've targeted. Once again, use the API as it was intended. Sometimes the scope of an API security test can be so large that it helps to be reminded of the purpose of a single request. If it is not clear from the perspective of the API collection, then it can be helpful to return to the web app.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/IV6jxOZtTD6uXPvuNLSc_MA13.PNG)

When we return to the web app and intercept the requests involved with the workshop, we see that the **POST /workshop/api/shop/orders** request is involved in the process used for purchasing products from the crAPI store. This request is even more interesting now that we know what an important role it plays for the target organization.   

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/ZbAjAnXSTi6rDATrXIIP_MA14.PNG)

Again, we can attempt to guess key values to use in this attack or use Param Miner. Try this out. Unfortunately, neither attempts come up interesting. Although we do not have documentation for crAPI, we can learn more about "product_id" in other requests. Another request that is involved in the workshop store is **GET /workshop/api/shop/products**.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/z6H4v34wSeOQ9HW7R5uG_MA16.PNG)

Checking this request out reveals the full catalog of store products along with the product id, name, price, and image URL. If we could submit user data to products there would be a great opportunity to leverage a mass assignment attack. If we were able to submit data here we would be able to create our own products with our own prices. However, this request uses the GET method and is only for requesting data not altering it. Well, how do the crAPI administrators manage the products page? Perhaps they use PUT or POST to submit products to this endpoint and it wouldn't be the first time that we have discovered a BFLA vulnerability with this target. Always try to leverage vulnerability findings in other requests when testing a target organization. Chances are if the secure development practices of an organization fall short in one aspect of the application, they likely fall short in other areas.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/RzVK3nP5TPmwWjCrm5bN_MA17.PNG)

Sending a POST request to /workshop/api/shop/products yields very interesting results! The API responds with suggested fields for a POST request, which is an indication that this request is vulnerable to BFLA. If we are able to submit requests to alter or create store products, then we will be able to confirm that it is also vulnerable to mass assignment.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/8sTs3qtSSLa4fBKwXYsQ_MA18.PNG)

The request to add our own product is successful! The API responds with Status 200 and the information that was submitted. We can also navigate tot he web app to verify our results.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/coDWlXwyRzGhEjTNi0YZ_MA19.PNG)

So, we can create our own product items, but how can we exploit this vulnerability to the next level? What if we were to make the price a negative number?![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/CiyWHFk0TMqY9yBUvaFp_MA20.PNG)

The API responds back with a new product that has a negative value for the price. If we go back and purchase this item now, we should see a pretty great proof of concept for this exploit in the form of a new account balance.

![](https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/site/2147573912/products/vqKr7wjqRLqbHC8ikmQ4_MA21.PNG)

Congratulations on exploiting a mass assignment vulnerability! This one took experimentation, pivoting, and combining weaknesses discovered in other areas of the API. This level of analysis and effort to exploit an API vulnerability is what will help you level up your API hacking skills.
