Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0547C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:42:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.939.1751056914130089525
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C7D040CBF;
	Fri, 27 Jun 2025 20:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCGe0WXCVK-X; Fri, 27 Jun 2025 20:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2B2E40C37;
	Fri, 27 Jun 2025 20:41:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 140EE16ADC6; Fri, 27 Jun 2025 16:41:49 -0400 (EDT)
Date: Fri, 27 Jun 2025 16:41:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/3] meta-ti: Remove
 bsp-ti-6_1 and bsp-bb_org-6_1 support
Message-ID: <20250627204149.GK18383@denix.org>
References: <20250627192454.575458-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627192454.575458-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18722

On Fri, Jun 27, 2025 at 02:24:52PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Remove support for the v6.1 TI and Beagle BSPs. This was originally
> split into meta-ti-bsp and meta-beagle changes, but there are some
> hidden interdependencies that made that more painful than needed.
> Remove v6.1 support from both BSP layers here.
> 
> This includes packages specific to those BSPs:
>  - TI and BB.org v6.1 Linux kernel
>  - TI and BB.org 2023.04 U-Boot
>  - Rogue GPU driver 23.3 and Mesa 22.3.5
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

[snip]

> diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
> index c7d72590..3da6e878 100644
> --- a/meta-beagle/conf/machine/beaglebone-ai64.conf
> +++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
> @@ -12,12 +12,6 @@ IMAGE_SR2_HS_SE_FILES = ""
>  
>  UBOOT_MACHINE = "j721e_beagleboneai64_a72_defconfig"
>  
> -UBOOT_MACHINE:bsp-ti-6_1 = "j721e_evm_a72_config"
> -UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
> -
> -UBOOT_MACHINE:bsp-bb_org-6_1 = "j721e_evm_a72_config"
> -UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "j721e_beagleboneai64_a72.config"
> -
>  SPL_BINARY = "tispl.bin_unsigned"
>  
>  KERNEL_DEVICETREE_PREFIX = " \
> @@ -32,23 +26,4 @@ ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
>  ti/k3-j721e-sk.dtb \
>  "
>  
> -KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
> -ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
> -ti/k3-j721e-common-proc-board-infotainment.dtbo \
> -ti/k3-j721e-evm-csi2-ov5640.dtbo \
> -ti/k3-j721e-evm-fusion.dtbo \
> -ti/k3-j721e-evm-pcie0-ep.dtbo \
> -ti/k3-j721e-evm-virt-mac-client.dtbo \
> -ti/k3-j721e-sk-csi2-ov5640.dtbo \
> -ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
> -ti/k3-j721e-sk-fusion.dtbo \
> -ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
> -"
> -
>  MACHINE_GUI_CLASS = "bigscreen"
> -
> -# TI has moved a driver out of its kernel tree and into an out of tree module.
> -# We need to not include that for older kernels since the module is still in
> -# the kernel.
> -TI_VXE_VXD_DRIVER:bsp-bb_org-6_6 = ""
> -TI_VXE_VXD_DRIVER:bsp-bb_org-6_1 = ""

Looks like 6.6 override here got removed by accident along with 6.1


[snip]


> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 30aa2a69..5833c322 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -38,6 +38,5 @@ OPTEEMACHINE = "k3-j721e"
>  
>  TI_VXE_VXD_DRIVER = "ti-vxe-vxd-driver"
>  TI_VXE_VXD_DRIVER:bsp-ti-6_6 = ""
> -TI_VXE_VXD_DRIVER:bsp-ti-6_1 = ""

Here, the change is limited to 6.1 only, keeping 6.6

-- 
Denys

