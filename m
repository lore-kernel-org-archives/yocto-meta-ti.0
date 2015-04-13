Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CFAFE00854; Mon, 13 Apr 2015 10:53:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EFF0E0076B
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2015 10:52:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3DHqu4O025569
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2015 12:52:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3DHqtw1020536
	for <meta-ti@yoctoproject.org>; Mon, 13 Apr 2015 12:52:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 13 Apr 2015 12:52:54 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3DHqsEc030032;	Mon, 13 Apr 2015 12:52:54 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Apr 2015 13:52:53 -0400
Message-ID: <1428947573-29290-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ipc-transport-qmss: Add recipe for ipc qmss transport and test code
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
X-List-Received-Date: Mon, 13 Apr 2015 17:53:00 -0000
Content-Type: text/plain

- Provides ipc transport layer using qmss module
- Supports k2h, k2k, k2e, k2l devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb |   31 +++++++++++++++++++++++++
 recipes-ti/ipc/ipc-transport-qmss.inc         |   16 +++++++++++++
 recipes-ti/ipc/ipc-transport-qmss_git.bb      |   14 +++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 recipes-ti/ipc/ipc-transport-qmss-test_git.bb
 create mode 100644 recipes-ti/ipc/ipc-transport-qmss.inc
 create mode 100644 recipes-ti/ipc/ipc-transport-qmss_git.bb

diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
new file mode 100644
index 0000000..34d3708
--- /dev/null
+++ b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
@@ -0,0 +1,31 @@
+include ipc-transport-qmss.inc
+
+DEPENDS = "ipc-transport-qmss ti-ipc"
+
+#FILES_${PN}-test = "${bindir}/multiProcessTest_*.out"
+
+CHOICELIST = "yes no"
+
+DEVICELIST = "k2h k2k k2e k2l"
+
+do_compile () {
+#   Now build the test code
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake tests \
+				IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} \
+				USEDYNAMIC_LIB="$choice" DEVICE="$device"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake installbin \
+			INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+	done
+
+}
diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
new file mode 100644
index 0000000..35c2111
--- /dev/null
+++ b/recipes-ti/ipc/ipc-transport-qmss.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "TI QMSS-Based IPC MessageQ Transport"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-linux/ipc-transport.git;protocol=git;branch=${BRANCH}"
+# Below commit ID corresponds to DEV.IPC-TRANSPORT.01.00.00.00
+SRCREV = "b3077467126c84b5d583dc29e13ab221064b687b"
+PV = "01.00.00.00"
+
+COMPATIBLE_MACHINE = "keystone"
+
+S = "${WORKDIR}/git/linux/qmss"
+
+EXTRA_OEMAKE += "PDK_INSTALL_PATH=${STAGING_INCDIR} TRANS_QMSS_SRC_DIR=${S}"
diff --git a/recipes-ti/ipc/ipc-transport-qmss_git.bb b/recipes-ti/ipc/ipc-transport-qmss_git.bb
new file mode 100644
index 0000000..cb77a12
--- /dev/null
+++ b/recipes-ti/ipc/ipc-transport-qmss_git.bb
@@ -0,0 +1,14 @@
+include ipc-transport-qmss.inc
+
+DEPENDS = "ti-ipc mpm-transport"
+
+do_compile () {
+#   Now build the transport
+	oe_runmake clean
+	oe_runmake lib
+}
+
+do_install () {
+	oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
+		INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


