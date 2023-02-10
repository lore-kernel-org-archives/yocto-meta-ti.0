Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4BDC636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 20:16:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4947.1676060180385592879
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 12:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 431EB40C1E;
	Fri, 10 Feb 2023 20:16:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZLHoM3rd4kS; Fri, 10 Feb 2023 20:16:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ECBE640BA8;
	Fri, 10 Feb 2023 20:16:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C0195163758; Fri, 10 Feb 2023 15:15:49 -0500 (EST)
Date: Fri, 10 Feb 2023 15:15:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] am62xx-lp-evm: Add AM62x LP HS-FS
 evm configuration
Message-ID: <20230210201549.GA22689@denix.org>
References: <20230210125615.2607653-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210125615.2607653-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 20:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15802

I see all 3 patches are trying to add the same new multiconfig file:
>  create mode 100644 conf/multiconfig/k3r5-hs-fs.conf

AM62A:
https://patchwork.yoctoproject.org/project/ti/patch/20230210000834.24783-1-s-adivi@ti.com/

AM62:
https://patchwork.yoctoproject.org/project/ti/patch/20230210124534.2607360-1-c-shilwant@ti.com/

AM62 LP:
https://patchwork.yoctoproject.org/project/ti/patch/20230210124534.2607360-1-c-shilwant@ti.com/

This would cause a conflict and extra work for maintainer...


On Fri, Feb 10, 2023 at 06:26:15PM +0530, Chirag Shilwant wrote:
> Lets add the basic AM62x LP HS-FS configuration
> - Add machine conf for AM62x LP HS-FS.
> - The wic images will boot on AM62x LP HS-FS devices by default. The sysfw image for HS-SE will be packaged in the wic image as tiboot3-am62x-hs-evm.bin.
> - Add ti-sci-firmware overrides.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf | 14 ++++++++++++++
>  conf/machine/am62xx-lp-evm-k3r5-hs-se.conf |  7 +++++++
>  conf/machine/include/am62xx-lp.inc         |  8 +++++++-
>  conf/multiconfig/k3r5-hs-fs.conf           |  3 +++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb     |  1 +
>  5 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
>  create mode 100644 conf/multiconfig/k3r5-hs-fs.conf
> 
> diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf b/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
> new file mode 100644
> index 00000000..0178fcfc
> --- /dev/null
> +++ b/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: AM62xx LPSK HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-FS EVM (R5F core)
> +
> +# Booting HS-FS requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-hs-fs"
> +
> +SYSFW_SOC = "am62x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
> index b752ee7e..37e9760a 100644
> --- a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
> +++ b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
> @@ -11,4 +11,11 @@ SYSFW_SOC = "am62x"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "hs"
>  
> +SYSFW_TIBOOT3_SYMLINK = ""
> +
>  UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> + 
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/include/am62xx-lp.inc b/conf/machine/include/am62xx-lp.inc
> index c38de868..02937662 100644
> --- a/conf/machine/include/am62xx-lp.inc
> +++ b/conf/machine/include/am62xx-lp.inc
> @@ -8,8 +8,14 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
>  TFA_K3_SYSTEM_SUSPEND = "1"
>  
> -# Default tiboot3.bin on AM62x LP is for HS-SE
> +# Default tiboot3.bin on AM62x LP is for HS-FS
> +BBMULTICONFIG = "k3r5-hs-fs"
> +do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for HS-SE
>  BBMULTICONFIG += "k3r5-hs-se"
> +IMAGE_BOOT_FILES += " tiboot3-am62x-hs-evm.bin"
>  do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>  
> diff --git a/conf/multiconfig/k3r5-hs-fs.conf b/conf/multiconfig/k3r5-hs-fs.conf
> new file mode 100644
> index 00000000..c6d58ead
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-hs-fs.conf
> @@ -0,0 +1,3 @@
> +require k3r5.conf
> +
> +MACHINE_append = "-hs-fs"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 7896c366..24af66a2 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -41,6 +41,7 @@ SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
>  SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
>  SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
>  SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
> +SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-fs = "fs"
>  SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
>  
>  SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
> -- 
> 2.34.1
> 

