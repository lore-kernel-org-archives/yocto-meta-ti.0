Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04453E008F5; Thu, 28 Jan 2016 10:21:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F477E00A7D
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:21:49 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BCB7B529C9; Thu, 28 Jan 2016 18:21:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128182148.BCB7B529C9@arago-project.org>
Date: Thu, 28 Jan 2016 18:21:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : multiprocmgr: Clean up recipes
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
X-List-Received-Date: Thu, 28 Jan 2016 18:21:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 1d3ae0e54853e2a85d6526c025c8cb6211c910fe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1d3ae0e54853e2a85d6526c025c8cb6211c910fe

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 19:59:08 2016 +0000

multiprocmgr: Clean up recipes

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb |    2 ++
 recipes-ti/multiprocmgr/multiprocmgr.inc         |   13 ++++++++++---
 recipes-ti/multiprocmgr/multiprocmgr_git.bb      |    2 +-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
index b05cd44..8605cf1 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "TI Multiproc Manager test code"
 
 include multiprocmgr.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "multiprocmgr cmem"
 RDEPENDS_${PN} = "multiprocmgr mpm-transport cmem"
 
diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index ebe2eee..122ac0f 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -4,11 +4,18 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
 SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "master"
+MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
+MULTIPROCMGR_GIT_PROTOCOL = "git"
+MULTIPROCMGR_GIT_BRANCH = "master"
+
 # The following commits correspond to DEV.MPM-3.00.00.02
-SRCREV = "319c6cfe15054df08eb70cbedc99a88dd5a06cda"
+MULTIPROCMGR_SRCREV = "319c6cfe15054df08eb70cbedc99a88dd5a06cda"
+
 PV = "3.0.0.2"
+INC_PR = "r2"
 
-SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
+BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
+SRC_URI = "${MULTIPROCMGR_GIT_URI};protocol=${MULTIPROCMGR_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${MULTIPROCMGR_SRCREV}"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index c903f3a..38d4ceb 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Provides download, debug and other utilities for other cores in the S
 
 include multiprocmgr.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 DEPENDS = "mpm-transport libdaemon virtual/kernel"
 RDEPENDS_${PN} = "syslog-ng"


