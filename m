Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA20C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:49:54 +0000 (UTC)
Subject: [kirkstone] libgpiod-tools gpioinfo missing for beaglebone
To: meta-ti@lists.yoctoproject.org
From: "Lukasz Przenioslo" <bremenpl@gmail.com>
X-Originating-Location: Szczecin, West Pomerania, PL (83.20.46.245)
X-Originating-Platform: Windows Firefox 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 00:49:51 -0800
Message-ID: <6K9j.1704444591892894346.Xv85@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 08:49:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17384

Hello,
I have recently moved from Dunfell to Kirkstone for the beaglebone machine.=
 Since then I have noticed that calling gpioinfo from libgpiod-tools does n=
ot show the gpio labels:

```
root@beaglebone:~# gpioinfo
gpiochip0 - 32 lines:
        line   0:      unnamed       unused   input  active-high=20
        line   1:      unnamed       unused   input  active-high=20
        line   2:      unnamed       unused   input  active-high=20
        line   3:      unnamed       unused   input  active-high=20
        line   4:      unnamed       unused   input  active-high=20
        line   5:      unnamed       unused   input  active-high=20
        line   6:      unnamed       unused   input  active-high=20
        line   7:      unnamed       unused   input  active-high=20
        line   8:      unnamed       unused   input  active-high=20
        line   9:      unnamed       unused   input  active-high=20
        line  10:      unnamed       unused   input  active-high=20
        line  11:      unnamed       unused   input  active-high=20
        line  12:      unnamed       unused   input  active-high=20
        line  13:      unnamed       unused   input  active-high=20
        line  14:      unnamed       unused   input  active-high=20
        line  15:      unnamed       unused   input  active-high=20
        line  16:      unnamed       unused   input  active-high=20
        line  17:      unnamed       unused   input  active-high=20
        line  18:      unnamed       unused   input  active-high=20
        line  19:      unnamed       unused   input  active-high=20
        line  20:      unnamed       unused   input  active-high=20
        line  21:      unnamed "beaglebone:green:usr0" output active-high [=
used]
        line  22:      unnamed "beaglebone:green:usr1" output active-high [=
used]
        line  23:      unnamed "beaglebone:green:usr2" output active-high [=
used]
        line  24:      unnamed "beaglebone:green:usr3" output active-high [=
used]
        line  25:      unnamed       unused   input  active-high=20
        line  26:      unnamed       unused   input  active-high=20
        line  27:      unnamed       unused   input  active-high=20
        line  28:      unnamed       unused   input  active-high=20
        line  29:      unnamed       unused   input  active-high=20
        line  30:      unnamed       unused   input  active-high=20
        line  31:      unnamed       unused   input  active-high=20
gpiochip1 - 32 lines:
        line   0:      unnamed       unused   input  active-high=20
        line   1:      unnamed       unused   input  active-high=20
        line   2:      unnamed       unused   input  active-high=20
        line   3:      unnamed       unused   input  active-high=20
        line   4:      unnamed       unused   input  active-high=20
        line   5:      unnamed       unused   input  active-high=20
        line   6:      unnamed       unused   input  active-high=20
        line   7:      unnamed       unused   input  active-high=20
        line   8:      unnamed       unused   input  active-high=20
        line   9:      unnamed       unused   input  active-high=20
        line  10:      unnamed       unused   input  active-high=20
        line  11:      unnamed       unused   input  active-high=20
        line  12:      unnamed       unused   input  active-high=20
        line  13:      unnamed       unused   input  active-high=20
        line  14:      unnamed       unused   input  active-high=20
        line  15:      unnamed       unused   input  active-high=20
        line  16:      unnamed       unused   input  active-high=20
        line  17:      unnamed       unused   input  active-high=20
        line  18:      unnamed       unused   input  active-high=20
        line  19:      unnamed       unused   input  active-high=20
        line  20:      unnamed       unused   input  active-high=20
        line  21:      unnamed       unused   input  active-high=20
        line  22:      unnamed       unused   input  active-high=20
        line  23:      unnamed       unused   input  active-high=20
        line  24:      unnamed       unused   input  active-high=20
        line  25:      unnamed       unused   input  active-high=20
        line  26:      unnamed       unused   input  active-high=20
        line  27:      unnamed       unused   input  active-high=20
        line  28:      unnamed       unused   input  active-high=20
        line  29:      unnamed       unused   input  active-high=20
        line  30:      unnamed       unused   input  active-high=20
        line  31:      unnamed       unused   input  active-high=20
gpiochip2 - 32 lines:
        line   0:      unnamed       unused   input  active-high=20
        line   1:      unnamed       unused   input  active-high=20
        line   2:      unnamed       unused   input  active-high=20
        line   3:      unnamed       unused   input  active-high=20
        line   4:      unnamed       unused   input  active-high=20
        line   5:      unnamed       unused   input  active-high=20
        line   6:      unnamed       unused   input  active-high=20
        line   7:      unnamed       unused   input  active-high=20
        line   8:      unnamed       unused   input  active-high=20
        line   9:      unnamed       unused   input  active-high=20
        line  10:      unnamed       unused   input  active-high=20
        line  11:      unnamed       unused   input  active-high=20
        line  12:      unnamed       unused   input  active-high=20
        line  13:      unnamed       unused   input  active-high=20
        line  14:      unnamed       unused   input  active-high=20
        line  15:      unnamed       unused   input  active-high=20
        line  16:      unnamed       unused   input  active-high=20
        line  17:      unnamed       unused   input  active-high=20
        line  18:      unnamed       unused   input  active-high=20
        line  19:      unnamed       unused   input  active-high=20
        line  20:      unnamed       unused   input  active-high=20
        line  21:      unnamed       unused   input  active-high=20
        line  22:      unnamed       unused   input  active-high=20
        line  23:      unnamed       unused   input  active-high=20
        line  24:      unnamed       unused   input  active-high=20
        line  25:      unnamed       unused   input  active-high=20
        line  26:      unnamed       unused   input  active-high=20
        line  27:      unnamed       unused   input  active-high=20
        line  28:      unnamed       unused   input  active-high=20
        line  29:      unnamed       unused   input  active-high=20
        line  30:      unnamed       unused   input  active-high=20
        line  31:      unnamed       unused   input  active-high=20
gpiochip3 - 32 lines:
        line   0:      unnamed       unused   input  active-high=20
        line   1:      unnamed       unused   input  active-high=20
        line   2:      unnamed       unused   input  active-high=20
        line   3:      unnamed       unused   input  active-high=20
        line   4:      unnamed       unused   input  active-high=20
        line   5:      unnamed       unused   input  active-high=20
        line   6:      unnamed         "cd"   input   active-low [used]
        line   7:      unnamed       unused   input  active-high=20
        line   8:      unnamed       unused   input  active-high=20
        line   9:      unnamed       unused   input  active-high=20
        line  10:      unnamed       unused   input  active-high=20
        line  11:      unnamed       unused   input  active-high=20
        line  12:      unnamed       unused   input  active-high=20
        line  13:      unnamed       unused   input  active-high=20
        line  14:      unnamed       unused   input  active-high=20
        line  15:      unnamed       unused   input  active-high=20
        line  16:      unnamed       unused   input  active-high=20
        line  17:      unnamed       unused   input  active-high=20
        line  18:      unnamed       unused   input  active-high=20
        line  19:      unnamed       unused   input  active-high=20
        line  20:      unnamed       unused   input  active-high=20
        line  21:      unnamed       unused   input  active-high=20
        line  22:      unnamed       unused   input  active-high=20
        line  23:      unnamed       unused   input  active-high=20
        line  24:      unnamed       unused   input  active-high=20
        line  25:      unnamed       unused   input  active-high=20
        line  26:      unnamed       unused   input  active-high=20
        line  27:      unnamed       unused   input  active-high=20
        line  28:      unnamed       unused   input  active-high=20
        line  29:      unnamed       unused   input  active-high=20
        line  30:      unnamed       unused   input  active-high=20
        line  31:      unnamed       unused   input  active-high
```

1. What could be the cause for that (exact different between Dunfell and Ki=
rkstone in meta-ti)? Can it be that the relevant dts file(s) somehow change=
d?
2. Aside from labels missing, can there be any other consequences here? I t=
ested gpio outputs state changing and it works normally.

I would appreciate all help and feedback!

