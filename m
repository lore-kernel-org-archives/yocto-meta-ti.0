Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DDBC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:59:00 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.53110.1703170737192695849
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 06:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=VnB9O+/w;
 spf=pass (domain: criticallink.com, ip: 209.85.208.174, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cc3f5e7451so10056141fa.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1703170735; x=1703775535; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b1qjxP8YnPm3HfR2vGw3rw6E4LadWE9NTJYy5adowq0=;
        b=VnB9O+/whKNL9e7wDvi2OxzaQkoJQuqI70Ksr9P3+Cr5uA8xjOcIOw3WxpCealwxTX
         opGZp/9E09vK5YC6yopZKPdL7eiFtHGrUEwDydj/BHhAeezw2oVBiIU485QFTrSvk1tm
         ioUcKwLZuxK9KoLHMLLYC3yxKWPI6gwQPQLvPEEs524zFOEsz3Njoekp0FjY5nY0JtYD
         pHmd/i2QYY8RrsBbzBb99jejFIrRkLR32N0MSKVVElnT91EQ+BPGnyx9G69UsSAYBUg+
         fjgqKOrY0onm3eBIqp90RpHbKIAMzrSGIwn+lOgMFmoGz86IO12ypsp+Kj71c8xtWvAS
         66QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703170735; x=1703775535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1qjxP8YnPm3HfR2vGw3rw6E4LadWE9NTJYy5adowq0=;
        b=JXl7BmWVVfPUTEorAfUZWDcc8Kop90PUJ6E1hj4NNABCjCmdt5gU1ILebaK5SuCcLg
         T3ZM9aAG8vSKH/KEoFvs2IungeBpGOwa3LKhD7XN6c/14zl+cN+H1yOYtg7OlPaBUW3d
         d5wzJqqTbFqj75V7uLJNByIo3SjOw6SlsHUEm7Wj9uBoNupIPGzU/I8YSE9wmbsOvPL9
         T3nmzQD9e8fH0jDDKZbtknOKHAZjdONrmgON7B7hVHaNDh6ZcdkprtphYm9MZdb9guVa
         EgTzvik5LP0ahU2TrY51niXoy4aHuAB/rGP2nifxxFOUNUnDa7VWGtLlrxMAr/XAYlYR
         hLKg==
X-Gm-Message-State: AOJu0YyLbPoEMg3UkKTmUrB4ARwkm/h0NJ0jzdm51RFnl9VjF0qkk68Z
	lvYGjGD9VZ+oe60r8ALPQePoUYWQrLASGfORQhvEzg==
X-Google-Smtp-Source: AGHT+IEceNeaNuvQIj3flZHlJvE4wP3zZH443MFZFKyP6O4JewB68q/0WhFvaW462y+Epe5aE6gQ2Jz4oDzzDq65DIY=
X-Received: by 2002:a2e:3809:0:b0:2cc:5d98:6f60 with SMTP id
 f9-20020a2e3809000000b002cc5d986f60mr4383451lja.42.1703170735078; Thu, 21 Dec
 2023 06:58:55 -0800 (PST)
MIME-Version: 1.0
References: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
In-Reply-To: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 21 Dec 2023 09:58:43 -0500
Message-ID: <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com>
Subject: Re: [meta-ti] Custom device tree overlay for BBB
To: Lukasz Przenioslo <bremenpl@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a80f23060d065665"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 14:59:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17362

--000000000000a80f23060d065665
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is a possible example overlay that configures pinmuxes with the
expectation that the pru's will use them.  There is likely a similar
example in that long list of overlays that disables hdmi.

https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335X-P=
RU-RPROC-4-19-TI-PRUCAPE-00A0.dts

Note its entirely possible these examples won't build or apply correctly on
a different kernel version, but they should still be a decent starting
point.

On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo <bremenpl@gmail.c=
om>
wrote:

> Hello there,
>
> I was able to compile the Poky image (Dunfell) with meta-ti included for
> the BBB. I am working on an open source project intended for home
> automation based on the BBB: https://github.com/Beaglenode/BeagleNodeHW
>
> The next step I am trying to make is to prepare a proper device tree
> overlay that would align with the HW requirements of this project (or
> "cape"). I need to:
> - Disable the HDMI pins,
> - configure multiple pins as either PRU0 or PRU1 controlled.
>
> For that I thought the best approach would be to prepare a DTO, instead o=
f
> modifying the default one for BBB. I don't know how to prepare that DTO y=
et
> and I don't know how to include it in my build. I would like to ask for
> some help in this manner, especially the prior part (how to load the cust=
om
> DTO). Right now I am still modifying everything in the local.conf, as I d=
o
> not have the knowledge yet to build my own distro for this device (that's
> the end plan).
>
> I would appreciate all help!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17360):
> https://lists.yoctoproject.org/g/meta-ti/message/17360
> Mute This Topic: https://lists.yoctoproject.org/mt/103298715/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--000000000000a80f23060d065665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Here is a possible example overlay that configures pi=
nmuxes with the expectation that the pru&#39;s will use them.=C2=A0 There i=
s likely a similar example in that long list of overlays that disables hdmi=
.<br></div><div><br></div><div><a href=3D"https://github.com/beagleboard/bb=
.org-overlays/blob/master/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts=
">https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335X=
-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts</a></div><div><br></div><div>Note its e=
ntirely possible these examples won&#39;t build or apply correctly on a dif=
ferent kernel version, but they should still be a decent starting point.<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo &lt;<a hre=
f=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hello there,<br>
<br>
I was able to compile the Poky image (Dunfell) with meta-ti included for th=
e BBB. I am working on an open source project intended for home automation =
based on the BBB: <a href=3D"https://github.com/Beaglenode/BeagleNodeHW" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Beaglenode/BeagleNode=
HW</a><br>
<br>
The next step I am trying to make is to prepare a proper device tree overla=
y that would align with the HW requirements of this project (or &quot;cape&=
quot;). I need to:<br>
- Disable the HDMI pins,<br>
- configure multiple pins as either PRU0 or PRU1 controlled.<br>
<br>
For that I thought the best approach would be to prepare a DTO, instead of =
modifying the default one for BBB. I don&#39;t know how to prepare that DTO=
 yet and I don&#39;t know how to include it in my build. I would like to as=
k for some help in this manner, especially the prior part (how to load the =
custom DTO). Right now I am still modifying everything in the local.conf, a=
s I do not have the knowledge yet to build my own distro for this device (t=
hat&#39;s the end plan).<br>
<br>
I would appreciate all help!<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17360): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17360" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17360</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/103298715/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/103298715/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB=
6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></font></div></div></div><=
div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http://ww=
w.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://www.C=
riticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0Syrac=
use, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font color=
=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com/co=
mpany/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.google.=
com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D=
0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a hre=
f=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1y=
WERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ=
"></a></font></font></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div>

--000000000000a80f23060d065665--

