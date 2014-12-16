Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD75BE00752; Tue, 16 Dec 2014 10:12:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B995E003AB
	for <meta-ti@yoctoproject.org>; Tue, 16 Dec 2014 10:12:14 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBGICDJe032265
	for <meta-ti@yoctoproject.org>; Tue, 16 Dec 2014 12:12:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGICDSI011083
	for <meta-ti@yoctoproject.org>; Tue, 16 Dec 2014 12:12:13 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Dec 2014 12:12:13 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sBGICDfI021582;	Tue, 16 Dec 2014 12:12:13 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 16 Dec 2014 13:12:10 -0500
Message-ID: <1418753531-22371-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] cppi-lld: Add new recipe for CPPI Module low level driver
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
X-List-Received-Date: Tue, 16 Dec 2014 18:12:23 -0000
Content-Type: text/plain

- Provides low level driver and test code for Communications port programming
  interface module
- Supports k2h, k2k, k2l k2e devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb |   26 ++++++++++++++++++++++++++
 recipes-bsp/cppi-lld/cppi-lld.inc         |   15 +++++++++++++++
 recipes-bsp/cppi-lld/cppi-lld_git.bb      |   19 +++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100755 recipes-bsp/cppi-lld/cppi-lld-test_git.bb
 create mode 100644 recipes-bsp/cppi-lld/cppi-lld.inc
 create mode 100755 recipes-bsp/cppi-lld/cppi-lld_git.bb

diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
new file mode 100755
index 0000000..871546e
--- /dev/null
+++ b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "TI CPPI low level driver unit test and example binaries"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS = "common-csl-ip rm-lld cppi-lld qmss-lld"
+
+include cppi-lld.inc
+
+CHOICELIST = "yes no"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S}
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+do
+	make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+	done
+}
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
new file mode 100644
index 0000000..d26adc5
--- /dev/null
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -0,0 +1,15 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git;destsuffix=git/ti/drv/cppi;protocol=git;branch=${BRANCH}"
+
+# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.06"
+SRCREV = "4c6c0a857786c49d8003453d3bc7c3c97ff4f5a4"
+PV = "02.01.00.06"
+PR = "r0"
+
+DEVICELIST = "k2h k2k k2l k2e"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/cppi"
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
new file mode 100755
index 0000000..bb2028b
--- /dev/null
+++ b/recipes-bsp/cppi-lld/cppi-lld_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "TI CPPI Module low level driver"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld"
+
+include cppi-lld.inc
+
+do_compile () {
+#   Now build the lld in the updated directory
+	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}" 
+	done
+}
+
+do_install () {
+	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


