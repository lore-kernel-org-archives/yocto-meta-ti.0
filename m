Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB2C8E009C5; Fri, 29 Jan 2016 11:38:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 164E2E0073D
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 11:38:13 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TJcClX000362
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 13:38:12 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TJcCgV027127
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 13:38:12 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 13:38:12 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0TJcB3H007471;	Fri, 29 Jan 2016 13:38:12 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 29 Jan 2016 14:38:08 -0500
Message-ID: <1454096288-13840-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454096288-13840-1-git-send-email-j-stiffler@ti.com>
References: <1454096288-13840-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] netapi: Only build binaries relevent to the machine
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
X-List-Received-Date: Fri, 29 Jan 2016 19:38:14 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/netapi/netapi-test_git.bb | 4 ++--
 recipes-ti/netapi/netapi.inc         | 9 +++++++--
 recipes-ti/netapi/netapi_git.bb      | 4 +---
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
 
-- 
1.9.1


