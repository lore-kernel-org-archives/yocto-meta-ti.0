Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DFAC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 18:25:56 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.85.1704997550575514250
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jan 2024 10:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=QcMvAgfQ;
 spf=pass (domain: criticallink.com, ip: 209.85.208.180, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd703e9014so37393721fa.1
        for <meta-ti@lists.yoctoproject.org>; Thu, 11 Jan 2024 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1704997548; x=1705602348; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tl/vTYD9F16gSG/K3sDFkSc02JCpSIexxzwmB5vnUdA=;
        b=QcMvAgfQfbJ6Qvjo2yEr8hCGv8VsyGxSVI39HTl4Zw7lACyFbxqn/nsHxoodQt0CI6
         LlbFL5LdV+6LtEkxIKemIl3IPvDSh8hkYEM2KQ+d6EOWKF/8n9EHtJFa8+JXb58dorNU
         kplHIoqeMFZy6twfPKXqzqffY7/1payjQgwgq2OxxOTu5gxAYKsooFIN/PZtKVl0AY1k
         oSwuLp+ZTadnkCaU54sK7bXAZV0BXDfKPH//85QFnuq2OXVI4KGn2xiyn4ep4kzj6Az8
         5qcPu8uukLWUfLbCCPnNjX4LF55tFKV4hoLwM/KFFV60P2CIsFtv1Ber6Jm7K26JonNM
         JjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704997548; x=1705602348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl/vTYD9F16gSG/K3sDFkSc02JCpSIexxzwmB5vnUdA=;
        b=RUJ31eJaVFmbkOxsL5xsmoY1057b0hJ02wEFnczqoGHdkSIKyyxqu/cy5g9I9FR+6C
         oPBSlEhYQjJ7S3SoQ1qFrotjaa1oAOiEDqa4WzyxPWt5k48FeLBivJ+mT8L9W2Z/cfgd
         dLXzV12QLYEX1YPB7aWLN3zVXT0SkTblUP3jJf5wfsOKiGdjRGrzpFuhCOB69xMl++yQ
         9cRDPOARaubs6q0amG1CBjl1xoa0mdOCwKV/895IvVXy9KCJ0jJY3bqwZC1521Ihk2XY
         CG+99ZDmNkIYnVDPqFPUHLKPaEYrVJ2cS3oAM2454RK4pV1X5Kp20EVcWhTgrHeox3Km
         cFow==
X-Gm-Message-State: AOJu0YxsesunlrurIh9OJ9K8j5rmgv4LmtlV0cQdYB36XhPJsATDuYDR
	1VCYQuAnzuVfyF6FFHNqfFTTm3nqYyb/iveSXu/Vzre8CU8U
X-Google-Smtp-Source: AGHT+IFl1kweO+KdSOhiVgdILqSLFnVkMvQKqUO1WulF2TIqaVGE5ToFaPUMEtG03QkTeKK//ErFL5x1saO/vIHmCLQ=
X-Received: by 2002:a05:651c:30f:b0:2cc:6f11:1f8c with SMTP id
 a15-20020a05651c030f00b002cc6f111f8cmr78890ljp.20.1704997548224; Thu, 11 Jan
 2024 10:25:48 -0800 (PST)
MIME-Version: 1.0
References: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
 <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com>
 <18cf56aea90.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
 <CADL8D3ZjxJ0vczcGt_2nuDaQ8qYJ0qM9wAV9LU08UBBDbzFVsg@mail.gmail.com> <18cf6fe7340.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <18cf6fe7340.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 11 Jan 2024 13:25:37 -0500
Message-ID: <CADL8D3b3A1+xyDV05iu8dj5f10QZiNh934R17Ygt6EwRoYfJiQ@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
To: Bremenpl <bremenpl@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003485bb060eafad17"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jan 2024 18:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17401

--0000000000003485bb060eafad17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We can do a little digging to hopefully find out.

Based on my checkout which may be newer or older than yours:
* According to meta-ti/meta-ti-bsp/conf/machine/beaglebone.conf, the kernel
recipe used is linux-bb.org.
* According to meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb=
,
the kernel repo used is github.com/beagleboard/linux.git, branch
v6.1.46-ti-r13.
* According to that repo, the boneblack should have the gpio-line-names and
the bonegreen doesn't...
https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dt=
s/am335x-boneblack.dts
https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dt=
s/am335x-bonegreen.dts

To find out why you may have to ask them. Or look through the history to
find a commit about it.


On Thu, Jan 11, 2024 at 12:28=E2=80=AFAM Bremenpl <bremenpl@gmail.com> wrot=
e:

> am335x-bonegreen.dts, can also be am335x-boneblack.dts, but the case here
> is the same.
>
> On January 10, 2024 23:23:26 Jon Cormier <jcormier@criticallink.com>
> wrote:
>
>> Which device tree file is your device loading?
>>
>> On Wed, Jan 10, 2024 at 5:07=E2=80=AFPM Bremenpl <bremenpl@gmail.com> wr=
ote:
>>
>>> Hi Jonathan,
>>> Thank you for the answer.
>>>
>>> Yes it seems the dts file changed a bit between Dunfell and Kirkstone
>>> and these labers are now not there.
>>>
>>>    1. Any idea why these were gotten rid of? As you mentioned they are
>>>    usefull.
>>>    2. Who should be contacted to potentially put them back in place in
>>>    the repo (in case these were removed by error)?
>>>
>>> Thanks.
>>>
>>>
>>> On January 10, 2024 22:52:44 Jon Cormier <jcormier@criticallink.com>
>>> wrote:
>>>
>>>>
>>>>
>>>> On Fri, Jan 5, 2024 at 3:49=E2=80=AFAM Lukasz Przenioslo <bremenpl@gma=
il.com>
>>>> wrote:
>>>>
>>>>> Hello,
>>>>> I have recently moved from Dunfell to Kirkstone for the beaglebone
>>>>> machine. Since then I have noticed that calling gpioinfo from
>>>>> libgpiod-tools does not show the gpio labels:
>>>>>
>>>>> ```
>>>>> root@beaglebone:~# gpioinfo
>>>>> gpiochip0 - 32 lines:
>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>         line   6:      unnamed       unused   input  active-high
>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>         line  21:      unnamed "beaglebone:green:usr0" output
>>>>> active-high [used]
>>>>>         line  22:      unnamed "beaglebone:green:usr1" output
>>>>> active-high [used]
>>>>>         line  23:      unnamed "beaglebone:green:usr2" output
>>>>> active-high [used]
>>>>>         line  24:      unnamed "beaglebone:green:usr3" output
>>>>> active-high [used]
>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>         line  31:      unnamed       unused   input  active-high
>>>>> gpiochip1 - 32 lines:
>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>         line   6:      unnamed       unused   input  active-high
>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>         line  21:      unnamed       unused   input  active-high
>>>>>         line  22:      unnamed       unused   input  active-high
>>>>>         line  23:      unnamed       unused   input  active-high
>>>>>         line  24:      unnamed       unused   input  active-high
>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>         line  31:      unnamed       unused   input  active-high
>>>>> gpiochip2 - 32 lines:
>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>         line   6:      unnamed       unused   input  active-high
>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>         line  21:      unnamed       unused   input  active-high
>>>>>         line  22:      unnamed       unused   input  active-high
>>>>>         line  23:      unnamed       unused   input  active-high
>>>>>         line  24:      unnamed       unused   input  active-high
>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>         line  31:      unnamed       unused   input  active-high
>>>>> gpiochip3 - 32 lines:
>>>>>         line   0:      unnamed       unused   input  active-high
>>>>>         line   1:      unnamed       unused   input  active-high
>>>>>         line   2:      unnamed       unused   input  active-high
>>>>>         line   3:      unnamed       unused   input  active-high
>>>>>         line   4:      unnamed       unused   input  active-high
>>>>>         line   5:      unnamed       unused   input  active-high
>>>>>         line   6:      unnamed         "cd"   input   active-low [use=
d]
>>>>>         line   7:      unnamed       unused   input  active-high
>>>>>         line   8:      unnamed       unused   input  active-high
>>>>>         line   9:      unnamed       unused   input  active-high
>>>>>         line  10:      unnamed       unused   input  active-high
>>>>>         line  11:      unnamed       unused   input  active-high
>>>>>         line  12:      unnamed       unused   input  active-high
>>>>>         line  13:      unnamed       unused   input  active-high
>>>>>         line  14:      unnamed       unused   input  active-high
>>>>>         line  15:      unnamed       unused   input  active-high
>>>>>         line  16:      unnamed       unused   input  active-high
>>>>>         line  17:      unnamed       unused   input  active-high
>>>>>         line  18:      unnamed       unused   input  active-high
>>>>>         line  19:      unnamed       unused   input  active-high
>>>>>         line  20:      unnamed       unused   input  active-high
>>>>>         line  21:      unnamed       unused   input  active-high
>>>>>         line  22:      unnamed       unused   input  active-high
>>>>>         line  23:      unnamed       unused   input  active-high
>>>>>         line  24:      unnamed       unused   input  active-high
>>>>>         line  25:      unnamed       unused   input  active-high
>>>>>         line  26:      unnamed       unused   input  active-high
>>>>>         line  27:      unnamed       unused   input  active-high
>>>>>         line  28:      unnamed       unused   input  active-high
>>>>>         line  29:      unnamed       unused   input  active-high
>>>>>         line  30:      unnamed       unused   input  active-high
>>>>>         line  31:      unnamed       unused   input  active-high
>>>>> ```
>>>>>
>>>>> 1. What could be the cause for that (exact different between Dunfell
>>>>> and Kirkstone in meta-ti)? Can it be that the relevant dts file(s) so=
mehow
>>>>> changed?
>>>>>
>>>> The gpio names are defined in the device tree by defining
>>>> "gpio-line-names =3D ..."
>>>> Example for the am335x-boneblack.dts from TIs 6.1 kernel.
>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/=
boot/dts/am335x-boneblack.dts?h=3Dti-linux-6.1.y#n29
>>>>
>>>>> 2. Aside from labels missing, can there be any other consequences
>>>>> here? I tested gpio outputs state changing and it works normally.
>>>>>
>>>> I'd guess no, other than it being harder to identify the correct gpio.
>>>>
>>>>>
>>>>> I would appreciate all help and feedback!
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#17384):
>>>>> https://lists.yoctoproject.org/g/meta-ti/message/17384
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/103539668/7902621
>>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
>>>>> jcormier@criticallink.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>>>
>>>>
>>>> --
>>>> Jonathan Cormier
>>>> Software Engineer
>>>>
>>>> Voice:  315.425.4045 x222
>>>>
>>>>
>>>>
>>>> http://www.CriticalLink.com <http://www.criticallink.com/>
>>>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>>>>
>>>> <https://www.linkedin.com/company/critical-link-llc>
>>>> <https://twitter.com/Critical_Link>
>>>>
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

--0000000000003485bb060eafad17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>We can do a little digging to hopefu=
lly find out.</div><div><br></div><div>Based on my checkout which may be ne=
wer or older than yours:<br></div><div>* According to meta-ti/meta-ti-bsp/c=
onf/machine/beaglebone.conf, the kernel recipe used is <a href=3D"http://li=
nux-bb.org">linux-bb.org</a>.</div><div>* According to meta-ti/meta-ti-bsp/=
recipes-kernel/linux/<a href=3D"http://linux-bb.org_git.bb">linux-bb.org_gi=
t.bb</a>, the kernel repo used is <a href=3D"http://github.com/beagleboard/=
linux.git">github.com/beagleboard/linux.git</a>, branch v6.1.46-ti-r13. <br=
></div><div>* According to that repo, the boneblack should have the gpio-li=
ne-names and the bonegreen doesn&#39;t...</div><div><a href=3D"https://gith=
ub.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-bon=
eblack.dts">https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch=
/arm/boot/dts/am335x-boneblack.dts</a></div><div><a href=3D"https://github.=
com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/arm/boot/dts/am335x-bonegr=
een.dts">https://github.com/beagleboard/linux/blob/6.1.46-ti-rt-r13/arch/ar=
m/boot/dts/am335x-bonegreen.dts</a></div><div><br></div><div>To find out wh=
y you may have to ask them. Or look through the history to find a commit ab=
out it.<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 11, 2024 at 12:28=E2=80=AFAM Br=
emenpl &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">am335x-bonegreen<span style=3D"font-size:12pt">.dts, can =
also be am335x-boneblack.dts, but the case here is the same.</span></div><d=
iv dir=3D"auto"><br></div>
<div id=3D"m_2358749475498752242aqm-original" style=3D"color:black;font-fam=
ily:sans-serif">

<div>
<div style=3D"color:black">
<p style=3D"color:black;font-size:10pt;font-family:sans-serif;margin:8pt 0p=
x">On January 10, 2024 23:23:26 Jon Cormier &lt;<a href=3D"mailto:jcormier@=
criticallink.com" target=3D"_blank">jcormier@criticallink.com</a>&gt; wrote=
:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"ltr">Which device tree file is your device loading?<br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Jan 10, 2024 at 5:07=E2=80=AFPM Bremenpl &lt;<a href=3D"mailto:bremenpl@gma=
il.com" target=3D"_blank">bremenpl@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><u></u>

<div style=3D"font-family:Arial,Myriad,&quot;Liberation Sans&quot;,sans-ser=
if">
<div dir=3D"auto">
<div dir=3D"auto">Hi Jonathan,</div><div dir=3D"auto">Thank you for the ans=
wer.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes it seems the dt=
s file changed a bit between Dunfell and Kirkstone and these labers are now=
 not there.=C2=A0</div><div dir=3D"auto"><ol><li>Any idea why these were go=
tten rid of? As you mentioned they are usefull.</li><li>Who should be conta=
cted to potentially put them back in place in the repo (in case these were =
removed by error)?</li></ol></div><div dir=3D"auto">Thanks.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div>
<div id=3D"m_2358749475498752242m_-5589606811114802760aqm-original" style=
=3D"color:black;font-family:sans-serif">

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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed &quo=
t;beaglebone:green:usr0&quot; output active-high [used]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed &quo=
t;beaglebone:green:usr1&quot; output active-high [used]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed &quo=
t;beaglebone:green:usr2&quot; output active-high [used]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed &quo=
t;beaglebone:green:usr3&quot; output active-high [used]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
gpiochip1 - 32 lines:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
gpiochip2 - 32 lines:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
gpiochip3 - 32 lines:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A00:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A01:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A02:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A03:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A04:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A06:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cd&quot;=C2=A0 =C2=A0input=C2=A0 =
=C2=A0active-low [used]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A07:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A08:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A09:=C2=A0 =C2=A0 =C2=A0 unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 10:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 11:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 12:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 13:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 14:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 15:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 16:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 17:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 18:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 19:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 20:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 21:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 22:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 23:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 24:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 25:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 26:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 27:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 28:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 29:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 30:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 31:=C2=A0 =C2=A0 =C2=A0 unnamed=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unused=C2=A0 =C2=A0input=C2=A0 active-high<br>
```<br>
<br>
1. What could be the cause for that (exact different between Dunfell and Ki=
rkstone in meta-ti)? Can it be that the relevant dts file(s) somehow change=
d?<br></blockquote><div>The gpio names are defined in the device tree by de=
fining &quot;gpio-line-names =3D ...&quot;</div><div>Example for the am335x=
-boneblack.dts from TIs 6.1 kernel. <a href=3D"https://git.ti.com/cgit/ti-l=
inux-kernel/ti-linux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=
=3Dti-linux-6.1.y#n29" target=3D"_blank">https://git.ti.com/cgit/ti-linux-k=
ernel/ti-linux-kernel/tree/arch/arm/boot/dts/am335x-boneblack.dts?h=3Dti-li=
nux-6.1.y#n29</a></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
2. Aside from labels missing, can there be any other consequences here? I t=
ested gpio outputs state changing and it works normally.<br></blockquote><d=
iv>I&#39;d guess no, other than it being harder to identify the correct gpi=
o. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
/div></div></div></div></div></div>

--0000000000003485bb060eafad17--

