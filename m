Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31B38E009AE; Fri, 10 Apr 2015 10:59:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8EEEE009A1
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 10:59:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C524352A77; Fri, 10 Apr 2015 17:59:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410175952.C524352A77@arago-project.org>
Date: Fri, 10 Apr 2015 17:59:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : srss-tc: Update to new version 1.0.0.1
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
X-List-Received-Date: Fri, 10 Apr 2015 17:59:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 329af944f1745eef76133861a74fe24d1df2f72c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=329af944f1745eef76133861a74fe24d1df2f72c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Apr 10 19:44:19 2015 +0000

srss-tc: Update to new version 1.0.0.1

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srss-tc/srss-tc_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srss-tc_git.bb
index 79edbed..3c90069 100644
--- a/recipes-bsp/srss-tc/srss-tc_git.bb
+++ b/recipes-bsp/srss-tc/srss-tc_git.bb
@@ -4,11 +4,11 @@ LICENSE = "BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c17cd1dc60dc06a4c4f2a2c45472a51"
 COMPATIBLE_MACHINE = "keystone"
 
-PV = "1.0.0.0"
+PV = "1.0.0.1"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.SRSS-TC-01.00.00.00A
-SRCREV = "7aaf8308d7ba470144730275df12edae5007e07a"
+# This commit corresponds to tag DEV.SRSS-TC-01.00.00.01A
+SRCREV = "107cd1433ef5785e5647ef086a4cc77566506604"
 
 SRC_URI = "git://git.ti.com/keystone-linux/srss-tc.git;protocol=git;branch=${BRANCH}"
 


