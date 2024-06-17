Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC2AC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:46:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.60402.1718639181497175014
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 08:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D847240AB7;
	Mon, 17 Jun 2024 15:46:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5I9oXrkwf65; Mon, 17 Jun 2024 15:46:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E9E940A0B;
	Mon, 17 Jun 2024 15:46:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 680C7163FAF; Mon, 17 Jun 2024 11:46:16 -0400 (EDT)
Date: Mon, 17 Jun 2024 11:46:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Gyan Gupta <g-gupta@ti.com>, Vignesh <vigneshr@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 UBOOT_MACHINE for am62xxsip-evm
Message-ID: <20240617154616.GB5475@denix.org>
References: <20240614070123.1155319-1-c-shilwant@ti.com>
 <20240614164146.GZ21287@denix.org>
 <522267a7-a5cc-43bc-a41a-c33675311da2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <522267a7-a5cc-43bc-a41a-c33675311da2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 15:46:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17756

On Mon, Jun 17, 2024 at 01:56:40PM +0530, Chirag Shilwant wrote:
> Hi Denys,
> 
> On 14/06/24 22:11, Denys Dmytriyenko wrote:
> >On Fri, Jun 14, 2024 at 12:31:23PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> >>Modify the U-Boot defconfig names for A53 and R5
> >>machine configurations based on ti-u-boot-2024.04 [1]
> >>
> >>[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=df5181f8c6c41bf018ec043d565581b5d8a291c5
> >If we get the multi-BSP support merged, this would have to be adjusted to NOT
> >break builds with 2023.04 U-boot...
> >
> >Similar to beagleplay and beaglebone-ai64 changes here:
> >https://patchwork.yoctoproject.org/project/ti/patch/20240613172254.770920-3-denis@denix.org/
> 
> 
> 
> Thanks Denys for the catch! I will send out a new patch on top of
> meta-ti "-next" branch to handle 2023.04 U-boot.
> FYI, we can't handle u-boot-ti-mainline which is on 2024.01 [1], as
> it doesn't seem to have a fragment
> similar to 2023.04 U-boot nor it has the latest am62xsip*
> def-configs [2]. Hence, I will send out
> a patch only to support ti-u-boot-2023.04

Ok, I see you covered the mainline question in this thread - please ignore my 
question for the patch I just sent earlier.


> [1]: https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb#n16
> 
> [2]: https://source.denx.de/u-boot/u-boot/-/tree/866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e/configs
> 
> 
> 
> >
> >
> >>Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >>---
> >>  meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 7 +------
> >>  meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 +-
> >>  2 files changed, 2 insertions(+), 7 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> >>index 0daff2b9..c35edc6e 100644
> >>--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> >>+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> >>@@ -8,9 +8,4 @@ SYSFW_SOC = "am62x"
> >>  SYSFW_CONFIG = "evm"
> >>  SYSFW_SUFFIX = "hs-fs"
> >>-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> >>-
> >>-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
> >>-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
> >>-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> >>-UBOOT_CONFIG_FRAGMENTS = "am62xsip_sk_r5.config"
> >>+UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
> >>diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> >>index b5dd18f1..38fe04c9 100644
> >>--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> >>@@ -13,4 +13,4 @@ KERNEL_DEVICETREE = " \
> >>      ti/k3-am625-sk.dtb \
> >>  "
> >>-UBOOT_MACHINE = "am62x_evm_a53_defconfig"
> >>+UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
> >>-- 
> >>2.34.1

