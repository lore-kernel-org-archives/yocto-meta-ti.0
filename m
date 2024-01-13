Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DF9C4707B
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 09:23:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.15857.1705137790171109194
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 13 Jan 2024 01:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E3hokLk5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: bremenpl@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e6d6274f3so2362235e9.0
        for <meta-ti@lists.yoctoproject.org>; Sat, 13 Jan 2024 01:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705137788; x=1705742588; darn=lists.yoctoproject.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+G5A+fi6NeT77Wm74mUTtT1Bgat1R5g50WydJR9gLI=;
        b=E3hokLk5bPkOw3SxYS6CnhXRaVtL77pDynkg2G/LrMs5l20pYrVpVFmB0FNlwcqNs5
         eYpldf5OX/kE4/2wP0/A+89BuiC1E4TU6JS4H6RUysS2/YXOtCOuUmxQ9rxSFwRMoRRa
         o1WsZAXMPn4d3atfEhgbwRTx6BKNnxmQcgJE9kJH04T08gj69jvz1e0KUG51TFPB7l9W
         CkSvuAM+4HLJ1nRt2VLzvLFIheiLabxf0So3qs70VFXkIne0/kbOmWkmsAWoNEbE2oFB
         EIUTJfj2EQNlT4eNDRkIeYx/UgcPf+1+dFD7xRVqY6V3Vlir9lYAQAyi99/oBDgRP+vc
         qcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705137788; x=1705742588;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+G5A+fi6NeT77Wm74mUTtT1Bgat1R5g50WydJR9gLI=;
        b=gv3K+2cdqvC4JoRSXwfIAGLe4v5tzINOIwVuBpcr5NrU2Prd9s803xYAvEOB/akVyp
         He2t+kXa+tjI+vGthSshq/HRJ3x7enUJ7FjJTcQq6+jg8jpGASm5R2xzz50ENAGWuX6s
         lOSTqqjm+E7TbPlZ4RvPMvAdBgQi0FRj9ImXr86qY27I98OYZ7GlX6fNfD0j/fqjvSlT
         F5kGXIrFf0HgkzAFQ0ayyYc9kAeNIZs17YGZhhxg+SLjs4B++3UKBSTasET8DwSEvP7i
         FS7bgf1F0DTiuemWz9iJTXVKUpri0Hv/xbqPahHlxbOUvoXglWiNbh7oBI+05AK3ICXt
         YhYQ==
X-Gm-Message-State: AOJu0YzPH+/ffn4uxiXJ1fpfCPtIboXdKsz7jvOSnugqviewGRbIbW2k
	B2SWEeB0WZLrhwtK/Q3FExU=
X-Google-Smtp-Source: AGHT+IHMUmAWhVc4J5Xrf8d68aPgliTqm9gbbQHaFZE7ieEqpqKCRUzc9yAQZl18Er3KOvADOmhQBA==
X-Received: by 2002:a7b:c4ca:0:b0:40e:6a1a:8a00 with SMTP id g10-20020a7bc4ca000000b0040e6a1a8a00mr491215wmk.78.1705137787935;
        Sat, 13 Jan 2024 01:23:07 -0800 (PST)
Received: from [192.168.40.253] (omniahotel.hdinternet.cz. [188.120.212.249])
        by smtp.gmail.com with ESMTPSA id q20-20020a05600c46d400b0040e395cd20bsm12457420wmo.7.2024.01.13.01.23.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jan 2024 01:23:07 -0800 (PST)
From: Bremenpl <bremenpl@gmail.com>
To: Jon Cormier <jcormier@criticallink.com>
CC: <meta-ti@lists.yoctoproject.org>
Date: Sat, 13 Jan 2024 10:23:06 +0100
Message-ID: <18d0221c8a8.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <17A9934C6E495BDF.31870@lists.yoctoproject.org>
References: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
 <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com>
 <18cf56aea90.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3ZjxJ0vczcGt_2nuDaQ8qYJ0qM9wAV9LU08UBBDbzFVsg@mail.gmail.com>
 <18cf6fe7340.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3b3A1+xyDV05iu8dj5f10QZiNh934R17Ygt6EwRoYfJiQ@mail.gmail.com>
 <17A9934C6E495BDF.31870@lists.yoctoproject.org>
User-Agent: AquaMail/1.49.1 (build: 104901407)
Subject: Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="18d0221cca2a05284eddb8c22"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 13 Jan 2024 09:23:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17403

This is a multi-part message in MIME format.
--18d0221cca2a05284eddb8c22
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Jon,
Robert confirmed your findngs and already pushed the changes to another 
repo (I guess pipelined). Still figuring out how to sync it with the 
kirkstone repo. Thanks for your help!

https://forum.beagleboard.org/t/libgpiod-tools-gpioinfo-missing-for-beaglebone/37086/2


On January 12, 2024 11:38:11 "Lukasz Przenioslo via lists.yoctoproject.org" 
<bremenpl=gmail.com@lists.yoctoproject.org> wrote:
> Thanks for the answer Jon,
> I must double confirm this then... I recall that on kirkstone:
> There were no labels in both meta-ti-bsp and meta-yocto-bsp,
> They were missing for both dts (black and green).
> Will check this with the author (Robert C Nelson) and also test it tomorrow 
> and let you know.
>
> --
> Łukasz Przeniosło
>
>
> ------ Original Message ------
> From "Jon Cormier" <jcormier@criticallink.com>
> To "Bremenpl" <bremenpl@gmail.com>
> Cc meta-ti@lists.yoctoproject.org
> Date 2024-01-11 19:25:37
> Subject Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for 
> beaglebone
>
>> We can do a little digging to hopefully find out.
>>
>> Based on my checkout which may be newer or older than yours:
>> * According to meta-ti/meta-ti-bsp/conf/machine/beaglebone.conf, the kernel 
>> recipe used is linux-bb.org.
>> * According to 
>> meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb, the kernel 
>> repo used is github.com/beagleboard/linux.git, branch v6.1.46-ti-r13.
>> * According to that repo, the boneblack should have the gpio-line-names and 
>> the bonegreen doesn't...
>> https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-boneblack.dts
>> https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-bonegreen.dts
>>
>> To find out why you may have to ask them. Or look through the history to 
>> find a commit about it.
>>
>>
>> On Thu, Jan 11, 2024 at 12:28 AM Bremenpl <bremenpl@gmail.com> wrote:
>> am335x-bonegreen.dts, can also be am335x-boneblack.dts, but the case here 
>> is the same.
>>
>> On January 10, 2024 23:23:26 Jon Cormier <jcormier@criticallink.com> wrote:
>>> Which device tree file is your device loading?
>>>
>>> On Wed, Jan 10, 2024 at 5:07 PM Bremenpl <bremenpl@gmail.com> wrote:
>>> Hi Jonathan,
>>> Thank you for the answer.
>>>
>>> Yes it seems the dts file changed a bit between Dunfell and Kirkstone and 
>>> these labers are now not there.
>>> Any idea why these were gotten rid of? As you mentioned they are usefull.
>>> Who should be contacted to potentially put them back in place in the repo 
>>> (in case these were removed by error)?
>>> Thanks.
>>>
>>>
>>> On January 10, 2024 22:52:44 Jon Cormier <jcormier@criticallink.com> wrote:
>>>>
>>>>
>>>> On Fri, Jan 5, 2024 at 3:49 AM Lukasz Przenioslo <bremenpl@gmail.com> wrote:
>>>> Hello,
>>>> I have recently moved from Dunfell to Kirkstone for the beaglebone machine. 
>>>> Since then I have noticed that calling gpioinfo from libgpiod-tools does 
>>>> not show the gpio labels:
>>>>
>>>> ```
>>>> root@beaglebone:~# gpioinfo
>>>> gpiochip0 - 32 lines:
>>>> line   0:      unnamed       unused   input  active-high
>>>> line   1:      unnamed       unused   input  active-high
>>>> line   2:      unnamed       unused   input  active-high
>>>> line   3:      unnamed       unused   input  active-high
>>>> line   4:      unnamed       unused   input  active-high
>>>> line   5:      unnamed       unused   input  active-high
>>>> line   6:      unnamed       unused   input  active-high
>>>> line   7:      unnamed       unused   input  active-high
>>>> line   8:      unnamed       unused   input  active-high
>>>> line   9:      unnamed       unused   input  active-high
>>>> line  10:      unnamed       unused   input  active-high
>>>> line  11:      unnamed       unused   input  active-high
>>>> line  12:      unnamed       unused   input  active-high
>>>> line  13:      unnamed       unused   input  active-high
>>>> line  14:      unnamed       unused   input  active-high
>>>> line  15:      unnamed       unused   input  active-high
>>>> line  16:      unnamed       unused   input  active-high
>>>> line  17:      unnamed       unused   input  active-high
>>>> line  18:      unnamed       unused   input  active-high
>>>> line  19:      unnamed       unused   input  active-high
>>>> line  20:      unnamed       unused   input  active-high
>>>> line  21:      unnamed "beaglebone:green:usr0" output active-high [used]
>>>> line  22:      unnamed "beaglebone:green:usr1" output active-high [used]
>>>> line  23:      unnamed "beaglebone:green:usr2" output active-high [used]
>>>> line  24:      unnamed "beaglebone:green:usr3" output active-high [used]
>>>> line  25:      unnamed       unused   input  active-high
>>>> line  26:      unnamed       unused   input  active-high
>>>> line  27:      unnamed       unused   input  active-high
>>>> line  28:      unnamed       unused   input  active-high
>>>> line  29:      unnamed       unused   input  active-high
>>>> line  30:      unnamed       unused   input  active-high
>>>> line  31:      unnamed       unused   input  active-high
>>>> gpiochip1 - 32 lines:
>>>> line   0:      unnamed       unused   input  active-high
>>>> line   1:      unnamed       unused   input  active-high
>>>> line   2:      unnamed       unused   input  active-high
>>>> line   3:      unnamed       unused   input  active-high
>>>> line   4:      unnamed       unused   input  active-high
>>>> line   5:      unnamed       unused   input  active-high
>>>> line   6:      unnamed       unused   input  active-high
>>>> line   7:      unnamed       unused   input  active-high
>>>> line   8:      unnamed       unused   input  active-high
>>>> line   9:      unnamed       unused   input  active-high
>>>> line  10:      unnamed       unused   input  active-high
>>>> line  11:      unnamed       unused   input  active-high
>>>> line  12:      unnamed       unused   input  active-high
>>>> line  13:      unnamed       unused   input  active-high
>>>> line  14:      unnamed       unused   input  active-high
>>>> line  15:      unnamed       unused   input  active-high
>>>> line  16:      unnamed       unused   input  active-high
>>>> line  17:      unnamed       unused   input  active-high
>>>> line  18:      unnamed       unused   input  active-high
>>>> line  19:      unnamed       unused   input  active-high
>>>> line  20:      unnamed       unused   input  active-high
>>>> line  21:      unnamed       unused   input  active-high
>>>> line  22:      unnamed       unused   input  active-high
>>>> line  23:      unnamed       unused   input  active-high
>>>> line  24:      unnamed       unused   input  active-high
>>>> line  25:      unnamed       unused   input  active-high
>>>> line  26:      unnamed       unused   input  active-high
>>>> line  27:      unnamed       unused   input  active-high
>>>> line  28:      unnamed       unused   input  active-high
>>>> line  29:      unnamed       unused   input  active-high
>>>> line  30:      unnamed       unused   input  active-high
>>>> line  31:      unnamed       unused   input  active-high
>>>> gpiochip2 - 32 lines:
>>>> line   0:      unnamed       unused   input  active-high
>>>> line   1:      unnamed       unused   input  active-high
>>>> line   2:      unnamed       unused   input  active-high
>>>> line   3:      unnamed       unused   input  active-high
>>>> line   4:      unnamed       unused   input  active-high
>>>> line   5:      unnamed       unused   input  active-high
>>>> line   6:      unnamed       unused   input  active-high
>>>> line   7:      unnamed       unused   input  active-high
>>>> line   8:      unnamed       unused   input  active-high
>>>> line   9:      unnamed       unused   input  active-high
>>>> line  10:      unnamed       unused   input  active-high
>>>> line  11:      unnamed       unused   input  active-high
>>>> line  12:      unnamed       unused   input  active-high
>>>> line  13:      unnamed       unused   input  active-high
>>>> line  14:      unnamed       unused   input  active-high
>>>> line  15:      unnamed       unused   input  active-high
>>>> line  16:      unnamed       unused   input  active-high
>>>> line  17:      unnamed       unused   input  active-high
>>>> line  18:      unnamed       unused   input  active-high
>>>> line  19:      unnamed       unused   input  active-high
>>>> line  20:      unnamed       unused   input  active-high
>>>> line  21:      unnamed       unused   input  active-high
>>>> line  22:      unnamed       unused   input  active-high
>>>> line  23:      unnamed       unused   input  active-high
>>>> line  24:      unnamed       unused   input  active-high
>>>> line  25:      unnamed       unused   input  active-high
>>>> line  26:      unnamed       unused   input  active-high
>>>> line  27:      unnamed       unused   input  active-high
>>>> line  28:      unnamed       unused   input  active-high
>>>> line  29:      unnamed       unused   input  active-high
>>>> line  30:      unnamed       unused   input  active-high
>>>> line  31:      unnamed       unused   input  active-high
>>>> gpiochip3 - 32 lines:
>>>> line   0:      unnamed       unused   input  active-high
>>>> line   1:      unnamed       unused   input  active-high
>>>> line   2:      unnamed       unused   input  active-high
>>>> line   3:      unnamed       unused   input  active-high
>>>> line   4:      unnamed       unused   input  active-high
>>>> line   5:      unnamed       unused   input  active-high
>>>> line   6:      unnamed         "cd"   input   active-low [used]
>>>> line   7:      unnamed       unused   input  active-high
>>>> line   8:      unnamed       unused   input  active-high
>>>> line   9:      unnamed       unused   input  active-high
>>>> line  10:      unnamed       unused   input  active-high
>>>> line  11:      unnamed       unused   input  active-high
>>>> line  12:      unnamed       unused   input  active-high
>>>> line  13:      unnamed       unused   input  active-high
>>>> line  14:      unnamed       unused   input  active-high
>>>> line  15:      unnamed       unused   input  active-high
>>>> line  16:      unnamed       unused   input  active-high
>>>> line  17:      unnamed       unused   input  active-high
>>>> line  18:      unnamed       unused   input  active-high
>>>> line  19:      unnamed       unused   input  active-high
>>>> line  20:      unnamed       unused   input  active-high
>>>> line  21:      unnamed       unused   input  active-high
>>>> line  22:      unnamed       unused   input  active-high
>>>> line  23:      unnamed       unused   input  active-high
>>>> line  24:      unnamed       unused   input  active-high
>>>> line  25:      unnamed       unused   input  active-high
>>>> line  26:      unnamed       unused   input  active-high
>>>> line  27:      unnamed       unused   input  active-high
>>>> line  28:      unnamed       unused   input  active-high
>>>> line  29:      unnamed       unused   input  active-high
>>>> line  30:      unnamed       unused   input  active-high
>>>> line  31:      unnamed       unused   input  active-high
>>>> ```
>>>>
>>>> 1. What could be the cause for that (exact different between Dunfell and 
>>>> Kirkstone in meta-ti)? Can it be that the relevant dts file(s) somehow changed?
>>>> The gpio names are defined in the device tree by defining "gpio-line-names 
>>>> = ..."
>>>> Example for the am335x-boneblack.dts from TIs 6.1 kernel. 
>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=ti-linux-6.1.y#n29
>>>> 2. Aside from labels missing, can there be any other consequences here? I 
>>>> tested gpio outputs state changing and it works normally.
>>>> I'd guess no, other than it being harder to identify the correct gpio.
>>>>
>>>> I would appreciate all help and feedback!
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> Jonathan Cormier
>>>> Software Engineer
>>>>
>>>> Voice:  315.425.4045 x222
>>>>
>>>>
>>>>
>>>>
>>>> http://www.CriticalLink.com
>>>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>>>
>>>
>>>
>>> --
>>> Jonathan Cormier
>>> Software Engineer
>>>
>>> Voice:  315.425.4045 x222
>>>
>>>
>>>
>>>
>>> http://www.CriticalLink.com
>>> 6712 Brooklawn Parkway, Syracuse, NY 13211
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17402): 
> https://lists.yoctoproject.org/g/meta-ti/message/17402
> Mute This Topic: https://lists.yoctoproject.org/mt/103539668/8072670
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub 
> [bremenpl@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


--18d0221cca2a05284eddb8c22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<head>
<style id=3D"css_styles" type=3D"text/css">#aqm-original blockquote.cite {
margin-left: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px;=
 border-left: 1px solid #cccccc
} /* style */

#aqm-original blockquote.cite2 {
margin-left: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px;=
 border-left: 1px solid #cccccc; margin-top: 3px; padding-top: 0px;
} /* style */

#aqm-original a img {
border: 0px;
} /* style */

#aqm-original li[style=3D'text-align: center;'], #aqm-original li[style=3D'=
text-align: center; '], #aqm-original li[style=3D'text-align: right;'], #aq=
m-original li[style=3D'text-align: right; '] {
list-style-position: inside;
} /* style */

#aqm-original .aqm-original-body {
font-family: Verdana; font-size: 12pt;
} /* style */

#aqm-original .quote {
margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb solid; paddin=
g-left: 0.3em;
} /* style */

</style>
</head>
<body style=3D"font-family: Arial, Myriad, 'Liberation Sans', sans-serif;">
<div dir=3D"auto">
<div dir=3D"auto">Hi Jon,</div><div dir=3D"auto">Robert confirmed your find=
ngs and already pushed the changes to another repo (I guess pipelined). Sti=
ll figuring out how to sync it with the kirkstone repo. Thanks for your hel=
p!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://fo=
rum.beagleboard.org/t/libgpiod-tools-gpioinfo-missing-for-beaglebone/37086/=
2">https://forum.beagleboard.org/t/libgpiod-tools-gpioinfo-missing-for-beag=
lebone/37086/2</a></div><div dir=3D"auto"><br></div><div dir=3D'auto'><br><=
/div>
<div id=3D"aqm-original" style=3D"color: black; font-family: sans-serif;">

<!-- body start -->
<div class=3D"aqm-original-body"><div style=3D"color: black;">
<p style=3D"color: black; font-size: 10pt; font-family: sans-serif; margin:=
 8pt 0;">On January 12, 2024 11:38:11 "Lukasz Przenioslo via lists.yoctopro=
ject.org" &lt;bremenpl=3Dgmail.com@lists.yoctoproject.org&gt; wrote:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div>Thanks for the answer Jon,</div><div>I must double confirm this then..=
. I recall that on kirkstone:</div><div><ol style=3D"list-style-type: lower=
-latin;"><li>There were no labels in both meta-ti-bsp and meta-yocto-bsp,</=
li><li>They were missing for both dts (black and green).</li></ol><div>Will=
 check this with the author (Robert C Nelson) and also test it tomorrow and=
 let you know.</div></div>
<div><br></div><div id=3D"signature_old" style=3D"clear:both">--<div>=C5=81=
ukasz Przenios=C5=82o</div></div><div style=3D"clear:both"><br></div>
<div><br></div>
<div>
<div>------ Original Message ------</div>
<div>From "Jon Cormier" &lt;<a href=3D"mailto:jcormier@criticallink.com">jc=
ormier@criticallink.com</a>&gt;</div>
<div>To "Bremenpl" &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail=
.com</a>&gt;</div>
<div>Cc <a href=3D"mailto:meta-ti@lists.yoctoproject.org">meta-ti@lists.yoc=
toproject.org</a></div>
<div>Date 2024-01-11 19:25:37</div>
<div>Subject Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for =
beaglebone</div></div><div><br></div>
<div id=3D"x739d32d0b0a049b"><blockquote cite=3D"CADL8D3b3A1+xyDV05iu8dj5f1=
0QZiNh934R17Ygt6EwRoYfJiQ@mail.gmail.com" type=3D"cite" class=3D"cite2">
<div dir=3D"ltr"><div dir=3D"ltr"><div>We can do a little digging to hopefu=
lly find out.</div><div><br></div><div>Based on my checkout which may be ne=
wer or older than yours:<br></div><div>* According to meta-ti/meta-ti-bsp/c=
onf/machine/beaglebone.conf, the kernel recipe used is <a href=3D"http://li=
nux-bb.org">linux-bb.org</a>.</div><div>* According to meta-ti/meta-ti-bsp/=
recipes-kernel/linux/<a href=3D"http://linux-bb.org_git.bb">linux-bb.org_gi=
t.bb</a>, the kernel repo used is <a href=3D"http://github.com/beagleboard/=
linux.git">github.com/beagleboard/linux.git</a>, branch v6.1.46-ti-r13. <br=
></div><div>* According to that repo, the boneblack should have the gpio-li=
ne-names and the bonegreen doesn't...</div><div><a href=3D"https://github.c=
om/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-bonebla=
ck.dts">https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm=
/boot/dts/am335x-boneblack.dts</a></div><div><a href=3D"https://github.com/=
beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-bonegreen.=
dts">https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/bo=
ot/dts/am335x-bonegreen.dts</a></div><div><br></div><div>To find out why yo=
u may have to ask them. Or look through the history to find a commit about =
it.<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jan 11, 2024 at 12:28=E2=80=AFAM Brem=
enpl &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">am335x-bonegreen.dts, can also be am335x-boneblack.dts, b=
ut the case here is the same.</div><div dir=3D"auto"><br></div>
<div id=3D"m_2358749475498752242aqm-original" style=3D"color: rgb(0, 0, 0);=
 font-family: sans-serif;">

<div>
<div style=3D"color: rgb(0, 0, 0);">
<p style=3D"color: rgb(0, 0, 0); font-size: 10pt; font-family: sans-serif; =
margin: 8pt 0px;">On January 10, 2024 23:23:26 Jon Cormier &lt;<a href=3D"m=
ailto:jcormier@criticallink.com">jcormier@criticallink.com</a>&gt; wrote:</=
p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
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
<div id=3D"m_2358749475498752242m_-5589606811114802760aqm-original" style=
=3D"color: rgb(0, 0, 0); font-family: sans-serif;">

<div>
<div style=3D"color: rgb(0, 0, 0);">
<p style=3D"color: rgb(0, 0, 0); font-size: 10pt; font-family: sans-serif; =
margin: 8pt 0px;">On January 10, 2024 22:52:44 Jon Cormier &lt;<a href=3D"m=
ailto:jcormier@criticallink.com">jcormier@criticallink.com</a>&gt; wrote:</=
p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
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
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div>Voice:&nbsp;&nbsp;<a value=3D"+13154254045">315.425=
.4045</a>&nbsp;x222</div><div><br></div><div><img src=3D"https://ci3.google=
usercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArr=
kBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></div></div></div><div><div><span style=
=3D"color: rgb(17, 85, 204);"><br></span></div><div><a href=3D"http://www.c=
riticallink.com/"><span style=3D"color: rgb(17, 85, 204);">http://www.Criti=
calLink.com</span></a><br></div><div>6712 Brooklawn Parkway,&nbsp;Syracuse,=
 NY 13211&nbsp;</div></div></div><div><div><br></div><div><span style=3D"co=
lor: rgb(17, 85, 204);"><a href=3D"https://www.linkedin.com/company/critica=
l-link-llc"><img src=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=
=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3em=
NQY2VoaHA0RDdudWlFPQ"></a>&nbsp;&nbsp;<a href=3D"https://twitter.com/Critic=
al_Link"><img alt=3D"" src=3D"https://docs.google.com/uc?export=3Ddownload&=
amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hu=
eVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></span></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div>
</blockquote>
</div>
</div>


</div><div dir=3D"auto"><br></div>
</div></div>

</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div>Voice:&nbsp;&nbsp;<a value=3D"+13154254045">315.425=
.4045</a>&nbsp;x222</div><div><br></div><div><img src=3D"https://ci3.google=
usercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArr=
kBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></div></div></div><div><div><span style=
=3D"color: rgb(17, 85, 204);"><br></span></div><div><a href=3D"http://www.c=
riticallink.com/"><span style=3D"color: rgb(17, 85, 204);">http://www.Criti=
calLink.com</span></a><br></div><div>6712 Brooklawn Parkway,&nbsp;Syracuse,=
 NY 13211&nbsp;</div></div></div><div><div><br></div><div><span style=3D"co=
lor: rgb(17, 85, 204);"><a href=3D"https://www.linkedin.com/company/critica=
l-link-llc"><img src=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=
=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3em=
NQY2VoaHA0RDdudWlFPQ"></a>&nbsp;&nbsp;<a href=3D"https://twitter.com/Critic=
al_Link"><img alt=3D"" src=3D"https://docs.google.com/uc?export=3Ddownload&=
amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hu=
eVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></span></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div>
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
div><div><a href=3D"http://www.criticallink.com/"><span style=3D"color: #11=
55cc;">http://www.CriticalLink.com</span></a><br></div><div>6712 Brooklawn =
Parkway,&nbsp;Syracuse, NY 13211&nbsp;</div></div></div><div><div><br></div=
><div><span style=3D"color: #1155cc;"><span style=3D"color: #1155cc;"><a hr=
ef=3D"https://www.linkedin.com/company/critical-link-llc"><img src=3D"https=
://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5W=
nM&amp;revid=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>&nb=
sp;&nbsp;<a href=3D"https://twitter.com/Critical_Link"><img alt=3D"" src=3D=
"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWER=
rLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ"><=
/a></span></span></div></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div>
</blockquote></div>

<div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div>
<div>Links: You receive all messages sent to this group.</div>
<div>View/Reply Online (#17402): <a class=3D"aqm-autolink aqm-autowrap" hre=
f=3D"https://lists.yoctoproject.org/g/meta-ti/message/17402">https://lists.=
yoctoproject.org/g/meta-ti/message/17402</a></div>
<div>Mute This Topic: <a class=3D"aqm-autolink aqm-autowrap" href=3D"https:=
//lists.yoctoproject.org/mt/103539668/8072670">https://lists.yoctoproject.o=
rg/mt/103539668/8072670</a></div>
<div>Group Owner: <a class=3D"aqm-autolink aqm-autowrap" href=3D"mailto:met=
a-ti%2Bowner%40lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org=
</a></div>
<div>Unsubscribe: <a class=3D"aqm-autolink aqm-autowrap" href=3D"https://li=
sts.yoctoproject.org/g/meta-ti/unsub">https://lists.yoctoproject.org/g/meta=
-ti/unsub</a> [<a class=3D"aqm-autolink aqm-autowrap" href=3D"mailto:bremen=
pl%40gmail.com">bremenpl@gmail.com</a>]</div>
<div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div>
<div><br></div>
<div><br></div></blockquote>
</div>
</div>
<!-- body end -->

</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18d0221cca2a05284eddb8c22--


