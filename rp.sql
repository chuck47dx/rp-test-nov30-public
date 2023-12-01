SELECT prj.[pkey] AS [Project Key],
	   att.[FILE_SIZE] AS [File Size], 
	   att.[NAME] AS [File Name],
	   cwd.[email_address] AS [User Email Address],
	   prj.[pname] AS [Project Name],
	   CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att.[ID]) AS [Attachment Download]
FROM [AO_4D28DD_ATTACHMENT] att
JOIN [project] prj ON att.[PROJECT_ID] = prj.id
JOIN [app_user] appu ON appu.[user_key] = att.[USER_KEY]
JOIN [cwd_user] cwd ON cwd.[lower_user_name] = appu.[lower_user_name]
ORDER BY att.[FILE_SIZE] DESC
OFFSET 0 ROWS FETCH NEXT 1000 ROWS ONLY; -- For SQL Server 2012 onwards, used for pagination