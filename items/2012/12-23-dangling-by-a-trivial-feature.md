---
link: http://prog21.dadgum.com/160.html
published: 2012-12-23T22:14:45-08:00
title: Dangling by a trivial feature
---
James Hague lamenting his dismissal of a whole piece of software, and the labor-intensive work that goes into producing it, for lack of a single, minor feature:

> Yet here I am dismissing it in a casual, offhand way because of how the coordinates of the selection rectangle are displayed. ... but it makes no difference, because I've moved on.

Hague is more thoughtful and considerate than most users. I'll give him that.

When you make software for a living, you get used to this. No, it's not pleasant. Eventually you realize that you can't always anticipate what people want. That's why you listen to feedback, iterate and give them another release.

But you never try to make your software be all things to all people.

I saw this on [Hague's blog](http://prog21.dadgum.com/) before I noticed it made the front page of Hacker News.[^1] Looking at the [comment thread there](https://news.ycombinator.com/item?id=4960227), it's clear some folks don't get this aspect of it --- you can't solve the problem of which behaviors to include in your software just by making that software more configurable.

We used to tell this painfully self-deprecating joke while I was at Netscape:

> Question: How many preferences does Navigator have?
> 
> Answer: All of them.

If you ever used Netscape Navigator, you know what I mean. Even its preferences had preferences. And we still couldn't make enough people happy.

Software design is about making choices on behalf of your users. Constraints on how your software behaves will focus people on understanding how to use it. 

If you make the right choices you'll wind up pleasing enough people anyway. How do you know which are the right choices?

When you can't decide which behavior a feature should include, consider if the possible behaviors were available as an option. Decide which behavior would be the default for that option. Implement that default behavior. Now you're done.

[^1]: And the front page of Hacker News is where most of Hague's posts wind up. If you're a programmer, you really should be subscribing to his RSS feed. I'd recommend it even if you don't write code. Whether you agree with him or not, his site is always an interesting read.
