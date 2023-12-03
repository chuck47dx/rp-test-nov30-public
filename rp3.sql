//
SELECT "File Name",
MAX ("File Size") AS "File Size",
MAX ("Owner Email Address") AS "Owner Email Address",
MAX ("Attachment Download") AS "Attachment Download",
MAX ("Test") AS "Test",
MAX ("Test type") AS "Test type",
MAX ("URL") AS "URL"
FROM (
SELECT att."FILE SIZE" "File Size",
att."NAME" "File Name",
cwd."email address" "Owner Email Address",
CONCAT ('https://<BASE URL›/rest/tests/l.0/attachment/', att."ID") "Attachment Download",
cases,."KEY" Test",
'Test Case' AS "Test Type",
CONCAT ('https://<BASE URL>/secure/Tests.jspa#/testCase/', cases."KEY") "URL"
  
FROM "AO_4D28DD_ATTACHMENT" att
JOIN "app user" appu on appu.user_key = att."USER KEY"
  
JOIN lewd
user"
eWO ON cwd. lower
user
name = abou. lower user namer
dON
"AO 4D28DD TEST CASEI
cases ON cases. WID"
= att. "TEST CASE ID"
UNETON
seLECT att.
WEILE SIZE"
"File Size"
att
• "NAMPI
"File Namel
ewa.
"email
acore
Owner Email
CONCAT ('http: //‹BASE
URL>/rest/tests/1.0/attachment/ att."IDM) "Attachment Download"
tset."KEY"
"Test."
26
34
lest Plan
As "Test
Lype
CONCAT ('http: //‹BASE URL>/secure/Tests.jspa#/testPlan/', tset. "KEY")
MURL"
MROM
AO
4D28DD _ATTACHMENT
att
VOIN
" app
apou ON
appu.user key - att. USER KEY"
JOIN
lewd use
ewe
ON
and lower
user
JOTN "AO
4D28DD TEST
SET" tset ON
appu.
miower user
name
att.EST
SET
ID"
UNION
SELECT
att. "FILE
SIZE"
"File Size"
att. "NAME" "File Name"
cwd. "email
address" "Owner Email Address"
CONCAT ('http: //‹BASE URL›/rest/tests/1.0/attachment/',
att. "ID") "Attachment Download"
lest Cyclem,
est
Cycle
HASI
rest Type",
CONCATnttp:/‹BASE URL> secure Test
stevele/
cun.
"KEY")
"URL"
DROM
4D28D
TTAGEMETI
JOIN
app
appu ON appu.user key = att. "USER KEYI
COUN
user
ON cwd.lower
UDCI
name = appu. "lower
user name
COININA©
reun ON
run!
- "TEST_RUN ID"
"innertable
Croup BY "File
ORDER BY MAX ("File Size") DESC
000:
O
