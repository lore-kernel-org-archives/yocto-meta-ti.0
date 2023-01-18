Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DFFC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 20:55:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.28848.1674075353237943245
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 12:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DC86A40C8E;
	Wed, 18 Jan 2023 20:55:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oIopy26xzept; Wed, 18 Jan 2023 20:55:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB84840C2B;
	Wed, 18 Jan 2023 20:55:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 872B7163700; Wed, 18 Jan 2023 15:55:29 -0500 (EST)
Date: Wed, 18 Jan 2023 15:55:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 7/7] conf: machine: Rework
 do_image_wic dependencies
Message-ID: <20230118205529.GI22689@denix.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-7-afd@ti.com>
 <20230118183615.GH22689@denix.org>
 <c0991227-de85-79a1-45a9-76fbce3f3e96@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0991227-de85-79a1-45a9-76fbce3f3e96@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jan 2023 20:55:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15587

On Wed, Jan 18, 2023 at 01:28:12PM -0600, Ryan Eatmon wrote:
> 
> 
> On 1/18/2023 12:36, Denys Dmytriyenko wrote:
> >On Wed, Dec 07, 2022 at 03:43:12PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> >>The WIC image for K3 depends on the TI-SCI firmware, on AM65x and J721e
> >>also the bootloader. Make this clear by only depending on firmware in
> >>the base k3.inc file, then adding the bootloader dependency in AM65x and
> >>J721e specific includes.
> >>
> >>Remove unneeded overrides from the evm level files.
> >>
> >>Remove do_image_tar dependencies as the tar files do not include
> >>the bootloader nor TI-SCI firmware, only the boot partition of
> >>the WIC file needs these.
> >>
> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> >>index 12ee0c90..6322fe46 100644
> >>--- a/meta-ti-bsp/conf/machine/include/j721e.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> >>@@ -9,6 +9,17 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> >>  PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
> >>  PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> >>+# On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
> >>+do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
> >>+
> >>+# Default sysfw.itb on J721e is for SR1.1
> >>+BBMULTICONFIG += "k3r5-sr1-1"
> >
> >There's a slight problem - k3r5-sr1-1 multiconfig previously only applied to
> >the HS j721e-hs-evm device, but not the GP j721e-evm, see below.
> >
> >Hence there's no corresponding k3r5 config j721e-evm-k3r5-sr1-1.conf exists,
> >only the one for the HS - j721e-hs-evm-k3r5-sr1-1.conf
> >
> >Since you moved the above BBMULTICONFIG line into the common j721e.inc, it now
> >breaks with the error:
> >
> >MACHINE=j721e-evm-k3r5-sr1-1 is invalid. Please set a valid MACHINE in your local.conf, environment or other configuration file.
> >
> >I can re-spin this series with a fix, so it's easier for Ryan to apply...
> 
> I literally just ran into this while doing the test builds and added
> the missing file.  Please feel free to redo the patch series and
> I'll reapply everything.

Well, it wasn't as simple as just adding the conf file...

Anyway, I'm beginning to suspect that J721e SR1.1 is identical to SR1 for GP 
devices and only differs for HS devices. See this code in the imggen Makefile:

https://git.ti.com/cgit/k3-image-gen/k3-image-gen/tree/Makefile#n50

ifeq ($(SOC_TYPE),gp)
ifeq ($(SOC), j721e_sr1_1)
override SOC = j721e
endif
endif

So, basically it falls back to the same code path, meaning building both of 
them is just a waste of time, moreover the filenames will need to be accounted 
for, as it does not generate the required sysfw-j721e_sr1_1-evm.itb and 
obviously fails to deploy...


> >>+do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
> >>+IMAGE_BOOT_FILES += "sysfw.itb"
> >>+
> >>+# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
> >>+IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
> >>+
> >>  TFA_BOARD = "generic"
> >>  OPTEEMACHINE = "k3-j721e"
> >
> ><snip>
> >
> >>diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
> >>index d28d16d1..fe28e6f5 100644
> >>--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
> >>@@ -7,9 +7,6 @@ require conf/machine/include/j721e.inc
> >>  SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
> >>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> >>-# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
> >>-IMAGE_BOOT_FILES += "sysfw.itb"
> >>-
> >>  KERNEL_DEVICETREE = " \
> >>      ti/k3-j721e-common-proc-board.dtb \
> >>      ti/k3-j721e-common-proc-board-infotainment.dtbo \
> >>diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> >>index 9ef7b86a..acd5ca18 100644
> >>--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
> >>@@ -18,10 +18,3 @@ SPL_BINARY = "tispl.bin_HS"
> >>  UBOOT_BINARY = "u-boot.img_HS"
> >>  UBOOT_SYMLINK = "u-boot.img"
> >>  SYSFW_SYMLINK = ""
> >>-
> >>-BBMULTICONFIG += "k3r5-sr1-1"
> >>-
> >>-# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
> >>-IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
> >>-do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
> >>-do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"

