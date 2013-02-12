Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 245E5E006CB
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 15:25:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DB13252ABC; Tue, 12 Feb 2013 23:25:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130212232525.DB13252ABC@arago-project.org>
Date: Tue, 12 Feb 2013 23:25:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : ti-ocf-crypto-module: Port ti-ocf-crypto-module from Arago
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
X-List-Received-Date: Tue, 12 Feb 2013 23:25:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 15420045f6c396ffc5e0af431f7a43d5d238f4b1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=15420045f6c396ffc5e0af431f7a43d5d238f4b1

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Feb 11 19:04:41 2013 -0600

ti-ocf-crypto-module: Port ti-ocf-crypto-module from Arago

* Recipe pulls in ti-ocf-crypto-module from gforge
* For am37x, this module allows access to the crypto hardware accelerators
  through OCF-Linux.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ti-ocf-crypto-module_1.0.bb                    |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
new file mode 100644
index 0000000..ece63d0
--- /dev/null
+++ b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Builds Crypto module used by OCF-Linux driver in OpenSSL example applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/arm_crypto/"
+LICENSE = "BSD & GPLv2"
+LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=16;md5=acc0590f80e72fd64ad5c16cad8f4f76 \
+                    file://ocf_omap3_crypto.c;beginline=436;endline=438;md5=a52cad5c37c3aa3f27c6391552967304"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm"
+
+DEPENDS += "virtual/kernel"
+
+SRC_URI = "svn://gforge.ti.com/svn/arm_crypto/;module=trunk;protocol=https;user=anonymous;pswd=''"
+
+#gforge source revision
+SRCREV = "17"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+S = "${WORKDIR}/trunk"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
+
+do_compile_prepend () {
+    sed -i "s/arm-none-linux-gnueabi-/${TARGET_PREFIX}/g" ${S}/Makefile
+}
+
+do_install () {
+        install -d ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
+        install -m 0755 ${S}/ocf_omap3_cryptok.ko ${D}/lib/modules/${KERNEL_VERSION}/crypto/ocf/
+}
+
+FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/crypto/ocf/ocf_omap3_cryptok.ko"


