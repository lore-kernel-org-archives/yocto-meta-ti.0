Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF81FE00CA4; Fri, 16 Sep 2016 09:19:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43E44E00CAF
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6B20F529C6; Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161910.6B20F529C6@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : edma3-lld: Bump version
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 614a7c38725988c6b5ff84e998e2140b2d1387c7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=614a7c38725988c6b5ff84e998e2140b2d1387c7

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Sep 14 23:30:51 2016 +0000

edma3-lld: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 4de5987..2853dd2 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -6,12 +6,12 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
 EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_01_24"
-EDMA3_LLD_SRCREV = "e864a057032b070fc04628bac1345ecef01e2224"
+# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_01_25A"
+EDMA3_LLD_SRCREV = "b2d61c61dd048bdea35e9b2810647b4d419a82b5"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${EDMA3_LLD_SRCREV}"
 
-PV = "2.12.01.24"
+PV = "2.12.01.25A"
 INC_PR = "r0"


