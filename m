Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ACAC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 19:45:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1981.1748547944390973770
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 May 2025 12:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 362C440C79;
	Thu, 29 May 2025 19:45:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvIBs_9Wixz2; Thu, 29 May 2025 19:45:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1F8040BEC;
	Thu, 29 May 2025 19:45:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3C813169573; Thu, 29 May 2025 15:45:38 -0400 (EDT)
Date: Thu, 29 May 2025 15:45:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: lcpdbld@list.ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger:
 cicd.scarthgap.202505230901
Message-ID: <20250529194538.GV18383@denix.org>
References: <20250523190054.691771-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523190054.691771-1-lcpdbld@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 May 2025 19:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18611

Apparently, this went unnoticed, as nobody usually reviews CI/CD updates...


On Fri, May 23, 2025 at 02:00:54PM -0500, LCPD Automation Script via lists.yoctoproject.org wrote:
> Updated the value(s) for:
>   cnm-wave-fw: LIC_FILES_CHKSUM
>   ti-linux-fw: CNM_WAVE521_FW_VERSION,TI_LINUX_FW_SRCREV
>   u-boot-ti-staging_2025.01: SRCREV
>   k3conf: SRCREV
>   linux-ti-staging_6.12: PV,SRCREV
> 
> Changelogs:
>   ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=bffa52a1b8d3318ec86814047025e7c5edf7b7b0..d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7
>   u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=98b6b3f5a259be864e8db92f4925c3c19c3482a4..3d024809613c2a8f1d69258554ab8954d26537f5
>   k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=e4a814ff42ef357ee453b6f2f809ecdfa624aa8c..ea9938bf9cafd9c0cb05ef060a713ab4ac72270f
>   linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=013211ccdf5ec33e19652be631b820bc5f6b86a4..d95b7f80f66d104525e6beb002d82a9505b28131
> 
> Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb      | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
>  meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 43624183..6a65992f 100644
> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -5,7 +5,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  inherit update-alternatives
>  
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
> +LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36"

What are the actual changes in the license that caused the checksum update?

Did the license change from BSD-3-Clause to something else? Was the package 
re-licensed under something else, say more restrictive, or even commercial?

Sure, I'm imagining a worst-case scenario, but the whole purpose of this 
LIC_FILES_CHKSUM variable is to catch such cases. So, whenever it changes, 
there should be an explanation in the commit message detailing the reason 
for the license checksum change.

Moreover, in master there's now a mandatory tag required to explain such a 
change:
https://docs.yoctoproject.org/next/contributor-guide/recipe-style-guide.html#license-updates

In OE-Core this gets checked by test_lic_files_chksum_modified_not_mentioned 
Patchtest case and the patch gets automatically rejected w/o this tag:
https://wiki.yoctoproject.org/wiki/Patchtest

I would argue that CI/CD should not even try to modify LIC_FILES_CHKSUM 
variable in automated fashion - this was designed to be consciously updated 
by a human...


>  PV = "${CNM_WAVE521_FW_VERSION}"
>  PR = "${INC_PR}.1"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 925f81fe..adc7afa1 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -13,12 +13,12 @@ PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.04"
>  GOODIX_FW_VERSION = "1.0.0.0"
>  CADENCE_MHDP_FW_VERSION = "2.1.0"
>  IMG_DEC_FW_VERSION = "1.0"
> -CNM_WAVE521_FW_VERSION = "1.0.7"
> +CNM_WAVE521_FW_VERSION = "1.0.8"
>  TI_DM_FW_VERSION = "11.00.09"
>  TI_SYSFW_VERSION = "11.00.07"
>  TI_HSM_DEMO_FW_VERSION = "11.00.09"
>  
> -TI_LINUX_FW_SRCREV ?= "bffa52a1b8d3318ec86814047025e7c5edf7b7b0"
> +TI_LINUX_FW_SRCREV ?= "d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
>  
>  BRANCH ?= "ti-linux-firmware"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> index fb5dfa73..99a2c8fc 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> @@ -6,4 +6,4 @@ PR = "r0"
>  
>  BRANCH = "ti-u-boot-2025.01"
>  
> -SRCREV = "98b6b3f5a259be864e8db92f4925c3c19c3482a4"
> +SRCREV = "3d024809613c2a8f1d69258554ab8954d26537f5"
> diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> index 8e83a1aa..8691e523 100644
> --- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> @@ -10,7 +10,7 @@ PV = "0.3+git"
>  COMPATIBLE_MACHINE = "k3"
>  
>  BRANCH ?= "master"
> -SRCREV = "e4a814ff42ef357ee453b6f2f809ecdfa624aa8c"
> +SRCREV = "ea9938bf9cafd9c0cb05ef060a713ab4ac72270f"
>  
>  SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
>  
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> index 535a96f8..f399c207 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> @@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH ?= "ti-linux-6.12.y"
>  
> -SRCREV ?= "013211ccdf5ec33e19652be631b820bc5f6b86a4"
> -PV = "6.12.23+git"
> +SRCREV ?= "d95b7f80f66d104525e6beb002d82a9505b28131"
> +PV = "6.12.24+git"
>  
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
> -- 
> 2.43.5

