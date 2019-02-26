You finished to work on your feature, and it's finally working !
Review is going well, but now you have to clean up your history before being merge.


----
First
----
Using rebase -i on last four commits (HEAD~4)
Clean up useless commits by squashing them,
Split too big commit in several one,
then push (force-with-lease) your cleaned up history

----
Second
----
Oh wait, you cannot push : a reviewer added a fix on your branch.
But you already tidy your branch, and don't want to redo it.
Cherry pick the commits, then handle the conflicts.
Finally, you can push your branch, I'm sure it will be merged soon.

