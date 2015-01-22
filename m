Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E5C0E00902; Wed, 21 Jan 2015 21:25:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD49CE008EC
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 21:25:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0M5PIA8024737
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 23:25:18 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0M5PI4k002169
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 23:25:18 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 21 Jan 2015 23:25:18 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0M5PH66014603;	Wed, 21 Jan 2015 23:25:17 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Jan 2015 00:25:16 -0500
Message-ID: <1421904316-19840-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nwal-lld: Add recipes for Network abstraction layer low level driver and test code
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
X-List-Received-Date: Thu, 22 Jan 2015 05:25:24 -0000
Content-Type: text/plain

- Provide Network abstraction layer for keystone devices.
- Supports k2h, k2k, k2l & k2e devices.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/nwal-lld/nwal-lld-test_git.bb |   25 +++++++++++++++++++++++++
 recipes-bsp/nwal-lld/nwal-lld.inc         |   18 ++++++++++++++++++
 recipes-bsp/nwal-lld/nwal-lld_git.bb      |   25 +++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 recipes-bsp/nwal-lld/nwal-lld-test_git.bb
 create mode 100644 recipes-bsp/nwal-lld/nwal-lld.inc
 create mode 100644 recipes-bsp/nwal-lld/nwal-lld_git.bb

diff --git a/recipes-bsp/nwal-lld/nwal-lld-test_git.bb b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
new file mode 100644
index 0000000..3813df9
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld-test_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "TI Network Abstraction Layer unit test binaries"
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib nwal-lld"
+
+include nwal-lld.inc
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake clean NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
+			oe_runmake tests NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake installbin INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+	done
+}
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
new file mode 100644
index 0000000..1e77140
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -0,0 +1,18 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+COMPATIBLE_MACHINE = "keystone"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git;protocol=git;branch=${BRANCH}"
+
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.04A"
+SRCREV = "099a9191e642c7732760078bf5af1e3c6ca0197b"
+PV = "02.01.00.04"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/nwal"
+
+DEVICELIST = "k2h k2k k2l k2e"
+
+CHOICELIST = "yes no"
diff --git a/recipes-bsp/nwal-lld/nwal-lld_git.bb b/recipes-bsp/nwal-lld/nwal-lld_git.bb
new file mode 100644
index 0000000..da09730
--- /dev/null
+++ b/recipes-bsp/nwal-lld/nwal-lld_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "TI Network abstraction layer LLD library "
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld hplib pa-lld sa-lld pktlib"
+
+include nwal-lld.inc
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake clean NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
+			oe_runmake lib NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice" DEVICE="$device"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+	done
+}
-- 
1.7.9.5


