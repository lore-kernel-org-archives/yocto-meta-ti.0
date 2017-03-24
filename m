Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 000E9E00A64; Fri, 24 Mar 2017 12:05:28 -0700 (PDT)
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
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A8F9E0097C
	for <meta-ti@yoctoproject.org>; Fri, 24 Mar 2017 12:05:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2OJ5Q20021913
	for <meta-ti@yoctoproject.org>; Fri, 24 Mar 2017 14:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490382326;
	bh=VJyzUQzfzHNPV41OoCsJQIvvwewAriLeL6LXnEur0bA=;
	h=From:To:CC:Subject:Date;
	b=Tsik0RPH5v3sDd+NBRw395g7RT4w/dlUGcOBH/zozq0y4Olo5BGBPYGKze+nOZdT2
	f/WNcK2Sc1LNvWHEcCLiJkRUFXN/816V9zXvX1JWX0H1oaGPXjj1AzS3CSsbOrEsSl
	LjAWvY885sqYFY7L6MUJr8LZUkQDDbLzTcn8Aa04=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2OJ5QuS003930
	for <meta-ti@yoctoproject.org>; Fri, 24 Mar 2017 14:05:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 14:05:25 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2OJ5Pmc003930;	Fri, 24 Mar 2017 14:05:26 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 24 Mar 2017 15:05:25 -0400
Message-ID: <1490382325-16663-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] ti-ipc-examples: Update with change of directory structure
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
X-List-Received-Date: Fri, 24 Mar 2017 19:05:29 -0000
Content-Type: text/plain

Separated Linux host examples into separate package ti-ipc-examples-
linux and installed into /usr/bin directory.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc      |  2 +-
 recipes-ti/ipc/ti-ipc-examples_git.bb | 25 +++++++++++++++++--------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 6aa08c5..c5f28e7 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
 PV = "3.45.00.00"
-INC_PR = "r0"
+INC_PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 019bffa..40c3bc3 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -12,6 +12,11 @@ INSANE_SKIP_${PN} += "arch"
 
 ALLOW_EMPTY_${PN} = "1"
 
+PACKAGES =+ "${PN}-linux"
+
+INSANE_SKIP_${PN}-linux += "arch"
+ALLOW_EMPTY_${PN}-linux  = "1"
+
 IPC_INSTALL_DIR="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
 
 do_compile() {
@@ -56,31 +61,35 @@ do_install() {
   cd ${S_ipc-examples}/src
   IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
 
-  install -d ${D}/ipc_${IPC_VERSION}/examples
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    # Install directory for bios examples
+    install -d ${D}/ipc_${IPC_VERSION}/examples/bios
+    # Install directory for linux examples
+    install -d ${D}${bindir}/ipc/examples
     oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
     oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
 
     oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
       LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-      HOSTOS="linux" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+      HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples"
 
     if [ ! -z ${ALT_PLATFORM} ]; then
-      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \ 
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
         PLATFORM="${ALT_PLATFORM}"
       oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios" \
         PLATFORM="${ALT_PLATFORM}"
 
       oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
         LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-        HOSTOS="linux" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+        HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples" \
         PLATFORM="${ALT_PLATFORM}"
     fi
   fi
 }
 
 FILES_${PN} += "ipc_*"
+FILES_${PN}-linux += "${bindir}/*"
-- 
1.9.1


