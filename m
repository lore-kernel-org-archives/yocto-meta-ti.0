Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01BC8E006C3
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 15:26:46 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 856D152AB8; Tue, 12 Feb 2013 23:26:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130212232645.856D152AB8@arago-project.org>
Date: Tue, 12 Feb 2013 23:26:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : ti-pru-sw-edma-driver: Port PRU SW edma driver from Arago
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
X-List-Received-Date: Tue, 12 Feb 2013 23:26:46 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: b32bde478266ae7ae71de52dafff25dc5763b8e8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b32bde478266ae7ae71de52dafff25dc5763b8e8

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Feb 11 19:04:39 2013 -0600

ti-pru-sw-edma-driver: Port PRU SW edma driver from Arago

* Add PRU SW edma driver recipe for the omapl138 machines

* This recipe builds and installs an edma driver module that supports the
  edma user space libraries built by the ti-pru-sw-edma-library recipe.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb |   32 ++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
new file mode 100644
index 0000000..c7fdfd1
--- /dev/null
+++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Builds eDMA module used by eDMA libraries for PRU sw example applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://edmautils.c;beginline=1;endline=23;md5=312e9cb8a37a044c617c98a9e980ad1b"
+
+COMPATIBLE_MACHINE = "omapl138"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
+
+SRCREV = "33"
+
+S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
+
+inherit module
+
+EXTRA_OEMAKE += "KERNEL_DIR='${STAGING_KERNEL_DIR}'"
+
+do_compile_prepend () {
+        export CCTOOL_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}"
+}
+
+do_install () {
+        install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru
+        install -m 0755 ${S}/edmautils.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/
+}
+
+FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/edmautils.ko"


