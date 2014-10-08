Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 118B1E0077F; Wed,  8 Oct 2014 10:47:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: misformatted + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09966E00786
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 10:47:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5F30F52A3F; Wed,  8 Oct 2014 17:47:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141008174734.5F30F52A3F@arago-project.org>
Date: Wed,  8 Oct 2014 17:47:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : rm-lld: Rename recipe and update to new version
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
X-List-Received-Date: Wed, 08 Oct 2014 17:47:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: a085e612c59c9b4632286ebc754fd1c854c7aa9c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a085e612c59c9b4632286ebc754fd1c854c7aa9c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Oct  8 16:27:29 2014 +0000

rm-lld: Rename recipe and update to new version

- Removed ti-prefix based on review
- Update to new version 2.1.0.6
- Add dependency on libdaemon
- Remove device dependency
- Updated license to BSD-3-Clause

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rm-lld/{ti-rm_git.bb => rm-lld_git.bb} |   24 ++++++-------------
 1 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/recipes-bsp/rm-lld/ti-rm_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
similarity index 56%
rename from recipes-bsp/rm-lld/ti-rm_git.bb
rename to recipes-bsp/rm-lld/rm-lld_git.bb
index 276c01e..ed34478 100644
--- a/recipes-bsp/rm-lld/ti-rm_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -1,17 +1,17 @@
 DESCRIPTION = "TI Resource Manager Low Level Driver"
-LICENSE = "TI BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.RM_LLD.02.01.00.04
-SRCREV = "59e3bf5fca3995dd0f79bbdd1af988d278a2a049"
+# Below commit ID corresponds to DEV.RM_LLD.02.01.00.06
+SRCREV = "dc0dba4a6b0358efcb861d50b3dae21beb5281a8"
+PV = "02.01.00.06"
 PR = "r0"
-PV = "02.01.00.04"
 
 COMPATIBLE_MACHINE = "keystone"
 
-DEPENDS = "ti-ipc"
+DEPENDS = "ti-ipc libdaemon"
 
 PACKAGES =+ "${PN}-test"
 
@@ -19,8 +19,6 @@ FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
                     ${bindir}/rmLinuxClientTest_*.out \
                     ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
 
-DEVICELIST = "k2h k2k"
-
 CHOICELIST = "yes no"
 
 BASEDIR = "${WORKDIR}/git"
@@ -29,12 +27,9 @@ S = "${BASEDIR}/ti/drv/rm"
 do_compile () {
 #   Now build the lld
     make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
-    for device in ${DEVICELIST}
+    for choice in ${CHOICELIST}
     do
-      for choice in ${CHOICELIST}
-      do
-        make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} DEVICE="$device" USEDYNAMIC_LIB="$choice"
-      done
+      make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} USEDYNAMIC_LIB="$choice"
     done
 }
 
@@ -42,8 +37,5 @@ do_install () {
     install -d ${D}${includedir}/ti/drv/rm
     install -d ${D}${libdir}
     install -d ${D}${bindir}
-    for device in ${DEVICELIST}
-    do
-      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
-    done
+    make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
 }


