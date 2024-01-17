# API (Applications Programming Interface)

API (Applications Programming Interface) penetration test is a security evaluation conducted by an external pentester to detect vulnerabilities that may exist in API integrations due to incorrect business logic, core programming issues etc, often by using the same techniques and methodology as a real-world attacker.

## Passive Reconnaissance:
- Use Google Dorking for ex:
  - intitle:”api” site:”coinebase.com”
  - inurl:”/api/v1” site:”microsoft.com”
  - intitle:json site:ebay.com
- Use GitHub Dorking for ex:
  - api key exposed
  - extension:json nasa
  - shodn_api_key
  - “authorization: Bearer”
  - filename:swagger.json
- Use Shadon.io for ex:
  - “content-type: application/json”
  - “wp-json”

## Findings
  - Potential SQL Injection
  - Insecure Direct Object References (IDOR)
  - SMS Bombing
  - Unauthorised User Can Add Notes
  - Unauthorised user can cancel order
  - Successful Phishing Attack
  - Sensitive PII Data Exposure through IDOR
  - OTP Flooding
  - Host Header Injection
  - Improper Authorization
  - No Order Rate Limit
  - No Input Validation
  - OPTIONS Method Enabled
  - Sensitive PII Data Passed in JWT Token
  - Access Control Allow Origin Not Defined
  - No Character Limit
  - Sensitive Data Exposure in JWT Token
  - Security Headers are Missing
  - Cookie Path Set to Root
  - Server Information Disclosure
  - Misconfigured CORS
  - Vulnerable Framework Version Disclosure 
  - Internal IP Disclosure 
  - Improper Error Handling
  - No Token Expiry
