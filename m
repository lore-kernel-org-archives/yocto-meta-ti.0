Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79563E00E88; Tue, 23 Aug 2016 11:40:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC7B3E00D89
	for <meta-ti@yoctoproject.org>; Tue, 23 Aug 2016 11:40:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EA30752A1A; Tue, 23 Aug 2016 18:40:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160823184029.EA30752A1A@arago-project.org>
Date: Tue, 23 Aug 2016 18:40:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gowtham Tammana : ti-gc320-driver: recipe for gc320 kernel mode driver
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
X-List-Received-Date: Tue, 23 Aug 2016 18:40:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 30e001db25b8d66a51aa8071e274d00df390e798
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=30e001db25b8d66a51aa8071e274d00df390e798

Author: Gowtham Tammana <g-tammana@ti.com>
Date:   Tue Aug 23 00:14:58 2016 +0000

ti-gc320-driver: recipe for gc320 kernel mode driver

Kernel drivers for the Vivante GC320 chipset found in TI SoCs

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
new file mode 100644
index 0000000..9344e30
--- /dev/null
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Kernel drivers for the Vivante GC320 chipset found in TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-driver"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+# Need to branch out with ${PV} var
+BRANCH = "ti-${PV}-k4.4"
+
+SRCREV = "7a2b06ad1df46a274336f7ae0e24a9d67e72cd66"
+
+SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git/src"
+
+EXTRA_OEMAKE += "-f Kbuild AQROOT=${S} KERNEL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH}"
+
+do_install() {
+    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+    install -m 644 ${S}/galcore.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+}


