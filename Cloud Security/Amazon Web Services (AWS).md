# EXERCISE 1: IMPLEMENT AWS IDENTITY AND ACCESS MANAGEMENT
Amazon Web Services (AWS) provides on-demand cloud computing services to individuals, organizations, the government, etc. on a pay-per-use basis.
AWS IAM enables security professionals to control access to AWS services and resources securely. It allows establishment of access rules and permissions for specific users and applications. It controls who is authenticated (signed in) and authorized (has permissions) for resource access. This helps security professionals assign role-based access control for accessing critical information within the enterprise.

### OBJECTIVE
This lab will demonstrate how to create an IAM group and IAM user, attach a policy to the user, and enable Multi-Factor Authentication (MFA)
that enables adding two-factor authentication for individual users in order to ensure additional security for the user accounts in AWS.
In this lab, you will learn to do the following:
 - Create IAM Group in AWS
 - Create IAM User in AWS
 - Assign permission policy to user
 - Create custom IAM policy in AWS
 - Enable MFA

### OVERVIEW OF IAM
IAM enables role-based access control for accessing critical information within the enterprise. It comprises business processes, policies, and technologies that allow monitoring electronic or digital identities. IAM provides tools and technologies to regulate user access (creating, managing, and removing access) to systems or networks based on the roles of individual users within the enterprise. Organizations generally prefer all-in-one authentication, which can be extended to Identity Federation. Identity Federation includes IAM with single sign-on (SSO) and centralized Active directory (AD) account for secure management. For the root user account of cloud, and its associated user accounts, MFA is enabled. MFA is used to control access to Cloud Service APIs. However, the best option is choosing either Virtual MFA or a hardware device.

Note: Before starting this exercise, you should create an AWS account using the following: https://portal.aws.amazon.com/billing/signup. Once the registration is completed, perform the following tasks.

### TASKS

 1. Open the link https://aws.amazon.com/ into the browser.
 2. The AWS Web Services - Cloud Computing Services page appears. Click on AWS Management Console from the My Account drop-down menu as shown in the screenshot below.
    ![1](https://github.com/GTekSD/SUASS/assets/55411358/5d397059-4f1b-47c2-8b9e-388c3af2145e)
 3. The AWS Web Services Sign-in page appears. Type the AWS administrator account ID and click on Next. Note: In the next window, type the characters seen in the image and click on submit.
 4. In the Password field, type the password, and click on Sign-in.
 5. Select Services from the menu bar and click on IAM under the Security, Identity, & Compliance section.
 6. The Welcome to the Identity and Access Management (IAM) page appears. Click on User groups in the left pane under Access management.
 7. Now, click on Create group.
 8. In the Create user group section, type the group name in the User group name field (here, the group name is Testing_Group).
 9. In the Create user group section, type the group name in the User group name field (here, the group name is Testing_Group).
 10. Scroll down to Attach permissions policies. In the Attach permissions policies section, search for IAMUserChangePassword. The match record gets filtered. Check IAMUserChangePassword.
 11. Next, clear the filter and search for DatabaseAdministrator. The match record gets filtered. Check DatabaseAdministrator.
 12. Scroll down the page and click on Create group.
 13. Testing_Group will be created under Groups as shown in the screenshot below.
 14. Select Users from the Identity and Access Management (IAM) section, and click on Add user to create a new user.
 15. The Add user page appears. In the User name field, provide any name (here, the username is Alice).
 16. Under Select AWS access type, check Access key - Programmatic access and Password - AWS Management Console access. Choose the Custom password radio button and type the password in the password field (here, we use User@123). Require password reset is optional; however, check this setting. Next, click on Next: Permissions.
 17. In the Set permissions section, the Add user to group is selected, by default. Check the newly created group (here, the group is Testing_Group). We have now added the user to the group. Click on Next: Tags.
 18. Tags are optional; however, tagging will help us search for Tag keys easily later. Type Department in the field under Key and Testing under Value (optional). Click on Next: Review to proceed to reviewing IAM User creation.
 19. On the Review page, we will be able to view the settings and IAM User properties before creating the user. Once you have verified the settings, click on Create user.
 20. After you click on Create user, a Success message is displayed. You have an option to Send Email to get the login instructions for the newly created IAM User. Click on Close (lower right corner of the page) to return to the IAM page. It will redirect you to the Users page.
 21. Next, let us attach a policy to the user. Select the user for whom you want to add a policy and click the user name. In this instance, let us select Alice as shown in the screenshot below.
 22. The Summary page appears (here, it appears for Alice). Click on Add permissions.
 23. In the Grant permissions page, click on Attach existing policies directly.
 24. In the Filter policies field, search for amazons3readonlyaccess. This will display all pre-configured policies for S3. Select AmazonS3ReadOnlyAccess, and click on Next: Review.
 25. In the Permissions summary page, review the assigned policies to the IAM User. After you have reviewed the policies, click on Add permissions.
 26. The policy that was assigned will be displayed once you view the IAM User (here, Alice). The policy is displayed under Attached directly.
 27. Next, we will create a custom IAM policy. Click on Policies under the Identity and Access Management (IAM) console. Click on Create policy.
 28. Click the link Choose a service, specify the service that you wish to use and edit the permissions. In this example, let us use CloudFront on Service.
 29. Expand the Actions menu to select the Access level for CloudFront service. In this example, let us enable only Read access for CloudFront. Note: The number of Read access policies might vary in your lab environment.
 30. Scroll down and expand the Resources section. Select All resources radio button.
 31. Expand Request conditions. Check MFA required, and click on Next: Tags.
 32. In the Add tags section click on Next: Review.
 33. In the Review policy section, provide a name for the policy in the Name field and add a description in the Description field.
 34. Scroll down and click on Create policy.
 35. The new policy will be successfully created. To check the created policy, click on Policies, type the name of the policy in the search box of Filter policies, then click on the selected policy.
 36. Click on the Dashboard under the Identity and Access Management (IAM) section.
 37. You can see the IAM users sign-in link under AWS Account, copy the link.
 38. Open the Google Chrome browser in incognito mode, paste the copied URL, and press the Enter button.
 39. The new sign-in page appears. Type the IAM user name and Password that we created in the previous step (IAM user name: Alice and Password: User@123). Click on Sign in button
 40. A new page will open wherein you can reset the password. Change the password and click on Confirm password change button.
 41. User Alice is now logged in as an IAM user.
 42. We have given only Read permission to Alice who can access only limited resources.
 43. Click “Alice” from the upper section of the page and the drop-down menu appears. You can see that the user has been added as an IAM User.
 44. Next, try to access the IAM service. Expand All services under AWS services field and then select IAM under Security, Identity, & Compliance.
 45. Errors appear as shown in the screenshot below. The IAM User Alice does not have permission to access IAM services.
 46. As described above, a security professional can create an IAM Group, Users, and custom policies in AWS.
 47. Log out from the AWS platform and close all open windows.

 
