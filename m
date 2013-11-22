Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E0ABE005BB
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 23:49:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EA8A45299D; Fri, 22 Nov 2013 07:49:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122074946.EA8A45299D@arago-project.org>
Date: Fri, 22 Nov 2013 07:49:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes-bsp: add recipe for PowerVR SGX544MP2 kernel drivers
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
X-List-Received-Date: Fri, 22 Nov 2013 07:49:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3c401ae6d9f694827b06b2e8a06511b33d072623
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3c401ae6d9f694827b06b2e8a06511b33d072623

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 22 02:46:17 2013 -0500

recipes-bsp: add recipe for PowerVR SGX544MP2 kernel drivers

* The PowerVR SGX544MP2 is found on omap5 and dra7xx devices. This
  recipe adds support for the PowerVR graphics subsystem.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
new file mode 100644
index 0000000..24aadd5
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -0,0 +1,24 @@
+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://MIT-COPYING;md5=8c2810fa6bfdc5ae5c15a0c1ade34054"
+
+inherit module
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git"
+S = "${WORKDIR}/git"
+
+SRCREV = "86a4ffae3458c51f0a58e44b17b7a4fd92d2b8c6"
+PR = "${MACHINE_KERNEL_PR}"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
+
+do_compile_prepend() {
+    cd ${S}/eurasiacon/build/linux2/omap5430_linux
+}
+
+do_install() {
+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/extra/
+    cp ${S}/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapdrm_pvr.ko \
+    ${D}/lib/modules/${KERNEL_VERSION}/extra/
+}


