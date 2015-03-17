Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14D7BE008EA; Tue, 17 Mar 2015 11:33:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C007AE00753
	for <meta-ti@yoctoproject.org>; Tue, 17 Mar 2015 11:32:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HIWuYR011821
	for <meta-ti@yoctoproject.org>; Tue, 17 Mar 2015 13:32:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HIWtI3027588
	for <meta-ti@yoctoproject.org>; Tue, 17 Mar 2015 13:32:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 13:32:55 -0500
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2HIWsWD022303;	Tue, 17 Mar 2015 13:32:54 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 17 Mar 2015 14:32:52 -0400
Message-ID: <1426617172-12121-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: Add virutal/kernel dependency.
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
X-List-Received-Date: Tue, 17 Mar 2015 18:33:02 -0000
Content-Type: text/plain

* "linux/remoteproc_user.h" is included by ./src/daemon/mpmdlif.c

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index e1c4f2f..c2ef8fa 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Provides download, debug and other utilities for other cores in the S
 
 include multiprocmgr.inc
 
-DEPENDS = "mpm-transport libdaemon"
+DEPENDS = "mpm-transport libdaemon virtual/kernel"
 RDEPENDS_${PN} = "syslog-ng"
 
 
-- 
1.7.9.5


