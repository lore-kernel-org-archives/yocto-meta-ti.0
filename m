Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5AF61E009C3; Wed, 22 Apr 2015 09:04:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56B3BE009AF
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 09:04:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EAB5C52ACB; Wed, 22 Apr 2015 16:04:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150422160452.EAB5C52ACB@arago-project.org>
Date: Wed, 22 Apr 2015 16:04:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new version 2.0.1.8
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
X-List-Received-Date: Wed, 22 Apr 2015 16:04:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0a47b71b8c4222ca5136584aed15acbc218b199e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0a47b71b8c4222ca5136584aed15acbc218b199e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Apr 13 23:59:17 2015 +0000

multiprocmgr: Update to new version 2.0.1.8

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 26c8959..1d9b326 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -5,9 +5,9 @@ SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
 BRANCH = "master"
-# The following commits correspond to DEV.MPM-2.00.01.07
-SRCREV = "b79e1cdaed78014569d82cf2f748d3f5f91623ee"
-PV = "2.0.1.7"
+# The following commits correspond to DEV.MPM-2.00.01.08
+SRCREV = "ae3d5630b7c7ce5a795d56bd58957175402a0d17"
+PV = "2.0.1.8"
 
 SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
 


