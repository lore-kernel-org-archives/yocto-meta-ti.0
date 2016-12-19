Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6997E00C1F; Mon, 19 Dec 2016 15:19:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FA79E00B8F
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:19:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4343052A3D; Mon, 19 Dec 2016 23:19:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231929.4343052A3D@arago-project.org>
Date: Mon, 19 Dec 2016 23:19:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new version 3.0.2.0
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
X-List-Received-Date: Mon, 19 Dec 2016 23:19:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f45382c76e2870590ad729995b932268cd620906
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f45382c76e2870590ad729995b932268cd620906

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Dec 17 04:40:18 2016 +0000

multiprocmgr: Update to new version 3.0.2.0

This version add dependce on CMEM

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc    |    6 +++---
 recipes-ti/multiprocmgr/multiprocmgr_git.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 9c134c4..b8bbb56 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -8,10 +8,10 @@ MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
 MULTIPROCMGR_GIT_PROTOCOL = "git"
 MULTIPROCMGR_GIT_BRANCH = "master"
 
-# The following commits correspond to DEV.MPM-3.00.01.00
-MULTIPROCMGR_SRCREV = "6c2c0f7d14d34eb9074c6d6a6bd112da3751fb7e"
+# The following commits correspond to DEV.MPM-3.00.02.00
+MULTIPROCMGR_SRCREV = "303692fe954f36df91c90c300875a6587cb23556"
 
-PV = "3.0.1.0"
+PV = "3.0.2.0"
 INC_PR = "r0"
 
 BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index 2960ee3..cafcd98 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -7,7 +7,7 @@ SRC_URI_append = " file://mpmsrv-daemon.service"
 
 PR = "${INC_PR}.1"
 
-DEPENDS = "mpm-transport libdaemon virtual/kernel"
+DEPENDS = "mpm-transport libdaemon virtual/kernel cmem"
 RDEPENDS_${PN} = "syslog-ng"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


