Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F35CDE00750; Tue, 24 Feb 2015 14:43:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F036E00477
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 14:43:51 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1OMhpi5026295
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 16:43:51 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OMhoFd027571
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 16:43:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Feb 2015 16:43:49 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1OMhnaG006753;	Tue, 24 Feb 2015 16:43:49 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 24 Feb 2015 17:43:47 -0500
Message-ID: <1424817827-5585-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] netapi: Add recipe for NETAPI module
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
X-List-Received-Date: Tue, 24 Feb 2015 22:43:55 -0000
Content-Type: text/plain

- Provide TI user space network library and test code
- Supports k2h, k2k, k2l & k2e devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
- Modifed recipes to use oe_runmake for the applications as well
---
---
 recipes-ti/netapi/netapi-test_git.bb |   49 ++++++++++++++++++++++++++++++++++
 recipes-ti/netapi/netapi.inc         |   16 +++++++++++
 recipes-ti/netapi/netapi_git.bb      |   34 +++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 recipes-ti/netapi/netapi-test_git.bb
 create mode 100644 recipes-ti/netapi/netapi.inc
 create mode 100644 recipes-ti/netapi/netapi_git.bb

diff --git a/recipes-ti/netapi/netapi-test_git.bb b/recipes-ti/netapi/netapi-test_git.bb
new file mode 100644
index 0000000..9d49c29
--- /dev/null
+++ b/recipes-ti/netapi/netapi-test_git.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "Provides test and application binaries using NETAPI module"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS = "netapi ipsecmgr"
+
+include netapi.inc
+
+EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+#   Build the netapi binaries
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake -f makefile_armv7 tests NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
+				USEDYNAMIC_LIB="$choice" DEVICE="$device"
+		done
+
+#     Now build the netapi appplications
+		cd ${S}/applications/ipsec_offload/ipsecmgr/build
+		oe_runmake clean NETAPI_SRC_DIR=${S} DEVICE="$device"
+		oe_runmake app NETAPI_SRC_DIR=${S} DEVICE="$device"
+
+		cd ${S}/applications/ipsec_offload/config-app/build
+		oe_runmake clean DEVICE="$device"
+		oe_runmake app DEVICE="$device"
+		cd ${S}
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake -f makefile_armv7 installbin INSTALL_INC_BASE_DIR=${D}/${includedir} \
+			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
+			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
+
+		cd ${S}/applications/ipsec_offload/ipsecmgr/build
+		oe_runmake install \
+			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
+			DEVICE="$device"
+
+		cd ${S}/applications/ipsec_offload/config-app/build
+		oe_runmake install \
+			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
+			DEVICE="$device"
+		cd ${S}
+	done
+}
diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
new file mode 100644
index 0000000..b8d481a
--- /dev/null
+++ b/recipes-ti/netapi/netapi.inc
@@ -0,0 +1,16 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f2307287ca2074"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
+
+# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.04"
+SRCREV= "dc08af268200908d3d8a456ac852c65c53d2fd12"
+PV = "01.01.00.04"
+
+DEVICELIST = "k2h k2k k2l k2e"
+
+CHOICELIST = "yes no"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/runtime/netapi"
diff --git a/recipes-ti/netapi/netapi_git.bb b/recipes-ti/netapi/netapi_git.bb
new file mode 100644
index 0000000..d568cd0
--- /dev/null
+++ b/recipes-ti/netapi/netapi_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Provides NETAPI module: TI user space network library"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktlib nwal-lld"
+
+NAME = "netapi"
+
+include netapi.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+#   Now build the netapi
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake  clean NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
+				USEDYNAMIC_LIB="$choice" DEVICE="$device"
+			oe_runmake lib NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
+				USEDYNAMIC_LIB="$choice" DEVICE="$device"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
+			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
+			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
+	done
+}
-- 
1.7.9.5


