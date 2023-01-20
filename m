Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDEC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 20:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.86596.1674247885267541308
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 12:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E17540C90;
	Fri, 20 Jan 2023 20:51:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSItafcfRU64; Fri, 20 Jan 2023 20:51:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0A82E40C06;
	Fri, 20 Jan 2023 20:51:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 99680163700; Fri, 20 Jan 2023 15:51:02 -0500 (EST)
Date: Fri, 20 Jan 2023 15:51:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 7/7] conf: machine: Rework
 do_image_wic dependencies
Message-ID: <20230120205102.GQ22689@denix.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-7-afd@ti.com>
 <20230118183615.GH22689@denix.org>
 <c0991227-de85-79a1-45a9-76fbce3f3e96@ti.com>
 <173B82AA29E7A438.24231@lists.yoctoproject.org>
 <20230118210820.GJ22689@denix.org>
 <22286775-1f42-b72f-3a31-fd998fadd96f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22286775-1f42-b72f-3a31-fd998fadd96f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 20:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15614

On Wed, Jan 18, 2023 at 04:30:07PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 1/18/23 3:08 PM, Denys Dmytriyenko wrote:
> >On Wed, Jan 18, 2023 at 03:55:29PM -0500, Denys Dmytriyenko wrote:
> >>Well, it wasn't as simple as just adding the conf file...
> >>
> >>Anyway, I'm beginning to suspect that J721e SR1.1 is identical to SR1 for GP
> >>devices and only differs for HS devices. See this code in the imggen Makefile:
> 
> Your suspicion is correct, SR1.1 is a re-spin made to fix a ROM bug relating to HS,
> and so SR1.1 GP chips are effectively the same as SR1.0 GP.
> 
> >Second, do we want to go back to SR1.1 only for HS, or jump through the hoops
> >to make it work for GP as well?
> 
> I'd imagine there are very few SR1.0 HS chips left out there, and none went to
> production, might be time we drop that support instead. Then just go back to
> one type for J721e HS and call it the same for both GP and HS, drop all the
> _sr1_1 postfixes or add them to GP (since it doesn't matter for GP).

I've posted a re-spin of this series last night with this change:
https://patchwork.yoctoproject.org/project/ti/list/?series=9825

Only #7 is different:
https://patchwork.yoctoproject.org/project/ti/patch/20230120014050.1988728-7-denis@denix.org/

Here's the exact change between v1 and v2, dropping sr1-1 multiconfig:


From e06c62f5ba6e37c6a8ee513010bff794f7e1b1cf Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 20 Jan 2023 01:08:28 +0000
Subject: [PATCH] fixup! conf: machine: Rework do_image_wic dependencies

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-ti-bsp/conf/machine/include/j721e.inc            |  6 ------
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf | 11 -----------
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf       |  3 +--
 meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf          |  3 ---
 4 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 6322fe46..eba10d8d 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -12,14 +12,8 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
 
-# Default sysfw.itb on J721e is for SR1.1
-BBMULTICONFIG += "k3r5-sr1-1"
-do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "sysfw.itb"
 
-# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
-
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
deleted file mode 100644
index 6e809f46..00000000
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721e SR1.1 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721e SR1.1 HS EVM (R5F core)
-
-# Booting SR1.1 requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/j721e-hs-evm-k3r5.conf
-SOC_FAMILY:append = ":k3r5-sr1-1"
-
-SYSFW_SOC = "j721e_sr1_1"
-SYSFW_SYMLINK = "sysfw.itb"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
index a0d000b2..56312c0c 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -4,10 +4,9 @@
 
 require conf/machine/include/k3r5.inc
 
-SYSFW_SOC = "j721e"
+SYSFW_SOC = "j721e_sr1_1"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
-SYSFW_SYMLINK = ""
 
 SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
 SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf b/meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf
deleted file mode 100644
index 428f2212..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-sr1-1.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5.conf
-
-MACHINE:append = "-sr1-1"
-- 
2.25.1


