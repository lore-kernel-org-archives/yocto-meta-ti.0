Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.210.1637204210440341415
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 18:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 723E140C30;
	Thu, 18 Nov 2021 02:56:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nr5vqh62dYct; Thu, 18 Nov 2021 02:56:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4077640ACD;
	Thu, 18 Nov 2021 02:56:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 00C241746CF; Wed, 17 Nov 2021 21:56:43 -0500 (EST)
Date: Wed, 17 Nov 2021 21:56:43 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org, prashanth.ka@pathpartnertech.com
Subject: Re: [dunfell/master PATCHv2] vxd-dec-fw: Add the recipe for vxd-dec-fw
Message-ID: <20211118025643.GA18191@denix.org>
References: <20211118003005.25238-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211118003005.25238-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 17, 2021 at 06:30:05PM -0600, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Add the firmware packaging recipe for the video decoder
> for j721e.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
> Changes in v2: Update subject dunfell/master
> 
>  .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++++++++++++++
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> new file mode 100644
> index 00000000..55673b53
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Video Decoding Firmware Packaging recipe"

Well, the SUMMARY and the DESCRIPTION are for the resulting ipk/deb/rpm 
package, not the recipe.

E.g. on Ubuntu - the last 2 lines are the SUMMARY and DESCRIPTION accordingly:

$ dpkg -s linux-firmware
Package: linux-firmware
Status: install ok installed
Priority: optional
Section: misc
Installed-Size: 233791
Maintainer: Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>
Architecture: all
Multi-Arch: foreign
Version: 1.157.23
Replaces: atmel-firmware, linux-firmware-snapdragon (<= 1.2-0ubuntu1), linux-restricted-common
Provides: atmel-firmware
Breaks: linux-firmware-snapdragon (<= 1.2-0ubuntu1)
Conflicts: atmel-firmware
Description: Firmware for Linux kernel drivers
 This package provides firmware used by Linux kernel drivers.



> +LICENSE = "TI-IMG"
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
> index c59120b8..ebf133be 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -16,6 +16,7 @@ PRUETH_FW_AM65X_VERSION = "08.00.00.20"
>  PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
>  GOODIX_FW_VERSION = "1.0.0.0"
>  CADENCE_MHDP_FW_VERSION = "1.2.17"
> +IMG_DEC_FW_VERSION = "1.0"
>  
>  TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
