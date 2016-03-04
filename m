Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 055D3E00B89; Fri,  4 Mar 2016 13:58:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 996E0E00B89
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 13:58:35 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5EAB752AC7; Fri,  4 Mar 2016 21:58:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160304215835.5EAB752AC7@arago-project.org>
Date: Fri,  4 Mar 2016 21:58:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : multiprocmgr: Add SRCREV
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
X-List-Received-Date: Fri, 04 Mar 2016 21:58:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 749ec9792a88c3eb1df62cb55a9bc6c1422444db
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=749ec9792a88c3eb1df62cb55a9bc6c1422444db

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Sat Mar  5 03:52:06 2016 +0000

multiprocmgr: Add SRCREV

* This commit corresponds to the tag DEV.MPM-3.00.01.00

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 915ac7a..9c134c4 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -9,7 +9,7 @@ MULTIPROCMGR_GIT_PROTOCOL = "git"
 MULTIPROCMGR_GIT_BRANCH = "master"
 
 # The following commits correspond to DEV.MPM-3.00.01.00
-MULTIPROCMGR_SRCREV = ""
+MULTIPROCMGR_SRCREV = "6c2c0f7d14d34eb9074c6d6a6bd112da3751fb7e"
 
 PV = "3.0.1.0"
 INC_PR = "r0"


