Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8377E0084F; Tue,  7 Oct 2014 16:04:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FF08E00786
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 16:04:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 858DA52A3F; Tue,  7 Oct 2014 23:04:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141007230431.858DA52A3F@arago-project.org>
Date: Tue,  7 Oct 2014 23:04:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : boot-monitor: pass float ABI flag to fix gcc-4.9. 1 issue with stubs
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
X-List-Received-Date: Tue, 07 Oct 2014 23:04:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 51621f90c114ee335a1ef29cc49968416ddf35a4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=51621f90c114ee335a1ef29cc49968416ddf35a4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Oct  8 04:25:30 2014 +0000

boot-monitor: pass float ABI flag to fix gcc-4.9.1 issue with stubs

Otherwise fails with the below error, similar to am33x-cm3:

fatal error: gnu/stubs-soft.h: No such file or directory

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

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


