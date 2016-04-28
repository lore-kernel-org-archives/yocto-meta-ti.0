Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5D8BE00E0A; Thu, 28 Apr 2016 12:00:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3408FE00E0C
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 12:00:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C1285529EF; Thu, 28 Apr 2016 19:00:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160428190038.C1285529EF@arago-project.org>
Date: Thu, 28 Apr 2016 19:00:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cmem: Update to new eng version 4.11.00.00_eng
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
X-List-Received-Date: Thu, 28 Apr 2016 19:00:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 257a370e7aec4a8954e79697deafec2cd7c2301d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=257a370e7aec4a8954e79697deafec2cd7c2301d

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Apr 28 00:19:45 2016 +0000

cmem: Update to new eng version 4.11.00.00_eng

Resolves issues with kernel version 4.4

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 19d333c..413f925 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH ?= "lu-next"
-# This corresponds to version 4.10.02.05_eng
-SRCREV = "8df44102413c2d653341c5b7e6caee882e206d8c"
+# This corresponds to version 4.11.00.00_eng
+SRCREV = "852e97b5584cbdb6aa0fdef02a7c4e245409bcb6"
 
-PV = "4.10.02.05+git${SRCPV}"
+PV = "4.11.00.00+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 


