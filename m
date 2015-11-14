Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA04AE00AEE; Fri, 13 Nov 2015 21:26:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85BFBE00AB7
	for <meta-ti@yoctoproject.org>; Fri, 13 Nov 2015 21:26:50 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXS00IVPHS6Q870@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 13 Nov 2015 23:26:31 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=H8UvC2ZNaYvrD2VRZ7MA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A569C161D12;	Sat,
	14 Nov 2015 00:26:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 14 Nov 2015 00:26:30 -0500
Message-id: <1447478790-19890-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] cppi, qmss, traceframework: set sane defaults when platform is not defined
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
X-List-Received-Date: Sat, 14 Nov 2015 05:26:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld.inc                | 3 ++-
 recipes-bsp/qmss-lld/qmss-lld.inc                | 3 ++-
 recipes-bsp/traceframework/traceframework_git.bb | 4 ++--
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
-- 
2.2.0


