Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7694.1623755669346234155
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 04:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=THPC8YF+;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 29BC638C070D
	for <meta-ti@yoctoproject.org>; Tue, 15 Jun 2021 11:14:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15FBER3c019175;
	Tue, 15 Jun 2021 06:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623755667;
	bh=hxsQPl2qAHRSI8EWOnMIUxQg/00T8t2sbDivQaZ31Hw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=THPC8YF+NBIgsAbliIrh2bZZdR8VShCW5c4ZB+HlPeJ7wC4WESSMrZHuai/svvv5I
	 X4p7H4MN2SDXUlFDMXX2P4lSXRUB7LX9kUOfj4L3ki8TCbT/oToxs/+00/ugoAp7X0
	 HqV0qkPRaBv0QNd+tkP27q9e+MZFNcm9gOVty7Po=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15FBER78017598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Jun 2021 06:14:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 15
 Jun 2021 06:14:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 15 Jun 2021 06:14:27 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15FBD0Go081387;
	Tue, 15 Jun 2021 06:14:25 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell/master 2/2] recipes-kernel: jailhouse: Remove jailhouse recipe
Date: Tue, 15 Jun 2021 16:42:44 +0530
Message-ID: <20210615111244.24807-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210615111244.24807-1-nikhil.nd@ti.com>
References: <20210615111244.24807-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Jailhouse support is dropped for K3 platforms, remove the
recipe and corresponding patches.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse-arch.inc   |  22 ---
 ...hebang-in-helper-scripts-for-python3.patch |  56 ------
 recipes-kernel/jailhouse/jailhouse_git.bb     | 168 ------------------
 3 files changed, 246 deletions(-)
 delete mode 100644 recipes-kernel/jailhouse/jailhouse-arch.inc
 delete mode 100644 recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch
 delete mode 100644 recipes-kernel/jailhouse/jailhouse_git.bb

diff --git a/recipes-kernel/jailhouse/jailhouse-arch.inc b/recipes-kernel/jailhouse/jailhouse-arch.inc
deleted file mode 100644
index 498b25ed..00000000
--- a/recipes-kernel/jailhouse/jailhouse-arch.inc
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
diff --git a/recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch b/recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch
deleted file mode 100644
index f4922363..00000000
--- a/recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 24e58c75592a2ba09f3062c8a4722c0e29a9b558 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Wed, 1 Apr 2020 15:44:46 -0400
-Subject: [PATCH] tools: update shebang in helper scripts for python3
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- tools/jailhouse-cell-linux     | 2 +-
- tools/jailhouse-cell-stats     | 2 +-
- tools/jailhouse-config-create  | 2 +-
- tools/jailhouse-hardware-check | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
-index 007a5c4..e106b9d 100755
---- a/tools/jailhouse-cell-linux
-+++ b/tools/jailhouse-cell-linux
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- 
- # Jailhouse, a Linux-based partitioning hypervisor
- #
-diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
-index 2f7e966..4c5289f 100755
---- a/tools/jailhouse-cell-stats
-+++ b/tools/jailhouse-cell-stats
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- 
- # Jailhouse, a Linux-based partitioning hypervisor
- #
-diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
-index 1e2df74..9382b05 100755
---- a/tools/jailhouse-config-create
-+++ b/tools/jailhouse-config-create
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Jailhouse, a Linux-based partitioning hypervisor
- #
-diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
-index 375816e..658ce6f 100755
---- a/tools/jailhouse-hardware-check
-+++ b/tools/jailhouse-hardware-check
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- 
- # Jailhouse, a Linux-based partitioning hypervisor
- #
--- 
-2.7.4
-
diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
deleted file mode 100644
index 1011f286..00000000
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ /dev/null
@@ -1,168 +0,0 @@
-SUMMARY = "Linux-based partitioning hypervisor"
-DESCRIPTION = "Jailhouse is a partitioning Hypervisor based on Linux. It is able to run bare-metal applications or (adapted) \
-operating systems besides Linux. For this purpose, it configures CPU and device virtualization features of the hardware \
-platform in a way that none of these domains, called 'cells' here, can interfere with each other in an unacceptable way."
-HOMEPAGE = "https://github.com/siemens/jailhouse"
-SECTION = "jailhouse"
-LICENSE = "GPL-2.0 & BSD-2-Clause"
-
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
-"
-
-PV = "0.12+git${SRCPV}"
-SRCREV = "0d059b6f2c3efeaa2466517300540498b34b7655"
-BRANCH = "ti-jailhouse-0.12"
-
-SRC_URI = " \
-    git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
-    file://0001-tools-update-shebang-in-helper-scripts-for-python3.patch \
-"
-
-DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
-RDEPENDS_${PN} += "\
-	python3-curses\
-	python3-datetime\
-	python3-mmap\
-"
-
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
-JH_CELL_FILES ?= "*.cell"
-JH_CELL_FILES_k3 ?= "k3-*.cell"
-
-JH_INMATE_DTB ?= ""
-JH_INMATE_DTB_am65xx ?= "inmate-k3-am654-idk.dtb"
-JH_INMATE_DTB_j7 ?= "inmate-k3-j721e-evm.dtb"
-JH_INMATE_DTB_j7200-evm ?= "inmate-k3-j7200-evm.dtb"
-
-JH_LINUX_DEMO_CELL ?= ""
-JH_LINUX_DEMO_CELL_am65xx ?= "k3-am654-idk-linux-demo.cell"
-JH_LINUX_DEMO_CELL_j7 ?= "k3-j721e-evm-linux-demo.cell"
-JH_LINUX_DEMO_CELL_j7200-evm ?= "k3-j7200-evm-linux-demo.cell"
-
-JH_SYSCONFIG_CELL ?= ""
-JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
-JH_SYSCONFIG_CELL_j7 ?= "k3-j721e-evm.cell"
-JH_SYSCONFIG_CELL_j7200-evm ?= "k3-j7200-evm.cell"
-
-INITRAMFS_IMAGE ?= ""
-JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
-
-JH_CMDLINE ?= ""
-JH_CMDLINE_am65xx ?= "console=ttyS1,115200n8"
-JH_CMDLINE_j7 ?= "console=ttyS3,115200n8"
-JH_CMDLINE_j7200-evm ?= "console=ttyS3,115200n8"
-
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
-do_install() {
-	# Install pyjailhouse python modules needed by the tools
-	distutils3_do_install
-
-	# We want to install the python tools, but we do not want to use pip...
-	# At least with v0.10, we can work around this with
-	# 'PIP=":" PYTHON_PIP_USEABLE=yes'
-	oe_runmake PIP=: PYTHON=python3 PYTHON_PIP_USEABLE=yes DESTDIR=${D} install
-
-	install -d ${D}${CELL_DIR}
-	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
-
-	install -d ${D}${INMATES_DIR}
-	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
-
-	install -d ${D}/boot
-	if [ -n "${JH_RAMFS_IMAGE}" ]
-	then
-		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
-		then
-			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
-		else
-			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
-			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
-		fi
-	fi
-
-	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
-		cd ${TOOLS_SRC_DIR}
-
-		echo "#! /bin/sh" > ${D}${JH_DATADIR}/linux-demo.sh
-		echo "jailhouse enable ${CELL_DIR}/${JH_SYSCONFIG_CELL}" >> ${D}${JH_DATADIR}/linux-demo.sh
-		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
-			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
-			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
-			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
-			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
-			${DEPLOY_DIR_IMAGE}/Image \
-			| tr -cd '\11\12\15\40-\176' \
-			>> ${D}${JH_DATADIR}/linux-demo.sh
-
-		sed -i -e 's,^Modified device tree written.*,,g' ${D}${JH_DATADIR}/linux-demo.sh
-		sed -i -e 's,\${D},,g' ${D}${JH_DATADIR}/linux-demo.sh
-		sed -i -e 's, linux-loader.bin, ${JH_EXEC_DIR}/linux-loader.bin,g' ${D}${JH_DATADIR}/linux-demo.sh
-		sed -i -e 's,\${DEPLOY_DIR_IMAGE},/boot,g' ${D}${JH_DATADIR}/linux-demo.sh
-		sed -i -e '/^\s*$/d' ${D}${JH_DATADIR}/linux-demo.sh
-		chmod +x ${D}${JH_DATADIR}/linux-demo.sh
-	fi
-}
-
-PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
-FILES_${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
-FILES_pyjailhouse = "${PYTHON_SITEPACKAGES_DIR}"
-FILES_${PN}-tools = "${libexecdir}/${BPN}/${BPN}-*"
-
-RDEPENDS_${PN}-tools = "pyjailhouse python3-mmap python3-math python3-datetime python3-curses python3-compression"
-RDEPENDS_pyjailhouse = "python3-core python3-ctypes python3-fcntl python3-shell"
-
-RRECOMMENDS_${PN} = "${PN}-tools"
-
-INSANE_SKIP_${PN} = "ldflags"
-
-KERNEL_MODULE_AUTOLOAD += "jailhouse"
-
-# Any extra cells/inmates from external recipes/packages
-CELLS = ""
-
-python __anonymous () {
-    d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
-    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
-    if ramfs:
-        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
-
-    # Setup DEPENDS and RDEPENDS to included cells
-    cells = d.getVar('CELLS', True) or ""
-    for cell in cells.split():
-        d.appendVar('DEPENDS', ' ' + cell)
-        d.appendVar('RDEPENDS_${PN}', ' ' + cell)
-}
-- 
2.17.1

