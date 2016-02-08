Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0505E00C71; Mon,  8 Feb 2016 09:30:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B200AE00D95
	for <meta-ti@yoctoproject.org>; Mon,  8 Feb 2016 09:30:55 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3710452A86; Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160208173055.3710452A86@arago-project.org>
Date: Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ipc-transport: Extract source info to common inc file
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
X-List-Received-Date: Mon, 08 Feb 2016 17:31:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 63903ffd3796719ff06459b2501ddc647cbef037
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=63903ffd3796719ff06459b2501ddc647cbef037

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Sat Feb  6 02:19:13 2016 +0000

ipc-transport: Extract source info to common inc file

* Also use new variables to specify the source info so this can be
  easily overridden and applied to each recipe.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ipc-transport-qmss-test_git.bb |    2 ++
 recipes-ti/ipc/ipc-transport-qmss.inc         |    8 ++------
 recipes-ti/ipc/ipc-transport-qmss_git.bb      |    2 ++
 recipes-ti/ipc/ipc-transport-srio-test_git.bb |    2 ++
 recipes-ti/ipc/ipc-transport-srio.inc         |    8 ++------
 recipes-ti/ipc/ipc-transport-srio_git.bb      |    2 ++
 recipes-ti/ipc/ipc-transport.inc              |   15 +++++++++++++++
 7 files changed, 27 insertions(+), 12 deletions(-)

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


