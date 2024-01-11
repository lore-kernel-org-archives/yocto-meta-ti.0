Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76ACC4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 05:28:48 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.5537.1704950924238639774
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jan 2024 21:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dilxOQLB;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bremenpl@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55818b733f7so2878250a12.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 10 Jan 2024 21:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704950922; x=1705555722; darn=lists.yoctoproject.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i34FhXY+Ox0I3yOfiHav7h0/W6yYYlfjdzt8iLlZGB0=;
        b=dilxOQLBTC/vPmGkbOBT2CsyBV9v8cXATQkt+RLzYO3Qjhr+JUWc09iZvWNcxp0YQF
         LZbBmtMHNrYtvB4TA5WgvWGNv2ze5CVvAjGRr77hu5wKVIrX7MmfPhK71BZheuav9U/p
         cbsldGRfPoRD74A1jOTiRb+tiPphTNlJMbewI62wxdN/nSkf7QLdakJ0Pby8Qp8OG88/
         7OZVof9jDkEexyP3JbN34FqW3w5OYkzK0kUJt4tauOZx2W7ybFoduyuUIpeEyaP31qvx
         Q+fjU0ARaCJsvZnutpGqhWlqQiUT/ZCDzSMdTddVTc0hV8SewEg+wr0C99UImiUXLBIJ
         91wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704950922; x=1705555722;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i34FhXY+Ox0I3yOfiHav7h0/W6yYYlfjdzt8iLlZGB0=;
        b=nXqQ5tZhtBxJ3O/0kT1UW/Ds2U0ncgm9PyVz1qZ7jKsSAVhmAL8hJfiFfvIzlfhfMz
         BhhYWE/r1yiXpPN7iUF0hS+zGX03Rzgqfu0SbGG/ETbBbtlv9WdyKb3jcdAGcYZBFLLu
         pzy7AJF2vc4thR1FlWKZLdCdTNjOOJWf65VBsleWMZcWAzuT5MRlnBTVO37/PWtBgRTT
         /KakEYG1PsdYSF0gfTuhJ53iL31diH52Mfsw2vFom2RUJK274gtPK3olHMDmCfxDIIxV
         GOG4BriWkaLYeS/swe8CuwdL1tXY8gEvAAziG4bMjgsjvfz0orHbI01Ikj1MfWESpUC6
         u7jQ==
X-Gm-Message-State: AOJu0Yzpg6vLyzlYfS3F2s5OQ3mVj7D58xG6GDVZ7264r3L20QxvanMx
	yhmuWv+IcLsYXFvQtkRpdJM=
X-Google-Smtp-Source: AGHT+IHprSJcEmdAOthTsxducE4xr75BVy/L3OiQZ7h6M2d7I8IhduVrr+0SCR0LJbpp1nBsc2M71A==
X-Received: by 2002:aa7:d9d8:0:b0:553:ffea:d0a7 with SMTP id v24-20020aa7d9d8000000b00553ffead0a7mr276831eds.32.1704950922244;
        Wed, 10 Jan 2024 21:28:42 -0800 (PST)
Received: from [192.168.40.172] (omniahotel.hdinternet.cz. [188.120.212.249])
        by smtp.gmail.com with ESMTPSA id c16-20020a056402121000b005589562f2bdsm185454edw.89.2024.01.10.21.28.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jan 2024 21:28:41 -0800 (PST)
From: Bremenpl <bremenpl@gmail.com>
To: Jon Cormier <jcormier@criticallink.com>
CC: <meta-ti@lists.yoctoproject.org>
Date: Thu, 11 Jan 2024 06:28:40 +0100
Message-ID: <18cf6fe7340.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <CADL8D3ZjxJ0vczcGt_2nuDaQ8qYJ0qM9wAV9LU08UBBDbzFVsg@mail.gmail.com>
References: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
 <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com>
 <18cf56aea90.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3ZjxJ0vczcGt_2nuDaQ8qYJ0qM9wAV9LU08UBBDbzFVsg@mail.gmail.com>
User-Agent: AquaMail/1.49.0 (build: 104900403)
Subject: Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="18cf6fe73f57ab7284e328bfab"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jan 2024 05:28:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17400

This is a multi-part message in MIME format.
--18cf6fe73f57ab7284e328bfab
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

am335x-bonegreen.dts, can also be am335x-boneblack.dts, but the case here 
is the same.

On January 10, 2024 23:23:26 Jon Cormier <jcormier@criticallink.com> wrote:
> Which device tree file is your device loading?
>
> On Wed, Jan 10, 2024 at 5:07 PM Bremenpl <bremenpl@gmail.com> wrote:
> Hi Jonathan,
> Thank you for the answer.
>
> Yes it seems the dts file changed a bit between Dunfell and Kirkstone and 
> these labers are now not there.
> Any idea why these were gotten rid of? As you mentioned they are usefull.
> Who should be contacted to potentially put them back in place in the repo 
> (in case these were removed by error)?
> Thanks.
>
>
> On January 10, 2024 22:52:44 Jon Cormier <jcormier@criticallink.com> wrote:
>>
>>
>> On Fri, Jan 5, 2024 at 3:49 AM Lukasz Przenioslo <bremenpl@gmail.com> wrote:
>> Hello,
>> I have recently moved from Dunfell to Kirkstone for the beaglebone machine. 
>> Since then I have noticed that calling gpioinfo from libgpiod-tools does 
>> not show the gpio labels:
>>
>> ```
>> root@beaglebone:~# gpioinfo
>> gpiochip0 - 32 lines:
>> line   0:      unnamed       unused   input  active-high
>> line   1:      unnamed       unused   input  active-high
>> line   2:      unnamed       unused   input  active-high
>> line   3:      unnamed       unused   input  active-high
>> line   4:      unnamed       unused   input  active-high
>> line   5:      unnamed       unused   input  active-high
>> line   6:      unnamed       unused   input  active-high
>> line   7:      unnamed       unused   input  active-high
>> line   8:      unnamed       unused   input  active-high
>> line   9:      unnamed       unused   input  active-high
>> line  10:      unnamed       unused   input  active-high
>> line  11:      unnamed       unused   input  active-high
>> line  12:      unnamed       unused   input  active-high
>> line  13:      unnamed       unused   input  active-high
>> line  14:      unnamed       unused   input  active-high
>> line  15:      unnamed       unused   input  active-high
>> line  16:      unnamed       unused   input  active-high
>> line  17:      unnamed       unused   input  active-high
>> line  18:      unnamed       unused   input  active-high
>> line  19:      unnamed       unused   input  active-high
>> line  20:      unnamed       unused   input  active-high
>> line  21:      unnamed "beaglebone:green:usr0" output active-high [used]
>> line  22:      unnamed "beaglebone:green:usr1" output active-high [used]
>> line  23:      unnamed "beaglebone:green:usr2" output active-high [used]
>> line  24:      unnamed "beaglebone:green:usr3" output active-high [used]
>> line  25:      unnamed       unused   input  active-high
>> line  26:      unnamed       unused   input  active-high
>> line  27:      unnamed       unused   input  active-high
>> line  28:      unnamed       unused   input  active-high
>> line  29:      unnamed       unused   input  active-high
>> line  30:      unnamed       unused   input  active-high
>> line  31:      unnamed       unused   input  active-high
>> gpiochip1 - 32 lines:
>> line   0:      unnamed       unused   input  active-high
>> line   1:      unnamed       unused   input  active-high
>> line   2:      unnamed       unused   input  active-high
>> line   3:      unnamed       unused   input  active-high
>> line   4:      unnamed       unused   input  active-high
>> line   5:      unnamed       unused   input  active-high
>> line   6:      unnamed       unused   input  active-high
>> line   7:      unnamed       unused   input  active-high
>> line   8:      unnamed       unused   input  active-high
>> line   9:      unnamed       unused   input  active-high
>> line  10:      unnamed       unused   input  active-high
>> line  11:      unnamed       unused   input  active-high
>> line  12:      unnamed       unused   input  active-high
>> line  13:      unnamed       unused   input  active-high
>> line  14:      unnamed       unused   input  active-high
>> line  15:      unnamed       unused   input  active-high
>> line  16:      unnamed       unused   input  active-high
>> line  17:      unnamed       unused   input  active-high
>> line  18:      unnamed       unused   input  active-high
>> line  19:      unnamed       unused   input  active-high
>> line  20:      unnamed       unused   input  active-high
>> line  21:      unnamed       unused   input  active-high
>> line  22:      unnamed       unused   input  active-high
>> line  23:      unnamed       unused   input  active-high
>> line  24:      unnamed       unused   input  active-high
>> line  25:      unnamed       unused   input  active-high
>> line  26:      unnamed       unused   input  active-high
>> line  27:      unnamed       unused   input  active-high
>> line  28:      unnamed       unused   input  active-high
>> line  29:      unnamed       unused   input  active-high
>> line  30:      unnamed       unused   input  active-high
>> line  31:      unnamed       unused   input  active-high
>> gpiochip2 - 32 lines:
>> line   0:      unnamed       unused   input  active-high
>> line   1:      unnamed       unused   input  active-high
>> line   2:      unnamed       unused   input  active-high
>> line   3:      unnamed       unused   input  active-high
>> line   4:      unnamed       unused   input  active-high
>> line   5:      unnamed       unused   input  active-high
>> line   6:      unnamed       unused   input  active-high
>> line   7:      unnamed       unused   input  active-high
>> line   8:      unnamed       unused   input  active-high
>> line   9:      unnamed       unused   input  active-high
>> line  10:      unnamed       unused   input  active-high
>> line  11:      unnamed       unused   input  active-high
>> line  12:      unnamed       unused   input  active-high
>> line  13:      unnamed       unused   input  active-high
>> line  14:      unnamed       unused   input  active-high
>> line  15:      unnamed       unused   input  active-high
>> line  16:      unnamed       unused   input  active-high
>> line  17:      unnamed       unused   input  active-high
>> line  18:      unnamed       unused   input  active-high
>> line  19:      unnamed       unused   input  active-high
>> line  20:      unnamed       unused   input  active-high
>> line  21:      unnamed       unused   input  active-high
>> line  22:      unnamed       unused   input  active-high
>> line  23:      unnamed       unused   input  active-high
>> line  24:      unnamed       unused   input  active-high
>> line  25:      unnamed       unused   input  active-high
>> line  26:      unnamed       unused   input  active-high
>> line  27:      unnamed       unused   input  active-high
>> line  28:      unnamed       unused   input  active-high
>> line  29:      unnamed       unused   input  active-high
>> line  30:      unnamed       unused   input  active-high
>> line  31:      unnamed       unused   input  active-high
>> gpiochip3 - 32 lines:
>> line   0:      unnamed       unused   input  active-high
>> line   1:      unnamed       unused   input  active-high
>> line   2:      unnamed       unused   input  active-high
>> line   3:      unnamed       unused   input  active-high
>> line   4:      unnamed       unused   input  active-high
>> line   5:      unnamed       unused   input  active-high
>> line   6:      unnamed         "cd"   input   active-low [used]
>> line   7:      unnamed       unused   input  active-high
>> line   8:      unnamed       unused   input  active-high
>> line   9:      unnamed       unused   input  active-high
>> line  10:      unnamed       unused   input  active-high
>> line  11:      unnamed       unused   input  active-high
>> line  12:      unnamed       unused   input  active-high
>> line  13:      unnamed       unused   input  active-high
>> line  14:      unnamed       unused   input  active-high
>> line  15:      unnamed       unused   input  active-high
>> line  16:      unnamed       unused   input  active-high
>> line  17:      unnamed       unused   input  active-high
>> line  18:      unnamed       unused   input  active-high
>> line  19:      unnamed       unused   input  active-high
>> line  20:      unnamed       unused   input  active-high
>> line  21:      unnamed       unused   input  active-high
>> line  22:      unnamed       unused   input  active-high
>> line  23:      unnamed       unused   input  active-high
>> line  24:      unnamed       unused   input  active-high
>> line  25:      unnamed       unused   input  active-high
>> line  26:      unnamed       unused   input  active-high
>> line  27:      unnamed       unused   input  active-high
>> line  28:      unnamed       unused   input  active-high
>> line  29:      unnamed       unused   input  active-high
>> line  30:      unnamed       unused   input  active-high
>> line  31:      unnamed       unused   input  active-high
>> ```
>>
>> 1. What could be the cause for that (exact different between Dunfell and 
>> Kirkstone in meta-ti)? Can it be that the relevant dts file(s) somehow changed?
>> The gpio names are defined in the device tree by defining "gpio-line-names 
>> = ..."
>> Example for the am335x-boneblack.dts from TIs 6.1 kernel. 
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=ti-linux-6.1.y#n29
>> 2. Aside from labels missing, can there be any other consequences here? I 
>> tested gpio outputs state changing and it works normally.
>> I'd guess no, other than it being harder to identify the correct gpio.
>>
>> I would appreciate all help and feedback!
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17384): 
>> https://lists.yoctoproject.org/g/meta-ti/message/17384
>> Mute This Topic: https://lists.yoctoproject.org/mt/103539668/7902621
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub 
>> [jcormier@criticallink.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>>
>> --
>> Jonathan Cormier
>> Software Engineer
>>
>> Voice:  315.425.4045 x222
>>
>>
>>
>>
>>
>>
>> http://www.CriticalLink.com
>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>
>
>
> --
> Jonathan Cormier
> Software Engineer
>
> Voice:  315.425.4045 x222
>
>
>
>
>
>
> http://www.CriticalLink.com
> 6712 Brooklawn Parkway, Syracuse, NY 13211


--18cf6fe73f57ab7284e328bfab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body style=3D"font-family: Arial, Myriad, 'Liberation Sans', sans-serif;">
<div dir=3D"auto">
<div dir=3D"auto">am335x-bonegreen<span style=3D"font-size: 12pt;">.dts, ca=
n also be am335x-boneblack.dts, but the case here is the same.</span></div>=
<div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black; font-family: sans-serif;">
<!-- body start -->
<div class=3D"aqm-original-body">
<div style=3D"color: black;">
<p style=3D"color: black; font-size: 10pt; font-family: sans-serif; margin:=
 8pt 0;">On January 10, 2024 23:23:26 Jon Cormier &lt;jcormier@criticallink=
.com&gt; wrote:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"ltr">Which device tree file is your device loading?<br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Jan 10, 2024 at 5:07=E2=80=AFPM Bremenpl &lt;<a href=3D"mailto:bremenpl@gma=
il.com">bremenpl@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">Hi Jonathan,</div><div dir=3D"auto">Thank you for the ans=
wer.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes it seems the dt=
s file changed a bit between Dunfell and Kirkstone and these labers are now=
 not there.&nbsp;</div><div dir=3D"auto"><ol><li>Any idea why these were go=
tten rid of? As you mentioned they are usefull.</li><li>Who should be conta=
cted to potentially put them back in place in the repo (in case these were =
removed by error)?</li></ol></div><div dir=3D"auto">Thanks.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div>
<div id=3D"m_-5589606811114802760aqm-original" style=3D"color:black;font-fa=
mily:sans-serif">

<div>
<div style=3D"color:black">
<p style=3D"color:black;font-size:10pt;font-family:sans-serif;margin:8pt 0p=
x">On January 10, 2024 22:52:44 Jon Cormier &lt;<a href=3D"mailto:jcormier@=
criticallink.com" target=3D"_blank">jcormier@criticallink.com</a>&gt; wrote=
:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 5, 2024 at 3:49=E2=80=AFA=
M Lukasz Przenioslo &lt;<a href=3D"mailto:bremenpl@gmail.com" target=3D"_bl=
ank">bremenpl@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hello,<br>
I have recently moved from Dunfell to Kirkstone for the beaglebone machine.=
 Since then I have noticed that calling gpioinfo from libgpiod-tools does n=
ot show the gpio labels:<br>
<br>
```<br>
root@beaglebone:~# gpioinfo<br>
gpiochip0 - 32 lines:<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;0:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;1:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;2:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;3:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;4:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;5:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;6:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;7:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;8:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;9:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 10:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 11:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 12:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 13:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 14:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 15:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 16:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 17:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 18:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 19:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 20:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 21:&nbsp; &nbsp; &nbsp; unnamed "bea=
glebone:green:usr0" output active-high [used]<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 22:&nbsp; &nbsp; &nbsp; unnamed "bea=
glebone:green:usr1" output active-high [used]<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 23:&nbsp; &nbsp; &nbsp; unnamed "bea=
glebone:green:usr2" output active-high [used]<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 24:&nbsp; &nbsp; &nbsp; unnamed "bea=
glebone:green:usr3" output active-high [used]<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 25:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 26:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 27:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 28:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 29:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 30:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 31:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
gpiochip1 - 32 lines:<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;0:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;1:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;2:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;3:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;4:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;5:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;6:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;7:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;8:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;9:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 10:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 11:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 12:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 13:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 14:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 15:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 16:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 17:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 18:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 19:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 20:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 21:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 22:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 23:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 24:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 25:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 26:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 27:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 28:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 29:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 30:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 31:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
gpiochip2 - 32 lines:<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;0:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;1:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;2:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;3:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;4:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;5:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;6:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;7:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;8:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;9:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 10:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 11:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 12:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 13:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 14:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 15:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 16:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 17:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 18:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 19:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 20:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 21:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 22:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 23:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 24:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 25:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 26:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 27:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 28:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 29:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 30:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 31:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
gpiochip3 - 32 lines:<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;0:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;1:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;2:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;3:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;4:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;5:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;6:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"cd"&nbsp; &nbsp;input&nbsp; &nbsp;active=
-low [used]<br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;7:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;8:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; &nbsp;9:&nbsp; &nbsp; &nbsp; unnamed=
&nbsp; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 10:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 11:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 12:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 13:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 14:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 15:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 16:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 17:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 18:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 19:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 20:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 21:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 22:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 23:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 24:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 25:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 26:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 27:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 28:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 29:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 30:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high <br>
&nbsp; &nbsp; &nbsp; &nbsp; line&nbsp; 31:&nbsp; &nbsp; &nbsp; unnamed&nbsp=
; &nbsp; &nbsp; &nbsp;unused&nbsp; &nbsp;input&nbsp; active-high<br>
```<br>
<br>
1. What could be the cause for that (exact different between Dunfell and Ki=
rkstone in meta-ti)? Can it be that the relevant dts file(s) somehow change=
d?<br></blockquote><div>The gpio names are defined in the device tree by de=
fining "gpio-line-names =3D ..."</div><div>Example for the am335x-boneblack=
.dts from TIs 6.1 kernel. <a href=3D"https://git.ti.com/cgit/ti-linux-kerne=
l/ti-linux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=3Dti-linux-=
6.1.y#n29" target=3D"_blank">https://git.ti.com/cgit/ti-linux-kernel/ti-lin=
ux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=3Dti-linux-6.1.y#n2=
9</a></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
2. Aside from labels missing, can there be any other consequences here? I t=
ested gpio outputs state changing and it works normally.<br></blockquote><d=
iv>I'd guess no, other than it being harder to identify the correct gpio. <=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I would appreciate all help and feedback!<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17384): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17384" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17384</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/103539668/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/103539668/7902621</a><br>
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
div><br></div><div><div><span style=3D"color:rgb(0,0,0)">Voice:&nbsp;&nbsp;=
<a value=3D"+13154254045">315.425.4045</a>&nbsp;x222</span></div><div><span=
 style=3D"color:rgb(0,0,0)"><br></span></div><div><span style=3D"color:rgb(=
0,0,0)"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4xml75f=
JPKYF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></=
span></div></div></div><div><div><span style=3D"color:rgb(17,85,204)"><br><=
/span></div><div><a href=3D"http://www.criticallink.com/" target=3D"_blank"=
><span style=3D"color:rgb(17,85,204)">http://www.CriticalLink.com</span></a=
><br></div><div>6712 Brooklawn Parkway,&nbsp;Syracuse, NY 13211&nbsp;</div>=
</div></div><div><div><br></div><div><span style=3D"color:rgb(17,85,204)"><=
span style=3D"color:rgb(17,85,204)"><a href=3D"https://www.linkedin.com/com=
pany/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.google.c=
om/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D0=
B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>&nbsp;&nbsp;<a href=
=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1y=
WERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ=
"></a></span></span></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div>
</blockquote>
</div>
</div>


</div><div dir=3D"auto"><br></div>
</div></div>

</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><span style=3D"color: #000000;">Voice:&nbsp;&nbsp;<=
a value=3D"+13154254045">315.425.4045</a>&nbsp;x222</span></div><div><span =
style=3D"color: #000000;"><br></span></div><div><span style=3D"color: #0000=
00;"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPK=
YF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></spa=
n></div></div></div><div><div><span style=3D"color: #1155cc;"><br></span></=
div><div><a href=3D"http://www.criticallink.com/" target=3D"_blank"><span s=
tyle=3D"color: #1155cc;">http://www.CriticalLink.com</span></a><br></div><d=
iv>6712 Brooklawn Parkway,&nbsp;Syracuse, NY 13211&nbsp;</div></div></div><=
div><div><br></div><div><span style=3D"color: #1155cc;"><span style=3D"colo=
r: #1155cc;"><a href=3D"https://www.linkedin.com/company/critical-link-llc"=
 target=3D"_blank"><img src=3D"https://docs.google.com/uc?export=3Ddownload=
&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D0B2vNSnu-aYu6RHNZUnhNbFp=
ER1l3emNQY2VoaHA0RDdudWlFPQ"></a>&nbsp;&nbsp;<a href=3D"https://twitter.com=
/Critical_Link" target=3D"_blank"><img alt=3D"" src=3D"https://docs.google.=
com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revid=3D=
0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></span></span></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
/div>
</blockquote>
</div>
</div>
<!-- body end -->

</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18cf6fe73f57ab7284e328bfab--


