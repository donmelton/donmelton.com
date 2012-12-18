---
published: 2012-12-18T14:26:08-08:00
title: An apology for sloppy RSS feed engineering
---
Note of apology to anyone who thought I was trying to engineer extra page views in RSS readers with my link-format posts, those with the little "&rarr;" after the title.

Apparently, I can't engineer shit on toast because those post titles when viewed in an RSS reader would link to my post's page and not the external website. It all worked correctly everywhere else, just not in the feed.

A quick application of `isPermaLink="false"` to the `<guid>` elements in my RSS feed cleared the problem right up. Which is pretty damn ironic considering the content of those `<guid>` elements are actually permalinks.

It's the Web. None of us understand how it works.

And who am I kidding? The odds are nobody noticed the problem anyway.
