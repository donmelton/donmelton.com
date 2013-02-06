---
published: 2013-01-28T13:58:05-08:00
title: Lesson learned from a performance scare
---
Last Wednesday I posted this on [Twitter](https://twitter.com/donmelton/status/294258385623326720) and [App.net](https://alpha.app.net/donmelton/post/2596068):

> It's taking almost two seconds to completely regenerate all content on donmelton.com using Magneto. I need to speed that up.

As I've mentioned before, [Magneto](https://github.com/donmelton/magneto) is a static site generator. It's a tool I wrote myself, and what I use to create all the HTML, CSS, JavaScript, etc. that you're reading now. The entire website is generated from this online [source](https://github.com/donmelton/donmelton.com).

Some might think I was humble-bragging about Magneto's speed, but I only had 42 posts here at the time and just under two seconds to generate that seemed a bit slothful to me.

Of course, I didn't do anything about it right away --- there are days when I make [Jeff Lebowski](https://en.wikipedia.org/wiki/The_Big_Lebowski "The Dude") look vigorous --- but I did think on the problem for awhile. And then I was distracted by pictures of cats and bacon on Reddit. You know how it is.

But two days later, [John Gruber](http://daringfireball.net/) made these [two](https://twitter.com/gruber/status/294975815689580544) [posts](https://twitter.com/gruber/status/294976708921143296) on Twitter:

> Just fixed a punctuation typo in the first-ever DF Linked List entry, from 25 June 2004: [df4.us/73](http://daringfireball.net/linked/2004/06/25/neuburg-word-2004)

> That was 18,989 items ago.

Stunning --- not the typo, everyone makes those --- but that he's made over 18,989 posts to his website. That is truly impressive. Of course, he's been doing it for over 10 years so you would expect him to have written maybe one or two.

Rather than make the "Finally!" joke like everyone else about him fixing the typo, I replied to John asking, "How long does it take to regenerate the site with [Movable Type](https://en.wikipedia.org/wiki/Movable_Type)?" And he responded, "Good question. It’s been years since I’ve done a site-wide rebuild."

And that... Got. Me. Thinking.

A site-wide rebuild? I do that here every time I make a single change. It's just easier that way --- no dependencies to calculate. And my website is still small so it makes sense, even if it's taking almost two seconds right now. If Gruber doesn't want to do a rebuild with Movable Type, maybe this is a bad approach. How long would it take Magneto to generate a website with 18,989 posts? Hmmm, how long?

So, I put down my White Russian, hung up my bathrobe, and got to work figuring that out.

First thing to do was fake up a shitload of posts. My usual approach to problems like this is a single and convoluted line of [shell](https://en.wikipedia.org/wiki/Shell_script) and [sed](https://en.wikipedia.org/wiki/Sed) script, typed and executed directly on the command line in [Terminal.app](https://en.wikipedia.org/wiki/Terminal_(OS_X)). It's gruesome, but I'm a hack and that gets the job done.

My not-a-real-script started copying my existing posts and then replacing their published timestamps. A minute into the process and I realized my outside loop counter was wrong and I would wind up with more that 20,000 posts. Oh well, it would just be a better test. And Gruber's total number of posts was probably closer to that anyway.

Then life interrupted. Not just more pictures of cats and bacon this time, but actual family interaction. For several hours, too.

When I managed to get back to my precious iMac, it was late thirty and I was tired. I kicked off Magneto and started it chugging on 20,394 posts, along with all of the other content already included in the website.

And I waited. Five minutes into staring at Terminal.app I remembered there's no way to tell which post Magneto was processing because everything happens in memory before it writes anything out to disk. This isn't as stupid, wasteful, and uncommunicative as it sounds. That behavior was, in fact, by design.

I yawned and thought, screw it, this is taking too long. Something's wrong, but I'll just let it keep running and check the results in the morning. Off to bed.

Saturday morning.

Made my coffee and started reading the news. Halfway into my usual RSS feeds when the caffeine finally loosened the knot in my frontal lobes --- I remembered. Say, what about that test I was running last night?

I switched over to Terminal.app. Magneto was done. Oh, how nice. But how long did that take? I looked at the console spew. Hmmm, 24,415.52 seconds --- a lot. Lesse, that's... trying to do the math in my head... switching to Calculator.app because I can't count that high... that's ... MOTHER OF GOD?!? That's 6 hours and 47 minutes! What the hell was Magneto doing?

I thought, there goes my performance bona fides. My reputation on Safari is shot. They'll ask for my union card back.

So, I set to work figuring out what went wrong.

The first task was to measure. Folks online pointed me at [ruby-prof](https://github.com/rdp/ruby-prof), a great little code profiler for Ruby. I reduced the number of posts in the test to a thousand or so since I couldn't stand to iterate all weekend on the problem.

And then it was lather, rinse and repeat with ruby-prof, while also adjusting the number of posts in the test.

It turns out, the problem was not with Magneto. I made an even stupider mistake --- I trusted the tool to protect me and didn't pay attention to how I was misusing it.

Now, Magneto is very simple. It's devoid of features, really. It's not even "blog aware" like some other systems. It requires you to write a site controller script, plugins and templates to tell it exactly how to generate blog posts, index pages, RSS feeds, etc. And you get to make all the policy --- that's its power.

When I wrote Magneto, I generated a thousand pages with Magneto before I released it just to make sure it didn't have any glaring performance issues. It scaled well. Of course, I tested other things, too. And it was plenty speedy with a simple site controller script. A. Simple. Script.

However, I was much more cavalier with my own site controller script, plugins and templates that I wrote to use here. And I made the cardinal sin of never measuring the performance implications of that sloppy-ass code.

I was right when I thought almost two seconds was too long to generate 42 posts. That's about .03 seconds per post. I thought I could do better on my hefty iMac.

But taking 6 hours and 47 minutes to generate 20,394 means it was taking 1.2 seconds per post. That's not linear --- not even close.

Thank god for ruby-prof. It took awhile, but I was able to zero in on the problems. Yes, it was more than one. But they were all the same issue --- not caching the unchanging result of a slow subroutine that was repeated in every post.

All these rookie mistakes were in one of my plugins and one of my templates. None of it in Magneto itself. And after some judicious use of static variables and other grotesque hacks, I was able to improve things a tiny, tiny bit.

Now it takes only 5 minutes and 19 seconds to generate 20,394 posts. That's a much more linear .016 seconds per post. And a 76.576x improvement overall --- that's not a percent improvement, that's 76.576 times faster.

Yes, I was that stupid.

I'm sure I can find more improvements, but it's unlikely that I'll be able to generate over twenty thousand posts in less than 10 seconds without a massive upgrade in hardware. And 10 seconds is about the most I ever want to wait for something like that. Right now, 10 seconds would be about one thousand posts.

No, if I ever approach the proficiency and productivity of John Gruber, then for daily use I'll need to extend Magneto or my site controller script to only rebuild what's changed and cache what hasn't.

In the meantime, I'll be measuring more up front. Maybe I'll even write about how I made a similar mistake with Safari and the other lessons we all learned from that.
