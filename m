Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDE01E00CA7; Thu, 17 May 2018 10:04:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4783E008D2
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2018 10:04:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4HH4khc015300
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2018 12:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526576686;
	bh=s7dztBGKOhYhS/MYMFwU631W5mxZHj37lajlhRttfXw=;
	h=From:To:CC:Subject:Date;
	b=uf59VsQwgYbAhIe9q3i/Rjc59Fx81kXUX5TOiU2979W3R+MdWVwaNNb8EKrcmn2Qw
	GSRCrdfOsSCPr5pNKqOnZs35F+PuFtwdgIFvlb4YtJU57tRr/QBx138GTJ3eVwwsQr
	M15c/CPkxtbDdAvKWZAmYX0J2mCGRN9XfHTiu/d8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4HH4kP2009005
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2018 12:04:46 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 17 May 2018 12:04:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 17 May 2018 12:04:46 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4HH4jog020794;
	Thu, 17 May 2018 12:04:46 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 17 May 2018 13:04:44 -0400
Message-ID: <1526576684-30849-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] ti-ipc: Update to new version 3.47.02.00
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
X-List-Received-Date: Thu, 17 May 2018 17:04:49 -0000
Content-Type: text/plain

Adds new example for AM571X

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
Update alt platform for am57xx-evm instead of dra7xx
---
---
 recipes-ti/ipc/ti-ipc-common.inc      |  5 +++--
 recipes-ti/ipc/ti-ipc-examples.inc    |  6 +++---
 recipes-ti/ipc/ti-ipc-examples_git.bb | 24 ++++++++++++------------
 recipes-ti/ipc/ti-ipc-rtos.inc        | 10 +++++-----
 recipes-ti/ipc/ti-ipc-rtos_git.bb     | 20 ++++++++++----------
 recipes-ti/ipc/ti-ipc.inc             |  4 ++--
 6 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 00e4e91..7f93842 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
-PV = "3.47.01.00"
-INC_PR = "r1"
+PV = "3.47.02.00"
+INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,3 +15,4 @@ PLATFORM_c667x-evm = "C6678"
 PLATFORM_c665x-evm = "C6678"
 
 ALT_PLATFORM_k2hk = "TCI6636"
+ALT_PLATFORM_am57xx-evm = "AM572X AM571X"
diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc-examples.inc
index c9fe2cb..cd2240c 100644
--- a/recipes-ti/ipc/ti-ipc-examples.inc
+++ b/recipes-ti/ipc/ti-ipc-examples.inc
@@ -17,10 +17,10 @@ do_compile() {
   oe_runmake .examples \
     IPCTOOLS="${S_ipc-metadata}/src/etc"
 
-  if [ ! -z ${ALT_PLATFORM} ]; then
-    oe_runmake .examples "PLATFORM=${ALT_PLATFORM}" \
+  for alt_platform in ${ALT_PLATFORM}; do
+    oe_runmake .examples "PLATFORM=${alt_platform}" \
       IPCTOOLS="${S_ipc-metadata}/src/etc"
-  fi
+  done
 }
 
 do_install() {
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 8aad69c..c46e5c8 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -8,16 +8,16 @@ do_compile_append() {
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
     oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
 
-    if [ ! -z ${ALT_PLATFORM} ]; then
-      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="bios" \
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake extract PLATFORM="${alt_platform}" HOSTOS="bios" \
          IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-    fi
+    done
     oe_runmake -C examples all HOSTOS="bios" \
       IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-    if [ ! -z ${ALT_PLATFORM} ]; then
+    for alt_platform in ${ALT_PLATFORM}; do
       oe_runmake -C examples all HOSTOS="bios" \
-        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${ALT_PLATFORM}"
-    fi
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${alt_platform}"
+    done
   fi
 }
 
@@ -30,14 +30,14 @@ do_install_append() {
     oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
       HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
 
-    if [ ! -z ${ALT_PLATFORM} ]; then
+    for alt_platform in ${ALT_PLATFORM}; do
       oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
-        PLATFORM="${ALT_PLATFORM}"
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
+        PLATFORM="${alt_platform}"
       oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
-        PLATFORM="${ALT_PLATFORM}"
-    fi
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
+        PLATFORM="${alt_platform}"
+    done
   fi
 }
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 3f876d3..868743e 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,11 +24,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.47.01.00B
-SRCREV_ipc-examples = "03ff856444b5bb9e60a907125a1f042b29b25d7b"
+# Corresponds to tag: 3.47.02.00
+SRCREV_ipc-metadata = "e8aff83111b8a0d64d7a77413b6f66d3106084d8"
 
-# Corresponds to tag: 3.47.01.00A
-SRCREV_ipc-metadata = "72578cce9c9f9a932eb22b3397b46131efb12d69"
+# Corresponds to tag: 3.47.02.00
+SRCREV_ipc-examples = "351e9a6d94c68f7ff64b2c002ee6750242ece6d9"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
@@ -36,7 +36,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.r5"
+PR = "${INC_PR}.r0"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 53ab76d..b292d67 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -27,20 +27,20 @@ do_compile() {
   cd ${S_ipc-examples}/src
   oe_runmake .examples \
     IPCTOOLS="${S_ipc-metadata}/src/etc"
-  if [ ! -z ${ALT_PLATFORM} ]; then
+  for alt_platform in ${ALT_PLATFORM}; do
     oe_runmake .examples \
       IPCTOOLS="${S_ipc-metadata}/src/etc" \
-      PLATFORM=${ALT_PLATFORM}
-  fi
+      PLATFORM=${alt_platform}
+  done
 
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
     oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${S}"
     oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${S}"
 
-    if [ ! -z ${ALT_PLATFORM} ]; then
-      oe_runmake extract PLATFORM=${ALT_PLATFORM} HOSTOS="bios" IPC_INSTALL_DIR="${S}"
-      oe_runmake extract PLATFORM=${ALT_PLATFORM} HOSTOS="linux" IPC_INSTALL_DIR="${S}"
-    fi
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake extract PLATFORM=${alt_platform} HOSTOS="bios" IPC_INSTALL_DIR="${S}"
+      oe_runmake extract PLATFORM=${alt_platform} HOSTOS="linux" IPC_INSTALL_DIR="${S}"
+    done
   fi
 
   IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
@@ -54,9 +54,9 @@ do_compile() {
     cp -pPf ${S_ipc-examples}/src/examples/*.* ${IPC_PACKAGE_DIR}/examples/
     cp -pPf ${S_ipc-examples}/src/examples/makefile ${IPC_PACKAGE_DIR}/examples/
     cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}* ${IPC_PACKAGE_DIR}/examples/
-    if [ ! -z ${ALT_PLATFORM} ]; then
-      cp -pPrf ${S_ipc-examples}/src/examples/${ALT_PLATFORM}* ${IPC_PACKAGE_DIR}/examples/
-    fi
+    for alt_platform in ${ALT_PLATFORM}; do
+      cp -pPrf ${S_ipc-examples}/src/examples/${alt_platform}* ${IPC_PACKAGE_DIR}/examples/
+    done
     find ${IPC_PACKAGE_DIR}/examples/ -name "*zip" -type f | xargs -I {} rm {}
   fi
 }
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 49d8224..e8038a5 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.47"
 
-#Corresponds to 3.47.01.00
-TI_IPC_SRCREV = "6a2595a4148fb12f259efc19164a9d33ad2ed294"
+#Corresponds to 3.47.02.00
+TI_IPC_SRCREV = "24c36385d096613af123d1e1696fb2fee652ef36"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


