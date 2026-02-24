Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83904F4BB8B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 21:04:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30967.1771967059180773984
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 13:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BCF040C8F;
	Tue, 24 Feb 2026 21:04:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eV8Kkvr4jYY6; Tue, 24 Feb 2026 21:04:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE60840AE9;
	Tue, 24 Feb 2026 21:04:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 285791790A7; Tue, 24 Feb 2026 16:04:11 -0500 (EST)
Date: Tue, 24 Feb 2026 16:04:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: rs@ti.com, reatmon@ti.com, denys@konsulko.com, praneeth@ti.com,
	robertcnelson@gmail.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 2/3] beagley-ai: add beagley-ai-ti
Message-ID: <20260224210411.GQ11121@denix.org>
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-3-rs@ti.com>
 <7b4a7756-a9f6-4b63-ba83-391411255e52@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b4a7756-a9f6-4b63-ba83-391411255e52@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 21:04:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19591

On Tue, Feb 24, 2026 at 12:31:27PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 2/23/26 5:57 PM, rs@ti.com wrote:
> >From: Randolph Sapp <rs@ti.com>
> >
> >Split the existing config into a beagley-ai-ti and beagley-ai that
> >includes it, like the existing beagleplay machine.
> >
> >Signed-off-by: Randolph Sapp <rs@ti.com>
> >---
> >  meta-beagle/conf/machine/beagley-ai-k3r5.conf     |  6 ++----
> >  ...agley-ai-k3r5.conf => beagley-ai-ti-k3r5.conf} |  3 ---
> >  meta-beagle/conf/machine/beagley-ai-ti.conf       | 15 +++++++++++++++
> >  meta-beagle/conf/machine/beagley-ai.conf          | 11 ++---------
> >  4 files changed, 19 insertions(+), 16 deletions(-)
> >  copy meta-beagle/conf/machine/{beagley-ai-k3r5.conf => beagley-ai-ti-k3r5.conf} (61%)
> >  create mode 100644 meta-beagle/conf/machine/beagley-ai-ti.conf
> >
> >diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >index 06c74cf9..2d6948d5 100644
> >--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >@@ -2,10 +2,8 @@
> >  #@NAME: BeagleY AI (R5F)
> >  #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
> >-require conf/machine/include/k3r5.inc
> >+require conf/machine/beagley-ai-ti-k3r5.conf
> >+
> >  require conf/machine/include/beagle-bsp.inc
> >-UBOOT_MACHINE = "am67a_beagley_ai_r5_defconfig"
> >  UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_r5_defconfig"
> >-UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_r5_defconfig"
> >-UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_r5_defconfig"
> >diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
> >similarity index 61%
> >copy from meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >copy to meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
> >index 06c74cf9..eaab2d57 100644
> >--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
> >+++ b/meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
> >@@ -3,9 +3,6 @@
> >  #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
> >  require conf/machine/include/k3r5.inc
> >-require conf/machine/include/beagle-bsp.inc
> >  UBOOT_MACHINE = "am67a_beagley_ai_r5_defconfig"
> >-UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_r5_defconfig"
> >  UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_r5_defconfig"
> >-UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_r5_defconfig"
> >diff --git a/meta-beagle/conf/machine/beagley-ai-ti.conf b/meta-beagle/conf/machine/beagley-ai-ti.conf
> >new file mode 100644
> >index 00000000..d6d05264
> >--- /dev/null
> >+++ b/meta-beagle/conf/machine/beagley-ai-ti.conf
> >@@ -0,0 +1,15 @@
> >+#@TYPE: Machine
> >+#@NAME: BeagleY AI (A53)
> >+#@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
> >+
> >+require conf/machine/include/j722s.inc
> >+
> >+UBOOT_MACHINE = "am67a_beagley_ai_a53_defconfig"
> >+UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_a53_config"
> >+
> >+KERNEL_DEVICETREE_PREFIX = " \
> >+    ti/k3-am67a \
> >+    ti/k3-j722s \
> >+"
> >+
> >+MACHINE_GUI_CLASS = "bigscreen"
> >diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
> >index d73d0506..d2c68201 100644
> >--- a/meta-beagle/conf/machine/beagley-ai.conf
> >+++ b/meta-beagle/conf/machine/beagley-ai.conf
> >@@ -2,18 +2,11 @@
> >  #@NAME: BeagleY AI (A53)
> >  #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
> >-require conf/machine/include/j722s.inc
> >+require conf/machine/beagley-ai-ti.conf
> >+
> 
> We should flip this around, `beagley-ai-ti.conf` should include `beagley-ai.conf`,
> not the other way around. `beagley-ai.conf` is the "deafult" config using the
> Beagle kernel as one would expect of a Beagle product. The "-ti.conf" version is
> the odd ball in that it changes the default to something else. Plus that would
> keep this patch more simple, only needing changes to the new "-ti.conf" file.
> 
> Only downside would be this is done the other way around currently for
> beagleplay, but that would be an easy fix to switch it too.

If you recall, one of the main goals for creating meta-beagle was to showcase 
and set an example of how downstream layers can build on top and extend the 
base meta-ti-bsp layer. So, meta-beagle is a downstream layer to meta-ti-bsp 
and that sets the layer dependency.

The way beagleplay machines were originally placed in these 2 layers, you 
cannot include beagleplay.conf from "-ti.conf" file, only the other way 
around.


> Andrew
> 
> >  require conf/machine/include/beagle-bsp.inc
> >-UBOOT_MACHINE = "am67a_beagley_ai_a53_defconfig"
> >  UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_a53_config"
> >-UBOOT_MACHINE:bsp-ti-6_6 = "j722s_evm_a53_config"
> >-UBOOT_MACHINE:bsp-ti-6_12 = "j722s_evm_a53_config"
> >-
> >-KERNEL_DEVICETREE_PREFIX = " \
> >-    ti/k3-am67a \
> >-    ti/k3-j722s \
> >-"
> >  KERNEL_DEVICETREE:bsp-bb_org-6_6 = " \
> >  ti/k3-am67a-beagley-ai.dtb \

