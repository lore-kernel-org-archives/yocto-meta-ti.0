Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44E3AE00D3C; Fri,  5 Feb 2016 12:19:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC298E00D2A
	for <meta-ti@yoctoproject.org>; Fri,  5 Feb 2016 12:19:16 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u15KJF2w005447
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2016 14:19:15 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u15KJFmP031989
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2016 14:19:15 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Feb 2016 14:19:15 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u15KJERE030840;	Fri, 5 Feb 2016 14:19:14 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 5 Feb 2016 15:19:13 -0500
Message-ID: <1454703553-21810-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ipc-transport: Extract source info to common inc file
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
X-List-Received-Date: Fri, 05 Feb 2016 20:19:20 -0000
Content-Type: text/plain

* Also use new variables to specify the source info so this can be
  easily overridden and applied to each recipe.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb |  2 ++
 recipes-ti/ipc/ipc-transport-qmss.inc         |  8 ++------
 recipes-ti/ipc/ipc-transport-qmss_git.bb      |  2 ++
 recipes-ti/ipc/ipc-transport-srio-test_git.bb |  2 ++
 recipes-ti/ipc/ipc-transport-srio.inc         |  8 ++------
 recipes-ti/ipc/ipc-transport-srio_git.bb      |  2 ++
 recipes-ti/ipc/ipc-transport.inc              | 15 +++++++++++++++
 7 files changed, 27 insertions(+), 12 deletions(-)
 create mode 100644 recipes-ti/ipc/ipc-transport.inc

diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
index e7c827e..bfedaf5 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
@@ -1,5 +1,7 @@
 include ipc-transport-qmss.inc
 
+PR = "${INC_PR}.0"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "ipc-transport-qmss ti-ipc"
diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
index 4b74eec..a5c8dc4 100644
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ b/recipes-ti/ipc/ipc-transport-qmss.inc
@@ -1,13 +1,9 @@
 DESCRIPTION = "TI QMSS-Based IPC MessageQ Transport"
 LICENSE = "BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
+require ipc-transport.inc
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-linux/ipc-transport.git;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
-SRCREV = "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
-PV = "02.00.00.01"
+INC_PR_append = ".0"
 
 COMPATIBLE_MACHINE = "keystone"
 
diff --git a/recipes-ti/ipc/ipc-transport-qmss_git.bb b/recipes-ti/ipc/ipc-transport-qmss_git.bb
index cb77a12..09acbf0 100644
--- a/recipes-ti/ipc/ipc-transport-qmss_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss_git.bb
@@ -1,5 +1,7 @@
 include ipc-transport-qmss.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "ti-ipc mpm-transport"
 
 do_compile () {
diff --git a/recipes-ti/ipc/ipc-transport-srio-test_git.bb b/recipes-ti/ipc/ipc-transport-srio-test_git.bb
index 866fc35..4e23fb2 100644
--- a/recipes-ti/ipc/ipc-transport-srio-test_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio-test_git.bb
@@ -1,5 +1,7 @@
 include ipc-transport-srio.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "ipc-transport-srio ipc-transport-qmss ti-ipc"
 
 DEVICELIST = "k2h k2k"
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
index 91e3be1..4b5c305 100644
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ b/recipes-ti/ipc/ipc-transport-srio.inc
@@ -1,13 +1,9 @@
 DESCRIPTION = "TI SRIO-Based IPC MessageQ Transport"
 LICENSE = "BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
+require ipc-transport.inc
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-linux/ipc-transport.git;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
-SRCREV = "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
-PV = "02.00.00.01"
+INC_PR_append = ".0"
 
 COMPATIBLE_MACHINE = "k2hk-evm"
 
diff --git a/recipes-ti/ipc/ipc-transport-srio_git.bb b/recipes-ti/ipc/ipc-transport-srio_git.bb
index 266aa4e..f0586d8 100644
--- a/recipes-ti/ipc/ipc-transport-srio_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio_git.bb
@@ -1,5 +1,7 @@
 include ipc-transport-srio.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "ti-ipc mpm-transport"
 
 do_compile () {
diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transport.inc
new file mode 100644
index 0000000..4ba3670
--- /dev/null
+++ b/recipes-ti/ipc/ipc-transport.inc
@@ -0,0 +1,15 @@
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
+
+IPC_TRANSPORT_GIT_URI = "git://git.ti.com/keystone-linux/ipc-transport.git"
+IPC_TRANSPORT_GIT_BRANCH = "master"
+IPC_TRANSPORT_GIT_PROTOCOL = "git"
+
+# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
+IPC_TRANSPORT_SRCREV = "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
+
+BRANCH="${IPC_TRANSPORT_GIT_BRANCH}"
+SRC_URI = "${IPC_TRANSPORT_GIT_URI};protocol=${IPC_TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${IPC_TRANSPORT_SRCREV}"
+PV = "02.00.00.01"
+
+INC_PR = "r1"
-- 
1.9.1


