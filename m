Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4A22E0088B; Mon,  1 Feb 2016 14:09:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38179E0079A
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 14:09:03 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4210C52A7F; Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160201220903.4210C52A7F@arago-project.org>
Date: Mon,  1 Feb 2016 22:09:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : netapi: Use INC_PR
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
X-List-Received-Date: Mon, 01 Feb 2016 22:09:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 4260a7351187ccc63e4744554ff0780b857785fe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4260a7351187ccc63e4744554ff0780b857785fe

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Sat Jan 30 01:38:07 2016 +0000

netapi: Use INC_PR

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi-test_git.bb |    2 ++
 recipes-ti/netapi/netapi.inc         |    2 +-
 recipes-ti/netapi/netapi_git.bb      |    2 ++
 3 files changed, 5 insertions(+), 1 deletions(-)

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


