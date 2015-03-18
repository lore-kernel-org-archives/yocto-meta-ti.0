Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F123E008EA; Tue, 17 Mar 2015 18:04:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28CA9E008EA
	for <meta-ti@yoctoproject.org>; Tue, 17 Mar 2015 18:04:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A0B78529A9; Wed, 18 Mar 2015 01:04:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150318010412.A0B78529A9@arago-project.org>
Date: Wed, 18 Mar 2015 01:04:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : multiprocmgr: Add virutal/kernel dependency.
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
X-List-Received-Date: Wed, 18 Mar 2015 01:04:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c69c6e137e90f5326d617ba71dd00b4727d21a4a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c69c6e137e90f5326d617ba71dd00b4727d21a4a

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Mar 18 00:32:52 2015 +0000

multiprocmgr: Add virutal/kernel dependency.

* "linux/remoteproc_user.h" is included by ./src/daemon/mpmdlif.c

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index e1c4f2f..c2ef8fa 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Provides download, debug and other utilities for other cores in the S
 
 include multiprocmgr.inc
 
-DEPENDS = "mpm-transport libdaemon"
+DEPENDS = "mpm-transport libdaemon virtual/kernel"
 RDEPENDS_${PN} = "syslog-ng"
 
 


