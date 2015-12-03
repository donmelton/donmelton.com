---
published: 2013-01-03T21:04:03-08:00
title: Keeping Safari a secret
---
For much of the time we spent developing Safari --- long before it was [called by that name](/2012/12/19/when-i-first-heard-the-name-safari/) --- it pretended to be Microsoft Internet Explorer. Specifically, Internet Explorer for Mac, which Apple had provided with the OS since 1998. Less than six months before Safari debuted, it started pretending to be a Mozilla browser.

Why did we do this? And how did we make Safari pretend to be these browsers when its code and behavior were so different?

Not only was I tasked by Scott Forstall with building a browser and building a team to build that browser, I had to keep the whole damn project a secret. Which, by the way, really complicated the shit out of hiring most of the original team since I couldn't tell them what they were working on until they took the job. Talk about your management challenges. But that's another story.

So, secrecy. We weren't under physical lockdown like Jony Ive's design group was then, or like the iPhone team would be years later. But unless you knew who to look for, you were never going to find us on campus. And if you did, it's unlikely you could tell what we were doing unless you caught one of us actually running Safari --- something we usually did with our office doors closed.

I wasn't worried about talk either. Forstall certainly trusted me --- that's one of the many things that made him a great boss. And I trusted my team --- otherwise I wouldn't have hired them. None of us nor any of the internal beta testers at Apple were going to snitch. There were too damn few beta testers, but they were above reproach.

Twitter and Facebook didn't exist then. Nobody at Apple was stupid enough to blog about work, so what was I worried about?

Server logs. They scared the hell out of me.

When a Web browser fetches a page from a Web server, the browser identifies itself to that server with a user agent string --- basically its name, version, platform, etc. The browser also gives the server an IP address so the server knows where to return the page. This exchange not only makes the Web work, it also allows the server to tell who is using what browser and where they're using it.

You can see where this is going, right? But wait, there's more...

Back around 1990, some forward-thinking IT person secured for Apple an entire Class A network of IP addresses. That's right, Apple has 16,777,216 static IP addresses. And because all of these addresses belong together --- in what's now called a "/8 block" --- every one of them starts with the same number. In Apple's case, the number is `17`.

IP address `17.149.160.49`? That's Apple. `17.1.2.3`? Yes, Apple. `17.18.19.20`? Also, Apple. `17.253.254.255`? Apple, dammit!

I was so screwed.

Even though we operated the project like some CIA black op --- with loyalty oaths and all --- we couldn't let Safari be "Safari" when we used it on the Apple campus network. Otherwise, some Web server administrator somewhere might be scanning their log files and notice the connection between user agent string and IP address origin. Then the big surprise Steve Jobs wanted to unveil at Macworld on January 7, 2003, would be shot. And, likely, so would I.

So we hid my cleverly designed Safari user agent string whenever we were at Apple. And I say "my" because that's actually one of the few pieces of code in Safari and WebKit that 1) I can claim to have designed and 2) is still actually in the source. Thank God my engineering team removed or refactored all my other hacks. I hired good people.

Whenever we were off the Apple campus network, e.g. in our homes, we modified Safari to enable its real user agent string. And we had to do this for compatibility testing. That allowed me to tweak the string for maximum compatibility with the websites of that time. Which explains why the Safari user agent string has so much extra information in it, e.g. `KHTML, like Gecko` --- the names of other browser engines.

We couldn't ship with the real Safari user agent string disabled, but we came up with the next best thing --- automatically enabling it after a certain date. Just about this time 10 years ago, days before it was to debut, Safari went from hiding its light under a bushel to being proud of who it really was.

And I spent the days before that debut nervous and losing sleep as I combed the Internet for server logs.
