---
published: 2013-01-10T20:26:41-08:00
title: Safari is released to the world
---
During the early development of Safari, I didn't just worry about [leaking our secret project](/2013/01/03/keeping-safari-a-secret/) through Apple's IP address or our browser's user agent string. It also concerned me that curious gawkers on the outside would notice who I was hiring at Apple.

Other than a bit part in a [documentary about Netscape](https://www.youtube.com/watch?v=4Q7FTjhvZ7Y) that aired on PBS, I wasn't known to anyone but a few dozen other geeks in The Valley. Of course, several of those folks were aware I was now at Apple and working on some project I wouldn't say anything about. And it doesn't take many people in this town to snowball a bit of idle speculation.

I found out later that [Andy Hertzfeld](https://en.wikipedia.org/wiki/Andy_Hertzfeld), an Apple veteran who I worked with at [Eazel](https://en.wikipedia.org/wiki/Eazel), had figured it all out by the time I showed up for my first day to work on the browser on June 25, 2001. Andy was very insightful that way. But thankfully he was also quiet about it at the time.

Hiring [Darin Adler](https://en.wikipedia.org/wiki/Darin_Adler), also ex-Apple and ex-Eazel, in the Spring of 2002 was likely visible to others in the industry since he was much more well known than me. But because Darin had never worked on a dedicated Web browser like I had, no one made the connection.

However, when I hired [Dave Hyatt](https://en.wikipedia.org/wiki/Dave_Hyatt) in July 2002, then guesses started flying fast.

While at Netscape, Dave built the Chimera (now known as [Camino](https://en.wikipedia.org/wiki/Camino_(web_browser))) browser for Mac OS X and co-created the project that would later become Firefox. Both of these applications were based on the Mozilla [Gecko layout engine](https://en.wikipedia.org/wiki/Gecko_(software)) on which Dave also worked. He was a true celebrity in the Web browser world, having his hands in just about every Mozilla project.

So, during the Summer of 2002, several bloggers and tech websites speculated that Dave must be bringing Chimera to the Mac. Except that Chimera was already a Mac application and didn't need to be ported. So what the hell was Dave doing at Apple? Building another Gecko-based Mac browser? No one knew. And none of this made much sense. Which is probably why the rumors subsided so quickly.

But people would remember all of this when Safari debuted at Macworld in San Francisco on January 7, 2003. And at least one of them would remember it at full volume while Steve Jobs was on stage making that announcement.

* * *

Until I watched that video I found and [posted of the Macworld keynote](/2013/01/07/macworld-2003-keynote/), I had completely forgotten what else was announced that day. Which is pretty sad considering I saw Steve rehearse the whole thing at least four times.

But you have to realize I was totally focused on Safari. And Scott Forstall, my boss, wanted me at those rehearsals in case something went wrong with it.

There's nothing that can fill your underwear faster than seeing your product fail during a Steve Jobs demo.

One of my concerns at the time was network reliability. So, I brought Ken Kocienda, the first Safari engineer, with me to troubleshoot since he wrote so much of our networking code. If necessary, Ken could also diagnose and duct tape any other part of Safari too. He coined one of our team aphorisms, "If it doesn't fit, you're not shoving hard enough."

Ken and I started at Apple on the same day so, technically, he's the only original Safari team member I didn't hire. But because we both worked at Eazel together, I knew that Ken was a world-class propellor-head and insisted Forstall assign him to my team --- essentially a requirement for me taking the job.

Most of the time during those rehearsals, Ken and I had nothing to do except sit in the then empty audience and watch The Master Presenter at work --- crafting his keynote. What a privilege to be a spectator during that process. At Apple, we were actually all students, not just spectators. When I see [other companies clumsily announce products](http://www.theverge.com/2013/1/8/3850056/qualcomms-insane-ces-2013-keynote-pictures-tweets) these days, I realize again how much the rest of the world lost now that Steve is gone.

At one rehearsal, Safari hung during Steve's demo --- unable to load any content. Before my pants could load any of its own, Ken discovered the entire network connection had failed. Nothing we could do. The IT folks fixed the problem quickly and set up a redundant system. But I still worried that it might happen again when it really mattered.

* * *

On the day of actual keynote, only a few of us from the Safari team were in the audience. Employee passes are always limited at these events for obvious reasons. But we did have great seats, just a few rows from the front --- you didn't want to be too close in case something really went wrong.

Steve [started the Safari presentation](https://www.youtube.com/watch?v=13n98rSaYp4&t=54m52s) with, "So, buckle up." And that's what I wished I could do then --- seatbelt myself down. Then he defined one of our product goals as, "Speed. Speed." So, I tensed up. Not that I didn't agree, of course. I just knew what was coming soon:

Demo time.

And for the entire six minutes and 32 seconds that Steve used Safari on stage, I don't remember taking a single breath. I was thinking about that network failure during rehearsal and screaming inside my head, "Stay online, stay online!" We only had one chance to make a first impression.

Of course, Steve, Safari and the network performed flawlessly. I shouldn't have worried.

Then it was back to slides and Steve talking about how we built it. "We based Safari on an HTML rendering engine that is open source." And right then is when everybody else remembered all those rumors from the Summer about Dave Hyatt bringing Chimera to Apple.

But I chose the engine we used --- with my team's and my management chain's support, of course --- a year before Dave joined the project. Dave thought it was a great decision too, once he arrived. But that engine wasn't Gecko, the code inside Chimera.

It was [KHTML](https://en.wikipedia.org/wiki/KHTML). Specifically KHTML and [KJS](https://en.wikipedia.org/wiki/KJS_(software)) --- the code inside KDE's [Konqueror](https://en.wikipedia.org/wiki/Konqueror) Web browser on Linux. After the keynote was over, I sent [this email](https://marc.info/?m=104197092318639) to the KDE team to thank them and introduce ourselves. I did it right from where I was sitting too, once they turned the WiFi back on.

You can argue whether KHTML was the right decision --- go ahead, after 10 years it doesn't faze me anymore. I'll detail my reasons in a later post. Spoiler alert: I don't hate Gecko.

But back to Steve's presentation.

Everyone was clapping that Apple embraced open source. Happy, happy, happy. And they were just certain what was coming next. Then Steve moved a new slide onto the screen. With only one word, "KHTML" --- six-foot-high white letters on a blue background.

If you listen to that video I posted, notice that no one applauds here. Why? I'm guessing confusion and complete lack of recognition.

What you also can't hear on the video is someone about 15 to 20 rows behind where we were sitting --- obviously expecting the word "Gecko" up there --- shout at what seemed like the top of his lungs:

"WHAT THE FUCK!?"

KHTML may have been a bigger surprise than Apple doing a browser at all. And that moment was glorious. We had punk'd the entire crowd.
