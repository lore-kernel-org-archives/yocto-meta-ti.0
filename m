Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2241CE006AD
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 15:22:30 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI400HZ1RL2CLH0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Feb 2013 17:22:29 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2716B2008E; Tue,
	12 Feb 2013 18:22:14 -0500 (EST)
Date: Tue, 12 Feb 2013 18:22:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: fcooperjr27@gmail.com
Message-id: <20130212232214.GC1858@denix.org>
References: <1360631082-29015-1-git-send-email-fcooper@ti.com>
	<1360631082-29015-7-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1360631082-29015-7-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 7/7] u-boot_2012.04.01: Add latest u-boot recipe for am37x-evm
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 23:22:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 11, 2013 at 07:04:42PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> 
> diff --git a/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> new file mode 100644
> index 0000000..e193124
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> @@ -0,0 +1,50 @@
> +require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +
> +DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> +# Use the version of u-boot.inc in oe-core not the meta-ti version

This comment is out of place. I'll move it to the top of the recipe...

> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +COMPATIBLE_MACHINE = "am37x-evm|beagleboard"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +BRANCH ?= "master"
> +
> +SRCREV = "v2012.04.01"
> +
> +S = "${WORKDIR}/git"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
> +
> +# Add patches for the AMSDK
> +#  - 0001-omap3-beagle-add-usbethaddr....Not for Upstream
> +#  - 0001-OMAP3-Beagle-Set-BOOTDELAY....Pending Upstream
> +#  - 0002-am335x-am3517evm-beagleboard....Pending Upstream
> +#  - 0003-beagleboard-Load-uImage-from....Not for Upstream
> +#  - 0004-beagleboard-Load-uImage-to....Pending Upstream
> +#  - 0001-omap3_evm-Added-function....Pending Upstream
> +#  - 0002-omap3evm-Make-the-board....Pending Upstream
> +#  - 0003-beagleboard-Make-xM-rev....Pending Upstream
> +#  - 0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch....Upstreamed
> +
> +# Add a patch to set a default usbethaddr address to enable the out of box
> +# experience.
> +SRC_URI += "file://0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch \
> +            file://0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch \
> +            file://0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch \
> +            file://0003-beagleboard-Load-uImage-from-VFAT-by-default.patch \
> +            file://0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch \
> +            file://0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch \
> +            file://0002-omap3evm-Make-the-board-start-at-800MHz.patch \
> +            file://0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch \
> +            file://0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch \
> +            "
> +
> +UBOOT_SUFFIX = "img"
> +
> +# Set the name of the SPL that will built so that it is also packaged with u-boot.
> +SPL_BINARY = "MLO"
> -- 
> 1.7.0.4

