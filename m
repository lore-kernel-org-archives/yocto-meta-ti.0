Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA09C47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 22:08:08 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.6899.1704924479537597411
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jan 2024 14:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AfHmXkbN;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: bremenpl@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd853c159eso1161671fa.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 10 Jan 2024 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704924477; x=1705529277; darn=lists.yoctoproject.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F86n5h0gUHCZNz6onQtdhCo6gdgw2LdeS2nTzjlV8a4=;
        b=AfHmXkbN3/1d48pN3oOOYEifgs1e5gM3Oih8BdFJ8A2b7z7QjOCP1ARI9hvdQbV8cA
         nXvomErHNzN7Z/U6r/DP33KR7gGS0956fBtegMg+Vth/US6goePb3Bp6KY4TbEL10NoP
         DbQg4bBVWan+C+u3jstZuPDEbURzzf7CX2m3SV/Lrq0lYo4qstLNhMFtOyWsFnV6psBG
         GdksLxRlnCVvdO4lx07w3M02OsH6mD1kzPTBpCKQsio2/8drryCvp/uUyqM0c1u7TA0y
         YRON3ElYpl4m51sdWRTXb+XfIdxB8p6IBz6kCZGy2l7BMWjh+DCtlqlSyDdOoFRkiY3k
         0xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704924477; x=1705529277;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F86n5h0gUHCZNz6onQtdhCo6gdgw2LdeS2nTzjlV8a4=;
        b=ZIFsPgtu27LQI7g51WdJOD6V1ytgVxP77vIhWeY6q1Zpcotdp/gt7wH2T+v00pWdj0
         QeosCGTIbNclD7cRLNfrJIImZylvUQkMlUsr08cz3z2QM/btMytl8k8BiFtZUAccD13e
         8KoDVpas4hLF97PF5NBpdt9ZpUDG/i7oEdiijiorMVHYVk8Hkb8sMDvP4Yiu91YufDL1
         BkQ0H8i7Y3QKXt1IePyk+HtO62jnc+lEgoNZkRn8o/UXgnrymspeuknMWcYf3Bns2e2a
         Fp2ngUY00VuTGBaTB9s0gbmpkF4OwT+Qq19lggF8lOM1XkhIU0jYi4dSA/LfK3MESr6K
         fOGg==
X-Gm-Message-State: AOJu0YxMbDExaFI3YOTbiygh1qCoVaAgIMyHlOVA0AYxbiQ39P4FzdyV
	5/8tuK+uJ+8NdKMcclTPV1g=
X-Google-Smtp-Source: AGHT+IFQ6tkzmf/9rCTQk9xXzNKAkFMj0o016biy44v58j3mm5WnPS1UX+/3wIMhPr8IxIeuV3H0Hg==
X-Received: by 2002:a19:e01d:0:b0:50e:b234:622a with SMTP id x29-20020a19e01d000000b0050eb234622amr48680lfg.92.1704924477238;
        Wed, 10 Jan 2024 14:07:57 -0800 (PST)
Received: from [192.168.40.172] (omniahotel.hdinternet.cz. [188.120.212.249])
        by smtp.gmail.com with ESMTPSA id x8-20020a1709065ac800b00a28d1d73654sm2469032ejs.207.2024.01.10.14.07.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jan 2024 14:07:56 -0800 (PST)
From: Bremenpl <bremenpl@gmail.com>
To: Jon Cormier <jcormier@criticallink.com>
CC: <meta-ti@lists.yoctoproject.org>
Date: Wed, 10 Jan 2024 23:07:54 +0100
Message-ID: <18cf56aea90.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com>
References: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
 <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com>
User-Agent: AquaMail/1.49.0 (build: 104900403)
Subject: Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="18cf56aecdf7ab7284e7858efb"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jan 2024 22:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17398

This is a multi-part message in MIME format.
--18cf56aecdf7ab7284e7858efb
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Jonathan,
Thank you for the answer.

Yes it seems the dts file changed a bit between Dunfell and Kirkstone and 
these labers are now not there.
Any idea why these were gotten rid of? As you mentioned they are usefull.
Who should be contacted to potentially put them back in place in the repo 
(in case these were removed by error)?Thanks.


On January 10, 2024 22:52:44 Jon Cormier <jcormier@criticallink.com> wrote:
>
>
> On Fri, Jan 5, 2024 at 3:49 AM Lukasz Przenioslo <bremenpl@gmail.com> wrote:
> Hello,
> I have recently moved from Dunfell to Kirkstone for the beaglebone machine. 
> Since then I have noticed that calling gpioinfo from libgpiod-tools does 
> not show the gpio labels:
>
> ```
> root@beaglebone:~# gpioinfo
> gpiochip0 - 32 lines:
> line   0:      unnamed       unused   input  active-high
> line   1:      unnamed       unused   input  active-high
> line   2:      unnamed       unused   input  active-high
> line   3:      unnamed       unused   input  active-high
> line   4:      unnamed       unused   input  active-high
> line   5:      unnamed       unused   input  active-high
> line   6:      unnamed       unused   input  active-high
> line   7:      unnamed       unused   input  active-high
> line   8:      unnamed       unused   input  active-high
> line   9:      unnamed       unused   input  active-high
> line  10:      unnamed       unused   input  active-high
> line  11:      unnamed       unused   input  active-high
> line  12:      unnamed       unused   input  active-high
> line  13:      unnamed       unused   input  active-high
> line  14:      unnamed       unused   input  active-high
> line  15:      unnamed       unused   input  active-high
> line  16:      unnamed       unused   input  active-high
> line  17:      unnamed       unused   input  active-high
> line  18:      unnamed       unused   input  active-high
> line  19:      unnamed       unused   input  active-high
> line  20:      unnamed       unused   input  active-high
> line  21:      unnamed "beaglebone:green:usr0" output active-high [used]
> line  22:      unnamed "beaglebone:green:usr1" output active-high [used]
> line  23:      unnamed "beaglebone:green:usr2" output active-high [used]
> line  24:      unnamed "beaglebone:green:usr3" output active-high [used]
> line  25:      unnamed       unused   input  active-high
> line  26:      unnamed       unused   input  active-high
> line  27:      unnamed       unused   input  active-high
> line  28:      unnamed       unused   input  active-high
> line  29:      unnamed       unused   input  active-high
> line  30:      unnamed       unused   input  active-high
> line  31:      unnamed       unused   input  active-high
> gpiochip1 - 32 lines:
> line   0:      unnamed       unused   input  active-high
> line   1:      unnamed       unused   input  active-high
> line   2:      unnamed       unused   input  active-high
> line   3:      unnamed       unused   input  active-high
> line   4:      unnamed       unused   input  active-high
> line   5:      unnamed       unused   input  active-high
> line   6:      unnamed       unused   input  active-high
> line   7:      unnamed       unused   input  active-high
> line   8:      unnamed       unused   input  active-high
> line   9:      unnamed       unused   input  active-high
> line  10:      unnamed       unused   input  active-high
> line  11:      unnamed       unused   input  active-high
> line  12:      unnamed       unused   input  active-high
> line  13:      unnamed       unused   input  active-high
> line  14:      unnamed       unused   input  active-high
> line  15:      unnamed       unused   input  active-high
> line  16:      unnamed       unused   input  active-high
> line  17:      unnamed       unused   input  active-high
> line  18:      unnamed       unused   input  active-high
> line  19:      unnamed       unused   input  active-high
> line  20:      unnamed       unused   input  active-high
> line  21:      unnamed       unused   input  active-high
> line  22:      unnamed       unused   input  active-high
> line  23:      unnamed       unused   input  active-high
> line  24:      unnamed       unused   input  active-high
> line  25:      unnamed       unused   input  active-high
> line  26:      unnamed       unused   input  active-high
> line  27:      unnamed       unused   input  active-high
> line  28:      unnamed       unused   input  active-high
> line  29:      unnamed       unused   input  active-high
> line  30:      unnamed       unused   input  active-high
> line  31:      unnamed       unused   input  active-high
> gpiochip2 - 32 lines:
> line   0:      unnamed       unused   input  active-high
> line   1:      unnamed       unused   input  active-high
> line   2:      unnamed       unused   input  active-high
> line   3:      unnamed       unused   input  active-high
> line   4:      unnamed       unused   input  active-high
> line   5:      unnamed       unused   input  active-high
> line   6:      unnamed       unused   input  active-high
> line   7:      unnamed       unused   input  active-high
> line   8:      unnamed       unused   input  active-high
> line   9:      unnamed       unused   input  active-high
> line  10:      unnamed       unused   input  active-high
> line  11:      unnamed       unused   input  active-high
> line  12:      unnamed       unused   input  active-high
> line  13:      unnamed       unused   input  active-high
> line  14:      unnamed       unused   input  active-high
> line  15:      unnamed       unused   input  active-high
> line  16:      unnamed       unused   input  active-high
> line  17:      unnamed       unused   input  active-high
> line  18:      unnamed       unused   input  active-high
> line  19:      unnamed       unused   input  active-high
> line  20:      unnamed       unused   input  active-high
> line  21:      unnamed       unused   input  active-high
> line  22:      unnamed       unused   input  active-high
> line  23:      unnamed       unused   input  active-high
> line  24:      unnamed       unused   input  active-high
> line  25:      unnamed       unused   input  active-high
> line  26:      unnamed       unused   input  active-high
> line  27:      unnamed       unused   input  active-high
> line  28:      unnamed       unused   input  active-high
> line  29:      unnamed       unused   input  active-high
> line  30:      unnamed       unused   input  active-high
> line  31:      unnamed       unused   input  active-high
> gpiochip3 - 32 lines:
> line   0:      unnamed       unused   input  active-high
> line   1:      unnamed       unused   input  active-high
> line   2:      unnamed       unused   input  active-high
> line   3:      unnamed       unused   input  active-high
> line   4:      unnamed       unused   input  active-high
> line   5:      unnamed       unused   input  active-high
> line   6:      unnamed         "cd"   input   active-low [used]
> line   7:      unnamed       unused   input  active-high
> line   8:      unnamed       unused   input  active-high
> line   9:      unnamed       unused   input  active-high
> line  10:      unnamed       unused   input  active-high
> line  11:      unnamed       unused   input  active-high
> line  12:      unnamed       unused   input  active-high
> line  13:      unnamed       unused   input  active-high
> line  14:      unnamed       unused   input  active-high
> line  15:      unnamed       unused   input  active-high
> line  16:      unnamed       unused   input  active-high
> line  17:      unnamed       unused   input  active-high
> line  18:      unnamed       unused   input  active-high
> line  19:      unnamed       unused   input  active-high
> line  20:      unnamed       unused   input  active-high
> line  21:      unnamed       unused   input  active-high
> line  22:      unnamed       unused   input  active-high
> line  23:      unnamed       unused   input  active-high
> line  24:      unnamed       unused   input  active-high
> line  25:      unnamed       unused   input  active-high
> line  26:      unnamed       unused   input  active-high
> line  27:      unnamed       unused   input  active-high
> line  28:      unnamed       unused   input  active-high
> line  29:      unnamed       unused   input  active-high
> line  30:      unnamed       unused   input  active-high
> line  31:      unnamed       unused   input  active-high
> ```
>
> 1. What could be the cause for that (exact different between Dunfell and 
> Kirkstone in meta-ti)? Can it be that the relevant dts file(s) somehow changed?
> The gpio names are defined in the device tree by defining "gpio-line-names 
> = ..."
> Example for the am335x-boneblack.dts from TIs 6.1 kernel. 
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=ti-linux-6.1.y#n29
> 2. Aside from labels missing, can there be any other consequences here? I 
> tested gpio outputs state changing and it works normally.
> I'd guess no, other than it being harder to identify the correct gpio.
>
> I would appreciate all help and feedback!
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17384): 
> https://lists.yoctoproject.org/g/meta-ti/message/17384
> Mute This Topic: https://lists.yoctoproject.org/mt/103539668/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub 
> [jcormier@criticallink.com]
> -=-=-=-=-=-=-=-=-=-=-=-
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


--18cf56aecdf7ab7284e7858efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body style=3D"font-family: Arial, Myriad, 'Liberation Sans', sans-serif;">
<div dir=3D"auto">
<div dir=3D"auto">Hi Jonathan,</div><div dir=3D"auto">Thank you for the ans=
wer.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes it seems the dt=
s file changed a bit between Dunfell and Kirkstone and these labers are now=
 not there.&nbsp;</div><div dir=3D"auto"><ol><li>Any idea why these were go=
tten rid of? As you mentioned they are usefull.</li><li>Who should be conta=
cted to potentially put them back in place in the repo (in case these were =
removed by error)?</li></ol></div><div dir=3D"auto">Thanks.</div><div dir=
=3D"auto"><br></div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black; font-family: sans-serif;">
<!-- body start -->
<div class=3D"aqm-original-body">
<div style=3D"color: black;">
<p style=3D"color: black; font-size: 10pt; font-family: sans-serif; margin:=
 8pt 0;">On January 10, 2024 22:52:44 Jon Cormier &lt;jcormier@criticallink=
.com&gt; wrote:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 5, 2024 at 3:49=E2=80=AFA=
M Lukasz Przenioslo &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hello,<br>
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
6.1.y#n29">https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arc=
h/arm/boot/dts/am335x-boneblack.dts?h=3Dti-linux-6.1.y#n29</a></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
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
/div></div>
</blockquote>
</div>
</div>
<!-- body end -->

</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18cf56aecdf7ab7284e7858efb--


