Return-Path: <jsm@jsolano.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D4DCCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:06:22 +0000 (UTC)
Subject: Beagleplay EFI boot flow does not work - SD card partition unrecognized
To: meta-ti@lists.yoctoproject.org
From: "Juan Solano" <jsm@jsolano.com>
X-Originating-Location: Munich, Bavaria, DE (82.135.80.167)
X-Originating-Platform: Linux Firefox 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 11:06:21 -0700
Message-ID: <WbHb.1760724381805743164.kZDR@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Oct 2025 18:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19143

Hi,

I am using scarthgap 11.01.16 with a Beagleplay. My u-boot is=20

u-boot-ti-staging:
  meta-ti-bsp          1:2025.01+git

When I interrupt the boot flow (pressing space as required), I see that the=
 SD card is not visible, only the eMMC:

U-Boot 2025.01-00586-gc779c758475c-dirty (Sep 24 2025 - 19:44:29 +0000)
...
...
Press SPACE to abort autoboot in 2 seconds
=3D> <INTERRUPT>
=3D> bootflow scan -l
Scanning for bootflows in all bootdevs
Seq  Method       State   Uclass    Part  Name                      Filenam=
e
---  -----------  ------  --------  ----  ------------------------  -------=
---------
Scanning bootdev 'mmc@fa00000.bootdev':
Scanning bootdev 'mmc@fa10000.bootdev':
  0  extlinux     ready   mmc          1  mmc@fa10000.bootdev.part_ /extlin=
ux/extlinux.conf
No more bootdevs
---  -----------  ------  --------  ----  ------------------------  -------=
---------
(1 bootflow, 1 valid)


Any ideas? I cannot boot from the SD card. If I patch u-boot to use extlinu=
x instead of the default EFI boot flow, the board boots fine.
Juan.

