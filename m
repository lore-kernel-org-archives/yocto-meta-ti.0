Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3295E00876; Wed,  8 Oct 2014 03:27:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BDF9E007C1
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 03:27:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s98ARWxJ025578
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 05:27:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s98ARWhd005498
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 05:27:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 05:27:31 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s98ARVe3024960;	Wed, 8 Oct 2014 05:27:31 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 8 Oct 2014 06:27:28 -0400
Message-ID: <1412764049-7074-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/2] ti-rm: Move from meta-arago to meta-ti
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
X-List-Received-Date: Wed, 08 Oct 2014 10:27:36 -0000
Content-Type: text/plain

- Moved recipe from meta-arago based on review comments
- Provides resource manager low level driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- Corrected/Updated comments
---
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


