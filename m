Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87C2C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 11:22:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10868.1708514558792832711
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 03:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GQWIJwae;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41LBMcRi037577
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Feb 2024 05:22:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708514558;
	bh=O1vjYjZQq33by1P9Qh3QYX5MbKCuPDJsxo3TGwOL0Zo=;
	h=From:To:CC:Subject:Date;
	b=GQWIJwaeOpj3G9UfZVjjdSo565X7y6snEYClL+TD5IXN4e0UvKlnYbRFY6BFcitR9
	 O6LTL3EitB9H1CJ9rbChtERLOAkdD7mBzXHCfJQh7xPtCoq9eehSy43V94awXsrLEa
	 u9p6HCPwXZRsFKINWOW3AnoMEYGrwakIQFbFtBCo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41LBMcdV079749
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Feb 2024 05:22:38 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Feb 2024 05:22:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Feb 2024 05:22:37 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41LBMaND080474;
	Wed, 21 Feb 2024 05:22:37 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] Rework jailhouse recipe to support different image build
Date: Wed, 21 Feb 2024 16:52:18 +0530
Message-ID: <20240221112218.321332-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Feb 2024 11:22:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17490

This patch moves the jailhouse recipe general variables to a
ti-jailhouse.inc file along with fetch and compile task.
Jailhouse repo also contains some demo applications which can
be packaged alone in filesytem and does not require packaging
jailhouse module, firmware and tool.

So add a new recipe jailhouse-inmate which can be used to only
package those demos. The existing jailhouse recipe will contain
variables and other dependencies needed for do_install task for
jailhouse module, tools, demos etc. The do_install of jailhouse
inmate recipe will only package demo applications.

This new recipe(jailhouse-inmate) will be added to a new image
in meta-arago. The new image will be used for jailhouse second
linux instance or cell.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-ti/jailhouse/jailhouse-arch.inc   | 22 -----
 .../recipes-ti/jailhouse/jailhouse-inmate.bb  | 12 +++
 .../recipes-ti/jailhouse/jailhouse_git.bb     | 78 ++---------------
 .../recipes-ti/jailhouse/ti-jailhouse.inc     | 87 +++++++++++++++++++
 4 files changed, 104 insertions(+), 95 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc
 create mode 100644 meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
 create mode 100644 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc
deleted file mode 100644
index 498b25ed..00000000
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-# Set jailhouse architecture JH_ARCH variable
-#
-# return value must match one of architectures supported by jailhouse
-#
-valid_jh_archs = "x86 arm"
-
-def map_jh_arch(a, d):
-    import re
-
-    valid_jh_archs = d.getVar('valid_jh_archs', True).split()
-
-    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
-    elif re.match('armeb$', a):                 return 'arm'
-    elif re.match('aarch64$', a):               return 'arm64'
-    elif re.match('aarch64_be$', a):            return 'arm64'
-    elif a in valid_jh_archs:                   return a
-    else:
-        bb.error("cannot map '%s' to a jailhouse supported architecture" % a)
-
-export JH_ARCH = "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
-
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
new file mode 100644
index 00000000..39654a53
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
@@ -0,0 +1,12 @@
+require ti-jailhouse.inc
+
+do_install() {
+
+	install -d ${D}${bindir}
+	install -m 0755 ${TOOLS_SRC_DIR}/demos/ivshmem-demo ${D}${bindir}
+
+}
+
+FILES:${PN} = " \
+    ${bindir}/ivshmem-demo \
+"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 70d6a0b6..98ec0e9e 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -1,49 +1,11 @@
-SUMMARY = "Linux-based partitioning hypervisor"
-DESCRIPTION = "Jailhouse is a partitioning Hypervisor based on Linux. It is able to run bare-metal applications or (adapted) \
-operating systems besides Linux. For this purpose, it configures CPU and device virtualization features of the hardware \
-platform in a way that none of these domains, called 'cells' here, can interfere with each other in an unacceptable way."
-HOMEPAGE = "https://github.com/siemens/jailhouse"
-SECTION = "jailhouse"
-LICENSE = "GPL-2.0-only & BSD-2-Clause"
-
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
-"
-
-COMPATIBLE_MACHINE = "am62xx|am62pxx"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-PV = "0.12+git${SRCPV}"
-SRCREV = "0b29ad90f6f54105b98d6bbf35cc47fb244f7799"
-BRANCH = "master"
-
-SRC_URI = " \
-    git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
-"
+require ti-jailhouse.inc
 
-DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
 RDEPENDS:${PN} += "\
-	python3-curses\
-	python3-datetime\
-	python3-mmap\
+        python3-curses\
+        python3-datetime\
+        python3-mmap\
 "
 
-require jailhouse-arch.inc
-inherit module python3native bash-completion deploy setuptools3
-
-S = "${WORKDIR}/git"
-B = "${S}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "(ti-soc)"
-
-JH_DATADIR ?= "${datadir}/jailhouse"
-JH_EXEC_DIR ?= "${libexecdir}/jailhouse"
-CELL_DIR ?= "${JH_DATADIR}/cells"
-CELLCONF_DIR ?= "${JH_DATADIR}/configs"
-INMATES_DIR ?= "${JH_DATADIR}/inmates"
-
 JH_CELL_FILES ?= "*.cell"
 JH_CELL_FILES:k3 ?= "k3-*.cell"
 JH_CELL_FILES:am62xx ?= "k3-am625-*.cell"
@@ -63,13 +25,6 @@ JH_LINUX_DEMO_CELL:am62pxx ?= "k3-am62p5-sk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7 ?= "k3-j721e-evm-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7200-evm ?= "k3-j7200-evm-linux-demo.cell"
 
-JH_SYSCONFIG_CELL ?= ""
-JH_SYSCONFIG_CELL:am62xx ?= "k3-am625-sk.cell"
-JH_SYSCONFIG_CELL:am65xx ?= "k3-am654-idk.cell"
-JH_SYSCONFIG_CELL:am62pxx ?= "k3-am62p5-sk.cell"
-JH_SYSCONFIG_CELL:j7 ?= "k3-j721e-evm.cell"
-JH_SYSCONFIG_CELL:j7200-evm ?= "k3-j7200-evm.cell"
-
 INITRAMFS_IMAGE ?= ""
 JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
 
@@ -80,29 +35,7 @@ JH_CMDLINE:am65xx ?= "console=ttyS1,115200n8"
 JH_CMDLINE:j7 ?= "console=ttyS3,115200n8"
 JH_CMDLINE:j7200-evm ?= "console=ttyS3,115200n8"
 
-do_configure() {
-	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
-	then
-		cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
-	fi
-}
-
-USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
-                    -DJAILHOUSE_VERSION=\\\"$JAILHOUSE_VERSION\\\" \
-                    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
-                    -I../driver'
-
-TOOLS_SRC_DIR = "${S}/tools"
-
-EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR}"
-
-do_compile() {
-	oe_runmake V=1
-}
-
 do_install() {
-	# Install pyjailhouse python modules needed by the tools
-	# distutils3_do_install
 
 	# We want to install the python tools, but we do not want to use pip...
 	# At least with v0.10, we can work around this with
@@ -154,7 +87,7 @@ do_install() {
 }
 
 PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
-FILES:${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
+
 FILES:pyjailhouse = "${PYTHON_SITEPACKAGES_DIR}"
 FILES:${PN}-tools = "${libexecdir}/${BPN}/${BPN}-*"
 
@@ -183,7 +116,6 @@ python __anonymous () {
         d.appendVar('RDEPENDS_${PN}', ' ' + cell)
 }
 
-
 FILES:${PN} = " \
     /boot/* \
     /usr/libexec \
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
new file mode 100644
index 00000000..a63891bf
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -0,0 +1,87 @@
+SUMMARY = "Linux-based partitioning hypervisor"
+DESCRIPTION = "Jailhouse is a partitioning Hypervisor based on Linux. It is able to run bare-metal applications or (adapted) \
+operating systems besides Linux. For this purpose, it configures CPU and device virtualization features of the hardware \
+platform in a way that none of these domains, called 'cells' here, can interfere with each other in an unacceptable way."
+HOMEPAGE = "https://github.com/siemens/jailhouse"
+SECTION = "jailhouse"
+
+LICENSE = "GPL-2.0-only & BSD-2-Clause"
+
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
+"
+
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
+TARGET_CC_ARCH += "${LDFLAGS}"
+PV = "0.12+git${SRCPV}"
+SRCREV = "0b29ad90f6f54105b98d6bbf35cc47fb244f7799"
+BRANCH = "master"
+SRC_URI = " \
+    git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
+"
+
+# Set jailhouse architecture JH_ARCH variable
+#
+# return value must match one of architectures supported by jailhouse
+#
+valid_jh_archs = "x86 arm"
+
+def map_jh_arch(a, d):
+    import re
+
+    valid_jh_archs = d.getVar('valid_jh_archs', True).split()
+
+    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
+    elif re.match('armeb$', a):                 return 'arm'
+    elif re.match('aarch64$', a):               return 'arm64'
+    elif re.match('aarch64_be$', a):            return 'arm64'
+    elif a in valid_jh_archs:                   return a
+    else:
+        bb.error("cannot map '%s' to a jailhouse supported architecture" % a)
+
+export JH_ARCH = "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
+
+inherit module python3native bash-completion deploy setuptools3
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "(ti-soc)"
+
+JH_DATADIR ?= "${datadir}/jailhouse"
+JH_EXEC_DIR ?= "${libexecdir}/jailhouse"
+CELL_DIR ?= "${JH_DATADIR}/cells"
+CELLCONF_DIR ?= "${JH_DATADIR}/configs"
+INMATES_DIR ?= "${JH_DATADIR}/inmates"
+
+JH_SYSCONFIG_CELL ?= ""
+JH_SYSCONFIG_CELL:am62xx ?= "k3-am625-sk.cell"
+JH_SYSCONFIG_CELL:am65xx ?= "k3-am654-idk.cell"
+JH_SYSCONFIG_CELL:am62pxx ?= "k3-am62p5-sk.cell"
+JH_SYSCONFIG_CELL:j7 ?= "k3-j721e-evm.cell"
+JH_SYSCONFIG_CELL:j7200-evm ?= "k3-j7200-evm.cell"
+
+do_configure() {
+        if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
+        then
+            cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
+        fi
+}
+
+USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
+                    -DJAILHOUSE_VERSION=\\\"$JAILHOUSE_VERSION\\\" \
+                    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
+                    -I../driver'
+
+TOOLS_SRC_DIR = "${S}/tools"
+
+EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR}"
+
+do_compile() {
+        oe_runmake V=1
+}
-- 
2.34.1


