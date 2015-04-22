Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 726DDE009AF; Wed, 22 Apr 2015 09:04:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5651DE009AE
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 09:04:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id ECEEA52ACC; Wed, 22 Apr 2015 16:04:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150422160452.ECEEA52ACC@arago-project.org>
Date: Wed, 22 Apr 2015 16:04:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ipc-transport-qmss: Add recipe for ipc qmss transport and test code
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
X-List-Received-Date: Wed, 22 Apr 2015 16:04:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ef3632215004f4697c46b166c475cc66afabb257
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ef3632215004f4697c46b166c475cc66afabb257

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Apr 13 23:52:53 2015 +0000

ipc-transport-qmss: Add recipe for ipc qmss transport and test code

- Provides ipc transport layer using qmss module
- Supports k2h, k2k, k2e, k2l devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ipc-transport-qmss-test_git.bb |   31 +++++++++++++++++++++++++
 recipes-ti/ipc/ipc-transport-qmss.inc         |   16 +++++++++++++
 recipes-ti/ipc/ipc-transport-qmss_git.bb      |   14 +++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)

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


