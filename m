Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41627C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:52:48 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.6545.1704923565662306472
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jan 2024 13:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=FbdbSeeB;
 spf=pass (domain: criticallink.com, ip: 209.85.208.170, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cd81b09e83so5940241fa.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 10 Jan 2024 13:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1704923564; x=1705528364; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YDbcIEmlp/R4OSU2vvdRbB0wKDls0p0qWg0wCiETbYM=;
        b=FbdbSeeBMV5sPfCBe1TZoEl+uMHA5yx6a/Pw8Jj1ZfR15C4YLHbuejOPSEe1XP79QV
         C9jca+y2IdY2C98RFc5Ic4fVJf1a4dGivF3v3Rjra49+LKz6WbDFfOZhUxkszAmhLkHO
         TeUppAgjgdsmL5RzWmypjF+RE+UuH9wi7p6jHYCfizJzyByU7V5wftFfi2hULwAtOnqx
         xN2dKSlAdHbak/ZmDU7Vf787DO5FSrSB9jddepQAAlaeaiaJvkynAXJkwe73js1XbmD+
         u4yH+nByz0HWbYW2FAgX5sgrSZkgk1//7Yi6K6ZHaH+tdDtwb45Qy3Aki57cwGMHJbEO
         qIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704923564; x=1705528364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDbcIEmlp/R4OSU2vvdRbB0wKDls0p0qWg0wCiETbYM=;
        b=nSxmP35L2ncP5e9BbzUDp6P8/p/6NyNg0gfADGJbhIdVAGh86ohOVYg7Frs+LqyMPa
         hlQ5022m2M6stG5hUIpYZ4VuW1OAtfX0ZTTbnpc4DM74Gm8jTtN4vQcgcwAPJJnFe749
         06AvSMBHOAaR1p73PHs1cq//fPtj927g1OmVRYtazEGRpk7lkeKXqghOaiZ7pOTOb9yH
         jcqXy1G9uaKlAex72EZtIhQDgfcgeBBQDpRYceAHBTyMS2i6s9Of5xb5DyfMolAEQkcn
         Euo4+2Asx1kGY1iEe+yFaVQI72TbDECrDMJgZbfPM9jSvx/ZiqE/b3fQWFSEOoGgvmkI
         28wg==
X-Gm-Message-State: AOJu0YzT7cRqXCCjGCeEvI2xS7nJqPuHRf5arXTOE9NPQApyVVE9FisV
	wxBS0ulV98FvEtIrcPu/ObW9Zs33PxjiJaJT1Wv+IUmJ0+Qg
X-Google-Smtp-Source: AGHT+IEn95WqzlwoAcsakuF4iuxGI9gg6b0KPaHdQuVU0o4GMyc03IDTbeWP/gVhNjL3ZEm/avDFXCgS2lfR7LrnS0c=
X-Received: by 2002:a2e:82c8:0:b0:2cc:d541:c649 with SMTP id
 n8-20020a2e82c8000000b002ccd541c649mr54881ljh.204.1704923563350; Wed, 10 Jan
 2024 13:52:43 -0800 (PST)
MIME-Version: 1.0
References: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
In-Reply-To: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 10 Jan 2024 16:52:32 -0500
Message-ID: <CADL8D3Z=C3PzbVcn4si6hLkCCHtk9iNTsSzi+_hb3KRv2hvTfA@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
To: Lukasz Przenioslo <bremenpl@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005cef71060e9e73c6"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jan 2024 21:52:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17397

--0000000000005cef71060e9e73c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 3:49=E2=80=AFAM Lukasz Przenioslo <bremenpl@gmail.co=
m> wrote:

> Hello,
> I have recently moved from Dunfell to Kirkstone for the beaglebone
> machine. Since then I have noticed that calling gpioinfo from
> libgpiod-tools does not show the gpio labels:
>
> ```
> root@beaglebone:~# gpioinfo
> gpiochip0 - 32 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed       unused   input  active-high
>         line   3:      unnamed       unused   input  active-high
>         line   4:      unnamed       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>         line   6:      unnamed       unused   input  active-high
>         line   7:      unnamed       unused   input  active-high
>         line   8:      unnamed       unused   input  active-high
>         line   9:      unnamed       unused   input  active-high
>         line  10:      unnamed       unused   input  active-high
>         line  11:      unnamed       unused   input  active-high
>         line  12:      unnamed       unused   input  active-high
>         line  13:      unnamed       unused   input  active-high
>         line  14:      unnamed       unused   input  active-high
>         line  15:      unnamed       unused   input  active-high
>         line  16:      unnamed       unused   input  active-high
>         line  17:      unnamed       unused   input  active-high
>         line  18:      unnamed       unused   input  active-high
>         line  19:      unnamed       unused   input  active-high
>         line  20:      unnamed       unused   input  active-high
>         line  21:      unnamed "beaglebone:green:usr0" output active-high
> [used]
>         line  22:      unnamed "beaglebone:green:usr1" output active-high
> [used]
>         line  23:      unnamed "beaglebone:green:usr2" output active-high
> [used]
>         line  24:      unnamed "beaglebone:green:usr3" output active-high
> [used]
>         line  25:      unnamed       unused   input  active-high
>         line  26:      unnamed       unused   input  active-high
>         line  27:      unnamed       unused   input  active-high
>         line  28:      unnamed       unused   input  active-high
>         line  29:      unnamed       unused   input  active-high
>         line  30:      unnamed       unused   input  active-high
>         line  31:      unnamed       unused   input  active-high
> gpiochip1 - 32 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed       unused   input  active-high
>         line   3:      unnamed       unused   input  active-high
>         line   4:      unnamed       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>         line   6:      unnamed       unused   input  active-high
>         line   7:      unnamed       unused   input  active-high
>         line   8:      unnamed       unused   input  active-high
>         line   9:      unnamed       unused   input  active-high
>         line  10:      unnamed       unused   input  active-high
>         line  11:      unnamed       unused   input  active-high
>         line  12:      unnamed       unused   input  active-high
>         line  13:      unnamed       unused   input  active-high
>         line  14:      unnamed       unused   input  active-high
>         line  15:      unnamed       unused   input  active-high
>         line  16:      unnamed       unused   input  active-high
>         line  17:      unnamed       unused   input  active-high
>         line  18:      unnamed       unused   input  active-high
>         line  19:      unnamed       unused   input  active-high
>         line  20:      unnamed       unused   input  active-high
>         line  21:      unnamed       unused   input  active-high
>         line  22:      unnamed       unused   input  active-high
>         line  23:      unnamed       unused   input  active-high
>         line  24:      unnamed       unused   input  active-high
>         line  25:      unnamed       unused   input  active-high
>         line  26:      unnamed       unused   input  active-high
>         line  27:      unnamed       unused   input  active-high
>         line  28:      unnamed       unused   input  active-high
>         line  29:      unnamed       unused   input  active-high
>         line  30:      unnamed       unused   input  active-high
>         line  31:      unnamed       unused   input  active-high
> gpiochip2 - 32 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed       unused   input  active-high
>         line   3:      unnamed       unused   input  active-high
>         line   4:      unnamed       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>         line   6:      unnamed       unused   input  active-high
>         line   7:      unnamed       unused   input  active-high
>         line   8:      unnamed       unused   input  active-high
>         line   9:      unnamed       unused   input  active-high
>         line  10:      unnamed       unused   input  active-high
>         line  11:      unnamed       unused   input  active-high
>         line  12:      unnamed       unused   input  active-high
>         line  13:      unnamed       unused   input  active-high
>         line  14:      unnamed       unused   input  active-high
>         line  15:      unnamed       unused   input  active-high
>         line  16:      unnamed       unused   input  active-high
>         line  17:      unnamed       unused   input  active-high
>         line  18:      unnamed       unused   input  active-high
>         line  19:      unnamed       unused   input  active-high
>         line  20:      unnamed       unused   input  active-high
>         line  21:      unnamed       unused   input  active-high
>         line  22:      unnamed       unused   input  active-high
>         line  23:      unnamed       unused   input  active-high
>         line  24:      unnamed       unused   input  active-high
>         line  25:      unnamed       unused   input  active-high
>         line  26:      unnamed       unused   input  active-high
>         line  27:      unnamed       unused   input  active-high
>         line  28:      unnamed       unused   input  active-high
>         line  29:      unnamed       unused   input  active-high
>         line  30:      unnamed       unused   input  active-high
>         line  31:      unnamed       unused   input  active-high
> gpiochip3 - 32 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed       unused   input  active-high
>         line   3:      unnamed       unused   input  active-high
>         line   4:      unnamed       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>         line   6:      unnamed         "cd"   input   active-low [used]
>         line   7:      unnamed       unused   input  active-high
>         line   8:      unnamed       unused   input  active-high
>         line   9:      unnamed       unused   input  active-high
>         line  10:      unnamed       unused   input  active-high
>         line  11:      unnamed       unused   input  active-high
>         line  12:      unnamed       unused   input  active-high
>         line  13:      unnamed       unused   input  active-high
>         line  14:      unnamed       unused   input  active-high
>         line  15:      unnamed       unused   input  active-high
>         line  16:      unnamed       unused   input  active-high
>         line  17:      unnamed       unused   input  active-high
>         line  18:      unnamed       unused   input  active-high
>         line  19:      unnamed       unused   input  active-high
>         line  20:      unnamed       unused   input  active-high
>         line  21:      unnamed       unused   input  active-high
>         line  22:      unnamed       unused   input  active-high
>         line  23:      unnamed       unused   input  active-high
>         line  24:      unnamed       unused   input  active-high
>         line  25:      unnamed       unused   input  active-high
>         line  26:      unnamed       unused   input  active-high
>         line  27:      unnamed       unused   input  active-high
>         line  28:      unnamed       unused   input  active-high
>         line  29:      unnamed       unused   input  active-high
>         line  30:      unnamed       unused   input  active-high
>         line  31:      unnamed       unused   input  active-high
> ```
>
> 1. What could be the cause for that (exact different between Dunfell and
> Kirkstone in meta-ti)? Can it be that the relevant dts file(s) somehow
> changed?
>
The gpio names are defined in the device tree by defining "gpio-line-names
=3D ..."
Example for the am335x-boneblack.dts from TIs 6.1 kernel.
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm/boot/=
dts/am335x-boneblack.dts?h=3Dti-linux-6.1.y#n29

> 2. Aside from labels missing, can there be any other consequences here? I
> tested gpio outputs state changing and it works normally.
>
I'd guess no, other than it being harder to identify the correct gpio.

>
> I would appreciate all help and feedback!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17384):
> https://lists.yoctoproject.org/g/meta-ti/message/17384
> Mute This Topic: https://lists.yoctoproject.org/mt/103539668/7902621
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

--0000000000005cef71060e9e73c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgSmFu
IDUsIDIwMjQgYXQgMzo0OeKAr0FNIEx1a2FzeiBQcnplbmlvc2xvICZsdDs8YSBocmVmPSJtYWls
dG86YnJlbWVucGxAZ21haWwuY29tIj5icmVtZW5wbEBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPkhlbGxvLDxicj4NCkkgaGF2ZSByZWNlbnRseSBtb3ZlZCBmcm9tIER1
bmZlbGwgdG8gS2lya3N0b25lIGZvciB0aGUgYmVhZ2xlYm9uZSBtYWNoaW5lLiBTaW5jZSB0aGVu
IEkgaGF2ZSBub3RpY2VkIHRoYXQgY2FsbGluZyBncGlvaW5mbyBmcm9tIGxpYmdwaW9kLXRvb2xz
IGRvZXMgbm90IHNob3cgdGhlIGdwaW8gbGFiZWxzOjxicj4NCjxicj4NCmBgYDxicj4NCnJvb3RA
YmVhZ2xlYm9uZTp+IyBncGlvaW5mbzxicj4NCmdwaW9jaGlwMCAtIDMyIGxpbmVzOjxicj4NCsKg
IMKgIMKgIMKgIGxpbmXCoCDCoDA6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAg
wqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDE6wqAgwqAg
wqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4N
CsKgIMKgIMKgIMKgIGxpbmXCoCDCoDI6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2Vk
wqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDM6wqAg
wqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxi
cj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDQ6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51
c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDU6
wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdo
IDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDY6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKg
dW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDC
oDc6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1o
aWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDg6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKg
IMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXC
oCDCoDk6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2
ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMDrCoCDCoCDCoCB1bm5hbWVkwqAgwqAg
wqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGlu
ZcKgIDExOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3Rp
dmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTI6wqAgwqAgwqAgdW5uYW1lZMKgIMKg
IMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxp
bmXCoCAxMzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0
aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE0OsKgIMKgIMKgIHVubmFtZWTCoCDC
oCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBs
aW5lwqAgMTU6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFj
dGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxNjrCoCDCoCDCoCB1bm5hbWVkwqAg
wqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAg
bGluZcKgIDE3OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBh
Y3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTg6wqAgwqAgwqAgdW5uYW1lZMKg
IMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKg
IGxpbmXCoCAxOTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAg
YWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDIwOsKgIMKgIMKgIHVubmFtZWTC
oCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDC
oCBsaW5lwqAgMjE6wqAgwqAgwqAgdW5uYW1lZCAmcXVvdDtiZWFnbGVib25lOmdyZWVuOnVzcjAm
cXVvdDsgb3V0cHV0IGFjdGl2ZS1oaWdoIFt1c2VkXTxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAy
MjrCoCDCoCDCoCB1bm5hbWVkICZxdW90O2JlYWdsZWJvbmU6Z3JlZW46dXNyMSZxdW90OyBvdXRw
dXQgYWN0aXZlLWhpZ2ggW3VzZWRdPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDIzOsKgIMKgIMKg
IHVubmFtZWQgJnF1b3Q7YmVhZ2xlYm9uZTpncmVlbjp1c3IyJnF1b3Q7IG91dHB1dCBhY3RpdmUt
aGlnaCBbdXNlZF08YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjQ6wqAgwqAgwqAgdW5uYW1lZCAm
cXVvdDtiZWFnbGVib25lOmdyZWVuOnVzcjMmcXVvdDsgb3V0cHV0IGFjdGl2ZS1oaWdoIFt1c2Vk
XTxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyNTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1
bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI2
OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGln
aCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjc6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKg
dW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAy
ODrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhp
Z2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI5OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDC
oHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAg
MzA6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1o
aWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAzMTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAg
wqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KZ3Bpb2NoaXAxIC0gMzIgbGlu
ZXM6PGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgMDrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAg
wqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKg
IMKgMTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZl
LWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgMjrCoCDCoCDCoCB1bm5hbWVkwqAgwqAg
wqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGlu
ZcKgIMKgMzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0
aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgNDrCoCDCoCDCoCB1bm5hbWVkwqAg
wqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAg
bGluZcKgIMKgNTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAg
YWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgNjrCoCDCoCDCoCB1bm5hbWVk
wqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAg
wqAgbGluZcKgIMKgNzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0
wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIMKgODrCoCDCoCDCoCB1bm5h
bWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAg
wqAgwqAgbGluZcKgIMKgOTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlu
cHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDEwOsKgIMKgIMKgIHVu
bmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDC
oCDCoCDCoCBsaW5lwqAgMTE6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBp
bnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMjrCoCDCoCDCoCB1
bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAg
wqAgwqAgwqAgbGluZcKgIDEzOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKg
aW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTQ6wqAgwqAgwqAg
dW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKg
IMKgIMKgIMKgIGxpbmXCoCAxNTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDC
oGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE2OsKgIMKgIMKg
IHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrC
oCDCoCDCoCDCoCBsaW5lwqAgMTc6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAg
wqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxODrCoCDCoCDC
oCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0K
wqAgwqAgwqAgwqAgbGluZcKgIDE5OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKg
IMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjA6wqAgwqAg
wqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4N
CsKgIMKgIMKgIMKgIGxpbmXCoCAyMTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTC
oCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDIyOsKgIMKg
IMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+
DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjM6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2Vk
wqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyNDrCoCDC
oCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJy
Pg0KwqAgwqAgwqAgwqAgbGluZcKgIDI1OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNl
ZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjY6wqAg
wqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxi
cj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyNzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVz
ZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI4OsKg
IMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8
YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjk6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51
c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAzMDrC
oCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2gg
PGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDMxOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVu
dXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQpncGlvY2hpcDIgLSAzMiBsaW5lczo8
YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqAwOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVu
dXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqAx
OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGln
aCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqAyOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDC
oHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAg
wqAzOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUt
aGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA0OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDC
oCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5l
wqAgwqA1OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3Rp
dmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA2OsKgIMKgIMKgIHVubmFtZWTCoCDC
oCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBs
aW5lwqAgwqA3OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBh
Y3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgwqA4OsKgIMKgIMKgIHVubmFtZWTC
oCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDC
oCBsaW5lwqAgwqA5OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTC
oCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTA6wqAgwqAgwqAgdW5uYW1l
ZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKg
IMKgIGxpbmXCoCAxMTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0
wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDEyOsKgIMKgIMKgIHVubmFt
ZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDC
oCDCoCBsaW5lwqAgMTM6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1
dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxNDrCoCDCoCDCoCB1bm5h
bWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAg
wqAgwqAgbGluZcKgIDE1OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5w
dXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTY6wqAgwqAgwqAgdW5u
YW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKg
IMKgIMKgIGxpbmXCoCAxNzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlu
cHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE4OsKgIMKgIMKgIHVu
bmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDC
oCDCoCDCoCBsaW5lwqAgMTk6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBp
bnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyMDrCoCDCoCDCoCB1
bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAg
wqAgwqAgwqAgbGluZcKgIDIxOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKg
aW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjI6wqAgwqAgwqAg
dW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKg
IMKgIMKgIMKgIGxpbmXCoCAyMzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDC
oGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI0OsKgIMKgIMKg
IHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrC
oCDCoCDCoCDCoCBsaW5lwqAgMjU6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAg
wqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyNjrCoCDCoCDC
oCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0K
wqAgwqAgwqAgwqAgbGluZcKgIDI3OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKg
IMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjg6wqAgwqAg
wqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4N
CsKgIMKgIMKgIMKgIGxpbmXCoCAyOTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTC
oCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDMwOsKgIMKg
IMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+
DQrCoCDCoCDCoCDCoCBsaW5lwqAgMzE6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2Vk
wqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCmdwaW9jaGlwMyAtIDMyIGxpbmVzOjxicj4N
CsKgIMKgIMKgIMKgIGxpbmXCoCDCoDA6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2Vk
wqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDE6wqAg
wqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxi
cj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDI6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51
c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDM6
wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdo
IDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDQ6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKg
dW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDC
oDU6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1o
aWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDY6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKg
IMKgIMKgJnF1b3Q7Y2QmcXVvdDvCoCDCoGlucHV0wqAgwqBhY3RpdmUtbG93IFt1c2VkXTxicj4N
CsKgIMKgIMKgIMKgIGxpbmXCoCDCoDc6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2Vk
wqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDg6wqAg
wqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxi
cj4NCsKgIMKgIMKgIMKgIGxpbmXCoCDCoDk6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51
c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMDrC
oCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2gg
PGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDExOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVu
dXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTI6
wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdo
IDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxMzrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1
bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE0
OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGln
aCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMTU6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKg
dW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAx
NjrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhp
Z2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDE3OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDC
oHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAg
MTg6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1o
aWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAxOTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAg
wqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKg
IDIwOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUt
aGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjE6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKg
IMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXC
oCAyMjrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZl
LWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDIzOsKgIMKgIMKgIHVubmFtZWTCoCDCoCDC
oCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5l
wqAgMjQ6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2
ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAyNTrCoCDCoCDCoCB1bm5hbWVkwqAgwqAg
wqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGlu
ZcKgIDI2OsKgIMKgIMKgIHVubmFtZWTCoCDCoCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3Rp
dmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBsaW5lwqAgMjc6wqAgwqAgwqAgdW5uYW1lZMKgIMKg
IMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFjdGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxp
bmXCoCAyODrCoCDCoCDCoCB1bm5hbWVkwqAgwqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0
aXZlLWhpZ2ggPGJyPg0KwqAgwqAgwqAgwqAgbGluZcKgIDI5OsKgIMKgIMKgIHVubmFtZWTCoCDC
oCDCoCDCoHVudXNlZMKgIMKgaW5wdXTCoCBhY3RpdmUtaGlnaCA8YnI+DQrCoCDCoCDCoCDCoCBs
aW5lwqAgMzA6wqAgwqAgwqAgdW5uYW1lZMKgIMKgIMKgIMKgdW51c2VkwqAgwqBpbnB1dMKgIGFj
dGl2ZS1oaWdoIDxicj4NCsKgIMKgIMKgIMKgIGxpbmXCoCAzMTrCoCDCoCDCoCB1bm5hbWVkwqAg
wqAgwqAgwqB1bnVzZWTCoCDCoGlucHV0wqAgYWN0aXZlLWhpZ2g8YnI+DQpgYGA8YnI+DQo8YnI+
DQoxLiBXaGF0IGNvdWxkIGJlIHRoZSBjYXVzZSBmb3IgdGhhdCAoZXhhY3QgZGlmZmVyZW50IGJl
dHdlZW4gRHVuZmVsbCBhbmQgS2lya3N0b25lIGluIG1ldGEtdGkpPyBDYW4gaXQgYmUgdGhhdCB0
aGUgcmVsZXZhbnQgZHRzIGZpbGUocykgc29tZWhvdyBjaGFuZ2VkPzxicj48L2Jsb2NrcXVvdGU+
PGRpdj5UaGUgZ3BpbyBuYW1lcyBhcmUgZGVmaW5lZCBpbiB0aGUgZGV2aWNlIHRyZWUgYnkgZGVm
aW5pbmcgJnF1b3Q7Z3Bpby1saW5lLW5hbWVzID0gLi4uJnF1b3Q7PC9kaXY+PGRpdj5FeGFtcGxl
IGZvciB0aGUgYW0zMzV4LWJvbmVibGFjay5kdHMgZnJvbSBUSXMgNi4xIGtlcm5lbC4gPGEgaHJl
Zj0iaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvdGktbGludXgta2VybmVsL3RpLWxpbnV4LWtlcm5l
bC90cmVlL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1eC1ib25lYmxhY2suZHRzP2g9dGktbGludXgt
Ni4xLnkjbjI5Ij5odHRwczovL2dpdC50aS5jb20vY2dpdC90aS1saW51eC1rZXJuZWwvdGktbGlu
dXgta2VybmVsL3RyZWUvYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWJvbmVibGFjay5kdHM/aD10
aS1saW51eC02LjEueSNuMjk8L2E+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KMi4gQXNpZGUgZnJvbSBsYWJlbHMg
bWlzc2luZywgY2FuIHRoZXJlIGJlIGFueSBvdGhlciBjb25zZXF1ZW5jZXMgaGVyZT8gSSB0ZXN0
ZWQgZ3BpbyBvdXRwdXRzIHN0YXRlIGNoYW5naW5nIGFuZCBpdCB3b3JrcyBub3JtYWxseS48YnI+
PC9ibG9ja3F1b3RlPjxkaXY+SSYjMzk7ZCBndWVzcyBubywgb3RoZXIgdGhhbiBpdCBiZWluZyBo
YXJkZXIgdG8gaWRlbnRpZnkgdGhlIGNvcnJlY3QgZ3Bpby4gPGJyPjwvZGl2PjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3Jk
ZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxi
cj4NCkkgd291bGQgYXBwcmVjaWF0ZSBhbGwgaGVscCBhbmQgZmVlZGJhY2shPGJyPg0KPGJyPg0K
LT0tPS09LT0tPS09LT0tPS09LT0tPS08YnI+DQpMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3Nh
Z2VzIHNlbnQgdG8gdGhpcyBncm91cC48YnI+DQpWaWV3L1JlcGx5IE9ubGluZSAoIzE3Mzg0KTog
PGEgaHJlZj0iaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS10aS9tZXNzYWdl
LzE3Mzg0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLnlv
Y3RvcHJvamVjdC5vcmcvZy9tZXRhLXRpL21lc3NhZ2UvMTczODQ8L2E+PGJyPg0KTXV0ZSBUaGlz
IFRvcGljOiA8YSBocmVmPSJodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTAzNTM5
NjY4Lzc5MDI2MjEiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMDM1Mzk2NjgvNzkwMjYyMTwvYT48YnI+DQpHcm91cCBP
d25lcjogPGEgaHJlZj0ibWFpbHRvOm1ldGEtdGklMkJvd25lckBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+bWV0YS10aStvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
PC9hPjxicj4NClVuc3Vic2NyaWJlOiA8YSBocmVmPSJodHRwczovL2xpc3RzLnlvY3RvcHJvamVj
dC5vcmcvZy9tZXRhLXRpL3Vuc3ViIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXRpL3Vuc3ViPC9hPiBbPGEgaHJl
Zj0ibWFpbHRvOmpjb3JtaWVyQGNyaXRpY2FsbGluay5jb20iIHRhcmdldD0iX2JsYW5rIj5qY29y
bWllckBjcml0aWNhbGxpbmsuY29tPC9hPl08YnI+DQotPS09LT0tPS09LT0tPS09LT0tPS09LTxi
cj4NCjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPjxzcGFuIGNs
YXNzPSJnbWFpbF9zaWduYXR1cmVfcHJlZml4Ij4tLSA8L3NwYW4+PGJyPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0
ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9
Imx0ciI+PGRpdj5Kb25hdGhhbiBDb3JtaWVyPGJyPlNvZnR3YXJlIEVuZ2luZWVyPGRpdj48ZGl2
PjxkaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2Pjxmb250IGNvbG9yPSIjMDAwMDAwIj5Wb2lj
ZTrCoMKgPGEgdmFsdWU9IisxMzE1NDI1NDA0NSI+MzE1LjQyNS40MDQ1PC9hPsKgeDIyMjwvZm9u
dD48L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMDAwMDAwIj48YnI+PC9mb250PjwvZGl2PjxkaXY+
PGZvbnQgY29sb3I9IiMwMDAwMDAiPjxpbWcgc3JjPSJodHRwczovL2NpMy5nb29nbGV1c2VyY29u
dGVudC5jb20vbWFpbC1zaWcvQUlvcks0eG1sNzVmSlBLWUY3TTlYNUR1eDRJcmJ0elprMFJCNmpm
OGlCWXVQUUtBcnJrQmtPa1U0SEoyclA3ZUg2ZDJoN19pdHVNV0VCYyI+PGJyPjwvZm9udD48L2Rp
dj48L2Rpdj48L2Rpdj48ZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMxMTU1Y2MiPjxicj48L2ZvbnQ+
PC9kaXY+PGRpdj48YSBocmVmPSJodHRwOi8vd3d3LmNyaXRpY2FsbGluay5jb20vIiB0YXJnZXQ9
Il9ibGFuayI+PGZvbnQgY29sb3I9IiMxMTU1Y2MiPmh0dHA6Ly93d3cuQ3JpdGljYWxMaW5rLmNv
bTwvZm9udD48L2E+PGJyPjwvZGl2PjxkaXY+NjcxMiBCcm9va2xhd24gUGFya3dheSzCoFN5cmFj
dXNlLCBOWSAxMzIxMcKgPC9kaXY+PC9kaXY+PC9kaXY+PGRpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
Pjxmb250IGNvbG9yPSIjMTE1NWNjIj48Zm9udCBjb2xvcj0iIzExNTVjYyI+PGEgaHJlZj0iaHR0
cHM6Ly93d3cubGlua2VkaW4uY29tL2NvbXBhbnkvY3JpdGljYWwtbGluay1sbGMiIHRhcmdldD0i
X2JsYW5rIj48aW1nIHNyYz0iaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vdWM/ZXhwb3J0PWRvd25s
b2FkJmFtcDtpZD0wQjJ2TlNudS1hWXU2T0VoSFJXOUJVRlY1V25NJmFtcDtyZXZpZD0wQjJ2TlNu
dS1hWXU2UkhOWlVuaE5iRnBFUjFsM2VtTlFZMlZvYUhBMFJEZHVkV2xGUFEiPjwvYT7CoMKgPGEg
aHJlZj0iaHR0cHM6Ly90d2l0dGVyLmNvbS9Dcml0aWNhbF9MaW5rIiB0YXJnZXQ9Il9ibGFuayI+
PGltZyBhbHQ9IiIgc3JjPSJodHRwczovL2RvY3MuZ29vZ2xlLmNvbS91Yz9leHBvcnQ9ZG93bmxv
YWQmYW1wO2lkPTBCMnZOU251LWFZdTZjVTF5V0VSckxYRTBTbk0mYW1wO3JldmlkPTBCMnZOU251
LWFZdTZiMVlyWlcxU00waHVlVmhWUzBwUFdtMUlPWEZTYzBJM2F5OWpQUSI+PC9hPjwvZm9udD48
L2ZvbnQ+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--0000000000005cef71060e9e73c6--

