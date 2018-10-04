Return-Path: <x0038811@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A8B3E00B5E; Thu,  4 Oct 2018 05:26:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 414DCE00A9B
	for <meta-ti@yoctoproject.org>; Thu,  4 Oct 2018 05:26:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w94CQSYK119285
	for <meta-ti@yoctoproject.org>; Thu, 4 Oct 2018 07:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538655988;
	bh=Um/P5V25/dS33y6Oqo9fr69cFaYRAumrPtbjiL1Ec9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WONhtioSaUM8cEwM/O7qZks7HvHmVt1uvV03EQ518Z5RTuGIySEaGQqeMlq0wUS3k
	ZjWx+jt36zommaUIZs517p9oC4cuV4rl8rB9MBReohrgwyOkc0CXAFVjzISm0Co5CY
	CnHlCZBm6rraomGilOfgTWzeXB1HLk0tog6AtUIs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w94CQSRY024072
	for <meta-ti@yoctoproject.org>; Thu, 4 Oct 2018 07:26:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 4 Oct 2018 07:26:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 4 Oct 2018 07:26:28 -0500
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w94CQOHh014156;
	Thu, 4 Oct 2018 07:26:27 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 4 Oct 2018 17:56:23 +0530
Message-ID: <1538655983-1625-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538655983-1625-1-git-send-email-x0038811@ti.com>
References: <1538655983-1625-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 1/1] ipumm: Update SRCREV and cleanup patches
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
X-List-Received-Date: Thu, 04 Oct 2018 12:26:30 -0000
Content-Type: text/plain

Cleanup the patch in meta-ti as the patch is merged
to ipumm repo

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...egration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch | 79 ----------------------
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  7 +-
 2 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch

diff --git a/recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch b/recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch
deleted file mode 100644
index 22e1a43..0000000
--- a/recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 19b01da6f9cd02c4869229e46d5cfeefa9d5a5c6 Mon Sep 17 00:00:00 2001
-From: Ramprasad N <x0038811@ti.com>
-Date: Fri, 17 Aug 2018 17:12:14 +0530
-Subject: [ipumm PATCH] Integration with IPC 3.50, BIOS 6.73, XDC 3.50
-
-    Integrating IPUMM with
-    IPC: 3.50.01.00
-    BIOS: 6.73.00.12
-    XDC: 3.50.07.20
-
-Signed-off-by: Ramprasad N <x0038811@ti.com>
----
- Makefile                              | 6 +++---
- build/common.bld                      | 2 +-
- platform/ti/dce/baseimage/dce_ipu.cfg | 4 ++--
- src/ti/framework/dce/dce.c            | 2 +-
- 4 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 929a2a3..87e1b10 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,9 +36,9 @@ REPO		:= $(BIOSTOOLSROOT)
- 
- # Different tool versions can easily be programmed by defining below variables
- # in your environment.
--XDCVERSION	?= xdctools_3_50_03_33_core
--BIOSVERSION	?= bios_6_52_00_12
--IPCVERSION	?= ipc_3_47_01_00
-+XDCVERSION	?= xdctools_3_50_07_20_core
-+BIOSVERSION	?= bios_6_73_00_12
-+IPCVERSION	?= ipc_3_50_01_00
- CEVERSION	?= codec_engine_3_24_00_08
- FCVERSION	?= framework_components_3_40_02_07
- XDAISVERSION	?= xdais_7_24_00_04
-diff --git a/build/common.bld b/build/common.bld
-index eacc2b7..ecc7de1 100644
---- a/build/common.bld
-+++ b/build/common.bld
-@@ -417,7 +417,7 @@ function GetVersionTag()
-   status = {};
-   var verInfo;
-   var git_cmd = "git ";
--  var ipc_ver = " IPC 3_47_01_00 ";
-+  var ipc_ver = " IPC 3_50_01_00 ";
-   var ipumm_ver = " MMIP 3_00_15_00 ";
- 
-   var type_cmd = "type ";
-diff --git a/platform/ti/dce/baseimage/dce_ipu.cfg b/platform/ti/dce/baseimage/dce_ipu.cfg
-index 5bc1139..c81af98 100644
---- a/platform/ti/dce/baseimage/dce_ipu.cfg
-+++ b/platform/ti/dce/baseimage/dce_ipu.cfg
-@@ -248,8 +248,8 @@ else
-     BIOS.smpEnabled = false;
- }
- 
--var Settings = xdc.useModule('ti.sysbios.posix.Settings');
--Settings.supportsMutexPriority = true;
-+var Settings = xdc.useModule('ti.posix.tirtos.Settings');
-+Settings.enableMutexPriority = true;
- 
- var Timer = xdc.useModule('ti.sysbios.timers.dmtimer.Timer');
- if(Program.global.HwType == hw_OMAP5)
-diff --git a/src/ti/framework/dce/dce.c b/src/ti/framework/dce/dce.c
-index 62bea8c..01dbcce 100644
---- a/src/ti/framework/dce/dce.c
-+++ b/src/ti/framework/dce/dce.c
-@@ -50,7 +50,7 @@
- #include <ti/sysbios/hal/Cache.h>
- #include <ti/sysbios/knl/Task.h>
- #include <ti/sysbios/knl/Semaphore.h>
--#include <ti/sysbios/posix/pthread.h>
-+#include <ti/posix/ccs/pthread.h>
- #include <xdc/cfg/global.h>
- #include <xdc/runtime/System.h>
- #include <xdc/runtime/Diags.h>
--- 
-1.9.1
-
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index cee72a8..f967728 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,15 +17,12 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "035ba2571a273162fde75a31decadc6534d17eca"
+SRCREV = "e95e96e6d1e112a18d6935a8ede91fefeae70a8f"
 
-SRC_URI += " \
-      file://0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch \
-"
 S = "${WORKDIR}/git"
 
 PV = "3.00.15.00"
-PR = "r2"
+PR = "r3"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.9.1


