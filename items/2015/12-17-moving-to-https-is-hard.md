---
published: 2015-12-17T23:38:28-08:00
title: Moving to HTTPS is hard
---
Since it's the third anniversary of my weblog here today, I was hoping to make the switch over to HTTPS and mark the occasion. Alas, trying to do everything in one day turned to be incredibly naive and optimistic.

Especially when you don't start the process until late afternoon.

You probably think I'm an old hand at HTTP-to-HTTPS migration but, to be honest, this is the first time I've attempted it. While it's true that I call myself a Web geek, I'm usually referring to the client side of that particular nerdity. Remember, we are a diverse species.

But I have made some progress. With my service provider, [DreamHost](https://www.dreamhost.com/), doing most of the heavy lifting, of course.

So far, I've switched over from shared hosting to a virtual private server. This wasn't strictly necessary for HTTPS, but I have other evil plans on the drawing board that'll fit better with that configuration. Stay tuned.

Provisioning the server and copying everything to it took a few hours and then required its new IP address to propagate through DNS, which took a few more.

Stupidly, I forgot that you really need a static IP address to make HTTPS not suck, so I had to acquire one of those while I ordered the SSL certificate.

The good news is that the certificate is now installed. The bad news is that the sever is refusing to connect via HTTPS on port 443. The DreamHost folks suspect this is because the new static IP address hasn't propagated yet through DNS. But we won't know for sure until that happens anyway.

So, again, the next step is... waiting. Pro tip: get your static IP address setup first if you're moving to HTTPS.

One bonus with watching this particular kettle boil so often and for so long is that it's given me time to prepare all the content changes to the site for HTTPS support. Like, you know, redirects. And if I'm lucky, I'll find out tomorrow whether those changes worked.

If they do, then it's a mad dash to the [Google Search Console](https://en.wikipedia.org/wiki/Google_Search_Console) and adding the HTTPS version of my site to their system before my page ranking drops off the radar.

Really, what could be easier than all of this?
