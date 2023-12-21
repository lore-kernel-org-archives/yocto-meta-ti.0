Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B4EC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 20:52:01 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.4627.1703191918518919363
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 12:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZcLNnPgZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: bremenpl@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e4a637958so1612861e87.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 12:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703191916; x=1703796716; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzT6G6glgsRZnsG+5ZrrnP9pc76L1tXMdlTxSqZxBmY=;
        b=ZcLNnPgZwCvQTbSxqgCjshYXKQmAqb6BeFYtkkU7tHd6Lctv8ORutP6uaxylFXj/74
         57wS7VQclxRfrtd/6s3Qa9iNIZ2PsF2XYC6i+fnIHKpwEUyBp7DtWz2zWV41kKD929a2
         hYQBjSCybuVuQdHvS4eCzi6Qm8nU+1pylPrWNErCIIXa9egT2i9z1dzo4qfjJm+j2+O1
         3yKfIic70fTXjgWe50ik/JqRwh6srrSOzcMfBtquIE9880RQVeS4A/Btc6kUbhDup28S
         YVu6yuqwTC0QcapnIczeIcqpteQc2UmsPXu98Nq9CzSwUceSn8eroumM1StNnQCfJYs1
         Rf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703191916; x=1703796716;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzT6G6glgsRZnsG+5ZrrnP9pc76L1tXMdlTxSqZxBmY=;
        b=cVgqsWcfZ2Qod/IUJ5JKVBfoahViGSPGDazy6FfD8hkT+gMRTT95sNtSg8IGUz4J7Q
         37Tzz8ybjDQmiZZWUjKDv/Iz++PR5lofP0LPKyxBY4G66pmh8hlngQkACK3ahyiggtkM
         XgnPTwlnHXkaUAfrwJjwxgiHt1VEZxZPYtBCCXB8bKaLJZC3QMsjRECC6ZEJNNdBST7S
         auwct2kIwFzjNx4KoUfqzLqOLU4JiGCMHyLFE/4QjS18R5Th9WLxpnP1kvr34X+HzjiP
         iwC/dZCWT9YJAkoRp2KQrlY0Refwf6lsM0LTGxUZKLjYLxgUtEgVabpZ3IJrTcwK4ltJ
         o1Fw==
X-Gm-Message-State: AOJu0YzGSZ8rK0CxA4lYBmL+zzcr7psc65RQONX26jOdblRg66RLqYmd
	UZN6FeqQ7ghDhqJSFJPR1ac=
X-Google-Smtp-Source: AGHT+IGXEQl9Yl6ZiY1Km6SNw51J5gJDWmMW44SAi6Ik3COpuVHERNoSijgIq9a42RIIRhWic7hBuA==
X-Received: by 2002:ac2:599a:0:b0:50e:3081:ba29 with SMTP id w26-20020ac2599a000000b0050e3081ba29mr53086lfn.57.1703191916092;
        Thu, 21 Dec 2023 12:51:56 -0800 (PST)
Received: from [192.168.7.17] (eqj153.neoplus.adsl.tpnet.pl. [83.20.77.153])
        by smtp.gmail.com with ESMTPSA id 23-20020ac24857000000b0050e525ba883sm363175lfy.127.2023.12.21.12.51.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Dec 2023 12:51:55 -0800 (PST)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Jon Cormier" <jcormier@criticallink.com>
Subject: Re[2]: [meta-ti] Custom device tree overlay for BBB
Cc: meta-ti@lists.yoctoproject.org
Date: Thu, 21 Dec 2023 20:51:49 +0000
Message-Id: <emfb88b8f2-4501-4fef-8010-1618c71d24e1@ffb2c130.com>
In-Reply-To: <CADL8D3YqbznfEqs2O9Bcf3iqHYZMHGxDHOqHZjcL6EE7cMBUzQ@mail.gmail.com>
References: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
 <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com>
 <18c8ce702d8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3YqbznfEqs2O9Bcf3iqHYZMHGxDHOqHZjcL6EE7cMBUzQ@mail.gmail.com>
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
User-Agent: eM_Client/9.2.2157.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------=_MBB16283C9-4164-41D3-9FD6-A5E2814D9D65"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 20:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17365

--------=_MBB16283C9-4164-41D3-9FD6-A5E2814D9D65
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Jon,
I guess the first option is more feasible, as I would not like to modify=20
any files provided by the Poky repo, but rather create my own recipe=20
that would somehow cover the default settings during the build. There is=20
still a lot ahead for me to understand though...

Thank you for the useful links.

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "Jon Cormier" <jcormier@criticallink.com>
To "Bremenpl" <bremenpl@gmail.com>
Cc meta-ti@lists.yoctoproject.org
Date 2023-12-21 16:17:38
Subject Re: [meta-ti] Custom device tree overlay for BBB

>This solution seems like a good place to start. I haven't tried it=20
>myself but it looks clean and easy to implement.
>https://stackoverflow.com/a/68650774
>
>The alternative would be to bbappend the kernel and patch your overlay=20
>into the correct folder.
>https://stackoverflow.com/a/39343720
>
>On Thu, Dec 21, 2023 at 10:03=E2=80=AFAM Bremenpl <bremenpl@gmail.com> wro=
te:
>>Hi and thank you for the answer Jonathan!
>>
>>Do you happen to also know a good reference on how to incorporate an=20
>>overlay into the yocto build?
>>
>>On December 21, 2023 15:58:56 Jon Cormier <jcormier@criticallink.com>=20
>>wrote:
>>
>>>Here is a possible example overlay that configures pinmuxes with the=20
>>>expectation that the pru's will use them.  There is likely a similar=20
>>>example in that long list of overlays that disables hdmi.
>>>
>>>https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335=
X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts
>>>
>>>Note its entirely possible these examples won't build or apply=20
>>>correctly on a different kernel version, but they should still be a=20
>>>decent starting point.
>>>
>>>On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo=20
>>><bremenpl@gmail.com> wrote:
>>>>Hello there,
>>>>
>>>>I was able to compile the Poky image (Dunfell) with meta-ti included=20
>>>>for the BBB. I am working on an open source project intended for=20
>>>>home automation based on the BBB:=20
>>>>https://github.com/Beaglenode/BeagleNodeHW
>>>>
>>>>The next step I am trying to make is to prepare a proper device tree=20
>>>>overlay that would align with the HW requirements of this project=20
>>>>(or "cape"). I need to:
>>>>- Disable the HDMI pins,
>>>>- configure multiple pins as either PRU0 or PRU1 controlled.
>>>>
>>>>For that I thought the best approach would be to prepare a DTO,=20
>>>>instead of modifying the default one for BBB. I don't know how to=20
>>>>prepare that DTO yet and I don't know how to include it in my build.=20
>>>>I would like to ask for some help in this manner, especially the=20
>>>>prior part (how to load the custom DTO). Right now I am still=20
>>>>modifying everything in the local.conf, as I do not have the=20
>>>>knowledge yet to build my own distro for this device (that's the end=20
>>>>plan).
>>>>
>>>>I would appreciate all help!
>>>>
>>>>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>Links: You receive all messages sent to this group.
>>>>View/Reply Online (#17360):=20
>>>>https://lists.yoctoproject.org/g/meta-ti/message/17360
>>>>Mute This Topic: https://lists.yoctoproject.org/mt/103298715/7902621
>>>>Group Owner: meta-ti+owner@lists.yoctoproject.org=20
>>>><mailto:meta-ti%2Bowner@lists.yoctoproject.org>
>>>>Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>>>[jcormier@criticallink.com]
>>>>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>
>>>
>>>--
>>>Jonathan Cormier
>>>Software Engineer
>>>
>>>Voice:  315.425.4045 x222
>>>
>>>
>>>
>>>http://www.CriticalLink.com <http://www.criticallink.com/>
>>>6712 Brooklawn Parkway, Syracuse, NY 13211
>>>
>>><https://www.linkedin.com/company/critical-link-llc>  =20
>>><https://twitter.com/Critical_Link>
>>
>
>
>--
>Jonathan Cormier
>Software Engineer
>
>Voice:  315.425.4045 x222
>
>
>
>http://www.CriticalLink.com <http://www.criticallink.com/>
>6712 Brooklawn Parkway, Syracuse, NY 13211
>
><https://www.linkedin.com/company/critical-link-llc>  =20
><https://twitter.com/Critical_Link>
--------=_MBB16283C9-4164-41D3-9FD6-A5E2814D9D65
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style id=3D"css_styles" type=3D"text/css"><!--blockquote.cite=
 { margin-left: 5px; margin-right: 0px; padding-left: 10px; padding-right:0p=
x; border-left: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: center; '], li[s=
tyle=3D'text-align: right;'], li[style=3D'text-align: right; '] {  list-sty=
le-position: inside;}
body { font-family: Verdana; font-size: 12pt; }
.quote { margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb soli=
d; padding-left: 0.3em; }
--></style></head><body><div>Hi Jon,</div><div>I guess the first option is=
 more feasible, as I would not like to modify any files provided by the Poky =
repo, but rather create my own recipe that would somehow cover the default =
settings during the build. There is still a lot ahead for me to understand =
though...</div><div><br /></div><div><div id=3D"x3075b3f5b3344b71ac3a13dcf=
823d09d">Thank you for the useful links.</div></div>
<div><br /></div><div id=3D"signature_old" style=3D"clear:both">--<div>=C5=
=81ukasz Przenios=C5=82o</div></div><div style=3D"clear:both"><br /></div>
<div><br /></div>
<div>
<div>------ Original Message ------</div>
<div>From "Jon Cormier" &lt;<a href=3D"mailto:jcormier@criticallink.com">jc=
ormier@criticallink.com</a>&gt;</div>
<div>To "Bremenpl" &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail=
.com</a>&gt;</div>
<div>Cc <a href=3D"mailto:meta-ti@lists.yoctoproject.org">meta-ti@lists.yoc=
toproject.org</a></div>
<div>Date 2023-12-21 16:17:38</div>
<div>Subject Re: [meta-ti] Custom device tree overlay for BBB</div></div><d=
iv><br /></div>
<div id=3D"xc0e4c75104e34ea"><blockquote cite=3D"CADL8D3YqbznfEqs2O9Bcf3iqH=
YZMHGxDHOqHZjcL6EE7cMBUzQ@mail.gmail.com" type=3D"cite" class=3D"cite2">
<div dir=3D"ltr"><div>This solution seems like a good place to start. I hav=
en't tried it myself but it looks clean and easy to implement.<br /></div><=
div><a href=3D"https://stackoverflow.com/a/68650774">https://stackoverflow.=
com/a/68650774</a></div><div><br /></div><div>The alternative would be to b=
bappend the kernel and patch your overlay into the correct folder.</div><di=
v><a href=3D"https://stackoverflow.com/a/39343720">https://stackoverflow.co=
m/a/39343720</a></div></div><br /><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Dec 21, 2023 at 10:03=E2=80=AFAM Bremenpl &=
lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com</a>&gt; wrote:<=
br /></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">Hi and thank you for the answer Jonathan!</div><div dir=
=3D"auto"><br /></div><div dir=3D"auto">Do you happen to also know a good r=
eference on how to incorporate an overlay into the yocto build?</div><div d=
ir=3D"auto"><br /></div>
<div id=3D"m_6296934730967812146aqm-original" style=3D"color: rgb(0, 0, 0); =
font-family: sans-serif;">

<div>
<div style=3D"color: rgb(0, 0, 0);">
<p style=3D"color: rgb(0, 0, 0); font-size: 10pt; font-family: sans-serif;=
 margin: 8pt 0px;">On December 21, 2023 15:58:56 Jon Cormier &lt;<a href=3D"=
mailto:jcormier@criticallink.com">jcormier@criticallink.com</a>&gt; wrote:<=
/p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"ltr"><div>Here is a possible example overlay that configures pi=
nmuxes with the expectation that the pru's will use them.=C2=A0 There is li=
kely a similar example in that long list of overlays that disables hdmi.<br =
/></div><div><br /></div><div><a href=3D"https://github.com/beagleboard/bb=
.org-overlays/blob/master/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts=
">https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335X=
-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts</a></div><div><br /></div><div>Note its =
entirely possible these examples won't build or apply correctly on a diffe=
rent kernel version, but they should still be a decent starting point.<br /=
></div></div><br /><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo &lt;<a h=
ref=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com</a>&gt; wrote:<br /></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello there,<br />
<br />
I was able to compile the Poky image (Dunfell) with meta-ti included for th=
e BBB. I am working on an open source project intended for home automation=
 based on the BBB: <a href=3D"https://github.com/Beaglenode/BeagleNodeHW" re=
l=3D"noreferrer">https://github.com/Beaglenode/BeagleNodeHW</a><br />
<br />
The next step I am trying to make is to prepare a proper device tree overla=
y that would align with the HW requirements of this project (or "cape"). I=
 need to:<br />
- Disable the HDMI pins,<br />
- configure multiple pins as either PRU0 or PRU1 controlled.<br />
<br />
For that I thought the best approach would be to prepare a DTO, instead of=
 modifying the default one for BBB. I don't know how to prepare that DTO yet =
and I don't know how to include it in my build. I would like to ask for so=
me help in this manner, especially the prior part (how to load the custom D=
TO). Right now I am still modifying everything in the local.conf, as I do n=
ot have the knowledge yet to build my own distro for this device (that's th=
e end plan).<br />
<br />
I would appreciate all help!<br />
<br />
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br />
Links: You receive all messages sent to this group.<br />
View/Reply Online (#17360): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17360" rel=3D"noreferrer">https://lists.yoctoproject.org/g/met=
a-ti/message/17360</a><br />
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/103298715/790=
2621" rel=3D"noreferrer">https://lists.yoctoproject.org/mt/103298715/790262=
1</a><br />
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org">meta=
-ti+owner@lists.yoctoproject.org</a><br />
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer">https://lists.yoctoproject.org/g/meta-ti/unsub</a> [<a href=
=3D"mailto:jcormier@criticallink.com">jcormier@criticallink.com</a>]<br />
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br />
<br />
</blockquote></div><br clear=3D"all" /><br /><span class=3D"gmail_signature=
_prefix">-- </span><br /><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div>Jonathan Cormier<br />Software Engineer<div><di=
v><div><div><br /></div><div><div>Voice:=C2=A0=C2=A0<a value=3D"+1315425404=
5">315.425.4045</a>=C2=A0x222</div><div><br /></div><div><img src=3D"https:=
//ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB6j=
f8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc" /><br /></div></div></div><div><=
div><span style=3D"color: rgb(17, 85, 204);"><br /></span></div><div><a hre=
f=3D"http://www.criticallink.com/"><span style=3D"color: rgb(17, 85, 204);"=
>http://www.CriticalLink.com</span></a><br /></div><div>6712 Brooklawn Park=
way,=C2=A0Syracuse, NY 13211=C2=A0</div></div></div><div><div><br /></div><=
div><span style=3D"color: rgb(17, 85, 204);"><a href=3D"https://www.linkedi=
n.com/company/critical-link-llc"><img src=3D"https://docs.google.com/uc?exp=
ort=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D0B2vNSnu-a=
Yu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ" /></a>=C2=A0=C2=A0<a href=3D"htt=
ps://twitter.com/Critical_Link"><img alt=3D"" src=3D"https://docs.google.co=
m/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revid=3D0B=
2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ" /></a></span></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div>
</blockquote>
</div>
</div>


</div><div dir=3D"auto"><br /></div>
</div></div>

</blockquote></div><br clear=3D"all" /><br /><span class=3D"gmail_signature=
_prefix">-- </span><br /><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div>Jonathan Cormier<br />Software Engineer<div><di=
v><div><div><br /></div><div><div><font color=3D"#000000" style=3D"color: r=
gb(0, 0, 0);">Voice:=C2=A0=C2=A0<a value=3D"+13154254045">315.425.4045</a>=
=C2=A0x222</font></div><div><font color=3D"#000000" style=3D"color: rgb(0,=
 0, 0);"><br /></font></div><div><font color=3D"#000000" style=3D"color: rgb=
(0, 0, 0);"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4xm=
l75fJPKYF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc" />=
<br /></font></div></div></div><div><div><font color=3D"#1155cc" style=3D"c=
olor: rgb(17, 85, 204);"><br /></font></div><div><a href=3D"http://www.crit=
icallink.com/"><font color=3D"#1155cc" style=3D"color: rgb(17, 85, 204);">h=
ttp://www.CriticalLink.com</font></a><br /></div><div>6712 Brooklawn Parkwa=
y,=C2=A0Syracuse, NY 13211=C2=A0</div></div></div><div><div><br /></div><di=
v><font color=3D"#1155cc" style=3D"color: rgb(17, 85, 204);"><font color=3D=
"#1155cc"><a href=3D"https://www.linkedin.com/company/critical-link-llc"><i=
mg src=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aY=
u6OEhHRW9BUFV5WnM&amp;revid=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdu=
dWlFPQ" /></a>=C2=A0=C2=A0<a href=3D"https://twitter.com/Critical_Link"><im=
g alt=3D"" src=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2=
vNSnu-aYu6cU1yWERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1I=
OXFSc0I3ay9jPQ" /></a></font></font></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div>
</blockquote></div>
</body></html>
--------=_MBB16283C9-4164-41D3-9FD6-A5E2814D9D65--


