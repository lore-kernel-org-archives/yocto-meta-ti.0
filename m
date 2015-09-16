Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BE54E00D34; Wed, 16 Sep 2015 05:15:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F224AE00C2C
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 05:15:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GCF9t8009804
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 07:15:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GCF9QZ006284
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 07:15:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 07:15:10 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t8GCF9TR013636;	Wed, 16 Sep 2015 07:15:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 16 Sep 2015 08:15:04 -0400
Message-ID: <1442405706-27242-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] ti-ipc: Bump version to 3.40.01.08
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
X-List-Received-Date: Wed, 16 Sep 2015 12:15:15 -0000
Content-Type: text/plain

* This provides a fix for GateMP support.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ipc/{ti-ipc-rtos_3.36.01.11.bb => ti-ipc-rtos_3.40.01.08.bb}  | 8 ++++----
 recipes-ti/ipc/ti-ipc_git.bb                                      | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename recipes-ti/ipc/{ti-ipc-rtos_3.36.01.11.bb => ti-ipc-rtos_3.40.01.08.bb} (42%)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
similarity index 42%
rename from recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
rename to recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
index e3f64b7..7c93695 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_3.36.01.11.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
@@ -1,9 +1,9 @@
 require ti-ipc-rtos.inc
 
-PV = "3_36_01_11"
-PR = "r1"
+PV = "3_40_01_08"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
 
-SRC_URI[ipczip.md5sum] = "560a75d6291ba1467ab9e328b3f7b995"
-SRC_URI[ipczip.sha256sum] = "ccf339a976a313c9f12cbdd91e74e7e0bc36507086b0cf077a344dcd79b9b273"
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
 
-- 
1.9.1


