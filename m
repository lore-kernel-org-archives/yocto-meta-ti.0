Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B8AC47422
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 10:38:13 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.4365.1705055889826394878
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 02:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VaHhkQiz;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bremenpl@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so7485132a12.2
        for <meta-ti@lists.yoctoproject.org>; Fri, 12 Jan 2024 02:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705055888; x=1705660688; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vRWq636T9n5l0zhRBk4PkuME4a/8ZRkY6ceokAekHc=;
        b=VaHhkQizh0d/EyS6Hbb/Rj5lNmbjeyoNLdHqqYq3+UvrReEPbZ+TRnq7nXf0qOuJhh
         4Lm7iNnOiw/AV+pogKSMRp9Yp4PD1VRP1sPouOm50CBoDPchDRRnYfRpv4V1QWx8vg+a
         LVV+j21nJuDPWz74tVO0LF5BySdaPfowOoAtP20qZqI71jFEq1r8JKfaR8UgEhFFNWDl
         i6QuNjKDI/TqZLEsONKYa3/4A8yBezwv6cQMbzQpGvXqi/8xHJXH6maMCAvtPZydyaea
         LhTbizIhzbtzZV/ntIA1SCZjJeshFa0tr1mtHsxE8gCFpA+1bEbZ0/ScygQOb0RZsAqC
         xEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055888; x=1705660688;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vRWq636T9n5l0zhRBk4PkuME4a/8ZRkY6ceokAekHc=;
        b=O7LLR52i0D9xnD+JATYZK32ypIi3OemulMcW1j3ke4RZG/I47qBsrJR0romSw/J8rb
         cBbyV/hDWYLK4L5YQ7mMskWqHjD9VvZffLfCUZeI1TK2HRY0qtzHUgN+GTHQGFFJKF60
         hNxRZl1/7S0BjaUB5IZSRnI1CCUApgmFgKhTGr/BLuyfCSANPOFlCbEwDkNenMjLp7WU
         x4iNewY15yqT5yrJhsjgrQxx2O5NseewisyHN2n6pk+UjlTbcFjtCn9LdbMd2fXKtQve
         hh9Vy7mARlMDpPUb8PwZ8UA/VqQ+0yy9X8WOP5QmNR/rW83l0wTxoqxZMxDB2vSXYUxH
         UEqA==
X-Gm-Message-State: AOJu0Yx7ugGPZJ0r59G4ZwDoiWsoYxlJ7/Xc4wHeXkmBovxDu6hWcXIj
	Qz9MZwClzlPwIKxatb6rg/g=
X-Google-Smtp-Source: AGHT+IEX7yCX462bsLmIdJhicpTfwlKQcx29S6YJlmqk1cmJYC01BdILhRITOdCYbgdA1LVYDdaRAQ==
X-Received: by 2002:a17:907:c987:b0:a27:2f10:fa06 with SMTP id uj7-20020a170907c98700b00a272f10fa06mr288853ejc.109.1705055887665;
        Fri, 12 Jan 2024 02:38:07 -0800 (PST)
Received: from [192.168.40.246] (omniahotel.hdinternet.cz. [188.120.212.249])
        by smtp.gmail.com with ESMTPSA id lf19-20020a170906ae5300b00a26a80a58fcsm1629869ejb.196.2024.01.12.02.38.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jan 2024 02:38:06 -0800 (PST)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Jon Cormier" <jcormier@criticallink.com>
Subject: Re[2]: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
Cc: meta-ti@lists.yoctoproject.org
Date: Fri, 12 Jan 2024 10:38:06 +0000
Message-Id: <em04d9c611-426b-4809-83ca-85b983ce0251@4ba67fc0.com>
In-Reply-To: <CADL8D3b3A1+xyDV05iu8dj5f10QZiNh934R17Ygt6EwRoYfJiQ@mail.gmail.com>
References: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
 <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com>
 <18cf56aea90.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3ZjxJ0vczcGt_2nuDaQ8qYJ0qM9wAV9LU08UBBDbzFVsg@mail.gmail.com>
 <18cf6fe7340.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3b3A1+xyDV05iu8dj5f10QZiNh934R17Ygt6EwRoYfJiQ@mail.gmail.com>
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
User-Agent: eM_Client/9.2.2157.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------=_MB285D47EF-913A-4F5F-86E0-B47246E85634"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Jan 2024 10:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17402

--------=_MB285D47EF-913A-4F5F-86E0-B47246E85634
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for the answer Jon,
I must double confirm this then... I recall that on kirkstone:
There were no labels in both meta-ti-bsp and meta-yocto-bsp,
They were missing for both dts (black and green).
Will check this with the author (Robert C Nelson) and also test it=20
tomorrow and let you know.

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "Jon Cormier" <jcormier@criticallink.com>
To "Bremenpl" <bremenpl@gmail.com>
Cc meta-ti@lists.yoctoproject.org
Date 2024-01-11 19:25:37
Subject Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for=20
beaglebone

>We can do a little digging to hopefully find out.
>
>Based on my checkout which may be newer or older than yours:
>* According to meta-ti/meta-ti-bsp/conf/machine/beaglebone.conf, the=20
>kernel recipe used is linux-bb.org.
>* According to=20
>meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb, the=20
>kernel repo used is github.com/beagleboard/linux.git, branch=20
>v6.1.46-ti-r13.
>* According to that repo, the boneblack should have the gpio-line-names=20
>and the bonegreen doesn't...
>https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/d=
ts/am335x-boneblack.dts
>https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/d=
ts/am335x-bonegreen.dts
>
>To find out why you may have to ask them. Or look through the history=20
>to find a commit about it.
>
>
>On Thu, Jan 11, 2024 at 12:28=E2=80=AFAM Bremenpl <bremenpl@gmail.com> wro=
te:
>>am335x-bonegreen.dts, can also be am335x-boneblack.dts, but the case=20
>>here is the same.
>>
>>On January 10, 2024 23:23:26 Jon Cormier <jcormier@criticallink.com>=20
>>wrote:
>>
>>>Which device tree file is your device loading?
>>>
>>>On Wed, Jan 10, 2024 at 5:07=E2=80=AFPM Bremenpl <bremenpl@gmail.com> wr=
ote:
>>>>Hi Jonathan,
>>>>Thank you for the answer.
>>>>
>>>>Yes it seems the dts file changed a bit between Dunfell and=20
>>>>Kirkstone and these labers are now not there.
>>>>Any idea why these were gotten rid of? As you mentioned they are=20
>>>>usefull.
>>>>Who should be contacted to potentially put them back in place in the=20
>>>>repo (in case these were removed by error)?
>>>>Thanks.
>>>>
>>>>
>>>>On January 10, 2024 22:52:44 Jon Cormier <jcormier@criticallink.com>=20
>>>>wrote:
>>>>
>>>>>
>>>>>
>>>>>On Fri, Jan 5, 2024 at 3:49=E2=80=AFAM Lukasz Przenioslo=20
>>>>><bremenpl@gmail.com> wrote:
>>>>>>Hello,
>>>>>>I have recently moved from Dunfell to Kirkstone for the beaglebone=20
>>>>>>machine. Since then I have noticed that calling gpioinfo from=20
>>>>>>libgpiod-tools does not show the gpio labels:
>>>>>>
>>>>>>```
>>>>>>root@beaglebone:~# gpioinfo
>>>>>>gpiochip0 - 32 lines:
>>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>>         line   6:      unnamed       unused   input  active-high
>>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>>         line  21:      unnamed "beaglebone:green:usr0" output=20
>>>>>>active-high [used]
>>>>>>         line  22:      unnamed "beaglebone:green:usr1" output=20
>>>>>>active-high [used]
>>>>>>         line  23:      unnamed "beaglebone:green:usr2" output=20
>>>>>>active-high [used]
>>>>>>         line  24:      unnamed "beaglebone:green:usr3" output=20
>>>>>>active-high [used]
>>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>>         line  31:      unnamed       unused   input  active-high
>>>>>>gpiochip1 - 32 lines:
>>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>>         line   6:      unnamed       unused   input  active-high
>>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>>         line  21:      unnamed       unused   input  active-high
>>>>>>         line  22:      unnamed       unused   input  active-high
>>>>>>         line  23:      unnamed       unused   input  active-high
>>>>>>         line  24:      unnamed       unused   input  active-high
>>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>>         line  31:      unnamed       unused   input  active-high
>>>>>>gpiochip2 - 32 lines:
>>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>>         line   6:      unnamed       unused   input  active-high
>>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>>         line  21:      unnamed       unused   input  active-high
>>>>>>         line  22:      unnamed       unused   input  active-high
>>>>>>         line  23:      unnamed       unused   input  active-high
>>>>>>         line  24:      unnamed       unused   input  active-high
>>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>>         line  31:      unnamed       unused   input  active-high
>>>>>>gpiochip3 - 32 lines:
>>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>>         line   6:      unnamed         "cd"   input   active-low=20
>>>>>>[used]
>>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>>         line  21:      unnamed       unused   input  active-high
>>>>>>         line  22:      unnamed       unused   input  active-high
>>>>>>         line  23:      unnamed       unused   input  active-high
>>>>>>         line  24:      unnamed       unused   input  active-high
>>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>>         line  31:      unnamed       unused   input  active-high
>>>>>>```
>>>>>>
>>>>>>1. What could be the cause for that (exact different between=20
>>>>>>Dunfell and Kirkstone in meta-ti)? Can it be that the relevant dts=20
>>>>>>file(s) somehow changed?
>>>>>The gpio names are defined in the device tree by defining=20
>>>>>"gpio-line-names =3D ..."
>>>>>Example for the am335x-boneblack.dts from TIs 6.1 kernel.=20
>>>>>https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/=
boot/dts/am335x-boneblack.dts?h=3Dti-linux-6.1.y#n29
>>>>>>2. Aside from labels missing, can there be any other consequences=20
>>>>>>here? I tested gpio outputs state changing and it works normally.
>>>>>I'd guess no, other than it being harder to identify the correct=20
>>>>>gpio.
>>>>>>
>>>>>>I would appreciate all help and feedback!
>>>>>>
>>>>>>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>Links: You receive all messages sent to this group.
>>>>>>View/Reply Online (#17384):=20
>>>>>>https://lists.yoctoproject.org/g/meta-ti/message/17384
>>>>>>Mute This Topic:=20
>>>>>>https://lists.yoctoproject.org/mt/103539668/7902621
>>>>>>Group Owner: meta-ti+owner@lists.yoctoproject.org=20
>>>>>><mailto:meta-ti%2Bowner@lists.yoctoproject.org>
>>>>>>Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>>>>>[jcormier@criticallink.com]
>>>>>>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>
>>>>>
>>>>>
>>>>>--
>>>>>Jonathan Cormier
>>>>>Software Engineer
>>>>>
>>>>>Voice:  315.425.4045 x222
>>>>>
>>>>>
>>>>>
>>>>>http://www.CriticalLink.com <http://www.criticallink.com/>
>>>>>6712 Brooklawn Parkway, Syracuse, NY 13211
>>>>>
>>>>><https://www.linkedin.com/company/critical-link-llc>  =20
>>>>><https://twitter.com/Critical_Link>
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
--------=_MB285D47EF-913A-4F5F-86E0-B47246E85634
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
--></style></head><body><div>Thanks for the answer Jon,</div><div>I must do=
uble confirm this then... I recall that on kirkstone:</div><div><ol style=
=3D"list-style-type: lower-latin;"><li>There were no labels in both meta-ti=
-bsp and meta-yocto-bsp,</li><li>They were missing for both dts (black and=
 green).</li></ol><div>Will check this with the author (Robert C Nelson) and =
also test it tomorrow and let you know.</div></div>
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
<div>Date 2024-01-11 19:25:37</div>
<div>Subject Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for=
 beaglebone</div></div><div><br /></div>
<div id=3D"x739d32d0b0a049b"><blockquote cite=3D"CADL8D3b3A1+xyDV05iu8dj5f1=
0QZiNh934R17Ygt6EwRoYfJiQ@mail.gmail.com" type=3D"cite" class=3D"cite2">
<div dir=3D"ltr"><div dir=3D"ltr"><div>We can do a little digging to hopefu=
lly find out.</div><div><br /></div><div>Based on my checkout which may be=
 newer or older than yours:<br /></div><div>* According to meta-ti/meta-ti-b=
sp/conf/machine/beaglebone.conf, the kernel recipe used is <a href=3D"http:=
//linux-bb.org">linux-bb.org</a>.</div><div>* According to meta-ti/meta-ti-=
bsp/recipes-kernel/linux/<a href=3D"http://linux-bb.org_git.bb">linux-bb.or=
g_git.bb</a>, the kernel repo used is <a href=3D"http://github.com/beaglebo=
ard/linux.git">github.com/beagleboard/linux.git</a>, branch v6.1.46-ti-r13. =
<br /></div><div>* According to that repo, the boneblack should have the g=
pio-line-names and the bonegreen doesn't...</div><div><a href=3D"https://gi=
thub.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-b=
oneblack.dts">https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/ar=
ch/arm/boot/dts/am335x-boneblack.dts</a></div><div><a href=3D"https://githu=
b.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-bone=
green.dts">https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/=
arm/boot/dts/am335x-bonegreen.dts</a></div><div><br /></div><div>To find ou=
t why you may have to ask them. Or look through the history to find a commi=
t about it.<br /></div><div><br /></div></div><br /><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 11, 2024 at 12:28=E2=
=80=AFAM Bremenpl &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.=
com</a>&gt; wrote:<br /></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">am335x-bonegreen.dts, can also be am335x-boneblack.dts, b=
ut the case here is the same.</div><div dir=3D"auto"><br /></div>
<div id=3D"m_2358749475498752242aqm-original" style=3D"color: rgb(0, 0, 0); =
font-family: sans-serif;">

<div>
<div style=3D"color: rgb(0, 0, 0);">
<p style=3D"color: rgb(0, 0, 0); font-size: 10pt; font-family: sans-serif;=
 margin: 8pt 0px;">On January 10, 2024 23:23:26 Jon Cormier &lt;<a href=3D"m=
ailto:jcormier@criticallink.com">jcormier@criticallink.com</a>&gt; wrote:</=
p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"ltr">Which device tree file is your device loading?<br /></div>=
<br /><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Jan 10, 2024 at 5:07=E2=80=AFPM Bremenpl &lt;<a href=3D"mailto:bremenpl=
@gmail.com">bremenpl@gmail.com</a>&gt; wrote:<br /></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">Hi Jonathan,</div><div dir=3D"auto">Thank you for the ans=
wer.</div><div dir=3D"auto"><br /></div><div dir=3D"auto">Yes it seems the=
 dts file changed a bit between Dunfell and Kirkstone and these labers are n=
ow not there.=C2=A0</div><div dir=3D"auto"><ol><li>Any idea why these were=
 gotten rid of? As you mentioned they are usefull.</li><li>Who should be con=
tacted to potentially put them back in place in the repo (in case these wer=
e removed by error)?</li></ol></div><div dir=3D"auto">Thanks.</div><div dir=
=3D"auto"><br /></div><div dir=3D"auto"><br /></div>
<div id=3D"m_2358749475498752242m_-5589606811114802760aqm-original" style=
=3D"color: rgb(0, 0, 0); font-family: sans-serif;">

<div>
<div style=3D"color: rgb(0, 0, 0);">
<p style=3D"color: rgb(0, 0, 0); font-size: 10pt; font-family: sans-serif;=
 margin: 8pt 0px;">On January 10, 2024 22:52:44 Jon Cormier &lt;<a href=3D"m=
ailto:jcormier@criticallink.com">jcormier@criticallink.com</a>&gt; wrote:</=
p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"ltr"><div dir=3D"ltr"><br /></div><br /><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 5, 2024 at 3:49=E2=80=
=AFAM Lukasz Przenioslo &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@=
gmail.com</a>&gt; wrote:<br /></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello,<br />
I have recently moved from Dunfell to Kirkstone for the beaglebone machine. =
Since then I have noticed that calling gpioinfo from libgpiod-tools does n=
ot show the gpio labels:<br />
<br />
```<br />
root@beaglebone:~# gpioinfo<br />
gpiochip0 - 32 lines:<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed "bea=
glebone:green:usr0" output active-high [used]<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed "bea=
glebone:green:usr1" output active-high [used]<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed "bea=
glebone:green:usr2" output active-high [used]<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed "bea=
glebone:green:usr3" output active-high [used]<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
gpiochip1 - 32 lines:<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
gpiochip2 - 32 lines:<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
gpiochip3 - 32 lines:<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"cd"=C2=A0 =C2=A0input=C2=A0 =C2=A0active=
-low [used]<br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br /=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br />
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high<br />
```<br />
<br />
1. What could be the cause for that (exact different between Dunfell and Ki=
rkstone in meta-ti)? Can it be that the relevant dts file(s) somehow change=
d?<br /></blockquote><div>The gpio names are defined in the device tree by=
 defining "gpio-line-names =3D ..."</div><div>Example for the am335x-bonebla=
ck.dts from TIs 6.1 kernel. <a href=3D"https://git.ti.com/cgit/ti-linux-ker=
nel/ti-linux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=3Dti-linu=
x-6.1.y#n29">https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/a=
rch/arm/boot/dts/am335x-boneblack.dts?h=3Dti-linux-6.1.y#n29</a></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
2. Aside from labels missing, can there be any other consequences here? I t=
ested gpio outputs state changing and it works normally.<br /></blockquote>=
<div>I'd guess no, other than it being harder to identify the correct gpio. =
<br /></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br />
I would appreciate all help and feedback!<br />
<br />
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br />
Links: You receive all messages sent to this group.<br />
View/Reply Online (#17384): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17384" rel=3D"noreferrer">https://lists.yoctoproject.org/g/met=
a-ti/message/17384</a><br />
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/103539668/790=
2621" rel=3D"noreferrer">https://lists.yoctoproject.org/mt/103539668/790262=
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
></div></div></div></div></div></div></div></div></div></div></div></div></=
div>
</blockquote>
</div>
</div>


</div><div dir=3D"auto"><br /></div>
</div></div>

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
iv></div></div></div></div></div></div></div></div>
</blockquote></div>
</body></html>
--------=_MB285D47EF-913A-4F5F-86E0-B47246E85634--


