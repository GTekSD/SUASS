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
 2. The AWS Web Services - Cloud Computing Services page appears. Click on `AWS Management Console` from the My Account drop-down menu as shown in the screenshot below.
    ![1](https://github.com/GTekSD/SUASS/assets/55411358/5d397059-4f1b-47c2-8b9e-388c3af2145e)
 3. The AWS Web Services Sign-in page appears. Type the AWS administrator account ID and click on **Next**. Note: In the next window, type the characters seen in the image and click on submit.
    ![2](https://github.com/GTekSD/SUASS/assets/55411358/1ac6e35c-f900-4378-ad78-6fce3446a440)

 5. In the Password field, type the password, and click on **Sign-in**.
    ![3](https://github.com/GTekSD/SUASS/assets/55411358/c880fdd6-e6fe-44bf-8bcb-e476b320438f)

 7. Select Services from the menu bar and click on `IAM` under the `Security, Identity, & Compliance` section.
    ![4](https://github.com/GTekSD/SUASS/assets/55411358/730bcd65-b8b3-4e2f-a089-5184786e15a4)

 9. The Welcome to the **Identity and Access Management (IAM)** page appears. Click on `User groups` in the left pane under **Access management**.
     ![5](https://github.com/GTekSD/SUASS/assets/55411358/04f0132d-3a40-4185-9163-a5c086305be2)

 11. Now, click on `Create group`.
     ![6](https://github.com/GTekSD/SUASS/assets/55411358/fd34a73d-314a-48ae-9b0b-8f645b01a2ec)

 13. In the **Create user group** section, type the group name in the User group name field (here, the group name is **"Testing_Group"**).
     ![7](https://github.com/GTekSD/SUASS/assets/55411358/222ed7ef-0fdd-4f3b-9a24-aa6d3bb0e66f)
     
 14. Scroll down to **Attach permissions policies**. In the Attach permissions policies section, search for **IAMUserChangePassword**. The match record gets filtered. Check `IAMUserChangePassword`.
     ![8](https://github.com/GTekSD/SUASS/assets/55411358/9fb9e635-83fe-4213-8ac0-02f14c2c3285)

 15. Scroll down the page and click on `Create group`.
     ![9](https://github.com/GTekSD/SUASS/assets/55411358/58d91b47-88b4-45b3-9bd5-a74caff1da45)

 21. **Testing_Group** will be created under Groups as shown in the screenshot below.
     ![10](https://github.com/GTekSD/SUASS/assets/55411358/17623b4f-16db-4d54-9d43-d3041330733d)

 23. Select `Users` from the Identity and Access Management (IAM) section, and click on `Add user` to create a new user.
     ![11](https://github.com/GTekSD/SUASS/assets/55411358/b55b3d17-ecc0-4fa9-aa09-d0998f266ae9)

 25. The Add user page appears. In the User name field, provide any name (here, the username is **"Alice"**).
     ![12](https://github.com/GTekSD/SUASS/assets/55411358/3da013ac-0fd3-4b24-a1da-3b35e37cf2bd)

 27. Under Select AWS access type, check `Access key - Programmatic access and Password - AWS Management Console access`. Choose the Custom password radio button and type the password in the password field (here, we use **"User@123"**). Require password reset is optional; however, check this setting. Next, click on Next: Permissions.
     ![13](https://github.com/GTekSD/SUASS/assets/55411358/b9e35de8-ac3a-495f-ab6c-ab41c5878e14)

 29. In the Set permissions section, the Add user to group is selected, by default. Check the newly created group (here, the group is Testing_Group). We have now added the user to the group. Click on Next: Tags.
     ![14](https://github.com/GTekSD/SUASS/assets/55411358/487c12d3-5730-40c1-8552-f159d76018eb)

 31. Tags are optional; however, tagging will help us search for Tag keys easily later. Type Department in the field under Key and Testing under Value (optional). Click on Next: Review to proceed to reviewing IAM User creation.
     ![15](https://github.com/GTekSD/SUASS/assets/55411358/555f73f3-39d7-484d-87d9-0f4b847edd24)

 33. On the Review page, we will be able to view the settings and IAM User properties before creating the user. Once you have verified the settings, click on Create user.
     ![16](https://github.com/GTekSD/SUASS/assets/55411358/d29c0023-80b6-4a1d-851b-c6b7a6a1d924)

 35. After you click on Create user, a Success message is displayed. You have an option to Send Email to get the login instructions for the newly created IAM User. Click on Close (lower right corner of the page) to return to the IAM page. It will redirect you to the Users page.
     ![17](https://github.com/GTekSD/SUASS/assets/55411358/4c0af24c-7584-4fbf-b08a-51f250dbb31d)

 37. Next, let us attach a policy to the user. Select the user for whom you want to add a policy and click the user name. In this instance, let us select Alice as shown in the screenshot below.
     ![18](https://github.com/GTekSD/SUASS/assets/55411358/24cbd794-3464-43ef-b7d6-cee7d771568c)

 39. The Summary page appears (here, it appears for Alice). Click on Add permissions.
     
 41. In the Grant permissions page, click on Attach existing policies directly.
 42. In the Filter policies field, search for amazons3readonlyaccess. This will display all pre-configured policies for S3. Select AmazonS3ReadOnlyAccess, and click on Next: Review.
 43. In the Permissions summary page, review the assigned policies to the IAM User. After you have reviewed the policies, click on Add permissions.
 44. The policy that was assigned will be displayed once you view the IAM User (here, Alice). The policy is displayed under Attached directly.
 45. Next, we will create a custom IAM policy. Click on Policies under the Identity and Access Management (IAM) console. Click on Create policy.
 46. Click the link Choose a service, specify the service that you wish to use and edit the permissions. In this example, let us use CloudFront on Service.
 47. Expand the Actions menu to select the Access level for CloudFront service. In this example, let us enable only Read access for CloudFront. Note: The number of Read access policies might vary in your lab environment.
 48. Scroll down and expand the Resources section. Select All resources radio button.
 49. Expand Request conditions. Check MFA required, and click on Next: Tags.
 50. In the Add tags section click on Next: Review.
 51. In the Review policy section, provide a name for the policy in the Name field and add a description in the Description field.
 52. Scroll down and click on Create policy.
 53. The new policy will be successfully created. To check the created policy, click on Policies, type the name of the policy in the search box of Filter policies, then click on the selected policy.
 54. Click on the Dashboard under the Identity and Access Management (IAM) section.
 55. You can see the IAM users sign-in link under AWS Account, copy the link.
 56. Open the Google Chrome browser in incognito mode, paste the copied URL, and press the Enter button.
 57. The new sign-in page appears. Type the IAM user name and Password that we created in the previous step (IAM user name: Alice and Password: User@123). Click on Sign in button
 58. A new page will open wherein you can reset the password. Change the password and click on Confirm password change button.
 59. User Alice is now logged in as an IAM user.
 60. We have given only Read permission to Alice who can access only limited resources.
 61. Click “Alice” from the upper section of the page and the drop-down menu appears. You can see that the user has been added as an IAM User.
 62. Next, try to access the IAM service. Expand All services under AWS services field and then select IAM under Security, Identity, & Compliance.
 63. Errors appear as shown in the screenshot below. The IAM User Alice does not have permission to access IAM services.
 64. As described above, a security professional can create an IAM Group, Users, and custom policies in AWS.
 65. Log out from the AWS platform and close all open windows.

# EXERCISE 2: IMPLEMENT KEY MANAGEMENT SERVICES IN AWS
