Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1360.1637265921890976421
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 12:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D806D40C3A;
	Thu, 18 Nov 2021 20:05:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYkmfEu1uzZc; Thu, 18 Nov 2021 20:05:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B417340ACD;
	Thu, 18 Nov 2021 20:05:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 78C851746CE; Thu, 18 Nov 2021 15:05:17 -0500 (EST)
Date: Thu, 18 Nov 2021 15:05:17 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v4] vxd-dec-fw: Add the recipe for vxd-dec-fw
Message-ID: <20211118200517.GH18191@denix.org>
References: <20211118195750.4658-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211118195750.4658-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 18, 2021 at 07:57:50PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Add the firmware packaging recipe for the video decoder
> for j721e.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
> 
> resend v3 as v4
> 
> Changes from v2:
> 1) Fixed the summary
> 2) Bumped the ti-linux-fw to pick the video decoder binary
> 3) Added the kernel dependency to build this recipe
> 
>  .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++++++++++++++
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  5 ++--
>  recipes-kernel/linux/kernel-rdepends.inc      |  3 +++
>  3 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> new file mode 100644
> index 00000000..cccda6bb
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Video Decoding Firmware"
> +LICENSE = "TI-IMG"

And meta-ti does not define such license:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/licenses


> +LIC_FILES_CHKSUM = "file://LICENSE.ti-img;md5=84ca7278930db001870686ad997d6bb1"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${IMG_DEC_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +CLEANBROKEN = "1"
> +
> +COMPATIBLE_MACHINE = "j7"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +TARGET = "pvdec_full_bin.fw"
> +
> +do_install() {
> +        install -d ${D}${base_libdir}/firmware/ti-img
> +        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmware/ti-img/${TARGET}
> +}
> +
> +FILES_${PN} = "${base_libdir}/firmware"
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index c59120b8..f6d5b8d1 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -13,11 +13,12 @@ NETCP_SA_FW_VERSION = "1.0.0"
>  NETCP_PA_FW_VERSION = "3.0.2.3"
>  QMSS_PDSP_FW_VERSION = "1.0.0.9"
>  PRUETH_FW_AM65X_VERSION = "08.00.00.20"
> -PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
> +PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.07"
>  GOODIX_FW_VERSION = "1.0.0.0"
>  CADENCE_MHDP_FW_VERSION = "1.2.17"
> +IMG_DEC_FW_VERSION = "1.0"
>  
> -TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
> +TI_LINUX_FW_SRCREV ?= "c96a734a059889e571dcf30c0638157c690a6e6e"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
>  
>  BRANCH ?= "ti-linux-firmware"
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 5e5241c9..76b7a508 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -39,3 +39,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
>  
>  # Add run-time dependency for Cadence MHDP firmware to the rootfs
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
> +
> +# Add run-time dependency for Video Decoding firmware to the rootfs
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
> -- 
> 2.17.1
> 
