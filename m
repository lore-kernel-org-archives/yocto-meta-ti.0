Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 872FFE00C1A; Fri, 18 Dec 2015 11:24:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 322AFE0078A
	for <meta-ti@yoctoproject.org>; Fri, 18 Dec 2015 11:24:15 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9186752A6D; Fri, 18 Dec 2015 19:24:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151218192414.9186752A6D@arago-project.org>
Date: Fri, 18 Dec 2015 19:24:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Dan Murphy : boot-monitor: Update commit sha for boot monitor
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
X-List-Received-Date: Fri, 18 Dec 2015 19:24:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 120ecb5a16a733baeaf5f844441beb66e0f1c568
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=120ecb5a16a733baeaf5f844441beb66e0f1c568

Author: Dan Murphy <dmurphy@ti.com>
Date:   Fri Dec 18 19:58:18 2015 +0000

boot-monitor: Update commit sha for boot monitor

Update the commit sha to the latest commit for
the boot monitor and uptick the rev as well
The update contains non-critical build fixes

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 081e605..e532f21 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,13 +8,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "3.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "28e4fba48f49cc6223d01bffc912fd9f8d1b54e7"
+SRCREV = "035329caed63abe7193c855ad5d561ae783b19d7"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 


