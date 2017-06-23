Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6EE4CE00B9D; Fri, 23 Jun 2017 11:14:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCA10E00B18
	for <meta-ti@yoctoproject.org>; Fri, 23 Jun 2017 11:14:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A36A320C1A;
	Fri, 23 Jun 2017 18:14:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3Cl_c-KFsgla; Fri, 23 Jun 2017 18:14:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C94E208FB;
	Fri, 23 Jun 2017 18:14:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E4954162513;
	Fri, 23 Jun 2017 14:14:21 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Jun 2017 14:14:17 -0400
Message-Id: <1498241657-42514-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498241657-42514-1-git-send-email-denys@ti.com>
References: <1498241657-42514-1-git-send-email-denys@ti.com>
Subject: [PATCH 2/2] codec-engine: remove outdated components
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
X-List-Received-Date: Fri, 23 Jun 2017 18:14:29 -0000

Remove the old 2.x version of Codec Engine, that hasn't been updated in years
and the corresponding codecs-omap3530 package.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/codec-engine/ti-codec-engine.inc        | 199 --------------------
 .../bypass-GCArmv5T-used-is-sealed.patch           |  22 ---
 ...-08-Examples-Add-LPM_INSTALL_DIR-packages.patch |  60 ------
 .../ti-codec-engine/dm365-evm/loadmodules.sh       |  49 -----
 .../loadmodules-ti-codec-engine-apps.sh            |  37 ----
 .../unloadmodules-ti-codec-engine-apps.sh          |  12 --
 .../codec-engine/ti-codec-engine_2.26.02.11.bb     |  12 --
 .../ti-codecs-omap3530/disable-c6accel.diff        |  47 -----
 .../ti-codecs-omap3530/mp3dec_cs1omap3530.patch    |  41 ----
 .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  | 208 ---------------------
 10 files changed, 687 deletions(-)
 delete mode 100644 recipes-ti/codec-engine/ti-codec-engine.inc
 delete mode 100644 recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch
 delete mode 100644 recipes-ti/codec-engine/ti-codec-engine/ce-2-26-00-08-Examples-Add-LPM_INSTALL_DIR-packages.patch
 delete mode 100644 recipes-ti/codec-engine/ti-codec-engine/dm365-evm/loadmodules.sh
 delete mode 100644 recipes-ti/codec-engine/ti-codec-engine/loadmodules-ti-codec-engine-apps.sh
 delete mode 100644 recipes-ti/codec-engine/ti-codec-engine/unloadmodules-ti-codec-engine-apps.sh
 delete mode 100644 recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
 delete mode 100644 recipes-ti/codec-engine/ti-codecs-omap3530/disable-c6accel.diff
 delete mode 100644 recipes-ti/codec-engine/ti-codecs-omap3530/mp3dec_cs1omap3530.patch
 delete mode 100644 recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb

diff --git a/recipes-ti/codec-engine/ti-codec-engine.inc b/recipes-ti/codec-engine/ti-codec-engine.inc
deleted file mode 100644
index 15bd464..0000000
--- a/recipes-ti/codec-engine/ti-codec-engine.inc
+++ /dev/null
@@ -1,199 +0,0 @@
-DESCRIPTION = "Codec Engine for TI ARM/DSP processors"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce"
-SECTION = "devel"
-LICENSE = "BSD"
-
-# TODO :: Add Codec Engine Library Rebuild
-# TODO :: Add Examples APP_LOCAL build as well?
-# TODO :: Check DEPENDS - are the DSP side packages required for ARM-only products?
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-PROVIDES += "ti-codec-engine-examples"
-
-PR = "${MACHINE_KERNEL_PR}"
-
-S = "${WORKDIR}/codec_engine_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
-
-DEPENDS = "ti-framework-components ti-xdais ti-xdctools ti-linuxutils"
-DEPENDS_append_dm6446 	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x ti-biosutils ti-edma3lld"
-DEPENDS_append_dm6467 	= " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
-DEPENDS_append_omap3	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x ti-biosutils ti-edma3lld"
-DEPENDS_append_omapl137 = " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
-DEPENDS_append_omapl138 = " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
-
-# SOC_FAMILY configuration
-
-# Define DEVICES variable
-CEEXAMPLESDEVICES_dm6446     = "DM6446"
-CEEXAMPLESDEVICES_dm6467     = "DM6467"
-CEEXAMPLESDEVICES_omap3      = "OMAP3530"
-CEEXAMPLESDEVICES_dm355      = "DM355"
-CEEXAMPLESDEVICES_dm365      = "DM365"
-CEEXAMPLESDEVICES_omapl137   = "OMAPL137"
-CEEXAMPLESDEVICES_omapl138   = "OMAPL138"
-CEEXAMPLESDEVICES           ?= "<UNDEFINED_CEEXAMPLESDEVICES>"
-
-# Define GPPOS variable
-CEEXAMPLESGPPOS_dm6446       = "LINUX_GCC"
-CEEXAMPLESGPPOS_dm6467       = "LINUX_GCC"
-CEEXAMPLESGPPOS_omap3        = "LINUX_GCC"
-CEEXAMPLESGPPOS_dm355        = "LINUX_GCC"
-CEEXAMPLESGPPOS_dm365        = "LINUX_GCC"
-CEEXAMPLESGPPOS_omapl137     = "LINUX_GCC"
-CEEXAMPLESGPPOS_omapl138     = "LINUX_GCC"
-CEEXAMPLESGPPOS             ?= "<UNDEFINED_CEEXAMPLESGPPOS>"
-
-# Define PROGRAM variable
-CEEXAMPLESPROGRAMS_dm6446    = "APP_CLIENT DSP_SERVER"
-CEEXAMPLESPROGRAMS_dm6467    = "APP_CLIENT DSP_SERVER"
-CEEXAMPLESPROGRAMS_omap3     = "APP_CLIENT DSP_SERVER"
-CEEXAMPLESPROGRAMS_dm355     = "APP_LOCAL"
-CEEXAMPLESPROGRAMS_dm365     = "APP_LOCAL"
-CEEXAMPLESPROGRAMS_omapl137  = "APP_CLIENT DSP_SERVER"
-CEEXAMPLESPROGRAMS_omapl138  = "APP_CLIENT DSP_SERVER"
-CEEXAMPLESPROGRAMS          ?= "<UNDEFINED_CEEXAMPLESPROGRAMS>"
-
-do_configure() {
-
-    # No way to pass this via ENV?
-    sed -i  \
-        -e s:arm-none-linux-gnueabi-:${TARGET_PREFIX}:g \
-        ${S}/examples/xdcpaths.mak
-
-    # compiler is not under ${TOOLCHAIN_PATH}/bin anymore...
-    sed -i  \
-        -e s:bin/${TARGET_PREFIX}gcc:${TARGET_PREFIX}gcc:g \
-        ${S}/examples/xdcpaths.mak
-
-    # ... and ar is not there too
-#    sed -i  \
-#        -e s:/arm-angstrom-linux-gnueabi/bin/ar:/arm-angstrom-linux-gnueabi-ar:g \
-#        ${S}/examples/ti/xdais/dm/examples/viddec1_copy/package.mak
-}
-
-do_prepsources() {
-
-        for i in codecs extensions servers apps ; do
-                cd ${S}/examples/ti/sdo/ce/examples/$i
-                make DEVICES="${CEEXAMPLESDEVICES}" \
-                     GPPOS="${CEEXAMPLESGPPOS}" \
-                     PROGRAMS="${CEEXAMPLESPROGRAMS}" \
-                     CE_INSTALL_DIR="${S}" \
-                     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
-                     BIOS_INSTALL_DIR="${BIOS_INSTALL_DIR}" \
-                     BIOSUTILS_INSTALL_DIR="${BIOSUTILS_INSTALL_DIR}" \
-		     DSPLINK_INSTALL_DIR="${LINK_INSTALL_DIR}" \
-                     XDAIS_INSTALL_DIR="${XDAIS_INSTALL_DIR}" \
-                     FC_INSTALL_DIR="${FC_INSTALL_DIR}" \
-                     CMEM_INSTALL_DIR="${CMEM_INSTALL_DIR}" \
-                     LPM_INSTALL_DIR="${LPM_INSTALL_DIR}" \
-                     EDMA3_LLD_INSTALL_DIR="${EDMA3_LLD_INSTALL_DIR}" \
-                     CGTOOLS_V5T="${TOOLCHAIN_PATH}" \
-                     CGTOOLS_C64P="${CODEGEN_INSTALL_DIR}" \
-                     CGTOOLS_C674="${CODEGEN_INSTALL_DIR}" \
-                     clean
-		     # '.make' target was used in CE < 2.26, but its no longer
-		     # supported in CE >= 2.26. Now we are moved to >=2.26 
-		     # hence commenting out the .make target.
-                     # .make clean
-        done
-}
-
-addtask prepsources after do_configure before do_compile
-
-do_compile () {
-
-        for i in codecs extensions servers apps ; do
-                cd ${S}/examples/ti/sdo/ce/examples/$i
-                make DEVICES="${CEEXAMPLESDEVICES}" \
-                     GPPOS="${CEEXAMPLESGPPOS}" \
-                     PROGRAMS="${CEEXAMPLESPROGRAMS}" \
-                     CE_INSTALL_DIR="${S}" \
-                     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
-                     BIOS_INSTALL_DIR="${BIOS_INSTALL_DIR}" \
-                     BIOSUTILS_INSTALL_DIR="${BIOSUTILS_INSTALL_DIR}" \
-		     DSPLINK_INSTALL_DIR="${LINK_INSTALL_DIR}" \
-                     XDAIS_INSTALL_DIR="${XDAIS_INSTALL_DIR}" \
-                     FC_INSTALL_DIR="${FC_INSTALL_DIR}" \
-                     CMEM_INSTALL_DIR="${CMEM_INSTALL_DIR}" \
-                     LPM_INSTALL_DIR="${LPM_INSTALL_DIR}" \
-                     EDMA3_LLD_INSTALL_DIR="${EDMA3_LLD_INSTALL_DIR}" \
-                     CGTOOLS_V5T="${TOOLCHAIN_PATH}" \
-                     CGTOOLS_C64P="${CODEGEN_INSTALL_DIR}" \
-                     CGTOOLS_C674="${CODEGEN_INSTALL_DIR}" \
-                     all
-        done
-}
-
-do_install() {
-
-	install -d ${D}/${installdir}/ti-codec-engine-examples
-	if [ -e ${S}/examples/apps/system_files/${CEEXAMPLESDEVICES}/loadmodules.sh ]; then
-		cp ${S}/examples/apps/system_files/${CEEXAMPLESDEVICES}/loadmodules.sh ${D}/${installdir}/ti-codec-engine-examples
-	elif [ -e ${WORKDIR}/loadmodules.sh ]; then
-		cp ${WORKDIR}/loadmodules.sh ${D}/${installdir}/ti-codec-engine-examples
-	fi
-
-	cd ${S}/examples/ti/sdo/ce/examples
-
-	# Install the apps, servers and test data, mirroring the source directory structure
-	#  - Put the servers inside the same folder as the executable
-	#  - TODO - Check nested dirs (e.g. dualcpu_separateconfig)
-
-        # Put all servers in separate tree.
-        for i in $(find . -name "*.${DSPSUFFIX}"); do
-                install -d ${D}/${installdir}/ti-codec-engine-examples/servers/`dirname ${i} | cut -f3 -d /`
-                install ${i} ${D}/${installdir}/ti-codec-engine-examples/servers/`dirname ${i} | cut -f3 -d /`
-        done
-
-	for i in $(find . -name "*.xv5T"); do
-		install -d ${D}/${installdir}/ti-codec-engine-examples/`dirname ${i} | cut -f3 -d /`
-		install ${i} ${D}/${installdir}/ti-codec-engine-examples/`dirname ${i} | cut -f3 -d /`
-	done
-
-	for i in $(find . -name "*.dat"); do
-		install -d ${D}/${installdir}/ti-codec-engine-examples/`dirname ${i} | cut -f3 -d /`
-		install ${i} ${D}/${installdir}/ti-codec-engine-examples/`dirname ${i} | cut -f3 -d /`
-        done
-
-	# For each directory, softlink to the app server, except special cases
-	cd ${D}/${installdir}/ti-codec-engine-examples
-	for i in $(find . -type d | grep -v servers); do
-		{
-		pwd
-		cd ${D}/${installdir}/ti-codec-engine-examples/$i
-		if [ $(basename $i) = "audio1_ires" ] ; then 
-			ln -s ../servers/audio1_ires/audio1_ires.${DSPSUFFIX}
-		elif [ $(basename $i) = "server_api_example" ] ; then
-			ln -s ../servers/server_api_example/audio_copy.${DSPSUFFIX}
-                elif [ $(basename $i) != "." ] ; then
-			ln -s ../servers/all_codecs/all.${DSPSUFFIX}
-		else
-			echo Skipping $i
-		fi
-		}
-	done
-
-        # Install/Stage the Source Tree
-        install -d ${D}${CE_INSTALL_DIR_RECIPE}
-        cp -pPrf ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PACKAGES += "ti-codec-engine-examples"
-
-RDEPENDS_ti-codec-engine-examples                 = " ti-cmem-module"
-RDEPENDS_ti-codec-engine-examples_append_dm6446   = " ti-dsplink-module ti-lpm-module"
-RDEPENDS_ti-codec-engine-examples_append_dm6467   = " ti-dsplink-module"
-RDEPENDS_ti-codec-engine-examples_append_omap3    = " ti-dsplink-module ti-lpm-module"
-RDEPENDS_ti-codec-engine-examples_append_omapl137 = " ti-dsplink-module"
-RDEPENDS_ti-codec-engine-examples_append_omapl138 = " ti-dsplink-module"
-FILES_ti-codec-engine-examples = "${installdir}/ti-codec-engine-examples/*"
-INSANE_SKIP_ti-codec-engine-examples = "1"
-
-FILES_${PN}-dbg += "${installdir}/ti-codec-engine-examples/*/.debug"
diff --git a/recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch b/recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch
deleted file mode 100644
index b93161f..0000000
--- a/recipes-ti/codec-engine/ti-codec-engine/bypass-GCArmv5T-used-is-sealed.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-do_compile produces:
-
-js: "/prj/oe/bb/build/tmp-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_26_02_11-r114a/codec_engine_2_26_02_11/packages/ti/sdo/ce/osal/linux/package.xs", line 50: XDC runtime error: gnu.targets.arm.GCArmv5T: '$used' is sealed
-
-Fix per suggestion in http://e2e.ti.com/support/dsp/omap_applications_processors/f/447/t/110920.aspx
-
---- ./packages/ti/sdo/ce/osal/linux/package.xs.orig	2010-12-01 23:24:48.000000000 -0600
-+++ ./packages/ti/sdo/ce/osal/linux/package.xs	2011-12-27 14:59:39.382423341 -0600
-@@ -47,10 +47,10 @@
-     }
- 
-     /* Conditionally load CMEM here */
--    var targetMod = xdc.useModule(prog.build.target.$name);
--    if ((":"+targetMod.getISAChain().join(":")+":").match(/:v5T:/i)) {
-+    //var targetMod = xdc.useModule(prog.build.target.$name);
-+    //if ((":"+targetMod.getISAChain().join(":")+":").match(/:v5T:/i)) {
-         xdc.useModule('ti.sdo.linuxutils.cmem.CMEM');
--    }
-+    //}
- 
-     var osalGlobal = xdc.useModule('ti.sdo.ce.osal.Global');
- 
diff --git a/recipes-ti/codec-engine/ti-codec-engine/ce-2-26-00-08-Examples-Add-LPM_INSTALL_DIR-packages.patch b/recipes-ti/codec-engine/ti-codec-engine/ce-2-26-00-08-Examples-Add-LPM_INSTALL_DIR-packages.patch
deleted file mode 100644
index 1eb8108..0000000
--- a/recipes-ti/codec-engine/ti-codec-engine/ce-2-26-00-08-Examples-Add-LPM_INSTALL_DIR-packages.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-diff --git a/examples/ti/sdo/ce/examples/apps/audio1_ires/rtcfg_local_evm3530_linux/makefile b/examples/ti/sdo/ce/examples/apps/audio1_ires/rtcfg_local_evm3530_linux/makefile
-index 2bbfb72..2a00d0d 100644
---- a/examples/ti/sdo/ce/examples/apps/audio1_ires/rtcfg_local_evm3530_linux/makefile
-+++ b/examples/ti/sdo/ce/examples/apps/audio1_ires/rtcfg_local_evm3530_linux/makefile
-@@ -80,6 +80,7 @@ REPO_PATH = \
- 	$(FC_INSTALL_DIR)/packages \
- 	$(FC_INSTALL_DIR)/examples \
- 	$(CMEM_INSTALL_DIR)/packages \
-+	$(LPM_INSTALL_DIR)/packages \
- 	$(BIOSUTILS_INSTALL_DIR)/packages \
- 	$(EXAMPLES_ROOTDIR)
- 
-diff --git a/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_local_evm3530_linux/makefile b/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_local_evm3530_linux/makefile
-index f2b187a..827f6bc 100644
---- a/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_local_evm3530_linux/makefile
-+++ b/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_local_evm3530_linux/makefile
-@@ -74,6 +74,7 @@ REPO_PATH = \
- 	$(XDAIS_INSTALL_DIR)/packages \
- 	$(FC_INSTALL_DIR)/packages \
- 	$(CMEM_INSTALL_DIR)/packages \
-+	$(LPM_INSTALL_DIR)/packages \
- 	$(BIOSUTILS_INSTALL_DIR)/packages \
- 	$(EXAMPLES_ROOTDIR)
- 
-diff --git a/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_remote_evm3530_linux/makefile b/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_remote_evm3530_linux/makefile
-index a4fe4dc..a23f991 100644
---- a/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_remote_evm3530_linux/makefile
-+++ b/examples/ti/sdo/ce/examples/apps/speech1_copy/rtcfg_remote_evm3530_linux/makefile
-@@ -76,6 +76,7 @@ REPO_PATH = \
- 	$(XDAIS_INSTALL_DIR)/packages \
- 	$(FC_INSTALL_DIR)/packages \
- 	$(CMEM_INSTALL_DIR)/packages \
-+	$(LPM_INSTALL_DIR)/packages \
- 	$(BIOSUTILS_INSTALL_DIR)/packages \
- 	$(EXAMPLES_ROOTDIR)
- 
-diff --git a/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_local_evm3530_linux/makefile b/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_local_evm3530_linux/makefile
-index 8baa9dd..3c01c04 100644
---- a/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_local_evm3530_linux/makefile
-+++ b/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_local_evm3530_linux/makefile
-@@ -74,6 +74,7 @@ REPO_PATH = \
- 	$(XDAIS_INSTALL_DIR)/packages \
- 	$(FC_INSTALL_DIR)/packages \
- 	$(CMEM_INSTALL_DIR)/packages \
-+	$(LPM_INSTALL_DIR)/packages \
- 	$(BIOSUTILS_INSTALL_DIR)/packages \
- 	$(EXAMPLES_ROOTDIR)
- 
-diff --git a/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_remote_evm3530_linux/makefile b/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_remote_evm3530_linux/makefile
-index 3319c06..09a6357 100644
---- a/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_remote_evm3530_linux/makefile
-+++ b/examples/ti/sdo/ce/examples/apps/video1_copy/rtcfg_remote_evm3530_linux/makefile
-@@ -75,6 +75,7 @@ REPO_PATH = \
- 	$(XDAIS_INSTALL_DIR)/packages \
- 	$(FC_INSTALL_DIR)/packages \
- 	$(CMEM_INSTALL_DIR)/packages \
-+	$(LPM_INSTALL_DIR)/packages \
- 	$(BIOSUTILS_INSTALL_DIR)/packages \
- 	$(EXAMPLES_ROOTDIR)
- 
diff --git a/recipes-ti/codec-engine/ti-codec-engine/dm365-evm/loadmodules.sh b/recipes-ti/codec-engine/ti-codec-engine/dm365-evm/loadmodules.sh
deleted file mode 100644
index 60a40f0..0000000
--- a/recipes-ti/codec-engine/ti-codec-engine/dm365-evm/loadmodules.sh
+++ /dev/null
@@ -1,49 +0,0 @@
-#
-#  Copyright (c) 2008, Texas Instruments Incorporated
-#  All rights reserved.
-# 
-#  Redistribution and use in source and binary forms, with or without
-#  modification, are permitted provided that the following conditions
-#  are met:
-# 
-#  *  Redistributions of source code must retain the above copyright
-#     notice, this list of conditions and the following disclaimer.
-# 
-#  *  Redistributions in binary form must reproduce the above copyright
-#     notice, this list of conditions and the following disclaimer in the
-#     documentation and/or other materials provided with the distribution.
-# 
-#  *  Neither the name of Texas Instruments Incorporated nor the names of
-#     its contributors may be used to endorse or promote products derived
-#     from this software without specific prior written permission.
-# 
-#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-#  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-#  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-#  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-#  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
-#  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-#
-
-# insert cmemk, tell it to occupy physical 120MB-128MB, create 
-# 20 4K buffers, 10 128K buffers  and two 1MB buffers
-CMEM_MODPARAMS="phys_start=0x87800000 phys_end=0x88000000 pools=20x4096,10x131072,2x1048576"
-
-if [ -e cmemk.ko ]
-    then
-        insmod cmemk.ko $CMEM_MODPARAMS
-    else
-        modprobe cmemk $CMEM_MODPARAMS
-fi
-
-# Allow cmem driver to be used by all users
-if [ -e /dev/cmem ]
-    then
-        chmod 666 /dev/cmem
-fi
-
diff --git a/recipes-ti/codec-engine/ti-codec-engine/loadmodules-ti-codec-engine-apps.sh b/recipes-ti/codec-engine/ti-codec-engine/loadmodules-ti-codec-engine-apps.sh
deleted file mode 100644
index 9f9233d..0000000
--- a/recipes-ti/codec-engine/ti-codec-engine/loadmodules-ti-codec-engine-apps.sh
+++ /dev/null
@@ -1,37 +0,0 @@
-#
-# Default Memory Map - for OMAP3530 CE 2.21 examples
-#
-# Start Addr    Size    Description
-# -------------------------------------------
-# 0x80000000    80 MB   Linux
-# 0x85000000    08 MB   CMEM
-# 0x86000000    24 MB   DDRALGHEAP
-# 0x87800000     6 MB   DDR2 (BIOS, Codecs, Applications)
-# 0x87E00000     1 MB   DSPLINK (MEM)
-# 0x87F00000     4 KB   DSPLINK (RESET)
-# 0x87F01000  1020 KB   unused
-
-# sanity check to verify that we're using the right mem=xxM (80M in this case)
-awk '/MemTotal:/ {
-    mem=$2
-
-    if (mem > 80 * 1024)
-        print "Warning! You need to use mem=80M or less on the kernel cmdline"
-
-    printf "You have %dkB total memory for Linux\n", mem
-}' /proc/meminfo
-
-# Select cmemk parameters for best fit, i.e. starting at 0x85000000
-modprobe cmemk phys_start=0x85000000 phys_end=0x86000000 pools=20x4096,8x131072,5x1048576,1x1429440,1x256000,1x3600000,5x829440
-
-# insert DSP/BIOS Link driver
-#
-modprobe dsplinkk
-
-# make /dev/dsplink
-#rm -f /dev/dsplink
-#mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print \\$1}" /proc/devices` 0
-
-# insert Local Power Manager driver
-#
-modprobe lpm_omap3530
diff --git a/recipes-ti/codec-engine/ti-codec-engine/unloadmodules-ti-codec-engine-apps.sh b/recipes-ti/codec-engine/ti-codec-engine/unloadmodules-ti-codec-engine-apps.sh
deleted file mode 100644
index f990d99..0000000
--- a/recipes-ti/codec-engine/ti-codec-engine/unloadmodules-ti-codec-engine-apps.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-# Unload modules - CODEC ENGINE - OMAP3530
-
-# remove lpm module
-rmmod lpm_omap3530
-
-# remove DSP/BIOS Link driver
-rmmod dsplinkk
-#rm -f /dev/dsplink
-
-# remove cmem module
-rmmod cmemk
-
diff --git a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb b/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
deleted file mode 100644
index 4a27b1d..0000000
--- a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-codec-engine.inc
-
-LIC_FILES_CHKSUM = "file://codec_engine_${PV}_manifest.html;md5=912535f1b02ecf329a3979bf313f91e0"
-PV = "2_26_02_11"
-PR_append = "b"
-
-SRC_URI += "file://bypass-GCArmv5T-used-is-sealed.patch"
-
-SRC_URI[cetarball.md5sum] = "4f755f77119e4da19ab5cc7ae7ccfdb4"
-SRC_URI[cetarball.sha256sum] = "17fa053719265e0901fe3c3f90c9204957c6d0f5351d6b3ba4900df58cb7300f"
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530/disable-c6accel.diff b/recipes-ti/codec-engine/ti-codecs-omap3530/disable-c6accel.diff
deleted file mode 100644
index 6e2ed7e..0000000
--- a/recipes-ti/codec-engine/ti-codecs-omap3530/disable-c6accel.diff
+++ /dev/null
@@ -1,47 +0,0 @@
-diff -ur a/packages/ti/sdo/server/cs/codec.cfg b/packages/ti/sdo/server/cs/codec.cfg
---- a/packages/ti/sdo/server/cs/codec.cfg	2011-08-07 20:08:57.000000000 +0200
-+++ b/packages/ti/sdo/server/cs/codec.cfg	2011-08-07 20:08:10.000000000 +0200
-@@ -7,7 +7,7 @@
-  *  which we'll use to initialize config params and add the codecs to
-  *  the Server.algs array.
-  */
--    var C6ACCEL = xdc.useModule('ti.c6accel.ce.C6ACCEL');
-+/*    var C6ACCEL = xdc.useModule('ti.c6accel.ce.C6ACCEL');
- 
-         C6ACCEL.serverFxns = "UNIVERSAL_SKEL";
-         C6ACCEL.stubFxns = "UNIVERSAL_STUBS";
-@@ -17,7 +17,7 @@
-         C6ACCEL.alg.codeSection = codeSection;
-         C6ACCEL.alg.udataSection = udataSection;
-         C6ACCEL.alg.dataSection = dataSection;
--
-+*/
-     var AACHEDEC = xdc.useModule('ti.sdo.codecs.aachedec.ce.AACHEDEC');
- 
-         AACHEDEC.serverFxns = "AUDDEC1_SKEL";
-@@ -151,11 +151,11 @@
-  * algorithms (e.g. stack sizes, priorities, etc.).
-  */
- Server.algs = [ 
--    {name: "c6accel", mod: C6ACCEL , threadAttrs: {
-+/*    {name: "c6accel", mod: C6ACCEL , threadAttrs: {
-         stackMemId: 0, priority: Server.MINPRI + 3},
-         groupId : 2,
-     },
--
-+*/
-     {name: "aachedec", mod: AACHEDEC , threadAttrs: {
-         stackMemId: 0, priority: Server.MINPRI + 3},
-         groupId : 2,
-diff -ur a/packages/ti/sdo/server/cs/package.xs b/packages/ti/sdo/server/cs/package.xs
---- a/packages/ti/sdo/server/cs/package.xs	2011-08-07 20:09:31.000000000 +0200
-+++ b/packages/ti/sdo/server/cs/package.xs	2011-08-07 20:08:21.000000000 +0200
-@@ -7,7 +7,7 @@
-     // Each codec is validated with the following call:
-     //    validate_one_codec(<package name>, <module name>);
- 
--         validate_one_codec( "ti.c6accel", "C6ACCEL" );
-+//         validate_one_codec( "ti.c6accel", "C6ACCEL" );
-          validate_one_codec( "ti.sdo.codecs.aachedec", "AACHEDEC" );
-          validate_one_codec( "ti.sdo.codecs.deinterlacer", "I2P" );
-          validate_one_codec( "ti.sdo.codecs.g711dec", "G711DEC" );
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530/mp3dec_cs1omap3530.patch b/recipes-ti/codec-engine/ti-codecs-omap3530/mp3dec_cs1omap3530.patch
deleted file mode 100644
index 4ed9267..0000000
--- a/recipes-ti/codec-engine/ti-codecs-omap3530/mp3dec_cs1omap3530.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-diff -uNr -x .xdcenv.mak -x mp3dec cs1omap3530_1_00_01/packages/ti/sdo/server/cs/codec.cfg cs1omap3530_1_00_01_patches/packages/ti/sdo/server/cs/codec.cfg
---- cs1omap3530_1_00_01/packages/ti/sdo/server/cs/codec.cfg	2009-10-26 14:19:21.000000000 -0500
-+++ cs1omap3530_1_00_01_patches/packages/ti/sdo/server/cs/codec.cfg	2009-10-26 14:36:03.000000000 -0500
-@@ -92,6 +92,14 @@
-                 MPEG4ENC.alg.udataSection = "DDR2";
-                 MPEG4ENC.alg.dataSection = "DDR2";
- 
-+    var MP3DEC = xdc.useModule('ti.sdo.codecs.mp3dec.ce.MP3DEC');
-+
-+     // Module Config
-+                MP3DEC.alg.watermark = false;
-+                MP3DEC.alg.codeSection = "DDR2";
-+                MP3DEC.alg.udataSection = "DDR2";
-+                MP3DEC.alg.dataSection = "DDR2";
-+
- /*
-  * The array of algorithms this server can serve up.  This array also
-  * configures details about the threads which will be created to run the
-@@ -103,6 +111,11 @@
-         groupId : 1,
-     },
- 
-+    {name: "mp3dec", mod: MP3DEC , threadAttrs: {
-+        stackMemId: 0, priority: Server.MINPRI + 3},
-+        groupId : 1,
-+    },
-+
-     {name: "g711dec", mod: G711DEC , threadAttrs: {
-         stackMemId: 0, priority: Server.MINPRI + 3},
-         groupId : 1,
-diff -uNr -x .xdcenv.mak -x mp3dec cs1omap3530_1_00_01/packages/ti/sdo/server/cs/package.xs cs1omap3530_1_00_01_patches/packages/ti/sdo/server/cs/package.xs
---- cs1omap3530_1_00_01/packages/ti/sdo/server/cs/package.xs	2009-10-26 14:19:20.000000000 -0500
-+++ cs1omap3530_1_00_01_patches/packages/ti/sdo/server/cs/package.xs	2009-10-26 14:53:40.000000000 -0500
-@@ -17,6 +17,7 @@
-          validate_one_codec( "ti.sdo.codecs.mpeg2dec", "MPEG2DEC" );
-          validate_one_codec( "ti.sdo.codecs.mpeg4dec", "MPEG4DEC" );
-          validate_one_codec( "ti.sdo.codecs.mpeg4enc", "MPEG4ENC" );
-+         validate_one_codec( "ti.sdo.codecs.mp3dec", "MP3DEC" );
- }
- 
- function validate_one_codec( packageName, moduleName ) {
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
deleted file mode 100644
index 5c87b4c..0000000
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ /dev/null
@@ -1,208 +0,0 @@
-DESCRIPTION = "TI Codecs and Server Combo for OMAP3530"
-SECTION = "multimedia"
-LICENSE = "TI"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-PR="${MACHINE_KERNEL_PR}"
-PR_append = "a"
-
-PV="4_00_00_00"
-
-LIC_FILES_CHKSUM = "file://packages/ti/sdo/server/cs/docs/cs1omap3530_software_manifest.pdf;md5=84444ba7c7abe117c30f9c960d1930ec"
-
-CODEC_SUITE_NAME="${WORKDIR}/${PN}_${PV}"
-
-SRCREV = "8393c892b09e0ac42b19ff1531e232478c3b1a6c"
-
-require recipes-ti/includes/ti-eula-unpack.inc
-
-SRC_URI="http://software-dl.ti.com/dsps/dsps_public_sw/codecs/OMAP35xx//OMAP35xx_latest/omap3530_h264enc_2_01_013_production.bin;name=h264enc \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/OMAP35xx//OMAP35xx_latest/omap3530_h264dec_2_01_007_production.bin;name=h264dec \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/OMAP35xx//OMAP35xx_latest/omap3530_jpegenc_02_01_01_00_production.bin;name=jpegenc \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/C64XPlus_Video//C64XPlus_Video_latest/c64xplus_jpegdec_02_00_01_01_production.bin;name=jpegdec \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/C64XPlus_Video//C64XPlus_Video_latest/c64xplus_mpeg2dec_02_00_02_00_production.bin;name=mpeg2dec \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/OMAP35xx//OMAP35xx_latest/omap3530_mpeg4enc_02_04_00_00_production.bin;name=mpeg4enc \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/C64XPlus_Video//C64XPlus_Video_latest/c64xplus_mpeg4dec_02_01_00_00_production.bin;name=mpeg4dec \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/C64XPlus_Audio//C64XPlus_Audio_latest/c64xplus_aachedec_01_30_03_00_production.bin;name=aachedec \
-    http://software-dl.ti.com/dsps/dsps_public_sw/codecs/C64XPlus_Speech//C64XPlus_Speech_latest/c64xplus_g711_1_12_00_000_production.bin;name=g711 \
-    http://software-dl.ti.com/dsps/dsps_public_sw/sdo_tii/OMAP35xx_DM37xx_C64xPLUS_Algorithms/01_00_00_07//exports/c64xplus_deinterlacer_01_00_00_07_production.bin;name=i2p \
-    git://arago-project.org/git/projects/codec-servers.git;protocol=git \
-    \
-    file://disable-c6accel.diff \
-"
-
-SRC_URI[h264enc.md5sum] = "4a7a4698b1db360fe103aae76127a4ec"
-SRC_URI[h264enc.sha256sum] = "8fd970d83004bb099f51420b0eecd660b4ba9dccc87b2759d0b5a0be46f8f1a0"
-
-SRC_URI[h264dec.md5sum] = "81980df2d9dbedc5b64789c4e5575819"
-SRC_URI[h264dec.sha256sum] = "19d65e71ba0342670cb217e0fa6617263ff68a513e8444a8dfd5f34bd641b24f"
-
-SRC_URI[jpegenc.md5sum] = "c2e8ad88e90c04d2de7b199517019ac8"
-SRC_URI[jpegenc.sha256sum] = "6525e067cb5dd00cfc0b38045c44dcbed05866f8ad20188ceac630812502d473"
-
-SRC_URI[jpegdec.md5sum] = "cf2886c3406ab41409a586e5d550918d"
-SRC_URI[jpegdec.sha256sum] = "6b0c9f1b8f023070c6a59af690f015f84f2c7f3143235f788ddd1a4a7b229089"
-
-SRC_URI[mpeg2dec.md5sum] = "da3d0561f3073352be43dce96ce1ea62"
-SRC_URI[mpeg2dec.sha256sum] = "06cdb31242b8649bdd46bc07b9276de0ccd5f4e1c137d3cb79e0866c1ed04264"
-
-SRC_URI[mpeg4enc.md5sum] = "07c36e5d03368e1326df75a1f0c4934d"
-SRC_URI[mpeg4enc.sha256sum] = "a9566c8978f7230936053de9b1f3bfe8820ae555262ceba87243abdf60e5193f"
-
-SRC_URI[mpeg4dec.md5sum] = "4a27cda2d5a859e6322680a4855b6b88"
-SRC_URI[mpeg4dec.sha256sum] = "ca35db6841586fc2c22dd9c07a7f5b8557f480fa907e8a3471b660d4ada76e40"
-
-SRC_URI[aachedec.md5sum] = "649f2e79b4950719295cfecbff2ea82b"
-SRC_URI[aachedec.sha256sum] = "34d19e40d624ccdc1b371f9a5d6594b4793bdf3b7223ac65912d15d75320e020"
-
-SRC_URI[g711.md5sum] = "fd8e9f939cc505dc5761705ed17a726c"
-SRC_URI[g711.sha256sum] = "c87021e8df2a3f494f47e5bdce8a5fad04d667aa1b792fd9b3ecff634867b48d"
-
-SRC_URI[i2p.md5sum] = "f67c04eec9ee49c7a686eecf5d54be33"
-SRC_URI[i2p.sha256sum] = "3fbf8801f3ce2aabb6d31eb18e1e24e41ca861696b3140536f1d66adc76f0323"
-
-
-TI_BIN_UNPK_CMDS = "Y:workdir"
-
-S = "${CODEC_SUITE_NAME}"
-
-DEPENDS = "ti-cgt6x ti-xdctools ti-dspbios ti-codec-engine ti-linuxutils"
-
-#generic codec
-DSPSUFFIX_omap3530 = "x64P"
-
-python do_unpack () {
-    bb.build.exec_func('base_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "omap3530_h264enc_2_01_013_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_h264enc_2_01_013_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "omap3530_h264dec_2_01_007_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_h264dec_2_01_007_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "omap3530_jpegenc_02_01_01_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_jpegenc_02_01_01_00_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "c64xplus_jpegdec_02_00_01_01_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_jpegdec_02_00_01_01_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "c64xplus_mpeg2dec_02_00_02_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "omap3530_mpeg4enc_02_04_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_mpeg4enc_02_04_00_00_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)   
-
-    bb.data.setVar("BINFILE", "c64xplus_mpeg4dec_02_01_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "c64xplus_aachedec_01_30_03_00_production.bin", d)
-    bb.data.setVar("TARFILE", "dm6446_aachedec_01_30_03_00_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "dm6446_g711enc_1_12_00_000_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "dm6446_g711dec_1_12_00_000_production.tar", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-    bb.data.setVar("BINFILE", "c64xplus_deinterlacer_01_00_00_07_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_deinterlacer_01_00_00_07/c64xplus_deinterlacer_01_00_00_07_production.tar", d)
-    bb.data.setVar("TI_BIN_UNPK_CMDS", "y: :q: ", d)
-    bb.build.exec_func('ti_bin_do_unpack', d)
-
-}
-
-addtask prepsources after do_unpack before do_patch
-
-do_prepsources () {
-
-    mkdir -p ${CODEC_SUITE_NAME}/packages/ti/sdo/server/cs
-    cp ${WORKDIR}/git/omap3530/cs1omap3530/rel-files/*  ${CODEC_SUITE_NAME}/  
-    cp ${WORKDIR}/git/omap3530/cs1omap3530/source/*  ${CODEC_SUITE_NAME}/packages/ti/sdo/server/cs
-    cp -a "${WORKDIR}/git/omap3530/cs1omap3530/docs"  ${CODEC_SUITE_NAME}/packages/ti/sdo/server/cs 
-
-    mkdir -p ${CODEC_SUITE_NAME}/packages/ti/sdo/codecs
-    cp -a "${WORKDIR}/omap3530_h264enc_2_01_013_production/packages/ti/sdo/codecs/h264enc" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/omap3530_h264dec_2_01_007_production/packages/ti/sdo/codecs/h264dec" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/omap3530_jpegenc_02_01_01_00_production/packages/ti/sdo/codecs/jpegenc" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/c64xplus_jpegdec_02_00_01_01_production/packages/ti/sdo/codecs/jpegdec" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/c64xplus_mpeg2dec_02_00_02_00_production/packages/ti/sdo/codecs/mpeg2dec" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/omap3530_mpeg4enc_02_04_00_00_production/packages/ti/sdo/codecs/mpeg4enc" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/c64xplus_mpeg4dec_02_01_00_00_production/packages/ti/sdo/codecs/mpeg4dec" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    chmod -R +w "${WORKDIR}/dm6446_aachedec_01_30_03_00_production/packages/ti/sdo/codecs/aachedec/docs"
-    cp -a "${WORKDIR}/dm6446_aachedec_01_30_03_00_production/packages/ti/sdo/codecs/aachedec" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/dm6446_g711enc_1_12_00_000_production/packages/ti/sdo/codecs/g711enc" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/dm6446_g711dec_1_12_00_000_production/packages/ti/sdo/codecs/g711dec" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    cp -a "${WORKDIR}/c64xplus_deinterlacer_01_00_00_07_production/packages/ti/sdo/codecs/deinterlacer" "${CODEC_SUITE_NAME}/packages/ti/sdo/codecs"
-    chmod 755 -R ${CODEC_SUITE_NAME}
-}
-
-do_compile() {
-
-    cd "${S}"
-
-    make \
-             CE_INSTALL_DIR=${CE_INSTALL_DIR} \
-             FC_INSTALL_DIR=${FC_INSTALL_DIR} \
-             LINK_INSTALL_DIR=${LINK_INSTALL_DIR} \
-             CMEM_INSTALL_DIR=${CMEM_INSTALL_DIR} \
-             LPM_INSTALL_DIR=${LPM_INSTALL_DIR} \
-             BIOS_INSTALL_DIR=${BIOS_INSTALL_DIR} \
-             CODEGEN_INSTALL_DIR=${CODEGEN_INSTALL_DIR} \
-             XDC_INSTALL_DIR=${XDC_INSTALL_DIR} \
-             CODEC_INSTALL_DIR="${S}" \
-             XDCARGS="prod" \
-             C6ACCEL_INSTALL_DIR=${C6ACCEL_INSTALL_DIR} \
-             clean
-
-    make \
-             CE_INSTALL_DIR=${CE_INSTALL_DIR} \
-             FC_INSTALL_DIR=${FC_INSTALL_DIR} \
-             LINK_INSTALL_DIR=${LINK_INSTALL_DIR} \
-             CMEM_INSTALL_DIR=${CMEM_INSTALL_DIR} \
-             LPM_INSTALL_DIR=${LPM_INSTALL_DIR} \
-             BIOS_INSTALL_DIR=${BIOS_INSTALL_DIR} \
-             CODEGEN_INSTALL_DIR=${CODEGEN_INSTALL_DIR} \
-             XDC_INSTALL_DIR=${XDC_INSTALL_DIR} \
-             CODEC_INSTALL_DIR="${S}" \
-             XDCARGS="prod" \
-             C6ACCEL_INSTALL_DIR=${C6ACCEL_INSTALL_DIR} \
-             all
-}
-
-do_install() {
-
-    install -d ${D}/${installdir}/ti-codecs-server
-    cd ${S}
-
-    # Install the DSP Server Binary 
-    for file in `find . -name *.${DSPSUFFIX}`; do
-        cp ${file} ${D}/${installdir}/ti-codecs-server
-    done
-
-    # Install docs (codec qualiTI test reports, server config datasheet, etc)
-    for file in `find . -name *.html`; do
-        cp ${file} ${D}/${installdir}/ti-codecs-server
-    done
-
-    install -d ${D}${CODEC_INSTALL_DIR_RECIPE}
-    cp -pPrf ${CODEC_SUITE_NAME}/* ${D}${CODEC_INSTALL_DIR_RECIPE}
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PACKAGES += "ti-codecs-omap3530-server"
-FILES_ti-codecs-omap3530-server = "${installdir}/ti-codecs-server/*"
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"
-- 
2.7.4


