Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88D82E00717; Tue, 10 Feb 2015 14:57:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41A6DE002F9
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 14:57:00 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AMv0mA013363
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 16:57:00 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AMuxaB001391
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 16:56:59 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 16:56:59 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1AMusUg009273;	Tue, 10 Feb 2015 16:56:56 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 17:56:52 -0500
Message-ID: <1423609012-4194-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] srio-lld: Add recipe for srio peripheral low level driver
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
X-List-Received-Date: Tue, 10 Feb 2015 22:57:17 -0000
Content-Type: text/plain

- Provides user space low level driver for srio peripheral
- Devices supported k2h & k2k

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/srio-lld/srio-lld-test_git.bb |   27 +++++++++++++++++++++++++++
 recipes-bsp/srio-lld/srio-lld.inc         |   16 ++++++++++++++++
 recipes-bsp/srio-lld/srio-lld_git.bb      |   19 +++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 recipes-bsp/srio-lld/srio-lld-test_git.bb
 create mode 100644 recipes-bsp/srio-lld/srio-lld.inc
 create mode 100644 recipes-bsp/srio-lld/srio-lld_git.bb

diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
new file mode 100644
index 0000000..7cf254e
--- /dev/null
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "TI SRIO peripheral low level driver unit test and example binaries"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem"
+
+include srio-lld.inc
+
+CHOICELIST = "yes no"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	for device in ${DEVICELIST}
+	do
+		oe_runmake clean DEVICE="$device" SRIO_SRC_DIR=${S}
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake tests DEVICE="$device" SRIO_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+			oe_runmake examples DEVICE="$device" SRIO_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake installbin DEVICE="$device" SRIO_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+	done
+}
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
new file mode 100644
index 0000000..1ae2128
--- /dev/null
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -0,0 +1,16 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;endline=41;md5=469096088e072d883ff7eef301b34093"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/srio-lld.git;destsuffix=git/ti/drv/srio;protocol=git;branch=${BRANCH}"
+
+# commit ID corresponding to DEV.SRIO_LLD.02.00.00.11
+SRCREV = "2d0efea281222055b3b828c79e57102edaae9db7"
+PV = "02.00.00.11"
+
+DEVICELIST = "k2h k2k"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/srio"
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/srio-lld_git.bb
new file mode 100644
index 0000000..9ff845b
--- /dev/null
+++ b/recipes-bsp/srio-lld/srio-lld_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "TI SRIO peripheral low level driver"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="common-csl-ip rm-lld cppi-lld"
+
+include srio-lld.inc
+
+do_compile () {
+#   Now build the lld
+	oe_runmake clean
+	for device in ${DEVICELIST}
+	do
+		oe_runmake lib DEVICE="${device}"
+	done
+}
+
+do_install () {
+	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


