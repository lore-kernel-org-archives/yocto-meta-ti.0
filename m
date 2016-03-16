Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BD0FE007D2; Wed, 16 Mar 2016 12:26:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C946DE007D2
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 12:26:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 19C8252A7A; Wed, 16 Mar 2016 19:26:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160316192611.19C8252A7A@arago-project.org>
Date: Wed, 16 Mar 2016 19:26:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : cmem: Bump SRCREV for keystone fix
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
X-List-Received-Date: Wed, 16 Mar 2016 19:26:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 4e50591bee82f45aed9cc8c62fd2d030dc4e4d09
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4e50591bee82f45aed9cc8c62fd2d030dc4e4d09

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Mar 17 01:24:04 2016 +0000

cmem: Bump SRCREV for keystone fix

* set dma_pfn_offset for keystone2 devices

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index ddf50a4..19d333c 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH ?= "lu-next"
-# This corresponds to version 4.10.02.03
-SRCREV = "00241c45f810c8b8e4f5ac66c3323fec8e43b621"
+# This corresponds to version 4.10.02.05_eng
+SRCREV = "8df44102413c2d653341c5b7e6caee882e206d8c"
 
-PV = "4.10.02.04+git${SRCPV}"
+PV = "4.10.02.05+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 


