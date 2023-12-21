Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C796C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:18:00 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.53552.1703171871503384538
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 07:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=kOiGmpNe;
 spf=pass (domain: criticallink.com, ip: 209.85.208.174, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cc6863d43aso8987721fa.1
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1703171870; x=1703776670; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+4QwtJS4NI7rfjsPlPs6ATs5JJJxTh4Ur0ZBZhiJ14=;
        b=kOiGmpNeJEVdPeLZVbhp/vS5zUci1reqzdxLBeYJH0xXdV5QbTKW2f2wy7Ctm/mExF
         nqth33LNuDWV7zyRTOCCuk8GTEWWf3jFzzLXmrYGu/omBz3qOUAfSoTTEH3df4wOlCma
         ktHz4vziHEXAcWNhkZtZM+Wt3ysIKo9f7CXUEKGAn61aJbvFdsncICxVkizM/umG6H2T
         +DVvUdz8ngfW2buCJ6nXlSHcP1jLZvS2vmPWhzkdn4ImMHSatpdT+EjJ3lSy+jX9syHR
         kiQ1uhGLSBG32NUVXxu/gcTyzCmSvkGSFSlOK75FeWksl45wOwUtQHBUjU+m9zSA6DrL
         fBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703171870; x=1703776670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+4QwtJS4NI7rfjsPlPs6ATs5JJJxTh4Ur0ZBZhiJ14=;
        b=lpX5moep+kbmmplQ+1XqTIO9yuWKJCstnk7hsZ1bAfgU+H5dIGlv0GuCt+FgYWDRbR
         0cMRhmEcLDVp9zvLdzrAgWaZwbP9+5gck0LoqUa6ZgDzDhNMb6dk6jdyuaJvJM18enzS
         aWngQ/68/Ie0NDA34V0AlKGYysJvKj7ULSSWohI2j+4e3KqIJshbYXDInjsQRNc0sOg1
         /iTiY1Zt47bS3q7A9vbDXG8dX92PJAjO//oYOYn5WWekj6bz6ndSK+4Tfyv/tChbmern
         4QIrq01mdEiLiaUPdRb8hz1GIi0Uxp0OiiFhw20c3drr2YRSc02JVX256E6wetc2oqbf
         UBGQ==
X-Gm-Message-State: AOJu0YxSSHEDu9T3a9EcLz9WqQfh9R84lWVGvSTYIizrTLD9ZzPsOG6o
	Vqme1Bas0h66LAt3fCQhCzfbJMrjA3VHOT0ma2RVOg==
X-Google-Smtp-Source: AGHT+IGYLrOgnIzRfFoJA9K4ym2KYfrHwKJ8sobCuzrLVDyOAo3yyoFrgllsYCK07ozNmJDKLCnyPtISDm0gMXcwA+4=
X-Received: by 2002:a2e:8042:0:b0:2cc:8670:90fe with SMTP id
 p2-20020a2e8042000000b002cc867090femr2065463ljg.4.1703171869590; Thu, 21 Dec
 2023 07:17:49 -0800 (PST)
MIME-Version: 1.0
References: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
 <CADL8D3bhvg4CjJrGdniJmX4QPf2-Y08_fKTaZVkN1_P0ebecfA@mail.gmail.com> <18c8ce702d8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <18c8ce702d8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 21 Dec 2023 10:17:38 -0500
Message-ID: <CADL8D3YqbznfEqs2O9Bcf3iqHYZMHGxDHOqHZjcL6EE7cMBUzQ@mail.gmail.com>
Subject: Re: [meta-ti] Custom device tree overlay for BBB
To: Bremenpl <bremenpl@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000475816060d069a24"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 15:18:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17364

--000000000000475816060d069a24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This solution seems like a good place to start. I haven't tried it myself
but it looks clean and easy to implement.
https://stackoverflow.com/a/68650774

The alternative would be to bbappend the kernel and patch your overlay into
the correct folder.
https://stackoverflow.com/a/39343720

On Thu, Dec 21, 2023 at 10:03=E2=80=AFAM Bremenpl <bremenpl@gmail.com> wrot=
e:

> Hi and thank you for the answer Jonathan!
>
> Do you happen to also know a good reference on how to incorporate an
> overlay into the yocto build?
>
> On December 21, 2023 15:58:56 Jon Cormier <jcormier@criticallink.com>
> wrote:
>
>> Here is a possible example overlay that configures pinmuxes with the
>> expectation that the pru's will use them.  There is likely a similar
>> example in that long list of overlays that disables hdmi.
>>
>>
>> https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/AM335=
X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts
>>
>> Note its entirely possible these examples won't build or apply correctly
>> on a different kernel version, but they should still be a decent startin=
g
>> point.
>>
>> On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Przenioslo <bremenpl@gmai=
l.com>
>> wrote:
>>
>>> Hello there,
>>>
>>> I was able to compile the Poky image (Dunfell) with meta-ti included fo=
r
>>> the BBB. I am working on an open source project intended for home
>>> automation based on the BBB: https://github.com/Beaglenode/BeagleNodeHW
>>>
>>> The next step I am trying to make is to prepare a proper device tree
>>> overlay that would align with the HW requirements of this project (or
>>> "cape"). I need to:
>>> - Disable the HDMI pins,
>>> - configure multiple pins as either PRU0 or PRU1 controlled.
>>>
>>> For that I thought the best approach would be to prepare a DTO, instead
>>> of modifying the default one for BBB. I don't know how to prepare that =
DTO
>>> yet and I don't know how to include it in my build. I would like to ask=
 for
>>> some help in this manner, especially the prior part (how to load the cu=
stom
>>> DTO). Right now I am still modifying everything in the local.conf, as I=
 do
>>> not have the knowledge yet to build my own distro for this device (that=
's
>>> the end plan).
>>>
>>> I would appreciate all help!
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#17360):
>>> https://lists.yoctoproject.org/g/meta-ti/message/17360
>>> Mute This Topic: https://lists.yoctoproject.org/mt/103298715/7902621
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
>>> jcormier@criticallink.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> Jonathan Cormier
>> Software Engineer
>>
>> Voice:  315.425.4045 x222
>>
>>
>>
>> http://www.CriticalLink.com <http://www.criticallink.com/>
>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>>
>> <https://www.linkedin.com/company/critical-link-llc>
>> <https://twitter.com/Critical_Link>
>>
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

--000000000000475816060d069a24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This solution seems like a good place to start. I hav=
en&#39;t tried it myself but it looks clean and easy to implement.<br></div=
><div><a href=3D"https://stackoverflow.com/a/68650774">https://stackoverflo=
w.com/a/68650774</a></div><div><br></div><div>The alternative would be to b=
bappend the kernel and patch your overlay into the correct folder.</div><di=
v><a href=3D"https://stackoverflow.com/a/39343720">https://stackoverflow.co=
m/a/39343720</a></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Dec 21, 2023 at 10:03=E2=80=AFAM Bremenpl &lt=
;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">Hi and thank you for the answer Jonathan!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Do you happen to also know a good ref=
erence on how to incorporate an overlay into the yocto build?</div><div dir=
=3D"auto"><br></div>
<div id=3D"m_6296934730967812146aqm-original" style=3D"color:black;font-fam=
ily:sans-serif">

<div>
<div style=3D"color:black">
<p style=3D"color:black;font-size:10pt;font-family:sans-serif;margin:8pt 0p=
x">On December 21, 2023 15:58:56 Jon Cormier &lt;<a href=3D"mailto:jcormier=
@criticallink.com" target=3D"_blank">jcormier@criticallink.com</a>&gt; wrot=
e:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"ltr"><div>Here is a possible example overlay that configures pi=
nmuxes with the expectation that the pru&#39;s will use them.=C2=A0 There i=
s likely a similar example in that long list of overlays that disables hdmi=
.<br></div><div><br></div><div><a href=3D"https://github.com/beagleboard/bb=
.org-overlays/blob/master/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts=
" target=3D"_blank">https://github.com/beagleboard/bb.org-overlays/blob/mas=
ter/src/arm/AM335X-PRU-RPROC-4-19-TI-PRUCAPE-00A0.dts</a></div><div><br></d=
iv><div>Note its entirely possible these examples won&#39;t build or apply =
correctly on a different kernel version, but they should still be a decent =
starting point.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Dec 21, 2023 at 6:34=E2=80=AFAM Lukasz Prz=
enioslo &lt;<a href=3D"mailto:bremenpl@gmail.com" target=3D"_blank">bremenp=
l@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello there,<br>
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
div><br></div><div><div><span style=3D"color:rgb(0,0,0)">Voice:=C2=A0=C2=A0=
<a value=3D"+13154254045">315.425.4045</a>=C2=A0x222</span></div><div><span=
 style=3D"color:rgb(0,0,0)"><br></span></div><div><span style=3D"color:rgb(=
0,0,0)"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4xml75f=
JPKYF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></=
span></div></div></div><div><div><span style=3D"color:rgb(17,85,204)"><br><=
/span></div><div><a href=3D"http://www.criticallink.com/" target=3D"_blank"=
><span style=3D"color:rgb(17,85,204)">http://www.CriticalLink.com</span></a=
><br></div><div>6712 Brooklawn Parkway,=C2=A0Syracuse, NY 13211=C2=A0</div>=
</div></div><div><div><br></div><div><span style=3D"color:rgb(17,85,204)"><=
span style=3D"color:rgb(17,85,204)"><a href=3D"https://www.linkedin.com/com=
pany/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.google.c=
om/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D0=
B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a href=
=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1y=
WERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ=
"></a></span></span></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div>
</blockquote>
</div>
</div>


</div><div dir=3D"auto"><br></div>
</div></div>

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

--000000000000475816060d069a24--

