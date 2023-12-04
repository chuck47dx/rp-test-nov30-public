SELECT [File Name], 
       MAX([File Size]) AS [File Size],
       MAX([Owner Email Address]) AS [Owner Email Address],
       MAX([Attachment Download]) AS [Attachment Download],
       MAX([Test]) AS [Test],
       MAX([Test Type]) AS [Test Type],
       MAX([URL]) AS [URL]
FROM (
    SELECT att.FILE_SIZE AS [File Size], 
           att.NAME AS [File Name],
           cwd.email_address AS [Owner Email Address],
           CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att.ID) AS [Attachment Download],
           cases.[KEY] AS [Test],    
           'Test Case' AS [Test Type],      
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testCase/', cases.[KEY]) AS [URL]
    FROM AO_4D28DD_ATTACHMENT att
    JOIN app_user appu ON appu.user_key = att.USER_KEY
    JOIN cwd_user cwd ON cwd.lower_user_name = appu.lower_user_name
    JOIN AO_4D28DD_TEST_CASE cases ON cases.ID = att.TEST_CASE_ID
    UNION
    SELECT att.FILE_SIZE AS [File Size], 
           att.NAME AS [File Name],
           cwd.email_address AS [Owner Email Address],
           CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att.ID) AS [Attachment Download],
           tset.[KEY] AS [Test],
           'Test Plan' AS [Test Type],
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testPlan/', tset.[KEY]) AS [URL]
    FROM AO_4D28DD_ATTACHMENT att
    JOIN app_user appu ON appu.user_key = att.USER_KEY
    JOIN cwd_user cwd ON cwd.lower_user_name = appu.lower_user_name
    JOIN AO_4D28DD_TEST_SET tset ON tset.ID = att.TEST_SET_ID
    UNION
    SELECT att.FILE_SIZE AS [File Size], 
           att.NAME AS [File Name],
           cwd.email_address AS [Owner Email Address],
           CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att.ID) AS [Attachment Download],
           run.[KEY] AS [Test Cycle],
           'Test Cycle' AS [Test Type], 
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testCycle/', run.[KEY]) AS [URL]
    FROM AO_4D28DD_ATTACHMENT att
    JOIN app_user appu ON appu.user_key = att.USER_KEY
    JOIN cwd_user cwd ON cwd.lower_user_name = appu.lower_user_name
    JOIN AO_4D28DD_TEST_RUN run ON run.ID = att.TEST_RUN_ID
) AS innertable
GROUP BY [File Name]
ORDER BY MAX([File Size]) DESC
OFFSET 0 ROWS FETCH NEXT 1000 ROWS ONLY; -- For SQL Server, use OFFSET and FETCH to limit the number of rows