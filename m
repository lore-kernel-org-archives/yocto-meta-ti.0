Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC5BC7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 19:39:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24391.1681241972406873307
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 12:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BED6740C90;
	Tue, 11 Apr 2023 19:39:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXaqr3OM_mRO; Tue, 11 Apr 2023 19:39:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9906140C13;
	Tue, 11 Apr 2023 19:39:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D005C1637FE; Tue, 11 Apr 2023 15:38:51 -0400 (EDT)
Date: Tue, 11 Apr 2023 15:38:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 1/5] linux-ti-mainline:
 Use upstream configs with upstream kernel
Message-ID: <20230411193851.GW9226@denix.org>
References: <20230411174037.32244-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411174037.32244-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 19:39:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16354

On Tue, Apr 11, 2023 at 12:40:33PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Mainline should test the mainline kernel as it is, not with out-of-tree
> changes like to the default configuration that one would get when using
> a stock distro. Use only upstream configuration.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../recipes-kernel/linux/linux-ti-mainline/defconfig      | 1 -
>  .../linux/linux-ti-mainline/dra7xx/defconfig              | 1 -
>  .../recipes-kernel/linux/linux-ti-mainline/k3/defconfig   | 1 -
>  .../linux/linux-ti-mainline/omapl138/defconfig            | 1 -
>  .../linux/linux-ti-mainline/ti33x/defconfig               | 1 -
>  .../linux/linux-ti-mainline/ti43x/defconfig               | 1 -
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 8 +++++---
>  7 files changed, 5 insertions(+), 9 deletions(-)
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
> deleted file mode 100644
> index d083d182..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_omap2_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
> deleted file mode 100644
> index dcb53bab..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_dra7x_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
> deleted file mode 100644
> index b9bc6137..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_arm64_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
> deleted file mode 100644
> index b3467853..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_omapl138_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
> deleted file mode 100644
> index 88f80fa9..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am3x_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
> deleted file mode 100644
> index 4b9daaf9..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
> +++ /dev/null
> @@ -1 +0,0 @@
> -use-tisdk-config=ti_sdk_am4x_release
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index be278d73..7d948a85 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  
>  inherit kernel
>  
> -DEFCONFIG_BUILDER = "${S}/ti-upstream-tools/config/defconfig_builder.sh"
> -require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/kernel-rdepends.inc
>  require recipes-kernel/linux/ti-kernel.inc
>  
> @@ -33,12 +31,16 @@ KERNEL_GIT_PROTOCOL = "https"
>  SRC_URI += " \
>      ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
>      git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=git/ti-upstream-tools \
> -    file://defconfig \
>  "
>  
>  SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
>  SRCREV_FORMAT = "linux"
>  
> +DEFCONFIG_NAME = "multi_v7_defconfig"
> +DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
> +DEFCONFIG_NAME:k3 = "defconfig"
> +KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
> +
>  kernel_do_compile:append() {
>  	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>  	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> -- 
> 2.39.2

