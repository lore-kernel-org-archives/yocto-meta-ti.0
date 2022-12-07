Return-Path: <mrchapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC63C4708D
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 22:40:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.768.1670452809209026079
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 14:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bt3PPJkQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: mrchapp@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h10so20701358wrx.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 14:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhItrcAFpiVo0JQA3+N/T59JrJPKEs28wCvJ+90jPKs=;
        b=Bt3PPJkQKqJUpaVVNClnZUBvngOdwFC7/ZDHbG8cCMOPuryPG3tYycibmHALedZxfT
         I0+JemhmKEgVLB2kAZ9KDW2quls31O2Mee7brmUSZRq8oLY7QZI9yG5O1U0jz4Y8Yg0/
         OwDH3Ht78nEXSj5hLUC/hqKzEMoaaOD096f9fU75nraslJLYHmBbCjZAQfKFK8l8ZPGy
         adHQgGioPUilVo4guU7OHm8ypGid0HDuL8FmCMlV9plR6EkP9jTX9l+z2P8X2GsO+hTB
         3BR9TZOVTT+HTRkL8ceFHRLOmYN0PBv2+FYNLeAIDc+qnQxVSL7TnPoLZcQ5fEy6MOOX
         AsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhItrcAFpiVo0JQA3+N/T59JrJPKEs28wCvJ+90jPKs=;
        b=jNc88K/gVvHc/96ph1ZZItUr7BrH6mMm5SpBOUqZt9v/B62PrAWtL1ee+8DCcS2f03
         1u4IcM6H88i0zCEjpOfAYpKS8u6RosrS2lulf6Umb1y/m5XqrqEqfeo1b/zLWVG+1M6x
         aI96/MDKyu4t/55dRcUbJ9eRTyYEP99RJDNfJgw67k2Hq4ul4hMgYeSXT9LuTRj2Uk6a
         5JHpuqID5Fj6mAjH0l/uBMllIS8NWhA2VVc9R4ygummPsO2+puozinO9wq1GgC8NepgF
         poXIGWVQuMgjdqFUNG79vYXD7vmB6EyGu6S2HQf62ztGUqrMCaB3G2GgPnSq4sN07tNV
         kmFg==
X-Gm-Message-State: ANoB5pknzUBFNNmWXd14rIgDpBmndGykQidJi7PtHWNlzVQHCtB9kmPb
	69CTK68/kHhKDn3H4sQw+SRtLVVjYFYZJ0aGPxI=
X-Google-Smtp-Source: AA0mqf4tBeNj3tiuLd56UzbFyAKzi7ioo+uILanxkfggRpSyRjv5615eZtLDWI/+82g0w+1L+VEBVvPgnXDuFGTSaLw=
X-Received: by 2002:a5d:5509:0:b0:242:5023:efcb with SMTP id
 b9-20020a5d5509000000b002425023efcbmr11578099wrv.143.1670452807522; Wed, 07
 Dec 2022 14:40:07 -0800 (PST)
MIME-Version: 1.0
References: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
 <20221207222351.GB22689@denix.org> <1047cedf-f3ab-b519-63a9-081e8d371480@ti.com>
In-Reply-To: <1047cedf-f3ab-b519-63a9-081e8d371480@ti.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <mrchapp@gmail.com>
Date: Wed, 7 Dec 2022 16:39:55 -0600
Message-ID: <CAELJN2kY3gjcamCXPC=7n7ss961KH3OJkRFEXc9Ai0bEVeiX+w@mail.gmail.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sci-fw: make dependency on
 meta-ti-extras soft
To: reatmon@ti.com
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 22:40:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15431

Hello!

On Wed, Dec 7, 2022 at 4:34 PM Ryan Eatmon via lists.yoctoproject.org
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> I literally merged this out to master about 30mins ago.

We can this be expected to land on Kirkstone?

Thanks and greetings!

Daniel D=C3=ADaz
yosoy@danieldiaz.org



> On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:
> > Ping?
> >
> >
> > On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wrote:
> >> From: Denys Dmytriyenko <denys@konsulko.com>
> >>
> >> Replace "require" with "include" to load ti-paths.inc and not break
> >> parsing when meta-ti-extras is not in the BBLAYERS list.
> >>
> >> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
> >> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
> >> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
> >> the soft dependency will still work fine and give a build error
> >> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
> >>
> >> Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
> >> d.getVar() to access it ensuring it doesn't break the condition.
> >>
> >> Reported-by: Daniel D=C3=ADaz <mrchapp@gmail.com>
> >> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >> ---
> >>   meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta=
-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >> index e89a6855..c99cd660 100644
> >> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >> @@ -1,5 +1,5 @@
> >>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >> -require recipes-ti/includes/ti-paths.inc
> >> +include recipes-ti/includes/ti-paths.inc
> >>
> >>   DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virtual=
/bootloader"
> >>   DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
> >> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
> >>
> >>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>
> >> -TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or '${TI_=
K3_SECDEV_INSTALL_DIR}' }"
> >> +TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getV=
ar('TI_K3_SECDEV_INSTALL_DIR') }"
> >>   export TI_SECURE_DEV_PKG
> >>
> >>   SYSFW_SOC ?=3D "unknown"
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15430): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15430
> Mute This Topic: https://lists.yoctoproject.org/mt/95121729/1051867
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [mrchapp@gmai=
l.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

