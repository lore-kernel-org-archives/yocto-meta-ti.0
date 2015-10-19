Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC350E00343; Mon, 19 Oct 2015 12:12:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F17CAE0048C
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:12:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2DA4C52A5A; Mon, 19 Oct 2015 19:12:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019191255.2DA4C52A5A@arago-project.org>
Date: Mon, 19 Oct 2015 19:12:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : rm-lld: Update to new version 2.1.2.0
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
X-List-Received-Date: Mon, 19 Oct 2015 19:12:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a266decde2166d5875e57978cd4d6fd86b9a2083
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a266decde2166d5875e57978cd4d6fd86b9a2083

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:11:37 2015 +0000

rm-lld: Update to new version 2.1.2.0

-Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rm-lld/rm-lld_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
index beac927..8b2806c 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b6536
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.RM_LLD.02.01.00.08
-SRCREV = "7873d22076b4cb865365bbce20a244121414bb44"
-PV = "02.01.00.08"
+# Below commit ID corresponds to DEV.RM_LLD.02.01.02.00
+SRCREV = "b3d711203c6b4cf99fb2f95dc2f4728dfd1b2639"
+PV = "02.01.02.00"
 PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone"


