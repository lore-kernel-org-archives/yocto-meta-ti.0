Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30D22E00D6E; Wed, 16 Sep 2015 18:32:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94925E00D4E
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 18:31:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0A15F52AB1; Thu, 17 Sep 2015 01:31:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150917013156.0A15F52AB1@arago-project.org>
Date: Thu, 17 Sep 2015 01:31:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-ipc: Bump version to 3.40.01.08
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
X-List-Received-Date: Thu, 17 Sep 2015 01:32:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c75165343190c273a58abc3c0735ebe101eebe1c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c75165343190c273a58abc3c0735ebe101eebe1c

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Sep 16 18:15:04 2015 +0000

ti-ipc: Bump version to 3.40.01.08

* This provides a fix for GateMP support.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb |    9 ---------
 recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb |    9 +++++++++
 recipes-ti/ipc/ti-ipc_git.bb             |    8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb b/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
deleted file mode 100644
index e3f64b7..0000000
--- a/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-ipc-rtos.inc
-
-PV = "3_36_01_11"
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
-
-SRC_URI[ipczip.md5sum] = "560a75d6291ba1467ab9e328b3f7b995"
-SRC_URI[ipczip.sha256sum] = "ccf339a976a313c9f12cbdd91e74e7e0bc36507086b0cf077a344dcd79b9b273"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
new file mode 100644
index 0000000..7c93695
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
@@ -0,0 +1,9 @@
+require ti-ipc-rtos.inc
+
+PV = "3_40_01_08"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
+
+SRC_URI[ipczip.md5sum] = "738e1d54da9fab94899ad162f1ad78de"
+SRC_URI[ipczip.sha256sum] = "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 065d2c6..ac899bf 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -6,15 +6,15 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.36.01.11"
+PV = "3.40.01.08"
 
-BRANCH = "3.36"
+BRANCH = "3.40"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            file://0001-Add-kernel-build-dir.patch \
            "
-# Commit corresponds to 3.36.01.11
-SRCREV = "2a4256289d462d93a7e00a6ffb10bd46081a9500"
+# Commit corresponds to 3.40.01.08
+SRCREV = "239354b731b77e30a70230ebb54a31a83fc8b12f"
 
 S = "${WORKDIR}/git"
 


