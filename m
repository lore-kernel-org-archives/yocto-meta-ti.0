Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9DCEE00838; Mon, 15 Feb 2016 14:27:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FC75E0079A
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 14:27:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 693BD52A8B; Mon, 15 Feb 2016 22:27:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160215222717.693BD52A8B@arago-project.org>
Date: Mon, 15 Feb 2016 22:27:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omapdrm_pvr: SGX kernel mode driver v1. 14 for all TI SoCs
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
X-List-Received-Date: Mon, 15 Feb 2016 22:27:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: e64d04812d46afaef60483a2c97bb708fff7c42e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e64d04812d46afaef60483a2c97bb708fff7c42e

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Sat Feb 13 20:30:36 2016 +0000

omapdrm_pvr: SGX kernel mode driver v1.14 for all TI SoCs

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.14.3699939.bb    |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
new file mode 100644
index 0000000..e6e4e5d
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
@@ -0,0 +1,34 @@
+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
+
+inherit module
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
+MACHINE_KERNEL_PR_append = "i"
+PR = "${MACHINE_KERNEL_PR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH = "ti-img-sgx/${PV}/k4.1"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git"
+
+SRCREV = "fed0756f1b8b9d526da2821635c7d742989d47c3"
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
+
+do_compile_prepend() {
+    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
+}
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+}


