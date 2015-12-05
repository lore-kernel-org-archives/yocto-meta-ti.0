Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E13CE009F3; Fri,  4 Dec 2015 19:12:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EF3DE009F3
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:12:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 65B1C52AC4; Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205031210.65B1C52AC4@arago-project.org>
Date: Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version 3.41.00.06_eng
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
X-List-Received-Date: Sat, 05 Dec 2015 03:12:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8e8618fb00fb63214a2a78c6f878c6e30fc62ded
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8e8618fb00fb63214a2a78c6f878c6e30fc62ded

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Dec  5 03:20:23 2015 +0000

ti-ipc: Update to new version 3.41.00.06_eng

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index d41796d..b29ac5b 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,11 +8,11 @@ BRANCH = "ipc-next"
 
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
 
-#Corresponds to 3.41.00.03_eng
-SRCREV = "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
+#Corresponds to 3.41.00.06_eng
+SRCREV = "795af8b9cec28bd6cdd1f00df1b9084b2a285cce"
 
 S = "${WORKDIR}/git"
-PV = "3.41.00.03"
+PV = "3.41.00.06"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


