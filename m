Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E78AE00AEE; Fri, 13 Nov 2015 22:23:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_DYNIP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  0.0 TO_NO_BRKTS_DYNIP To: lacks brackets and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E487EE00AB7
	for <meta-ti@yoctoproject.org>; Fri, 13 Nov 2015 22:23:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 86CBB52AD5; Sat, 14 Nov 2015 06:23:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151114062330.86CBB52AD5@arago-project.org>
Date: Sat, 14 Nov 2015 06:23:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : cppi, qmss, traceframework: set sane defaults when platform is not defined
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
X-List-Received-Date: Sat, 14 Nov 2015 06:23:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 610d0ecdc1b42bb9b0428db387093cad73cdbdd9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=610d0ecdc1b42bb9b0428db387093cad73cdbdd9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Nov 14 11:26:30 2015 +0000

cppi, qmss, traceframework: set sane defaults when platform is not defined

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cppi-lld/cppi-lld.inc                |    3 ++-
 recipes-bsp/qmss-lld/qmss-lld.inc                |    3 ++-
 recipes-bsp/traceframework/traceframework_git.bb |    4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index cbcad34..6182973 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -17,8 +17,9 @@ SRC_URI = "${CPPI_LLD_GIT_URI};destsuffix=${CPPI_LLD_GIT_DESTSUFFIX};protocol=${
 
 SRCREV = "${CPPI_LLD_SRCREV}"
 PV = "02.01.00.10"
-INC_PR = "r2"
+INC_PR = "r3"
 
+DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
 DEVICELIST_k2e-evm  = "k2e"
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 1cf9b0b..9520cea 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -17,8 +17,9 @@ SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${
 SRCREV = "${QMSS_LLD_SRCREV}"
 
 PV = "02.01.00.11"
-INC_PR = "r1"
+INC_PR = "r2"
 
+DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2e-evm = "k2e"
diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 7a40291..d6b5023 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -15,13 +15,13 @@ SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX}
 SRCREV = "${TRACEFRAMEWORK_SRCREV}"
 
 PV = "01.01.01.07"
-PR = "r2"
+PR = "r3"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "cuia"
 
-DEVICELIST = ""
+DEVICELIST = "k2k k2h k2e k2l"
 DEVICELIST_append_tci6614-evm = "c6614"
 DEVICELIST_append_k2hk-evm    = "k2k k2h"
 DEVICELIST_append_k2e-evm     = "k2e"


