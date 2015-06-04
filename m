Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D680E00A08; Wed,  3 Jun 2015 17:27:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27791E009FA
	for <meta-ti@yoctoproject.org>; Wed,  3 Jun 2015 17:27:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CAEF352A2B; Thu,  4 Jun 2015 00:27:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150604002729.CAEF352A2B@arago-project.org>
Date: Thu,  4 Jun 2015 00:27:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc: update to 3.36.01.11
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
X-List-Received-Date: Thu, 04 Jun 2015 00:27:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 24c5c09b5de25f83eca6baef58cd29cbb6e058ba
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=24c5c09b5de25f83eca6baef58cd29cbb6e058ba

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jun  4 04:54:10 2015 +0000

ti-ipc: update to 3.36.01.11

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb |    8 --------
 recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb |    8 ++++++++
 recipes-ti/ipc/ti-ipc_git.bb             |    8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb b/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
deleted file mode 100644
index 4c67c6e..0000000
--- a/recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ti-ipc-rtos.inc
-
-PV = "3_35_01_07"
-
-LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
-
-SRC_URI[ipczip.md5sum] = "9e62e35b8c2d44b1ac5f7ad9554b1a34"
-SRC_URI[ipczip.sha256sum] = "006ac780ded0a5fa843397bbde0cb597338dc521544121f697c2efdd80f86314"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb b/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
new file mode 100644
index 0000000..07a8136
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
@@ -0,0 +1,8 @@
+require ti-ipc-rtos.inc
+
+PV = "3_36_01_11"
+
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
+
+SRC_URI[ipczip.md5sum] = "560a75d6291ba1467ab9e328b3f7b995"
+SRC_URI[ipczip.sha256sum] = "ccf339a976a313c9f12cbdd91e74e7e0bc36507086b0cf077a344dcd79b9b273"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index bb2c3c9..5f0b8db 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.35.01.07"
+PV = "3.36.01.11"
 
-BRANCH = "master"
+BRANCH = "3.36"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            "
-# Commit corresponds to 3.35.01.07
-SRCREV = "358d966c9f5973faf9ab71fb1d7dfe5d3e08a8dc"
+# Commit corresponds to 3.36.01.11
+SRCREV = "2a4256289d462d93a7e00a6ffb10bd46081a9500"
 
 S = "${WORKDIR}/git"
 


