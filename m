Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AA28E00D59; Mon, 29 Feb 2016 13:16:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2604E00951
	for <meta-ti@yoctoproject.org>; Mon, 29 Feb 2016 13:16:22 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A07A52A9F; Mon, 29 Feb 2016 21:16:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160229211622.2A07A52A9F@arago-project.org>
Date: Mon, 29 Feb 2016 21:16:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omapdrm_pvr: remove version 1.9. 2253347 as replaced by 1.14.3699939
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
X-List-Received-Date: Mon, 29 Feb 2016 21:16:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 79614c6d3496458c4f2927820ff10f20d7b85ac6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=79614c6d3496458c4f2927820ff10f20d7b85ac6

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Mon Feb 29 12:42:38 2016 +0000

omapdrm_pvr: remove version 1.9.2253347 as replaced by 1.14.3699939

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   42 --------------------
 1 files changed, 0 insertions(+), 42 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
deleted file mode 100644
index 4552fe1..0000000
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
-HOMEPAGE = "http://git.ti.com"
-LICENSE = "MIT | GPLv2"
-LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bfc03386bb4d8d9381b79d33898"
-
-inherit module
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-
-MACHINE_KERNEL_PR_append = "i"
-PR = "${MACHINE_KERNEL_PR}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-BRANCH_omap-a15 = "dra7/k4.1"
-BRANCH_ti33x = "am4/k4.1"
-BRANCH_ti43x = "am4/k4.1"
-
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
-S = "${WORKDIR}/git"
-
-SRCREV_omap-a15 = "c53a5dfb9f4d5612c372ec8e252cb13a731c9c10"
-SRCREV_ti33x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
-SRCREV_ti43x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
-
-PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "0"
-PVR_NULLDRM_omap-a15 = "0"
-
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" PVR_NULLDRM=${PVR_NULLDRM}'
-
-DEVICE_SUB_DIR_omap-a15 = "omap5430"
-DEVICE_SUB_DIR_ti33x = "omap335x"
-DEVICE_SUB_DIR_ti43x = "omap437x"
-
-do_compile_prepend() {
-    cd ${S}/eurasia_km/eurasiacon/build/linux2/${DEVICE_SUB_DIR}_linux
-}
-
-do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_${DEVICE_SUB_DIR}_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
-}


