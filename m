Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1744C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 18:45:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.69972.1753987543973102868
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 11:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3716B40AE9;
	Thu, 31 Jul 2025 18:45:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbDhcCGQ41yc; Thu, 31 Jul 2025 18:45:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD1F540A3D;
	Thu, 31 Jul 2025 18:45:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0151816D7A8; Thu, 31 Jul 2025 14:45:34 -0400 (EDT)
Date: Thu, 31 Jul 2025 14:45:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-padhi@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, a-limaye@ti.com, afd@ti.com,
	u-kumar1@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH v3] ti-pka-fw: Add a recipe
 to package prebuilt PKA firmware
Message-ID: <20250731184534.GQ24899@denix.org>
References: <20250731021744.1256347-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731021744.1256347-1-b-padhi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 31 Jul 2025 18:45:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18860

On Thu, Jul 31, 2025 at 07:47:44AM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
> Add a recipe to install the PKA firmware in root filesystem needed by
> sa2_ul driver for PKA operations across all K3 platforms.

So, I see that this firmware is still in the "ti-linux-firmware-next" branch 
and haven't been merged to the main "ti-linux-firmware" branch. Since Ryan 
merged this to "master-wip" of meta-ti, it now breaks my builds...

Also, see below for more comments.


> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v3: Changelog:
> 1. Add '&' in Licence instead of '|'.
> 2. Remove alternatives, directly install firmware in /lib/firmware
> 
> Link to v2:
> https://lore.kernel.org/all/20250730180302.7507-1-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Use MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS to package PKA firmware from
> within meta-ti itself.
> 2. Update LICENCE name and LIC_FILES_CHKSUM to appropriate licence from
> ti-linux-firmware.
> 
> Link to v1:
> https://lore.kernel.org/all/20250730074831.2640806-1-b-padhi@ti.com/
> 
>  meta-ti-bsp/conf/machine/include/k3.inc       |  1 +
>  .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>  .../recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb    | 23 +++++++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 7ec6b51e..fdcf193d 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -40,6 +40,7 @@ UBI_VOLNAME = "rootfs"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
>  MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
>  
>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 863d1a7e..7fe2c592 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -18,6 +18,7 @@ TI_DM_FW_VERSION = "11.01.09"
>  TI_SYSFW_VERSION = "11.01.05"
>  TI_HSM_DEMO_FW_VERSION = "11.00.09"
>  TAD5212_FW_VERSION = "1.0.0.0"
> +TI_PKA_FW_VERSION = "2.1.0"
>  
>  TI_LINUX_FW_SRCREV ?= "f59a711599249ecac75fea38b7a15ef9137d650d"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> new file mode 100644
> index 00000000..49ae0251
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "PKA prebuilt binary firmware image"
> +
> +LICENSE = "TI-TFL & INSIDE Secure"

1. No spaces in the license name allowed. Normally dash "-" is used instead.

2. For every license listed in the LICENSE variable, there should be a 
corresponding file of the same name in one of the LICENSE_PATH. All common 
licenses are provided by OE-Core:
https://git.openembedded.org/openembedded-core/tree/meta/files/common-licenses
But any vendor-specific licenses should be provided by a corresponding layer. 
And meta-ti provides such licenses here:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/licenses

So, if you need to refer "INSIDE-Secure" license, you should add a 
corresponding file with the license text in meta-ti-bsp/licenses.



> +LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
> +
> +COMPATIBLE_MACHINE = "k3"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${TI_PKA_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +PKA_FW_DIR = "ti-pka"
> +
> +INSTALL_PKA_FW_DIR = "${nonarch_base_libdir}/firmware"
> +
> +PKA_FW_NAME = "eip29t2_2.1.0.bin"
> +
> +do_install() {
> +    # Install Firmware
> +    install -d ${D}${INSTALL_PKA_FW_DIR}
> +    install -m 0644 ${S}/${PKA_FW_DIR}/${PKA_FW_NAME} ${D}/${INSTALL_PKA_FW_DIR}/${PKA_FW_NAME}
> +}
> -- 
> 2.34.1

