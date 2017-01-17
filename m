Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69AD3E009A5; Tue, 17 Jan 2017 12:04:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F3D0E00998
	for <meta-ti@yoctoproject.org>; Tue, 17 Jan 2017 12:04:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4E8E452AA5; Tue, 17 Jan 2017 20:04:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170117200417.4E8E452AA5@arago-project.org>
Date: Tue, 17 Jan 2017 20:04:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cmem: Update to new version 4.13.00.01_eng
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
X-List-Received-Date: Tue, 17 Jan 2017 20:04:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: refs/tags/ti2016.06
Commit: f0a7e52d65861a432ff94f2465e67e014cc7eca0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f0a7e52d65861a432ff94f2465e67e014cc7eca0

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Jan 10 23:06:50 2017 +0000

cmem: Update to new version 4.13.00.01_eng

Update to new version 4.13.00.01_eng with bug fix

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index af48891..aa9c8f2 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH = "lu-next"
-# This corresponds to version 4.13.00.00_eng
-SRCREV = "1b1e19754049446c20fba7c22b39b325eb0154ec"
+# This corresponds to version 4.13.00.01_eng
+SRCREV = "1389059f01eabc1e853a384f0e5f51c4f3e4f197"
 
-PV = "4.13.00.00+git${SRCPV}"
+PV = "4.13.00.01+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 


