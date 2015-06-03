Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E6B2E0095D; Wed,  3 Jun 2015 15:54:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24DB6E007B6
	for <meta-ti@yoctoproject.org>; Wed,  3 Jun 2015 15:54:13 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPE00M684YB3JF0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 03 Jun 2015 17:54:13 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=eIhxMilvRf8A:10 a=0gcC27t9AAAA:8	a=oR5dmqMzAAAA:8 a=-9mUelKeXuEA:10
	a=XAFQembCKUMA:10 a=sozttTNsAAAA:8	a=-tNj2r8LOxEOZgpYljkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5EA45161A73;	Wed,
	3 Jun 2015 18:54:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 03 Jun 2015 18:54:10 -0400
Message-id: <1433372050-3226-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ti-ipc: update to 3.36.01.11
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
X-List-Received-Date: Wed, 03 Jun 2015 22:54:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb | 8 --------
 recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb | 8 ++++++++
 recipes-ti/ipc/ti-ipc_git.bb             | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.35.01.07.bb
 create mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb

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
 
-- 
2.2.0


