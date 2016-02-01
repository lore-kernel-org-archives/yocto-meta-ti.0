Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2D65E00AD8; Mon,  1 Feb 2016 14:09:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA786E0088B
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 14:09:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CC81A52ABB; Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160201220903.CC81A52ABB@arago-project.org>
Date: Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : netapi: Only build binaries relevent to the machine
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
X-List-Received-Date: Mon, 01 Feb 2016 22:09:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 504c5919e7374cd4e92cfa84d6fba626209e72ed
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=504c5919e7374cd4e92cfa84d6fba626209e72ed

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Sat Jan 30 01:38:08 2016 +0000

netapi: Only build binaries relevent to the machine

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi-test_git.bb |    4 ++--
 recipes-ti/netapi/netapi.inc         |    9 +++++++--
 recipes-ti/netapi/netapi_git.bb      |    4 +---
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/netapi/netapi-test_git.bb b/recipes-ti/netapi/netapi-test_git.bb
index 1347d34..3b7825c 100644
--- a/recipes-ti/netapi/netapi-test_git.bb
+++ b/recipes-ti/netapi/netapi-test_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Provides test and application binaries using NETAPI module"
-COMPATIBLE_MACHINE = "keystone"
+
 DEPENDS = "netapi ipsecmgr"
 
 include netapi.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index e497b1a..0e7b04b 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -1,15 +1,20 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f2307287ca2074"
 
+COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
 
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
 SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
 PV = "01.01.00.06"
-INC_PR = "r2"
+INC_PR = "r3"
 
-DEVICELIST = "k2h k2k k2l k2e"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2e-evm  = "k2e"
 
 CHOICELIST = "yes no"
 
diff --git a/recipes-ti/netapi/netapi_git.bb b/recipes-ti/netapi/netapi_git.bb
index 298a86f..4427ecc 100644
--- a/recipes-ti/netapi/netapi_git.bb
+++ b/recipes-ti/netapi/netapi_git.bb
@@ -1,12 +1,10 @@
 DESCRIPTION = "Provides NETAPI module: TI user space network library"
 
-COMPATIBLE_MACHINE = "keystone"
-
 DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktlib nwal-lld"
 
 include netapi.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 


