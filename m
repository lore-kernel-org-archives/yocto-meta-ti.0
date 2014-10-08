Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A846BE0077F; Wed,  8 Oct 2014 10:58:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12B44E006DB
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 10:58:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s98Hwchs001625
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 12:58:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98HwcA8012027
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 12:58:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 12:58:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98HwcJo026781;
	Wed, 8 Oct 2014 12:58:38 -0500
Date: Wed, 8 Oct 2014 13:58:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20141008175837.GR1731@edge>
References: <1412769980-3628-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412769980-3628-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [daisy][PATCH v3] ti-ipc: Upgrade to IPC 3.30.00.09
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
X-List-Received-Date: Wed, 08 Oct 2014 17:58:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Thanks, I pushed your patches.

What was the trick to resolve posting patches to the list - was it specifying 
smtp server?

Also, please check at the end of this patch for a small nitpick...

Thanks.

-- 
Denys


On Wed, Oct 08, 2014 at 08:06:20AM -0400, Jacob Stiffler wrote:
> * Added new recipe for latest IPC
> * Removed older recipe versions
> * Latest recipe points to IPC 3.30.00.09
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...nstallation-prefix-feature-to-products.ma.patch |   38 ------------------
>  recipes-ti/ipc/ti-ipc/ipc.pc                       |    8 ----
>  recipes-ti/ipc/ti-ipc_1.24.00.16.bb                |   41 --------------------
>  recipes-ti/ipc/ti-ipc_3.00.00.bb                   |    7 ----
>  recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |    4 --
>  recipes-ti/ipc/{ti-ipc.inc => ti-ipc_git.bb}       |   26 +++++++------
>  6 files changed, 15 insertions(+), 109 deletions(-)
>  delete mode 100644 recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
>  delete mode 100644 recipes-ti/ipc/ti-ipc/ipc.pc
>  delete mode 100644 recipes-ti/ipc/ti-ipc_1.24.00.16.bb
>  delete mode 100644 recipes-ti/ipc/ti-ipc_3.00.00.bb
>  delete mode 100644 recipes-ti/ipc/ti-ipc_3.21.00.07.bb
>  rename recipes-ti/ipc/{ti-ipc.inc => ti-ipc_git.bb} (75%)
> 
> diff --git a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch b/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
> deleted file mode 100644
> index 58d77c7..0000000
> --- a/recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 26d09063063593aec760151393226b96bc7ab9f8 Mon Sep 17 00:00:00 2001
> -From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> -Date: Thu, 5 Sep 2013 17:01:15 +0530
> -Subject: [PATCH] ipc: Added installation prefix feature to products.mak
> -
> -Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ----
> - ipc-linux.mak |    1 +
> - products.mak  |    1 +
> - 2 files changed, 2 insertions(+)
> -
> -diff --git a/ipc-linux.mak b/ipc-linux.mak
> -index 788a5a2..01579e4 100644
> ---- a/ipc-linux.mak
> -+++ b/ipc-linux.mak
> -@@ -38,6 +38,7 @@ include products.mak
> - config:
> - 	@echo "Configuring Linux Ipc ..."
> - 	./configure --host=$(TOOLCHAIN_LONGNAME) \
> -+            --prefix=$(PREFIX) \
> -             CC=$(TOOLCHAIN_PREFIX)gcc \
> -             PLATFORM=$(PLATFORM) \
> -             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
> -diff --git a/products.mak b/products.mak
> -index e418d2f..4578a1e 100644
> ---- a/products.mak
> -+++ b/products.mak
> -@@ -55,6 +55,7 @@ PLATFORM ?=
> - TOOLCHAIN_LONGNAME = arm-none-linux-gnueabi
> - TOOLCHAIN_INSTALL_DIR = $(DEPOT)/_your_arm_code_gen_install_
> - TOOLCHAIN_PREFIX = $(TOOLCHAIN_INSTALL_DIR)/bin/$(TOOLCHAIN_LONGNAME)-
> -+PREFIX = /usr/local
> - 
> - # Optional: Path to Linux Kernel - needed to build the MmRpc user libraries
> - # (for devices that support it)
> --- 
> -1.7.9.5
> -
> diff --git a/recipes-ti/ipc/ti-ipc/ipc.pc b/recipes-ti/ipc/ti-ipc/ipc.pc
> deleted file mode 100644
> index 1a8c52d..0000000
> --- a/recipes-ti/ipc/ti-ipc/ipc.pc
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -prefix=/../../ipc_@VERSION@
> -includedir=${prefix}/ti/ipc
> -
> -Name: TI IPC
> -Description: TI ARM-DSP IPC (Inter Processor Communication) 
> -Version: @VERSION@
> -Requires: 
> -Cflags: -I${includedir}
> diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> deleted file mode 100644
> index 420d0f7..0000000
> --- a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION = "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
> -HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/index.html"
> -SECTION = "devel"
> -LICENSE = "BSD" 
> -LIC_FILES_CHKSUM = "file://ipc_${PV}_manifest.html;md5=573f5a5c0448d28bf8db35f438244d7f"
> -
> -
> -require ../includes/ti-paths.inc
> -require ../includes/ti-staging.inc
> -require ../includes/ti-eula-unpack.inc
> -
> -PV = "1_24_00_16"
> -
> -S = "${WORKDIR}/ipc_${PV}"
> -
> -SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=ipcbin \
> -           file://ipc.pc"
> -
> -DEPENDS = "ti-sysbios ti-cgt6x ti-xdctools"
> -
> -BINFILE="ipc_setuplinux_${PV}.bin"
> -TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
> -
> -do_configure() {
> -    sed -i -e s:@VERSION@:${PV}:g ${WORKDIR}/ipc.pc
> -    
> -    cp ${WORKDIR}/ipc.pc ${S}
> -}
> -
> -do_install() {
> -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> -   
> -    install -d ${D}/${libdir}/pkgconfig
> -    install ${S}/ipc.pc ${D}/${libdir}/pkgconfig/
> -}
> -
> -FILES_${PN}-dev = "${libdir}/*"
> -
> -SRC_URI[ipcbin.md5sum] = "d2f7cc82310d555ca039dcd353bd94c5"
> -SRC_URI[ipcbin.sha256sum] = "96df7835e920c7dabcd63d30ec8bc2aea7cd0c6197c9fb9ca0f8a9b681aa5396"
> diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb b/recipes-ti/ipc/ti-ipc_3.00.00.bb
> deleted file mode 100644
> index a6922c0..0000000
> --- a/recipes-ti/ipc/ti-ipc_3.00.00.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require ti-ipc.inc
> -
> -# For this version of IPC the PLATFORM value is lowercase
> -PLATFORM_keystone = "tci6638"
> -
> -# The following commit corresponds to 3.00.04.29
> -SRCREV = "12794ea33870b782bffe1fe4398e86e93fb64396"
> diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> deleted file mode 100644
> index 17cdab0..0000000
> --- a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require ti-ipc.inc
> -
> -# This commit corresponds to 3.21.00.07
> -SRCREV = "c18fece0c9f0dc76361dc1ee11b7ee2417479847"
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc_git.bb
> similarity index 75%
> rename from recipes-ti/ipc/ti-ipc.inc
> rename to recipes-ti/ipc/ti-ipc_git.bb
> index 860f55f..185e58b 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -2,11 +2,22 @@ DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Mul
>  HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>  
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=f2518e421e230f06fe6d449718d02edc"
> +LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=abd112f156e5eb9b0f3e202e48747f9a"
>  
>  DEPENDS += "virtual/kernel"
>  
> -PR = "r1"
> +PV = "3.30.00.09"
> +
> +# This is the first version of the 3.30.00.09 
> +# PR = "r0"

^^^ This is not really necessary. You either set PR to r0 or don't even 
include it, no need to comment it out, if you already have it in... :)
I took it as is for now, as it's a matter of prefernce and is not critical.


> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
> +           file://tiipclad-daemon.sh \
> +           "
> +SRCREV = "595bc3e3bbb2e7ec12a8287145d8e3929291e59d"
> +
> +S = "${WORKDIR}/git"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -22,20 +33,13 @@ DAEMON_keystone = "lad_tci6638"
>  
>  inherit autotools pkgconfig update-rc.d
>  
> -SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git \
> -           file://0002-ipc-Added-installation-prefix-feature-to-products.ma.patch \
> -           file://tiipclad-daemon.sh \
> -           "
> -
> -S = "${WORKDIR}/git"
> -
>  INITSCRIPT_NAME = "tiipclad-daemon.sh"
>  INITSCRIPT_PARAMS = "defaults 10"
>  
> -EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_INSTALL_DIR=${TOOLCHAIN_PATH} TOOLCHAIN_LONGNAME=${TOOLCHAIN_SYS} PLATFORM=${PLATFORM} PREFIX=${prefix}"
> +EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}"
>  
>  do_configure() {
> -    oe_runmake -f ${S}/ipc-linux.mak config
> +    oe_runconf
>  }
>  
>  do_install_append() {
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

