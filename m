Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6672DE007BA; Mon, 27 Feb 2017 10:12:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08618E00970
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 10:12:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 13A075298B; Mon, 27 Feb 2017 18:12:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170227181207.13A075298B@arago-project.org>
Date: Mon, 27 Feb 2017 18:12:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cmem: Update to new version 4.14.0.0_eng
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
X-List-Received-Date: Mon, 27 Feb 2017 18:12:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty-next
Commit: 660f6ae6250d0a2726fea8857e5e892fd625bbf0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=660f6ae6250d0a2726fea8857e5e892fd625bbf0

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Feb 16 21:24:18 2017 +0000

cmem: Update to new version 4.14.0.0_eng

Has update to changes related to Kernel 4.9

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index aa9c8f2..b6ffb27 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH = "lu-next"
-# This corresponds to version 4.13.00.01_eng
-SRCREV = "1389059f01eabc1e853a384f0e5f51c4f3e4f197"
+# This corresponds to version 4.14.00.00_eng
+SRCREV = "b514a99ac45c64f0439282d0774d7cff5def4c6f"
 
-PV = "4.13.00.01+git${SRCPV}"
+PV = "4.14.00.00+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 


