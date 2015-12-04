---
title: About me and this website
---

Hello, I'm Don Melton, probably best known as the person who started the [Safari](https://www.apple.com/safari/) and [WebKit](https://webkit.org/) projects at Apple. These days I'm just an aspiring writer and recovering programmer.

I live in the Republic of California with my wife, son and various creatures --- some of which are also family. I prefer dogs over cats since I'm allergic to the latter. The rest are mostly varmints.

Even though I'm retired now, I still haven't decided what I want to be when I grow up. I'm convinced that curiosity and tinkering are useful afflictions, so there's a good chance I'll be working at something again before I expire from more prosaic ailments.

Read on for some more history. Skip to [here](#how-im-playing-with-the-web-here) for details on my eponymous domain.

## I didn't start out as a Web geek

<%= image '/media/donmelton.png', :alt => 'Avatar for Don Melton', :width => 128, :height => 128, :align => 'left', :link => :self %> Growing up, all I ever wanted to be was a comic strip or comic book artist. I not only had a natural talent for drawing, I was diligent in my practice of it. Later I even had some success with my artwork. Now I rarely draw anything other than the occasional fly.

After illustrating some obscure [underground comics](https://en.wikipedia.org/wiki/Underground_comix) as a teenager, I became a professional newspaper artist where I finally managed to get a steady paycheck. Back in the '70s, there was no money in comics. Of course, there was no money in newspapers either.

Later in that slowly dying newspaper business, I pioneered using the Macintosh for [information graphics](https://en.wikipedia.org/wiki/Information_graphics). And I didn't just learn how to draw with computers. Out of curiosity and need, I taught myself to write software with them. In the beginning, I wrote code to make better graphics. Soon though, that effort got out of hand.

Turns out I was good at programming. And I liked it better than drawing. But just so we're clear, I still have no engineering degree. Nor formal management training. I even dropped out of college. Twice. I'm one of those annoying self-taught people you're told to avoid.

After leaving newspapers I've been, at one time or another, a senior engineer or engineering manager of [MacTOPS](https://en.wikipedia.org/wiki/TOPS_(file_server)), [Director](https://en.wikipedia.org/wiki/Adobe_Director), [Illustrator](https://en.wikipedia.org/wiki/Adobe_Illustrator), [Navigator](https://en.wikipedia.org/wiki/Netscape_Navigator), [Nautilus](https://en.wikipedia.org/wiki/Nautilus_(file_manager)) and Safari. Apparently, not everyone was avoiding me.

I was a member of the team at [Netscape](https://en.wikipedia.org/wiki/Netscape) which released [Mozilla](https://en.wikipedia.org/wiki/Mozilla) as [open source](https://en.wikipedia.org/wiki/Open_source). I hired and led the Safari team at Apple where I [chose KHTML and KJS](https://marc.info/?m=104197092318639) as core technologies for the WebKit project. There's a good chance you're reading this now in a WebKit-based browser.

While at Apple, I also led the department developing the [Mail](https://en.wikipedia.org/wiki/Mail_(application)), [Calendar](https://en.wikipedia.org/wiki/Calendar_(application)), [Contacts](https://en.wikipedia.org/wiki/Contacts_(application)), [Messages](https://en.wikipedia.org/wiki/Messages_(application)) and [FaceTime](https://en.wikipedia.org/wiki/FaceTime) apps on [OS X](https://en.wikipedia.org/wiki/OS_X) --- as well as [Core Services](https://en.wikipedia.org/wiki/Core_Services), a set of frameworks familiar to anyone programming for the Mac. My teams did the original versions of some built-in iPad applications. And, of course, I was responsible for WebKit on [iOS](https://en.wikipedia.org/wiki/IOS) in addition to the desktop.

Then, after over 10 years at Apple, and safely months before the [Mayan apocalypse](https://en.wikipedia.org/wiki/2012_phenomenon), I retired from my position as Engineering Director of Internet Technologies in early 2012 in order to focus on writing. At least that's what I told everyone at the time. When I'm not pretending to write, I love to tinker with things. Like this website.

## How I'm playing with the Web here

Although I've used publishing systems such as [WordPress](https://wordpress.org/), [Movable Type](https://movabletype.com/) and [Textpattern](http://textpattern.com/) elsewhere, I'm not deploying any of them here. And that's after prototyping this whole site in WordPress --- an effort which included writing my own theme and numerous plugins. Instead, I went full-on hipster and used a static website generator.

With a static publishing system there's no server-side database containing posts and pages. It works by generating Web content from simple text files. Although you lose Web-based authoring and dynamic behavior, you gain loading speed, security and ease of maintenance.

I considered [Nanoc](http://nanoc.ws/) and [Jekyll](http://jekyllrb.com/) for the generator. I admire both and, once again, prototyped the whole site with each of them. Did I mention I'm retired and have a lot of time on my hands? But, in the end, I wrote my own system. Why? Because I can. And I wanted an even simpler tool.

My generator is [Magneto](https://github.com/donmelton/magneto) and it's [Ruby](http://www.ruby-lang.org/)-based, just like Nanoc and Jekyll. It uses many of the same core technologies. But it's simpler because much of the typical policy and behavior built into those tools are moved into a controller script and set of plugins specific to my website. Which means I only re-invented a small part of the wheel.

Magneto is [available as a gem](https://rubygems.org/gems/magneto) which you can install on your own computer. Before using it, realize that it does have limitations due to its simplicity and that its programming interface may change because it's still under development. You can see how I use it in the source code to this website, [available online](https://github.com/donmelton/donmelton.com).

The output Magneto cooks is just tag soup of various flavors. Yum. And I always taste test it with Safari, Firefox, Opera, Chrome and Internet Explorer. But if something gives your browser a bellyache, [let me know](/contact/) and I'll see what I can do.

Of course, there's no guarantee that I'll keep using my own system to create this website. I love to tinker with things.
