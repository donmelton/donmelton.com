---
published: 2013-06-02T16:27:28-07:00
title: What I've been doing lately
---
A few words of explanation to those who are asking where I've gone and what I've been doing the last few months.

Sometime in March, shortly after I recorded [my first "Debug" podcast](http://www.imore.com/debug-11-don-melton-and-safari), our dog [Penny](/2012/12/31/worried-about-penny/) took a turn for the worse. My family and I struggled with her illness for long days and longer nights. And then we made a very hard decision. She passed away just before the month was over.

I won't write her eulogy now. She deserves better than this haphazard post. But I hope to publish something in a few days, on what would have been her sixteenth birthday.

We were devasted by her loss. More so than I realized at the time. I unplugged myself from the Internet and most everything else I was doing then. I don't even remember much of what happened the following week.

And then I realized I had to prepare my speech for the [Úll conference](http://2013.ull.ie/) starting on April 12. I'm thankful for the pressure of that deadline and my own natural tendency to procrastinate. It got my mind off grief and straight on to panic.

Now, public speaking doesn't bother me much. Years ago I trained as a minister --- a whole other story. But when you're twenty years old, in the pulpit, and telling people four times your age that you have the absolute Word of God for their lives today --- well, everything else is downhill from there in terms of pressure.

But I never want to do any kind of presentation without being prepared. The audience deserves better than that. So that had me worried. And blessedly focused.

What did me in was the way I wrote the speech. I scribbled down a 4,000-word outline --- just an outline, mind you --- and then proceeded to record myself trying it out. When I hit the 90-minute mark I knew I was screwed because we were limited to only 25 minutes at Úll. I figured I might get away with a half hour, but they would march me offstage if I went twice that long.

So it was cut, cut, cut and cut some more. Rewrite, rewrite, rewrite. Again and again.

I was still working on that speech the day before my wife and I got on the plane to Dublin. All the constraints, especially the time limit, actually improved it.

But the process of completing it burned me out on writing.

And then suddenly there was Úll --- _The_ Conference. I capitalize it because it's simply the best event I've ever attended.

Not only are [Paul Campbell](http://twitter.com/paulca) and [Dermot Daly](http://twitter.com/dermdaly) crazed saints for hosting such a celebration, but how they attracted all these wonderful people to operate it, speak at it, and attend it --- that's a stunning accomplishment. You need to [attend next year](http://2014.ull.ie). Trust me.

And the venue? Perfect. Dublin is now one of my favorite cities. Some say you can't swing a cat in that town without hitting a church or a pub. But it's not just religion and relaxing there. Ireland is thick with history and gorgeous to behold. And after you've worn yourself out absorbing it? My advice is too absorb a Guinness and some pub food.

Every Guinness I've drank in America tastes like piss compared to the brew --- like some magical beer milkshake --- that they serve with such expertise and pride there. You have to try it.

But it was the people in Dublin that impressed me the most. Not only did my wife and I make wonderful new friends at Úll, but everyone else we met in Ireland were just so... nice. Even the cab drivers.

So Úll and Dublin were great. And then we got back from that 15-hour flight to find that Penny's ashes had just been delivered to our home. It was like a punch in the gut. All those feelings were back.

Now, it's not wrong to mourn and miss someone --- and she was a some-_one_, not a some-_thing_. If you don't, did they really matter? But you can't dwell on just the loss.

That's when I decided to throw myself into a new project. If I wasn't so burned out, it would've been a writing project and you could've already read that here.

I say on this website that I'm a recovering programmer. Well, I've really fallen off the wagon this time.

Suddenly, I got a wild hair up my ass about [MPlayer](http://mplayerhq.hu/), the command line-based, cross-platform media player that geeks and other encoding freaks like myself use incessantly.

Even though it's a command line program, it still presents a Cocoa UI when displaying video on OS X. But the various quirks and bugs in that UI had been getting on my nerves for a long time.

So I wrote a whole new front end for it. Not by patching it. But by running it as a background process, capturing its output and then dynamically presenting a new UI from yet another command line tool.

Stupid, I know. But it was a wonderful distraction. And the damn thing works just fine.

I call it "MPlayerShell." The source code is [available on Github](https://github.com/donmelton/MPlayerShell) and, thanks to [Valerii Hiora](http://github.com/vhbit), it's installable via [Homebrew](http://brew.sh/) too. You can read all about it [here](https://github.com/donmelton/MPlayerShell#readme).

This is the project I talked about, but didn't name, on [my second "Debug" podcast](http://www.imore.com/debug-111-don-melton-blink-servo-and-more) with [Guy English](http://twitter.com/gte) and [Rene Ritchie](http://twitter.com/reneritchie/). Props to Rene for leading off the show with one of my "F" bombs --- the man never buries a good lede.

Anyway, the whole process of writing MPlayerShell took me nearly three weeks. Yes, I'm the world's slowest software engineer. But part of that process was 1) Figuring out MPlayer's peculiar APIs and behaviors, and 2) Learning to write in Objective-C on OS X again. Seriously, I hadn't done that in years.

Now I'm on a mission. I must do more coding. That monkey is not crawling off my back anytime soon.

And I know exactly what I'm going to write.
