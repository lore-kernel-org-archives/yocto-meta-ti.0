Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BEF5E00C90; Fri, 28 Aug 2015 17:42:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99F2AE00C9A
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 17:41:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 460DA5299C; Sat, 29 Aug 2015 00:41:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150829004158.460DA5299C@arago-project.org>
Date: Sat, 29 Aug 2015 00:41:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : boot-monitor: Update to new version 15.07
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
X-List-Received-Date: Sat, 29 Aug 2015 00:42:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 854403f60a1a74fe187f364cf43c07e95ad0656e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=854403f60a1a74fe187f364cf43c07e95ad0656e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Aug 25 19:54:46 2015 +0000

boot-monitor: Update to new version 15.07

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 4ad8448..c353488 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,14 +8,14 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "2.0+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-#Tag "K2_BM_14.09"
-SRCREV = "4b0287a3fa9c7a25c75bbe3a54f4ac2a92dc0aaa"
+#Tag "K2_BM_15.07"
+SRCREV = "62d198687a34a9df375c1686d75ad4f85515dcf9"
 
 BOOT_MONITOR_BINARY ?= "skern.bin"
 BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"


