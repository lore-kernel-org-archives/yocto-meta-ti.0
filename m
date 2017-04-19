Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18AC2E00AC8; Wed, 19 Apr 2017 03:30:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C08DFE00A38
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 03:30:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3JAUASs009266
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 05:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492597810;
	bh=jvbzyjFEOJ2HtScDlOcdYuHuEOqQVX/XI/0OLB4n75s=;
	h=From:To:CC:Subject:Date;
	b=OFgKDDsSrQ4ehcS+7maYrZl0PBTUMVdT55B7KtbMrBxNWYkZuTYHmYH0A3SmjmLAh
	ZE1RG58qelTEjqIu8PkPXvCwKGQm4Zl/388SM9bXAb4HLegL0eCJaN1hmjhTGoxcaB
	8OqTOPJtOYvW13AhQbnkd8agc1NcCFMcaP0ZnwMM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3JAU9W5001426
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 05:30:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 05:30:09 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3JAU7vK017044;
	Wed, 19 Apr 2017 05:30:08 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 19 Apr 2017 16:00:01 +0530
Message-ID: <1492597804-77037-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty 1/4] ti-cgt-arm: Include recipes for 16.9.1
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
X-List-Received-Date: Wed, 19 Apr 2017 10:30:15 -0000
Content-Type: text/plain

From: Ivan Pang <i-pang@ti.com>

Signed-off-by: Ivan Pang <i-pang@ti.com>
Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 classes/component_meta.bbclass          | 29 +++++++++++++++++++++++++++++
 recipes-ti/devtools/ti-cgt-arm-linux.bb | 26 ++++++++++++++++++++++++++
 recipes-ti/devtools/ti-cgt-arm.bb       | 26 ++++++++++++++++++++++++++
 recipes-ti/devtools/ti-cgt-arm.inc      | 19 +++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 classes/component_meta.bbclass
 create mode 100644 recipes-ti/devtools/ti-cgt-arm-linux.bb
 create mode 100644 recipes-ti/devtools/ti-cgt-arm.bb
 create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc

diff --git a/classes/component_meta.bbclass b/classes/component_meta.bbclass
new file mode 100644
index 0000000..f2dc754
--- /dev/null
+++ b/classes/component_meta.bbclass
@@ -0,0 +1,29 @@
+CM_NAME ?= ""
+CM_VERSION ?= ""
+CM_ROOT_DIR ?= ""
+CM_BINARY ?= ""
+CM_DESCRIPTION ?= ""
+
+do_component_meta() {
+    if [ ! -d "${DEPLOY_DIR_IMAGE}" ]
+    then
+        mkdir -p ${DEPLOY_DIR_IMAGE}    
+    fi
+
+    if [ ! -e "${DEPLOY_DIR_IMAGE}/.components_meta" ]
+    then
+        touch ${DEPLOY_DIR_IMAGE}/.components_meta
+    fi
+
+    # Check if component is already documented in .components_meta
+    if ! grep -q "${CM_ROOT_DIR}" ${DEPLOY_DIR_IMAGE}/.components_meta
+    then
+        # Add component meta information
+        echo "${CM_NAME}|${CM_VERSION}|${CM_ROOT_DIR}|${CM_BINARY}|${CM_DESCRIPTION}" >> \
+            ${DEPLOY_DIR_IMAGE}/.components_meta
+    fi
+}
+
+do_component_meta[lockfiles] = "${DEPLOY_DIR_IMAGE}/component_meta.lock"
+
+addtask do_component_meta after do_install before do_package
diff --git a/recipes-ti/devtools/ti-cgt-arm-linux.bb b/recipes-ti/devtools/ti-cgt-arm-linux.bb
new file mode 100644
index 0000000..dbb143c
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-arm-linux.bb
@@ -0,0 +1,26 @@
+include ti-cgt-arm.inc
+
+BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
+BINFILE_MD5 = "aa65a078eeddbf10e8e132a4cf1d58f0"
+BINFILE_SHA256 = "a372fd6f7b2608e11326b5c7438311aa37c7fbca0728b158cb9064a0666a8a05"
+
+do_install() {
+    cp ${S}/../${BINFILE} ${S}/${BINFILE_NAME}
+}
+
+inherit component_meta
+CM_NAME = "TI CGT ARM"
+CM_VERSION = "${PV}"
+CM_ROOT_DIR = "ti-cgt-arm_${PV}"
+CM_DESCRIPTION = "TI ARM code generation tools, including C/C++ compiler, linker, and run-time-support libraries"
+CM_BINARY = "${BINFILE_NAME}"
+
+deltask do_create_srcipk
+addtask create_srcipk after do_install before do_populate_sysroot
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "${CM_ROOT_DIR}"
+SRCIPK_SRC_DIR = "${S}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
diff --git a/recipes-ti/devtools/ti-cgt-arm.bb b/recipes-ti/devtools/ti-cgt-arm.bb
new file mode 100644
index 0000000..464374d
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-arm.bb
@@ -0,0 +1,26 @@
+include ti-cgt-arm.inc
+
+S = "${WORKDIR}/ti-cgt-arm-${PV}"
+
+require recipes-ti/includes/ti-unpack.inc
+require recipes-ti/includes/ti-staging.inc
+require recipes-ti/includes/ti-paths.inc
+
+TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
+BINFILE_MD5 = "aa65a078eeddbf10e8e132a4cf1d58f0"
+BINFILE_SHA256 = "a372fd6f7b2608e11326b5c7438311aa37c7fbca0728b158cb9064a0666a8a05"
+
+do_install() {
+    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
+    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
new file mode 100644
index 0000000..195d59e
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-arm.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "TI ARM Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
+
+LIC_FILES_CHKSUM = "file://../${BINFILE};md5=${BINFILE_MD5}"
+
+PV = "16.9.1"
+PE = "0"
+
+BINFILE_NAME = "cgt_arm_installer"
+
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
+
+SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
+SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
+
+FILES_${PN} += "${S}/*"
+
+INSANE_SKIP_${PN} += "arch staticdev"
-- 
1.9.1


