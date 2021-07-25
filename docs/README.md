
# Users & Groups

Azure Databricks uses [Azure Active Directory (AAD)](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-whatis) as the exclusive Identity Provider and there’s a seamless out of the box integration between them. This makes ADB tightly integrated with Azure just like its other core services. Any AAD member assigned to the Owner or Contributor role can deploy Databricks and is automatically added to the ADB members list upon first login. If a user is not a member or guest of the Active Directory tenant, they can’t login to the workspace.
Granting access to a user in another tenant (for example, if contoso.com wants to collaborate with adventure-works.com users) does work because those external users are added as guests to the tenant hosting Azure Databricks.

Azure Databricks comes with its own user management interface. You can create users and groups in a workspace, assign them certain privileges, etc. While users in AAD are equivalent to Databricks users, by default AAD roles have no relationship with groups created inside ADB, unless you use [SCIM](https://docs.azuredatabricks.net/administration-guide/admin-settings/scim/aad.html) for provisioning users and groups. With SCIM, you can import both groups and users from AAD into Azure Databricks, and the synchronization is automatic after the initial import. ADB also has a special group called ***Admins***, not to be confused with AAD’s role Admin.

The first user to login and initialize the workspace is the workspace ***owner***, and they are automatically assigned to the Databricks admin group. This person can invite other users to the workspace, add them as admins, create groups, etc. The ADB logged in user’s identity is provided by AAD, and shows up under the user menu in Workspace:


# Cluster Policy
