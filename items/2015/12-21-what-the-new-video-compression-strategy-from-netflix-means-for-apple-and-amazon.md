---
published: 2015-12-21T13:50:02-08:00
title: What the new video compression strategy from Netflix means for Apple and Amazon
---
Last week, several folks on Twitter pointed me to [this technical post](http://techblog.netflix.com/2015/12/per-title-encode-optimization.html) from Netflix about their new video compression strategy. While not yet implemented, it promises to save bandwidth while improving quality for some content.

And the article is very nearly a nerdgasm for a transcoding geek like myself. I'd still like to see more details about the exact rate control mechanism they're using and actual encoder arguments but, hey, you can't have everything.

The tl;dr of it all is simply that Netflix plans on scaling bitrates up and down based on the complexity of their video. So, slightly higher bitrates for busy action blockbusters and possibly lower bitrates for relatively static, flat cartoons.

Basically what we've all been doing for years with variable bitrate (VBR) encoding. But they're trying to control that variance a lot more than an encoder like [x264](https://en.wikipedia.org/wiki/X264) typically allows. In fact, as near as I can tell, Netflix still plans on encoding everything with a constant bitrate (CBR), but they want to be really particular about the target number.

To do that, Netflix will transcode every one of their videos a bazillion times at different resolutions and at different bitrates, finally selecting the smallest one for a particular title that doesn't suck visually. Seriously, their algorithm for all of this is quite clever.

And the new Netflix proposal will likely succeed. After all, they have a server farm the size of a small country to do all those iterations.

Since the rest of us don't have that kind of hardware, the rate control system used in my [video_transcoding](https://github.com/donmelton/video_transcoding) project might be more appropriate.

Anyway, besides all the geekery, what struck me about this whole plan by Netflix is that Apple and Amazon will likely go down the same path. For competitive reasons, if nothing else.

They all have the same server farms. Owned by Amazon, no doubt. And there aren't any technical hurdles. It's just more computation.

At least Apple and Amazon will likely do this for streaming. But I'm not sure that's true for sales of digital video downloads.

Let me explain.

When Apple first opened the iTunes Store to sell music, those audio files were provided at 128 Kbps in AAC format using Apple's own encoder.

And that encoder was quite good, but back then it was only used for constant (CBR) and average bitrate (ABR) output. So a track that was advertised being 128 Kbps was very likely encoded at or very near 128 Kbps. You got what you paid for. 

Later, Apple did away with audio DRM and upped the bitrate to 256 Kbps. For nearly the same price. It was awesome. And we all remember the awesomeness of it.

Apple also developed a new version of their audio encoder with a true variable bitrate (VBR) mode. And that new mode produced just as good if not better quality audio than the CBR and ABR schemes. Often at much lower bitrates, too.

But I suspect that was a problem.

You see, it would probably be difficult to sell those VBR files --- some of which were quite a bit lower than 256 Kbps and a few even lower than 128 Kbps --- because customers might perceive a loss of value.

I think this is why Apple developed a new encoding mode they call Constrained VBR. It has all the benefits of the regular VBR mode, but it just doesn't dip the bitrate too low. In a way, it acts like the old ABR mode, occasionally wasting space for less complex audio.

Of course, for some tracks the Constrained VBR output is larger than 256 Kbps. In fact, all of the songs on Taylor Swifts's "1989" are larger than 256 Kbps. I bet you're thinking, "Wow! More value for my money!" (And maybe, "WTF? Gramps listens to Taylor Swift?")

But there are quite a few audio files in the iTunes Store that could probably be a lot smaller with no perceived loss of quality if Apple used that original VBR mode to do the encoding.

I would bet money that Amazon ran into this same conundrum with the unconstrained VBR mode of the [LAME MP3 encoder](https://en.wikipedia.org/wiki/LAME) which they use. And this might explain why some of Amazon's files are in CBR format, artificially boosting their size.

Anyway, Netflix is talking about the bitrates for their 1080p videos soon being as low 2000 Kbps for the simple stuff. That's down from the 4300-5800 Kbps range they're using now. And I'm sure they can do that on the low end without any perceivable loss of quality while streaming.

But can Apple and Amazon sell 1080p videos --- averaging about 5000 Kbps now --- at bitrates as low as 2000 Kbps --- less than half that average size --- without a perceived loss of value?

I don't know. It's hard to predict because consumers... well... we're fucking stupid.
