Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C09FC3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:52:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1670.1747677126303759296
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4260040C83;
	Mon, 19 May 2025 17:52:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P898zkU2MGMH; Mon, 19 May 2025 17:52:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 17F7240C06;
	Mon, 19 May 2025 17:52:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7D0D81687D3; Mon, 19 May 2025 13:52:02 -0400 (EDT)
Date: Mon, 19 May 2025 13:52:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH 5/6] beagley-ai: upgrade BeagleY-AI
 to 6.12
Message-ID: <20250519175202.GZ18383@denix.org>
References: <20250517005430.3648211-1-denis@denix.org>
 <20250517005430.3648211-5-denis@denix.org>
 <23d2cb8c-3603-4389-8737-caf2fc9b3d0f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23d2cb8c-3603-4389-8737-caf2fc9b3d0f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 May 2025 17:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18585

On Mon, May 19, 2025 at 12:22:08PM -0500, Andrew Davis wrote:
> On 5/16/25 7:54 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Upgrade BeagleY-AI platform to 6.12 BSP.
> >
> >U-boot support for this platform is still in its own branch.
> >
> >Also adjust U-boot bootcmd, as Distro Boot doesn't fully work yet.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  meta-beagle/conf/machine/beagley-ai-k3r5.conf             | 3 +--
> >  meta-beagle/conf/machine/beagley-ai.conf                  | 8 ++++++--
> >  .../u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg   | 1 +
> >  meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb   | 7 +++++++
> >  4 files changed, 15 insertions(+), 4 deletions(-)
> >  create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg
> >
> >diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >index 6cc370d1..8d5111f0 100644
> >--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >@@ -3,8 +3,6 @@
> >  #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
> >  require conf/machine/include/k3r5.inc
> >-
> >-TI_PREFERRED_BSP ?= "bb_org-6_1"
> >  require conf/machine/include/beagle-bsp.inc
> >  SYSFW_SOC = "j722s"
> >@@ -12,5 +10,6 @@ SYSFW_CONFIG = "evm"
> >  SYSFW_SUFFIX = "hs-fs"
> >  UBOOT_MACHINE = "j722s_evm_r5_defconfig"
> >+UBOOT_MACHINE:bsp-bb_org-6_12 = "am67a_beagley_ai_r5_defconfig"
> >  UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_r5.config"
> >diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
> >index 9b1832d2..497001ee 100644
> >--- a/meta-beagle/conf/machine/beagley-ai.conf
> >+++ b/meta-beagle/conf/machine/beagley-ai.conf
> >@@ -3,11 +3,10 @@
> >  #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
> >  require conf/machine/include/j722s.inc
> >-
> >-TI_PREFERRED_BSP ?= "bb_org-6_1"
> >  require conf/machine/include/beagle-bsp.inc
> >  UBOOT_MACHINE = "j722s_evm_a53_config"
> >+UBOOT_MACHINE:bsp-bb_org-6_12 = "am67a_beagley_ai_a53_defconfig"
> >  UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am67a_beagley_ai_a53.config"
> >@@ -22,4 +21,9 @@ ti/k3-j722s-evm.dtb \
> >  ti/k3-am67a-beagley-ai.dtb \
> >  "
> >+KERNEL_DEVICETREE:append:bsp-bb_org-6_12 = " \
> >+ti/k3-j722s-evm.dtb \
> >+ti/k3-am67a-beagley-ai.dtb \
> >+"
> >+
> >  MACHINE_GUI_CLASS = "bigscreen"
> >diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg
> >new file mode 100644
> >index 00000000..362696b9
> >--- /dev/null
> >+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg
> >@@ -0,0 +1 @@
> >+CONFIG_BOOTCOMMAND="run bootcmd_ti_mmc"
> >diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> >index 492705c2..9fc4015e 100644
> >--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> >+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
> >@@ -10,3 +10,10 @@ UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
> >  UBOOT_GIT_PROTOCOL = "https"
> >  BRANCH = "v2025.04-Beagle"
> >  SRCREV = "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
> >+
> >+BRANCH:beagley-ai = "v2025.04-rc3-BeagleY-AI"
> 
> BeagleY-AI support is now in the latest upstream master. This branch here
> is missing some updates for BeagleY-AI that can be found in master.
> 
> Would it be better here to take the v2025.07-rc1-Beagle here which
> includes both these additional BeagleY-AI patches and also PB2 support?
> Maybe it should be the default then.

I'd be fine switching to 2025.07 eventually, once it matures a bit - I'm not 
comfortable taking rc1 at this point.

We can do this in stages - now update 6.1 -> 6.12 with 2025.04 in a seaprate 
branch, then update 2025.04 -> 2025.07 when it's ready (either final or at 
least rc3/rc4).


> Andrew
> 
> [0] $ git log --oneline 5a0a93a7684..9f5f9965960
> 
> >+BRANCH:beagley-ai-k3r5 = "v2025.04-rc3-BeagleY-AI"
> >+SRCREV:beagley-ai = "cc376f9faef201670c7bb1734f42f5475c73f85d"
> >+SRCREV:beagley-ai-k3r5 = "cc376f9faef201670c7bb1734f42f5475c73f85d"
> >+
> >+SRC_URI:append:beagley-ai = " file://bootcmd-ti-mmc.cfg"

