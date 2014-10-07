Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C462BE00848; Tue,  7 Oct 2014 14:31:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 606ECE0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 14:31:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97LVZSY031830
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 16:31:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97LVZqa016055
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 16:31:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 16:31:34 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s97LVYHZ009193;	Tue, 7 Oct 2014 16:31:34 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 Oct 2014 17:31:27 -0400
Message-ID: <1412717489-29990-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/3] ti-rm: Move from meta-arago to meta-ti
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
X-List-Received-Date: Tue, 07 Oct 2014 21:31:38 -0000
Content-Type: text/plain

-Moved recipe to meta-arago based on review comments
 (from http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb;h=38ec0ada5330977a5e19928e02060c9857b1f8d0;hb=HEAD)
- Provides resource manager low level driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/rm-lld/ti-rm_git.bb |   49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 recipes-bsp/rm-lld/ti-rm_git.bb

diff --git a/recipes-bsp/rm-lld/ti-rm_git.bb b/recipes-bsp/rm-lld/ti-rm_git.bb
new file mode 100644
index 0000000..276c01e
--- /dev/null
+++ b/recipes-bsp/rm-lld/ti-rm_git.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "TI Resource Manager Low Level Driver"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
+# Below commit ID corresponds to DEV.RM_LLD.02.01.00.04
+SRCREV = "59e3bf5fca3995dd0f79bbdd1af988d278a2a049"
+PR = "r0"
+PV = "02.01.00.04"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "ti-ipc"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
+                    ${bindir}/rmLinuxClientTest_*.out \
+                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
+
+DEVICELIST = "k2h k2k"
+
+CHOICELIST = "yes no"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/rm"
+
+do_compile () {
+#   Now build the lld
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
+    for device in ${DEVICELIST}
+    do
+      for choice in ${CHOICELIST}
+      do
+        make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} DEVICE="$device" USEDYNAMIC_LIB="$choice"
+      done
+    done
+}
+
+do_install () {
+    install -d ${D}${includedir}/ti/drv/rm
+    install -d ${D}${libdir}
+    install -d ${D}${bindir}
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+    done
+}
-- 
1.7.9.5


