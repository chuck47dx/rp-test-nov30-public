SELECT prj.[pkey] AS [Project Key],
       att.[FILE_SIZE] AS [File Size],
       att.[NAME] AS [File Name],
       cwd.[email_address] AS [User Email Address],
       prj.[pname] AS [Project Name],
       CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att.[ID]) AS [Attachment Download],
       cases.[KEY] AS [Test Case],
       CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testCase/', cases.[KEY]) AS [TestCase Link]
FROM [AO_4D28DD_ATTACHMENT] att
JOIN [project] prj ON att.[PROJECT_ID] = prj.[id]
JOIN [app_user] appu ON appu.[user_key] = att.[USER_KEY]
JOIN [cwd_user] cwd ON cwd.[lower_user_name] = appu.[lower_user_name]
JOIN [AO_4D28DD_TEST_CASE] cases ON cases.[ID] = att.[TEST_CASE_ID]
ORDER BY att.[FILE_SIZE] DESC
OFFSET 0 ROWS
FETCH NEXT 1000 ROWS ONLY;