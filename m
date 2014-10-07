Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7087E007C1; Tue,  7 Oct 2014 15:26:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5B6AE0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 15:25:50 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ND3006SMIAJ0M40@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 07 Oct 2014 17:25:32 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 53DF320101; Tue,
	07 Oct 2014 18:25:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 07 Oct 2014 18:25:30 -0400
Message-id: <1412720730-20619-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] boot-monitor: pass float ABI flag to fix gcc-4.9.1 issue with stubs
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
X-List-Received-Date: Tue, 07 Oct 2014 22:26:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Otherwise fails with the below error, similar to am33x-cm3:

fatal error: gnu/stubs-soft.h: No such file or directory

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 6e68213..6967be7 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -1,11 +1,5 @@
 DESCRIPTION = "Boot Monitor - TI ARM Boot monitor code"
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
-
 LICENSE = "BSD"
-
-BOOT_MONITOR_BINARY ?= "skern.bin"
-BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
 COMPATIBLE_MACHINE = "keystone"
@@ -22,6 +16,13 @@ S = "${WORKDIR}/git"
 #Tag "K2_BM_14.05"
 SRCREV = "0e3ffe1ea4a0cee38ae2406901b7cf4d5324b5e9"
 
+BOOT_MONITOR_BINARY ?= "skern.bin"
+BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
+
+FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}""
+
 do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
-- 
2.1.2


