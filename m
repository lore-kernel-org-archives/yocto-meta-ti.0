Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C79DDE0153D
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 05:31:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61CVeDd020349
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:31:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61CVe3T005369
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:31:40 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 07:31:39 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61CVcjN012411;
	Mon, 1 Jul 2013 07:31:39 -0500
Date: Mon, 1 Jul 2013 18:01:38 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130701123138.GA16101@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 1/2] recipes-bsp: Add recipe for PowerVR SGX544MP2 kernel drivers
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
X-List-Received-Date: Mon, 01 Jul 2013 12:31:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* The PowerVR SGX544MP2 is found on omap5 and dra7xx devices. This
  recipe adds support for the PowerVR graphics subsystem.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
new file mode 100644
index 0000000..edb2682
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -0,0 +1,42 @@
+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://MIT-COPYING;md5=8c2810fa6bfdc5ae5c15a0c1ade34054"
+
+inherit module 
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git"
+S = "${WORKDIR}/git"
+
+SRCREV = "6668f4ea0bbf7e3df7f72dc2230ab8da1e748b2d"
+PR = "${MACHINE_KERNEL_PR}"
+
+do_compile() {
+    cd ${S}/eurasiacon/build/linux2/omap5430_linux
+    oe_runmake KERNELDIR="${STAGING_KERNEL_DIR}"
+}
+
+do_install() {
+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/extra/
+    cp ${S}/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapdrm_pvr.ko \ 
+    ${D}/lib/modules/${KERNEL_VERSION}/extra/
+}
+
+FILES_omapdrm-pvr = "/lib/modules/${KERNEL_VERSION}/extra/omapdrm_pvr.ko"
+RDEPENDS_omapdrm-pvr += "update-modules"
+
+pkg_postinst_omapdrm-pvr () {
+#!/bin/sh
+if [ -n "$D" ]; then
+        exit 1
+fi
+
+depmod -a
+update-modules || true
+}
+
+pkg_postrm_omapdrm-pvr () {
+#!/bin/sh
+update-modules || true
+}
-- 
1.7.0.4


