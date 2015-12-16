Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2D9EE0079A; Tue, 15 Dec 2015 19:19:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DC2CE0079A
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 19:19:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 522AA52976; Wed, 16 Dec 2015 03:19:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151216031941.522AA52976@arago-project.org>
Date: Wed, 16 Dec 2015 03:19:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multiprocmgr: mark as machine-specific due to kernel dependency
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
X-List-Received-Date: Wed, 16 Dec 2015 03:19:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 25b0ab7f2991781d6d90daae2b735dd528a0d997
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=25b0ab7f2991781d6d90daae2b735dd528a0d997

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Dec 16 03:00:58 2015 +0000

multiprocmgr: mark as machine-specific due to kernel dependency

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr_git.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index c2ef8fa..c903f3a 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -3,9 +3,12 @@ SUMMARY = "Provides download, debug and other utilities for other cores in the S
 
 include multiprocmgr.inc
 
+PR = "r1"
+
 DEPENDS = "mpm-transport libdaemon virtual/kernel"
 RDEPENDS_${PN} = "syslog-ng"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 CC += "-I${STAGING_KERNEL_DIR}/include"
 


