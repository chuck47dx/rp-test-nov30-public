SELECT "File Name", 
       MAX("File Size") AS "File Size",
       MAX("Owner Email Address") AS "Owner Email Address",
       MAX("Attachment Download") AS "Attachment Download",
       MAX("Test") AS "Test",
       MAX("Test Type") AS "Test Type",
       MAX("URL") AS "URL"
FROM (
    SELECT att."FILE_SIZE" "File Size", 
           att."NAME" "File Name",
           cwd."email_address" "Owner Email Address",
           CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att."ID") "Attachment Download",
           cases."KEY" "Test",    
           'Test Case' AS "Test Type",      
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testCase/', cases."KEY") "URL"
    FROM "AO_4D28DD_ATTACHMENT" att
    JOIN "app_user" appu ON appu.user_key = att."USER_KEY"
    JOIN "cwd_user" cwd ON cwd.lower_user_name = appu."lower_user_name"
    JOIN "AO_4D28DD_TEST_CASE" cases ON cases."ID" = att."TEST_CASE_ID"
    UNION
    SELECT att."FILE_SIZE" "File Size", 
           att."NAME" "File Name",
           cwd."email_address" "Owner Email Address",
           CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att."ID") "Attachment Download",
           tset."KEY" "Test",
           'Test Plan' AS "Test Type",
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testPlan/', tset."KEY") "URL"
    FROM "AO_4D28DD_ATTACHMENT" att
    JOIN "app_user" appu ON appu.user_key = att."USER_KEY"
    JOIN "cwd_user" cwd ON cwd.lower_user_name = appu."lower_user_name"
    JOIN "AO_4D28DD_TEST_SET" tset ON tset."ID" = att."TEST_SET_ID"
    UNION
    SELECT att."FILE_SIZE" "File Size", 
           att."NAME" "File Name",
           cwd."email_address" "Owner Email Address",
           CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att."ID") "Attachment Download",
           run."KEY" "Test Cycle",
           'Test Cycle' AS "Test Type", 
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testCycle/', run."KEY") "URL"
    FROM "AO_4D28DD_ATTACHMENT" att
    JOIN "app_user" appu ON appu.user_key = att."USER_KEY"
    JOIN "cwd_user" cwd ON cwd.lower_user_name = appu."lower_user_name"
    JOIN "AO_4D28DD_TEST_RUN" run ON run."ID" = att."TEST_RUN_ID"
	UNION
	SELECT att."FILE_SIZE" "File Size", 
           att."NAME" "File Name",
           cwd."email_address" "Owner Email Address",
           CONCAT('http://<BASE_URL>/tests/1.0/attachment/', att."ID") "Attachment Download",
           rst."KEY" "Test",    
           'Test Execution' AS "Test Type",      
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testPlayer/testExecution/', rst."KEY") "URL"
    FROM "AO_4D28DD_ATTACHMENT" att
    JOIN "app_user" appu ON appu.user_key = att."USER_KEY"
    JOIN "cwd_user" cwd ON cwd.lower_user_name = appu."lower_user_name"
	JOIN "AO_4D28DD_TEST_RESULT" rst on att."TEST_SCRIPT_RESULT_ID" = rst."ID"
	UNION
	SELECT att."FILE_SIZE" "File Size", 
           att."NAME" "File Name",
           cwd."email_address" "Owner Email Address",
           CONCAT('http://<BASE_URL>/rest/tests/1.0/attachment/', att."ID") "Attachment Download",
           cases."KEY" "Test",    
           'Test Script' AS "Test Type",      
           CONCAT('http://<BASE_URL>/secure/Tests.jspa#/testCase/', cases."KEY") "URL"
    FROM "AO_4D28DD_ATTACHMENT" att
    JOIN "app_user" appu ON appu.user_key = att."USER_KEY"
    JOIN "cwd_user" cwd ON cwd.lower_user_name = appu."lower_user_name"
    JOIN "AO_4D28DD_TEST_CASE" cases ON cases."ID" = att."STEP_ID"
	JOIN "AO_4D28DD_STEP_ENTITY" steps on steps."ID" = cases."TEST_SCRIPT_ID" 
) AS "innertable"
GROUP BY "File Name"
ORDER BY MAX("File Size") DESC
LIMIT 1000;