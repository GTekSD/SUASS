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
