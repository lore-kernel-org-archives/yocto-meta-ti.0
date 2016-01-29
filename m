Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5DD9E00A7D; Fri, 29 Jan 2016 11:38:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47C8DE0088B
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 11:38:12 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TJcBhY024330
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 13:38:11 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TJcBCY027104
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 13:38:11 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 13:38:11 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0TJcB3G007471;	Fri, 29 Jan 2016 13:38:11 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 29 Jan 2016 14:38:07 -0500
Message-ID: <1454096288-13840-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] netapi: Use INC_PR
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
X-List-Received-Date: Fri, 29 Jan 2016 19:38:16 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/netapi/netapi-test_git.bb | 2 ++
 recipes-ti/netapi/netapi.inc         | 2 +-
 recipes-ti/netapi/netapi_git.bb      | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/netapi/netapi-test_git.bb b/recipes-ti/netapi/netapi-test_git.bb
index 9d49c29..1347d34 100644
--- a/recipes-ti/netapi/netapi-test_git.bb
+++ b/recipes-ti/netapi/netapi-test_git.bb
@@ -4,6 +4,8 @@ DEPENDS = "netapi ipsecmgr"
 
 include netapi.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index f7e5393..e497b1a 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -7,7 +7,7 @@ SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANC
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
 SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
 PV = "01.01.00.06"
-PR = "r1"
+INC_PR = "r2"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
diff --git a/recipes-ti/netapi/netapi_git.bb b/recipes-ti/netapi/netapi_git.bb
index d88e95a..298a86f 100644
--- a/recipes-ti/netapi/netapi_git.bb
+++ b/recipes-ti/netapi/netapi_git.bb
@@ -6,6 +6,8 @@ DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktlib nwal-lld"
 
 include netapi.inc
 
+PR = "${INC_PR}.0"
+
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-- 
1.9.1


