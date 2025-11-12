Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADE0CD4843
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 20:29:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7524.1762979383240265685
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 12:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8EF9F40C8A;
	Wed, 12 Nov 2025 20:29:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZ3krJ7iQD3t; Wed, 12 Nov 2025 20:29:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5478A40800;
	Wed, 12 Nov 2025 20:29:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A7A91174F73; Wed, 12 Nov 2025 15:29:38 -0500 (EST)
Date: Wed, 12 Nov 2025 15:29:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, rs@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH v4] ti-img-rogue-*: Migrate GPU
 driver version 24.2 -> 25.2
Message-ID: <20251112202938.GX3125@denix.org>
References: <20251112202652.3718660-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112202652.3718660-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 20:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19261

Thanks, LGTM now.


On Wed, Nov 12, 2025 at 02:26:52PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> New recipes for GPU DDK 25.2. Update BSP configuration files with new
> preferred recipe versions.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v2:
> - Removed recipes for 24.2
> - Update ti/beagle bsp config files to build 25.2 for kenrel 6.6
>  
> v3:
> - Forgot to update commit message. DDK 24.2 recipes will no longer
>   be present. DDK 25.2 also supports Linux kernel 6.6
> 
> v4:
> - Remove explicitly setting of PR variable, as it defaults to 0
> - Fix spelling mistake (DSP & dsp -> BSP & bsp)  
> 
>  meta-beagle/conf/machine/include/beagle-bsp.inc               | 4 ++--
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 ++--
>  ...er_24.2.6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} | 2 +-
>  ...bs_24.2.6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} | 4 +---
>  4 files changed, 6 insertions(+), 8 deletions(-)
>  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.2.6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} (96%)
>  rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24.2.6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} (98%)
> 
> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
> index 448e2086..5060e286 100644
> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
> @@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
>  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
>  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 = "1.17%"
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "25%"
>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 = "24%"
>  
>  # GC320 support requires out-of-tree drivers not yet available in bb.org 6.12
> @@ -40,7 +40,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
>  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
>  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "25%"
>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
>  
>  # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index dc0473de..5dc2e19e 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
>  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-sgx-ddk-km"
>  BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 = "1.17%"
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "25%"
>  BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
>  
>  # ==========
> @@ -60,7 +60,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
>  BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "25%"
>  BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
>  
>  # GC320 support requires out-of-tree drivers not yet available in 6.6
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> similarity index 96%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> index 513429bd..0f50026a 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
> +SRCREV = "a838ac0074db640ebd1b64be6364417b1bbca3cd"
>  
>  TARGET_PRODUCT:j721e = "j721e_linux"
>  TARGET_PRODUCT:j721s2 = "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> similarity index 98%
> rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> index 57f48fec..38a8e68a 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> @@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de52
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
>  
> -PR = "r4"
> -
>  BRANCH = "linuxws/scarthgap/k6.12/${PV}"
>  SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "1ed9ee185cd876200e6747192854015b8e94a7b0"
> +SRCREV = "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
>  S = "${WORKDIR}/git"
>  
>  TARGET_PRODUCT:j721e = "j721e_linux"
> -- 
> 2.34.1

