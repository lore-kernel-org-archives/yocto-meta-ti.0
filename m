Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C53BE00CAA; Wed, 28 Sep 2016 00:26:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B7A4E00C92
	for <meta-ti@yoctoproject.org>; Wed, 28 Sep 2016 00:26:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4E79152A5D; Wed, 28 Sep 2016 07:26:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160928072647.4E79152A5D@arago-project.org>
Date: Wed, 28 Sep 2016 07:26:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cmem: Update to new version 4.12.00.00
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
X-List-Received-Date: Wed, 28 Sep 2016 07:26:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: cd04df2f24fc562692e231b2d63bb8ed0340d971
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cd04df2f24fc562692e231b2d63bb8ed0340d971

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Sep 26 23:24:39 2016 +0000

cmem: Update to new version 4.12.00.00

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 413f925..e68bb6b 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
-BRANCH ?= "lu-next"
-# This corresponds to version 4.11.00.00_eng
-SRCREV = "852e97b5584cbdb6aa0fdef02a7c4e245409bcb6"
+BRANCH = "master"
+# This corresponds to version 4.12.00.00
+SRCREV = "d6d3e84c84d0e84a9b96c3f6f789ac642d03afcb"
 
-PV = "4.11.00.00+git${SRCPV}"
+PV = "4.12.00.00+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 


