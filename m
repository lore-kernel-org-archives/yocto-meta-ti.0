Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B71FFE00D44; Mon, 16 Oct 2017 20:20:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0E42E00D24
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 20:20:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9H3K5SV028021
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 22:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508210405;
	bh=pqHrB/QUWhsUd4KpjOm2u6v3NtdXrriaAQHKbMDt6/0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hB87PcL+wl+Qb+5pLkSVr6UsjVxVnXuEygR5AE0aJI/tzqyRglw17BMqmuNe8aij9
	IoelJz3BMCuehRy+QKULiPONt5qJby8fDRBnQFdF4+pcbXQ19Uv79ni0FVdGnu76ZP
	QFHSbUjCnO565PrEhuYakvYdY92GpUti/+ykyNrc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3K0j1024683
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 22:20:00 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 22:20:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 22:20:00 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3Js4N023854;
	Mon, 16 Oct 2017 22:20:00 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 16 Oct 2017 23:19:52 -0400
Message-ID: <1508210393-54841-4-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1508210393-54841-1-git-send-email-sam.nelson@ti.com>
References: <1508210393-54841-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2 4/5] ti-ipc: Update to new version 3.47.00.00
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
X-List-Received-Date: Tue, 17 Oct 2017 03:20:22 -0000
Content-Type: text/plain

Needs BIOS 6_52_00_12 and in turn needs gcc tools gcc-arm-none-
eabi-6-2017-q1-update

ti-ipc-examples: Separate Host linux and bios examples

This should save some build time as well, as ti-ipc-examples-linux will
only build linux host examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc            |  4 +-
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb | 48 +++++++++++++++++++++
 recipes-ti/ipc/ti-ipc-examples.inc          | 31 ++++++++++++++
 recipes-ti/ipc/ti-ipc-examples_git.bb       | 66 +++--------------------------
 recipes-ti/ipc/ti-ipc-rtos.inc              |  8 ++--
 recipes-ti/ipc/ti-ipc.inc                   |  6 +--
 6 files changed, 95 insertions(+), 68 deletions(-)
 create mode 100644 recipes-ti/ipc/ti-ipc-examples-linux_git.bb
 create mode 100644 recipes-ti/ipc/ti-ipc-examples.inc

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index f2df678..2fb7ffb 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
-PV = "3.46.02.04"
-INC_PR = "r1"
+PV = "3.47.00.00"
+INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
new file mode 100644
index 0000000..2340206
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -0,0 +1,48 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running bios"
+require ti-ipc-examples.inc
+
+DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
+
+do_compile_append() {
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="linux" \
+         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    fi
+    oe_runmake -C examples all HOSTOS="linux" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C examples all HOSTOS="linux" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        PLATFORM="${ALT_PLATFORM}"
+    fi
+  fi
+}
+
+do_install_append() {
+  cd ${S_ipc-examples}/src
+  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    # Install directory for linux examples
+    install -d ${D}${bindir}/ipc/examples
+    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples" \
+        PLATFORM="${ALT_PLATFORM}"
+    fi
+  fi
+}
+
+FILES_${PN} += "${bindir}/*"
diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc-examples.inc
new file mode 100644
index 0000000..c9fe2cb
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-examples.inc
@@ -0,0 +1,31 @@
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
+require ti-ipc-common.inc
+require ti-ipc-rtos.inc
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=fb83580b16bce88e8ed568a6005c8f02"
+
+INSANE_SKIP_${PN} += "arch"
+
+ALLOW_EMPTY_${PN} = "1"
+
+IPC_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+
+do_compile() {
+
+  cd ${S_ipc-examples}/src
+  oe_runmake .examples \
+    IPCTOOLS="${S_ipc-metadata}/src/etc"
+
+  if [ ! -z ${ALT_PLATFORM} ]; then
+    oe_runmake .examples "PLATFORM=${ALT_PLATFORM}" \
+      IPCTOOLS="${S_ipc-metadata}/src/etc"
+  fi
+}
+
+do_install() {
+  cd ${S_ipc-examples}/src
+  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+}
+
+INHIBIT_PACKAGE_STRIP = "1"
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 23ce2bf..5482ce4 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -1,80 +1,35 @@
-DESCRIPTION = "TI Inter Process Communication (IPC) examples"
-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
-require ti-ipc-common.inc
-require ti-ipc-rtos.inc
+DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running linux"
+require ti-ipc-examples.inc
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=fb83580b16bce88e8ed568a6005c8f02"
+DEPENDS = "ti-xdctools ti-sysbios ti-ipc-rtos"
 
-DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
+do_compile_append() {
 
-INSANE_SKIP_${PN} += "arch"
-
-ALLOW_EMPTY_${PN} = "1"
-
-PACKAGES =+ "${PN}-linux"
-
-INSANE_SKIP_${PN}-linux += "arch"
-ALLOW_EMPTY_${PN}-linux = "1"
-
-IPC_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
-
-do_compile() {
-
-  cd ${S_ipc-examples}/src
-  oe_runmake .examples \
-    IPCTOOLS="${S_ipc-metadata}/src/etc"
-
-  if [ ! -z ${ALT_PLATFORM} ]; then
-    oe_runmake .examples "PLATFORM=${ALT_PLATFORM}" \
-      IPCTOOLS="${S_ipc-metadata}/src/etc"
-	echo test
-  fi
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
     oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
 
     if [ ! -z ${ALT_PLATFORM} ]; then
       oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="bios" \
          IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="linux" \ 
-        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
     fi
     oe_runmake -C examples all HOSTOS="bios" \
-      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" 
-    oe_runmake -C examples all HOSTOS="linux" \
-      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" 
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
     if [ ! -z ${ALT_PLATFORM} ]; then
       oe_runmake -C examples all HOSTOS="bios" \
-        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${ALT_PLATFORM}" 
-      oe_runmake -C examples all HOSTOS="linux" \
-        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        PLATFORM="${ALT_PLATFORM}" 
-      echo testing
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${ALT_PLATFORM}"
     fi
   fi
 }
 
-do_install() {
-  cd ${S_ipc-examples}/src
-  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
-
+do_install_append() {
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
     # Install directory for bios examples
     install -d ${D}/ipc_${IPC_VERSION}/examples/bios
-    # Install directory for linux examples
-    install -d ${D}${bindir}/ipc/examples
     oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
       HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
     oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
       HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
 
-    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-      HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples"
-
     if [ ! -z ${ALT_PLATFORM} ]; then
       oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
         HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
@@ -82,15 +37,8 @@ do_install() {
       oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
         HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
         PLATFORM="${ALT_PLATFORM}"
-
-      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-        HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples" \
-        PLATFORM="${ALT_PLATFORM}"
     fi
   fi
 }
 
 FILES_${PN} += "ipc_*"
-FILES_${PN}-linux += "${bindir}/*"
-INHIBIT_PACKAGE_STRIP = "1"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index a7c1b3a..57cd132 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,11 +24,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.46.02.04
-SRCREV_ipc-examples = "b833c759d620b4218ece6d64fae91e4777ef823a"
+# Corresponds to tag: 3.47.00.00
+SRCREV_ipc-examples = "e71b82187a324faa9394b83e39495be38255f05b"
 
-# Corresponds to tag: 3.46.02.04
-SRCREV_ipc-metadata = "afdcf6855f05c97d2bb77867f4f150aed29c1b12"
+# Corresponds to tag: 3.47.00.00
+SRCREV_ipc-metadata = "f026a364d0b9c1aba5c695bf0aac0be8ede95f59"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index c3742c1..02f3c8d 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "3.46"
+TI_IPC_GIT_BRANCH = "3.47"
 
-#Corresponds to 3.46.02.04
-TI_IPC_SRCREV = "bf355e7d0f5c3993f56a6ea778743b656ef6b536"
+#Corresponds to 3.47.00.00
+TI_IPC_SRCREV = "e576990e3a220ad394b287588c1c7e85e8644d23"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


