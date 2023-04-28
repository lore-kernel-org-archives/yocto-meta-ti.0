Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625EAC77B73
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 01:59:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.10108.1682647189274065776
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 18:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 53DC240C68;
	Fri, 28 Apr 2023 01:59:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5u97fFbimIUG; Fri, 28 Apr 2023 01:59:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0346640C3A;
	Fri, 28 Apr 2023 01:59:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6FB4316387B; Thu, 27 Apr 2023 21:59:03 -0400 (EDT)
Date: Thu, 27 Apr 2023 21:59:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, detheridge@ti.com, reatmon@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] all: http to https
 everything
Message-ID: <20230428015903.GS9226@denix.org>
References: <20230428002809.1930898-1-rs@ti.com>
 <3d1cd334-740c-936e-ad61-3c02131dfd09@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d1cd334-740c-936e-ad61-3c02131dfd09@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Apr 2023 01:59:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16456

On Thu, Apr 27, 2023 at 07:31:16PM -0500, Randolph Sapp wrote:
> On 4/27/23 19:28, rs@ti.com wrote:
> >From: Randolph Sapp <rs@ti.com>
> >
> >All of the software-dl links 302 to https urls anyway. Just jump
> >straight to the secure version.
> >
> >Signed-off-by: Randolph Sapp <rs@ti.com>
> >---
> >  meta-ti-bsp/recipes-bsp/cmem/cmem.inc                         | 2 +-
> >  meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                         | 2 +-
> >  meta-ti-extras/recipes-ti/bios/ti-sysbios.inc                 | 4 ++--
> >  meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc              | 2 +-
> >  meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc     | 4 ++--
> >  meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc       | 2 +-
> >  meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc            | 2 +-
> >  meta-ti-extras/recipes-ti/dsplib/dsplib.inc                   | 2 +-
> >  .../framework-components/ti-framework-components.inc          | 4 ++--
> >  meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc              | 4 ++--
> >  meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc             | 2 +-
> >  meta-ti-extras/recipes-ti/mathlib/mathlib.inc                 | 2 +-
> >  meta-ti-extras/recipes-ti/osal/ti-osal.inc                    | 4 ++--
> >  meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc                  | 4 ++--
> >  meta-ti-extras/recipes-ti/xdais/ti-xdais.inc                  | 4 ++--
> >  15 files changed, 22 insertions(+), 22 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
> >index 683e1763..a5bafc83 100644
> >--- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
> >+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
> >@@ -1,4 +1,4 @@
> >-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
> >+HOMEPAGE = "https://processors.wiki.ti.com/index.php/Category:CMEM"
> >  LICENSE = "GPL-2.0-only"
> >  LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
> >diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
> >index 44be2466..fae038f1 100644
> >--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
> >+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
> >-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
> >+HOMEPAGE="https://processors.wiki.ti.com/index.php/Category:IPC"
> >  LICENSE = "BSD-3-Clause"
> >  LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
> >diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
> >index f31decec..0acb3d84 100644
> >--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
> >+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION = "TI SYS/BIOS v6 Kernel"
> >-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
> >+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
> >  SECTION = "devel"
> >  LICENSE = "BSD-3-Clause"
> >@@ -9,7 +9,7 @@ require ../includes/ti-eula-unpack.inc
> >  S = "${WORKDIR}/bios_${PV}"
> >-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
> >+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=sysbiosbin"
> >  BINFILE="bios_${PV}.bin"
> >  TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
> >diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> >index f0992aa7..77d23b6d 100644
> >--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> >+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
> >@@ -11,7 +11,7 @@ require ../includes/ti-eula-unpack.inc
> >  S = "${WORKDIR}/cgt470_${PV}"
> >-SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
> >+SRC_URI = "https://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
> 
> Don't actually merge this. Wanted to take this opportunity to ask
> what on earth theses SRC_URIs are. What do these mean, what's the
> story?

Heh, these were placeholders for "clickwrap" packages, which at some point 
long time ago TI Legal considered a "great" way to distribute software... 
Basically, there was no direct download URL - you must have downloaded them 
manually by filling out an online form and signing some sort of an agreement, 
which would trigger the download. Then you "install the source into the local 
downloads dir" (hence the name) by copying what you've downloaded manually 
into your ${DL_DIR} and Bitbake would be able to find it there regardless of 
the actual SRC_URI.


> >  BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
> >  TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
> >diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
> >index 7051fccc..4e136497 100644
> >--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
> >+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
> >@@ -1,5 +1,5 @@
> >-DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
> >-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
> >+DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - https://rtsc.eclipse.org)"
> >+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
> >  SECTION = "devel"
> >  LICENSE = "BSD-3-Clause & GPL-2.0-only"
> >diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
> >index 47f73b6d..0eaa7227 100644
> >--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
> >+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
> >@@ -2,4 +2,4 @@ require ti-xdctools-common.inc
> >  S = "${WORKDIR}/xdctools_${PV}_core"
> >-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
> >+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
> >diff --git a/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
> >index 1415f83e..f53a9d90 100644
> >--- a/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
> >+++ b/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
> >@@ -3,7 +3,7 @@ require ../includes/ti-eula-unpack.inc
> >  S = "${WORKDIR}/xdctools_${PV}"
> >-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
> >+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
> >  BINFILE="xdctools_setuplinux_${PV}.bin"
> >  TI_BIN_UNPK_CMDS="Y:workdir:Y"
> >diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
> >index 6ebc3b34..5b33f33d 100644
> >--- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
> >+++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
> >@@ -1,5 +1,5 @@
> >  SUMMARY = "DSPLIB contains optimized signal processing functions for TI DSPs"
> >-HOMEPAGE = "http://git.ti.com/ep-processor-libraries/dsplib"
> >+HOMEPAGE = "https://git.ti.com/ep-processor-libraries/dsplib"
> >  LICENSE = "BSD-3-Clause"
> >  require ../includes/ti-paths.inc
> >diff --git a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
> >index 81407ed7..f88f38b8 100644
> >--- a/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
> >+++ b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION = "TI Framework Components"
> >-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc"
> >+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc"
> >  SECTION = "devel"
> >  LICENSE = "BSD-3-Clause"
> >@@ -7,7 +7,7 @@ require recipes-ti/includes/ti-paths.inc
> >  S = "${WORKDIR}/framework_components_${PV}"
> >-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
> >+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
> >  do_install() {
> >      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >diff --git a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> >index ab5cbdb6..93c58d43 100644
> >--- a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> >+++ b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION = "IMGLIB contains optimized general-purpose image/video processing routines for TI DSPs"
> >-HOMEPAGE = "http://www.ti.com/tool/sprc264"
> >+HOMEPAGE = "https://www.ti.com/tool/sprc264"
> >  SECTION = "devel"
> >  LICENSE = "BSD-3-Clause"
> >@@ -9,7 +9,7 @@ require ../includes/ti-unpack.inc
> >  COMPATIBLE_MACHINE = "omap-a15"
> >-SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
> >+SRC_URI = "https://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"
> >  S = "${WORKDIR}/imglib-c66x-${PV}"
> >diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
> >index 09352505..b004a18a 100644
> >--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
> >+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
> >@@ -1,4 +1,4 @@
> >-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
> >+HOMEPAGE = "https://processors.wiki.ti.com/index.php/Category:IPC"
> >  require recipes-ti/ipc/ti-ipc-common.inc
> >  require ti-ipc-rtos.inc
> >diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
> >index 6ad073ec..6741933d 100644
> >--- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
> >+++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
> >@@ -1,5 +1,5 @@
> >  SUMMARY = "MATHLIB contains optimized floating-point math functions for TI DSPs"
> >-HOMEPAGE = "http://git.ti.com/ep-processor-libraries/mathlib"
> >+HOMEPAGE = "https://git.ti.com/ep-processor-libraries/mathlib"
> >  LICENSE = "BSD-3-Clause"
> >  require ../includes/ti-paths.inc
> >diff --git a/meta-ti-extras/recipes-ti/osal/ti-osal.inc b/meta-ti-extras/recipes-ti/osal/ti-osal.inc
> >index b0470793..583b33c7 100644
> >--- a/meta-ti-extras/recipes-ti/osal/ti-osal.inc
> >+++ b/meta-ti-extras/recipes-ti/osal/ti-osal.inc
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION = "TI Operating System Abstraction Library (OSAL)"
> >-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
> >+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
> >  LICENSE = "BSD-3-Clause & EPL-1.0"
> >  SECTION = "devel"
> >@@ -8,7 +8,7 @@ require ../includes/ti-staging.inc
> >  S = "${WORKDIR}/osal_${PV}"
> >-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal/${PV}/exports/osal_${PV}.tar.gz;name=osaltarball"
> >+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal/${PV}/exports/osal_${PV}.tar.gz;name=osaltarball"
> >  do_install() {
> >      install -d ${D}${OSAL_INSTALL_DIR_RECIPE}
> >diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> >index 6b5e186c..a704e023 100644
> >--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> >+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION = "TI Vision Library (VLIB) for C66x"
> >-HOMEPAGE = "http://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
> >+HOMEPAGE = "https://software-dl.ti.com/libs/vlib/latest/index_FDS.html"
> >  SECTION = "devel"
> >  LICENSE = "TI-TSPA & BSD-3-Clause"
> >@@ -9,7 +9,7 @@ require ../includes/ti-eula-unpack.inc
> >  COMPATIBLE_MACHINE = "omap-a15"
> >-SRC_URI = "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV}_Linux.bin;name=vlibbin"
> >+SRC_URI = "https://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_obj_${PV}_Linux.bin;name=vlibbin"
> >  S = "${WORKDIR}/vlib_c66x_${PV}"
> >diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
> >index 67d19022..58eba0ee 100644
> >--- a/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
> >+++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
> >@@ -1,5 +1,5 @@
> >  DESCRIPTION = "TI eXpress DSP Algorithm Interface Standard (XDAIS) specification"
> >-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais"
> >+HOMEPAGE = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais"
> >  LICENSE = "GPL-2.0-only"
> >  SECTION = "devel"
> >@@ -8,7 +8,7 @@ require ../includes/ti-staging.inc
> >  S = "${WORKDIR}/xdais_${PV}"
> >-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=xdaistarball"
> >+SRC_URI = "https://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=xdaistarball"
> >  do_install() {
> >      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

