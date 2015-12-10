Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35499E00B37; Thu, 10 Dec 2015 10:31:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BE36E0074C
	for <meta-ti@yoctoproject.org>; Thu, 10 Dec 2015 10:31:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D5F8552A72; Thu, 10 Dec 2015 18:31:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151210183119.D5F8552A72@arago-project.org>
Date: Thu, 10 Dec 2015 18:31:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version 3.41.0.7_eng
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
X-List-Received-Date: Thu, 10 Dec 2015 18:31:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 12ac3bac279175a541c1d28d99eb2c1a45d3ea8e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=12ac3bac279175a541c1d28d99eb2c1a45d3ea8e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Dec 10 21:55:51 2015 +0000

ti-ipc: Update to new version 3.41.0.7_eng

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index b29ac5b..4cdb25c 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,11 +8,11 @@ BRANCH = "ipc-next"
 
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
 
-#Corresponds to 3.41.00.06_eng
-SRCREV = "795af8b9cec28bd6cdd1f00df1b9084b2a285cce"
+#Corresponds to 3.41.00.07_eng
+SRCREV = "7370abce2e3f2a09fd4b057fbbf9e7d3d029c0df"
 
 S = "${WORKDIR}/git"
-PV = "3.41.00.06"
+PV = "3.41.00.07"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


