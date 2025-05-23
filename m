Return-Path: <d-gole@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85D5C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 18:52:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1492.1748026365580731256
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 11:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ufBtGKee;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: d-gole@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NIqe1S994835;
	Fri, 23 May 2025 13:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748026360;
	bh=rrBTQmWY1eaLE8Wc7v9+PWXVBI4UTzB+CXhEPeN6Bk0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ufBtGKeeP9uXafYy4Q86rOkb1CQ2G4UTt5Fp/fZNZvChVXBIxlCqLAAzPTl4Ngfir
	 mgpcJNta5Pp2g9vQAkDcZ/uc4tVTaA4CYR7KmCFP8blYutG97B8mmgFPmJLUtSd4qn
	 AdU1gA0ABp5dZKYMP3fN6ZAidPn/yOqIm6aZeJbc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NIqene4031554
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 13:52:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 13:52:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 13:52:40 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54NIqdWe1361181;
	Fri, 23 May 2025 13:52:40 -0500
Date: Sat, 24 May 2025 00:22:39 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Chirag Shilwant <c-shilwant@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <robertcnelson@beagleboard.org>, <jkridner@beagleboard.org>
Subject: Re: [meta-ti] [master][PATCH 6/6] pocketbeagle2: add configs for new
 PocketBeagle2 platform
Message-ID: <20250523185239.ysx3b2du37qa2vmk@lcpd911>
References: <20250517005430.3648211-1-denis@denix.org>
 <20250517005430.3648211-6-denis@denix.org>
 <ad550e5e-3f13-45ff-8b42-08ff4e7117eb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ad550e5e-3f13-45ff-8b42-08ff4e7117eb@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 18:52:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18593

Hi Chirag,

On May 23, 2025 at 17:23:01 +0530, Chirag Shilwant wrote:
> + Dhruva from beagleboard.org
> 
> Looks like Beagle-board.org just released Rev A1 which
> makes it quad-core A53 plus GPU [0]

Yes that's right.

> 
> Dhruva,
> 
> Any idea if beagleboard/u-boot will do s/am6232/am6254 in [1]

I checked with Robert on discord, looks like he'll be the one making
these decisions.
Adding him to this thread.

> 
> [0]: https://www.hackster.io/news/beagleboard-org-releases-a-surprise-pocketbeagle-2-refresh-doubles-the-cores-and-adds-a-gpu-286c3fe8ccd3
> 
> [1]: https://github.com/beagleboard/u-boot/commit/f7439516453b7728bda496ff6496ef6f1411aae3
> 
> 
> --
> Chirag
> 
> 
> On 17/05/25 06:24, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> > 
> > Add configuration files for the new PocketBeagle2 platform.
> > 
> > U-boot support for this platform is still in its own branch.
> > 
> > Adjust U-boot bootcmd, since EFI boot doesn't seem to work.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >   .../conf/machine/pocketbeagle2-k3r5.conf      | 12 ++++++++
> >   meta-beagle/conf/machine/pocketbeagle2.conf   | 28 +++++++++++++++++++
> >   .../u-boot/u-boot-bb.org_2025.04.bb           |  9 +++++-
> >   .../recipes-kernel/linux/linux-bb.org_6.12.bb |  2 +-
> >   4 files changed, 49 insertions(+), 2 deletions(-)
> >   create mode 100644 meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
> >   create mode 100644 meta-beagle/conf/machine/pocketbeagle2.conf
> > 
> > diff --git a/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf b/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
> > new file mode 100644
> > index 00000000..32e40312
> > --- /dev/null
> > +++ b/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
> > @@ -0,0 +1,12 @@
> > +#@TYPE: Machine
> > +#@NAME: PocketBeagle2 (R5F)
> > +#@DESCRIPTION: Machine configuration for the PocketBeagle2 (R5F core)
> > +
> > +require conf/machine/include/k3r5.inc
> > +require conf/machine/include/beagle-bsp.inc
> > +
> > +SYSFW_SOC = "am62x"
> > +SYSFW_CONFIG = "evm"
> > +SYSFW_SUFFIX = "hs-fs"
> > +
> > +UBOOT_MACHINE = "am6232_pocketbeagle2_r5_defconfig"
> > diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/conf/machine/pocketbeagle2.conf
> > new file mode 100644
> > index 00000000..3d9651bd
> > --- /dev/null
> > +++ b/meta-beagle/conf/machine/pocketbeagle2.conf
> > @@ -0,0 +1,28 @@
> > +#@TYPE: Machine
> > +#@NAME: PocketBeagle2 (A53)
> > +#@DESCRIPTION: Machine configuration for the PocketBeagle2 board (A53 core)
> > +
> > +require conf/machine/include/k3.inc
> > +require conf/machine/include/mc_k3r5.inc
> > +
> > +require conf/machine/include/beagle-bsp.inc
> > +
> > +SOC_FAMILY:append = ":am62xx"
> > +
> > +SERIAL_CONSOLES = "115200;ttyS2"
> > +
> > +TFA_BOARD = "lite"
> > +TFA_K3_SYSTEM_SUSPEND = "1"
> > +
> > +OPTEEMACHINE = "k3-am62x"
> > +
> > +UBOOT_MACHINE = "am6232_pocketbeagle2_a53_defconfig"
> > +
> > +KERNEL_DEVICETREE_PREFIX = " \
> > +    ti/k3-am6232 \
> > +"
> > +
> > +KERNEL_DEVICETREE = " \
> > +    ti/k3-am6232-pocketbeagle2.dtb \
> > +    ti/k3-am6232-pocketbeagle2-techlab-cape.dtbo \
> > +"
> > diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> > index 9fc4015e..aa825d99 100644
> > --- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> > +++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> > @@ -2,7 +2,7 @@ require recipes-bsp/u-boot/u-boot-ti.inc
> >   SUMMARY = "BeagleBoard.org U-Boot"
> > -COMPATIBLE_MACHINE = "beagle.*"
> > +COMPATIBLE_MACHINE = "pocketbeagle2|beagle.*"
> >   PV = "2025.04"
> > @@ -17,3 +17,10 @@ SRCREV:beagley-ai = "cc376f9faef201670c7bb1734f42f5475c73f85d"
> >   SRCREV:beagley-ai-k3r5 = "cc376f9faef201670c7bb1734f42f5475c73f85d"
> >   SRC_URI:append:beagley-ai = " file://bootcmd-ti-mmc.cfg"
> > +
> > +BRANCH:pocketbeagle2 = "v2025.04-pocketbeagle2"
> > +BRANCH:pocketbeagle2-k3r5 = "v2025.04-pocketbeagle2"
> > +SRCREV:pocketbeagle2 = "f7439516453b7728bda496ff6496ef6f1411aae3"
> > +SRCREV:pocketbeagle2-k3r5 = "f7439516453b7728bda496ff6496ef6f1411aae3"
> > +
> > +SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
> > diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> > index 2ef82e0c..bdfd4646 100644
> > --- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> > +++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
> > @@ -6,7 +6,7 @@ SUMMARY = "BeagleBoard.org Linux kernel"
> >   LICENSE = "GPL-2.0-only"
> >   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> > -COMPATIBLE_MACHINE = "beagle.*"
> > +COMPATIBLE_MACHINE = "pocketbeagle2|beagle.*"
> >   inherit kernel
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#18569): https://lists.yoctoproject.org/g/meta-ti/message/18569
> > Mute This Topic: https://lists.yoctoproject.org/mt/113155505/7030289
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

