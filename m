Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D3B8E00D01; Tue, 31 Oct 2017 09:37:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C33E4E00B67
	for <meta-ti@yoctoproject.org>; Tue, 31 Oct 2017 09:37:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9VGb2CD018727
	for <meta-ti@yoctoproject.org>; Tue, 31 Oct 2017 11:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509467822;
	bh=6w0S2K7Sqmj56X2yIo6Qz3q/5UJGd1IaUnU0tzazM4Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WaE3MhJg82nIsLg6rP54pn/yrYGYF1sKVN/VR34bZIDdUHczoG6pDM7YKVuKpHX6M
	6QZkS85ah6WwO4SIzGEevA8MT6OS8IWyK4zhSKFSbHu1PzOHNDc6Ov1rW58hpMaoyd
	qzshPESef0kjEN9iNIEd+wx4Al2s6Q6uIQG+zH4g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VGb2sB011453
	for <meta-ti@yoctoproject.org>; Tue, 31 Oct 2017 11:37:02 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 31 Oct 2017 11:37:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 31 Oct 2017 11:37:02 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VGav8W004325;
	Tue, 31 Oct 2017 11:37:01 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 31 Oct 2017 22:06:54 +0530
Message-ID: <1509467815-179618-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1509467815-179618-1-git-send-email-a0393906@ti.com>
References: <1509467815-179618-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth 3/4] ti-ipc: Upgrade to 3.47
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
X-List-Received-Date: Tue, 31 Oct 2017 16:37:05 -0000
Content-Type: text/plain

Sync changes with morty

This patch is essentially a port from the meta-ti/morty
commit = 0733c2299c3a5c47a5f5f0d8fa9a90835176294a

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc            |  9 ++--
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb | 48 ++++++++++++++++++++
 recipes-ti/ipc/ti-ipc-examples.inc          | 31 +++++++++++++
 recipes-ti/ipc/ti-ipc-examples_git.bb       | 70 ++++++-----------------------
 recipes-ti/ipc/ti-ipc-rtos.inc              | 26 ++++++++---
 recipes-ti/ipc/ti-ipc.inc                   |  6 +--
 6 files changed, 122 insertions(+), 68 deletions(-)
 create mode 100644 recipes-ti/ipc/ti-ipc-examples-linux_git.bb
 create mode 100644 recipes-ti/ipc/ti-ipc-examples.inc

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 6aa08c5..2fb7ffb 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.45.00.00"
+PV = "3.47.00.00"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -6,9 +6,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PLATFORM = "UNKNOWN"
 PLATFORM_omap5-evm = "OMAP54XX"
 PLATFORM_dra7xx = "DRA7XX"
-PLATFORM_k2hk-evm = "TCI6638"
+PLATFORM_k2hk = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e = "66AK2E"
 PLATFORM_k2g = "66AK2G"
+PLATFORM_omapl138 = "OMAPL138"
+PLATFORM_c667x-evm = "C6678"
+PLATFORM_c665x-evm = "C6678"
 
-ALT_PLATFORM_k2hk-evm = "TCI6636"
+ALT_PLATFORM_k2hk = "TCI6636"
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
index 019bffa..5482ce4 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -1,83 +1,41 @@
-DESCRIPTION = "TI Inter Process Communication (IPC) examples"
-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
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
-IPC_INSTALL_DIR="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
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
-  install -d ${D}/ipc_${IPC_VERSION}/examples
+do_install_append() {
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    # Install directory for bios examples
+    install -d ${D}/ipc_${IPC_VERSION}/examples/bios
     oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
     oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
-
-    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-      HOSTOS="linux" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
 
     if [ ! -z ${ALT_PLATFORM} ]; then
-      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \ 
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
         PLATFORM="${ALT_PLATFORM}"
       oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
-        PLATFORM="${ALT_PLATFORM}"
-
-      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-        HOSTOS="linux" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
         PLATFORM="${ALT_PLATFORM}"
     fi
   fi
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 696a897..57cd132 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -1,5 +1,4 @@
 require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
 
 TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
 TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
@@ -25,11 +24,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.45.00.00
-SRCREV_ipc-examples = "3a8ee1841ec36117a9bcd3d45bb2781bbd53ecf8"
+# Corresponds to tag: 3.47.00.00
+SRCREV_ipc-examples = "e71b82187a324faa9394b83e39495be38255f05b"
 
-# Corresponds to tag: 3.45.00.00
-SRCREV_ipc-metadata = "30b83f09be1877f86b22c971d978cb478fc7dd6e"
+# Corresponds to tag: 3.47.00.00
+SRCREV_ipc-metadata = "f026a364d0b9c1aba5c695bf0aac0be8ede95f59"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
@@ -37,7 +36,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.r2"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
@@ -46,7 +45,13 @@ DEPENDS_append_omap-a15 = " ti-cgt6x-native \
                             ti-cgt-arm-native \
                             gcc-arm-none-eabi-native \
 "
+DEPENDS_append_omapl138 = " ti-cgt6x-native \
+"
+DEPENDS_append_c66x = " ti-cgt6x-native \
+"
+
 IPC_TARGETS = ""
+
 IPC_TARGETS_omap-a15 = "\
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
@@ -54,11 +59,19 @@ IPC_TARGETS_omap-a15 = "\
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
+IPC_TARGETS_omapl138 = "\
+    ti.targets.elf.C674="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
+
 IPC_TARGETS_keystone = " \
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
+IPC_TARGETS_c66x = " \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
 
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
@@ -66,4 +79,5 @@ EXTRA_OEMAKE = "\
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
     ${IPC_TARGETS} \
     JOBS="--jobs=${BB_NUMBER_THREADS}" \
+    JAVA_TOOL_OPTIONS=-Xss2560k \
 "
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index ea256d2..02f3c8d 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "master"
+TI_IPC_GIT_BRANCH = "3.47"
 
-#Corresponds to 3.45.00.00
-TI_IPC_SRCREV = "1584985938884bf6cb1d839779578354b1865ea4"
+#Corresponds to 3.47.00.00
+TI_IPC_SRCREV = "e576990e3a220ad394b287588c1c7e85e8644d23"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


