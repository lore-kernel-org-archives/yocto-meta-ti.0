Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C315C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 21:02:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3508.1654290156872014024
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jun 2022 14:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F295840D25;
	Fri,  3 Jun 2022 21:02:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZlHRQJeaZTH; Fri,  3 Jun 2022 21:02:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8FE640D22;
	Fri,  3 Jun 2022 21:02:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 98EDD17495D; Fri,  3 Jun 2022 17:02:32 -0400 (EDT)
Date: Fri, 3 Jun 2022 17:02:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 2/2] conf: machine: Make
 multi-certificate image the default
Message-ID: <20220603210229.GO9834@denix.org>
References: <20220602202448.18068-1-afd@ti.com>
 <20220602202448.18068-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602202448.18068-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Jun 2022 21:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14781

On Thu, Jun 02, 2022 at 03:24:48PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Only the first two K3 devices do not support multi-cert boot so
> lets make multi-cert the default and only add back sysfw.itb
> for these two devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  conf/machine/include/am62xx.inc | 3 ---
>  conf/machine/include/am64xx.inc | 3 ---
>  conf/machine/include/am65xx.inc | 5 ++++-
>  conf/machine/include/j7.inc     | 2 --
>  conf/machine/include/k3.inc     | 5 +----
>  conf/machine/j7-evm.conf        | 3 +++
>  conf/machine/j7-hs-evm.conf     | 1 -
>  conf/machine/j7200-evm.conf     | 3 ---
>  conf/machine/j721s2-evm.conf    | 3 ---
>  9 files changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
> index ff857b97..7c902724 100644
> --- a/conf/machine/include/am62xx.inc
> +++ b/conf/machine/include/am62xx.inc
> @@ -8,9 +8,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
>  TFA_K3_SYSTEM_SUSPEND = "1"
>  
> -# AM62 supports multi-certificate images, use the same
> -IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 7646c70a..bc5b085c 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -13,9 +13,6 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm-nand.dtbo \
>  "
>  
> -# AM64 supports multi-certificate images, use the same
> -IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  
> diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
> index 1898f19c..b70d212f 100644
> --- a/conf/machine/include/am65xx.inc
> +++ b/conf/machine/include/am65xx.inc
> @@ -22,9 +22,12 @@ KERNEL_DEVICETREE = " \
>  
>  BBMULTICONFIG += "k3r5-sr2"
>  
> -# Use default IMAGE_BOOT_FILES_LEGACY files
> +# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
> +IMAGE_BOOT_FILES += "sysfw.itb"
> +
>  # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
>  IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
> +
>  do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>  
> diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
> index d3eda1a8..c187f299 100644
> --- a/conf/machine/include/j7.inc
> +++ b/conf/machine/include/j7.inc
> @@ -4,8 +4,6 @@ SOC_FAMILY_append = ":j7"
>  OPTEEMACHINE = "k3-j721e"
>  OPTEEOUTPUTMACHINE = "k3"
>  
> -# Use default IMAGE_BOOT_FILES_LEGACY files
> -
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "j721e j7200"
>  TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index f85e6b98..24741dee 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -41,10 +41,7 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  
> -IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
> -IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
> -
> -IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
> +IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>  
>  WKS_FILE ?= "sdimage-2part.wks"
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> index 1f47f00c..514695d6 100644
> --- a/conf/machine/j7-evm.conf
> +++ b/conf/machine/j7-evm.conf
> @@ -9,6 +9,9 @@ MACHINE_FEATURES += "gpu"
>  SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
> +# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
> +IMAGE_BOOT_FILES += "sysfw.itb"
> +
>  KERNEL_DEVICETREE = " \
>      ti/k3-j721e-common-proc-board.dtb \
>      ti/k3-j721e-proc-board-tps65917.dtb \
> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
> index 629a5ccd..9b95ce7a 100644
> --- a/conf/machine/j7-hs-evm.conf
> +++ b/conf/machine/j7-hs-evm.conf
> @@ -19,7 +19,6 @@ UBOOT_IMAGE = "u-boot.img_HS"
>  
>  BBMULTICONFIG += "k3r5-sr1-1"
>  
> -# Use default IMAGE_BOOT_FILES_LEGACY files
>  # Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
>  IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
>  do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
> index 2565c90c..c8a03a7b 100644
> --- a/conf/machine/j7200-evm.conf
> +++ b/conf/machine/j7200-evm.conf
> @@ -13,8 +13,5 @@ KERNEL_DEVICETREE = " \
>  
>  UBOOT_MACHINE = "j7200_evm_a72_config"
>  
> -# J7200 supports multi-certificate images, use the same
> -IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index e5ed0b73..a8898f12 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -17,8 +17,5 @@ KERNEL_DEVICETREE = " \
>  
>  UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>  
> -# J721S2 supports multi-certificate images, use the same
> -IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -- 
> 2.36.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14778): https://lists.yoctoproject.org/g/meta-ti/message/14778
> Mute This Topic: https://lists.yoctoproject.org/mt/91508259/3617104
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [denis@denix.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

