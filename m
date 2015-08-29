Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1287DE00CAD; Fri, 28 Aug 2015 17:04:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 816A7E00CAE
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 17:04:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B2FA552AB6; Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150829000430.B2FA552AB6@arago-project.org>
Date: Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : omapdrm-pvr: add AM3 and AM4 which use null_window DRM
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
X-List-Received-Date: Sat, 29 Aug 2015 00:04:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: cd24ef18557329695bc9242e810c7388833a2f1b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cd24ef18557329695bc9242e810c7388833a2f1b

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Sat Aug 29 02:08:31 2015 +0000

omapdrm-pvr: add AM3 and AM4 which use null_window DRM

Bumped driver revs to match latest kernel patches.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   26 ++++++++++++++++----
 1 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index e2d01cd..0978b43 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -5,22 +5,38 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bf
 
 inherit module
 
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
 MACHINE_KERNEL_PR_append = "h"
 PR = "${MACHINE_KERNEL_PR}"
 
-BRANCH = "dra7/k4.1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH_omap-a15 = "dra7/k4.1"
+BRANCH_ti33x = "am4/k4.1"
+BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
+SRCREV_omap-a15 = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
+SRCREV_ti33x = "696eaf6cff0e4ab6abedc3ff639ec158f8a6177f"
+SRCREV_ti43x = "696eaf6cff0e4ab6abedc3ff639ec158f8a6177f"
+
+PVR_NULLDRM_ti33x = "1"
+PVR_NULLDRM_ti43x = "1"
+PVR_NULLDRM_omap-a15 = "0"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" PVR_NULLDRM=${PVR_NULLDRM}'
 
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
+DEVICE_SUB_DIR_omap-a15 = "omap5430"
+DEVICE_SUB_DIR_ti33x = "omap335x"
+DEVICE_SUB_DIR_ti43x = "omap437x"
 
 do_compile_prepend() {
-    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap5430_linux
+    cd ${S}/eurasia_km/eurasiacon/build/linux2/${DEVICE_SUB_DIR}_linux
 }
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_${DEVICE_SUB_DIR}_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
 }


