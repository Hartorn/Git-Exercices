Everything was working fine, but there is a bug in production.
You can reproduce it, but impossible to determine what is causing this.
test.sh should return OK, but it is returning KO.

Hopefully, you know that tag 1.0.0 is working fine.

You need to determine what is the first commit causing this bug, to understand this bug.

For that, you are going to use git bisect :
- check the doc to understand the command
- start the bisect with git bisect start
- indicate current commit is bad with git bisect bad
- indicate remote tag 1.0.0 is good with git bisect good 1.0.0
- for every step, check if test.sh is returning OK or KO, and do either git bisect good, or git bisect bad
- at the end, you should have identified which commit broke the code

