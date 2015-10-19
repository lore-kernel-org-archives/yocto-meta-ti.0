Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC765E00843; Mon, 19 Oct 2015 14:12:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05997E00814
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 306EE52AC9; Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211148.306EE52AC9@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new version 2.0.1.10
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
X-List-Received-Date: Mon, 19 Oct 2015 21:12:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8d9332046550857221316262b6f47ab88938a8a7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8d9332046550857221316262b6f47ab88938a8a7

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:39:14 2015 +0000

multiprocmgr: Update to new version 2.0.1.10

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 1d9b326..d9360b5 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -5,9 +5,9 @@ SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
 BRANCH = "master"
-# The following commits correspond to DEV.MPM-2.00.01.08
-SRCREV = "ae3d5630b7c7ce5a795d56bd58957175402a0d17"
-PV = "2.0.1.8"
+# The following commits correspond to DEV.MPM-2.00.01.10D
+SRCREV = "4cb6009d6a3c94cea41ae6155a974e9ca44d982f"
+PV = "2.0.1.10"
 
 SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
 


