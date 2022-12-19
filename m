Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D46C4167B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 20:37:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.33487.1671482265285032935
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Dec 2022 12:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4787540C5D;
	Mon, 19 Dec 2022 20:37:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lE51WXADYawh; Mon, 19 Dec 2022 20:37:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 18CDB40031;
	Mon, 19 Dec 2022 20:37:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B4ECB1636B0; Mon, 19 Dec 2022 15:37:30 -0500 (EST)
Date: Mon, 19 Dec 2022 15:37:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-ti-next: Add filtering for
 dtb/dtbo to include
Message-ID: <20221219203730.GS22689@denix.org>
References: <20221215153800.14380-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215153800.14380-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 Dec 2022 20:37:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15488

On Thu, Dec 15, 2022 at 09:38:00AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add support for a new variable DEVICETREE_PATTERN that we
> can set in each machine config that will let us choose
> which dtb/dtbo files to include rather than picking
> them all.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/am62xx-evm.conf        |  2 ++
>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf     |  2 ++
>  meta-ti-bsp/conf/machine/beagle-x15.conf        |  2 ++
>  meta-ti-bsp/conf/machine/beaglebone.conf        |  2 ++
>  meta-ti-bsp/conf/machine/include/am64xx.inc     |  2 ++
>  meta-ti-bsp/conf/machine/include/am65xx.inc     |  2 ++
>  meta-ti-bsp/conf/machine/include/ti33x.inc      |  2 ++
>  meta-ti-bsp/conf/machine/j7200-evm.conf         |  2 ++
>  meta-ti-bsp/conf/machine/j721e-evm.conf         |  2 ++
>  meta-ti-bsp/conf/machine/j721s2-evm.conf        |  2 ++
>  meta-ti-bsp/conf/machine/j784s4-evm.conf        |  2 ++
>  .../recipes-kernel/linux/linux-ti-next_git.bb   | 17 +++++++++++------
>  12 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index 73859d5f..97927b48 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -11,4 +11,6 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am625-sk-csi2-ov5640.dtbo \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-am625-*"
> +
>  UBOOT_MACHINE = "am62x_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index ef8e8692..a29e1407 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -13,4 +13,6 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am625-sk-csi2-ov5640.dtbo \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-am62*"
> +
>  UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> index c7503266..14467f24 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -6,6 +6,8 @@ require conf/machine/include/dra7xx.inc
>  
>  KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
>  
> +DEVICETREE_PATTERN = "am57xx-beagle-*"
> +
>  MACHINE_GUI_CLASS = "bigscreen"
>  
>  SERIAL_CONSOLES = "115200;ttyS2"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
> index 413a960d..76035a4b 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> @@ -8,6 +8,8 @@ KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
>                      am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
>                      am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
>  
> +DEVICETREE_PATTERN = "am335x-*"
> +
>  MACHINE_GUI_CLASS = "bigscreen"
>  MACHINE_FEATURES += "screen"
>  
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 2fca1ac0..62c01347 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -14,6 +14,8 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm-nand.dtbo \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-am642-*"
> +
>  # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
>  BBMULTICONFIG = "k3r5-sr2-hs-fs"
>  do_image[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index ef31ea52..5bb84de5 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -26,6 +26,8 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am654-evm-ov5640.dtbo \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-am654-*"
> +
>  BBMULTICONFIG += "k3r5-sr2"
>  
>  # Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index d9381555..a327d29e 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -30,6 +30,8 @@ KERNEL_DEVICETREE = " \
>  
>  KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
>  
> +DEVICETREE_PATTERN = "am335x-*"
> +
>  UBOOT_ARCH = "arm"
>  UBOOT_MACHINE = "am335x_evm_config"
>  
> diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
> index 077d2f41..fdffd7a8 100644
> --- a/meta-ti-bsp/conf/machine/j7200-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
> @@ -11,6 +11,8 @@ KERNEL_DEVICETREE = " \
>      ti/k3-j7200-common-proc-board.dtb \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-j7200-*"
> +
>  UBOOT_MACHINE = "j7200_evm_a72_config"
>  
>  do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
> index d28d16d1..9a22cba9 100644
> --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
> @@ -16,4 +16,6 @@ KERNEL_DEVICETREE = " \
>      ti/k3-j721e-sk.dtb \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-j721e-*"
> +
>  UBOOT_MACHINE = "j721e_evm_a72_config"
> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> index d02c8258..bd99728c 100644
> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> @@ -15,6 +15,8 @@ KERNEL_DEVICETREE = " \
>      ti/k3-j721s2-gesi-exp-board.dtbo \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-j721s2-*"
> +
>  UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>  
>  do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> index f88006c3..a27c82ec 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -16,6 +16,8 @@ KERNEL_DEVICETREE = " \
>      ti/k3-j784s4-evm.dtb \
>  "
>  
> +DEVICETREE_PATTERN = "ti/k3-j784s4-*"
> +
>  UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
>  
>  do_image[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> index e2908951..6eb75673 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> @@ -19,21 +19,26 @@ PV = "6.1.0-rc1+git${SRCPV}"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
>  
> -def list_dtbs(dts_dir, dts_subdir):
> +def list_dtbs(dts_dir, dts_subdir, dts_pattern):
>      import os
>      import fnmatch
> -    matches = []
> +    all_matches = []
> +    final_matches = []
>  
>      for root,dirnames,filenames in os.walk(os.path.join(dts_dir, dts_subdir)):
>          for filename in fnmatch.filter(filenames, '*.dtb'):
> -            matches.append(os.path.join(dts_subdir, filename))
> +            all_matches.append(os.path.join(dts_subdir, filename))
>          for filename in fnmatch.filter(filenames, '*.dtbo'):
> -            matches.append(os.path.join(dts_subdir, filename))
> -    return ' '.join(matches)
> +            all_matches.append(os.path.join(dts_subdir, filename))
> +    for filename in fnmatch.filter(all_matches, dts_pattern):
> +        final_matches.append(filename)
> +    return ' '.join(final_matches)

I feel like with this change DTS_SUBDIR is not being used optimally.

You could either:

1. simplify DEVICETREE_PATTERN to not have "ti/" subdir prefix and 
automatically add DTS_SUBDIR here in the code, but then it would be 
a bit inconsistent with the KERNEL_DEVICETREE in the machine configs

2. or completely eliminate DTS_SUBDIR and reverse the code above to first 
match against DEVICETREE_PATTERN and then further filter for *.dtb/*.dtbo


> +
> +DEVICETREE_PATTERN ?= "*"
>  
>  DTS_SUBDIR = ""
>  DTS_SUBDIR:k3 = "ti"
> -KERNEL_DEVICETREE = "${@list_dtbs('${B}/arch/${ARCH}/boot/dts', '${DTS_SUBDIR}')}"
> +KERNEL_DEVICETREE = "${@list_dtbs('${B}/arch/${ARCH}/boot/dts', '${DTS_SUBDIR}', '${DEVICETREE_PATTERN}')}"
>  DEFCONFIG_NAME = "multi_v7_defconfig"
>  DEFCONFIG_NAME:k3 = "defconfig"
>  KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
> -- 
> 2.17.1
> 

