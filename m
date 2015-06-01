Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EBEEE00AAF; Mon,  1 Jun 2015 08:03:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67132E009A1
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 08:03:45 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2310452A81; Mon,  1 Jun 2015 15:03:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601150345.2310452A81@arago-project.org>
Date: Mon,  1 Jun 2015 15:03:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cmem: Update to new version 4.10.01.02
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
X-List-Received-Date: Mon, 01 Jun 2015 15:03:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 7d01ae47ff7f0243b3601a36a148830bd768df42
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7d01ae47ff7f0243b3601a36a148830bd768df42

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed May 27 23:07:34 2015 +0000

cmem: Update to new version 4.10.01.02

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index bbb86b0..23e5f2e 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH ?= "master"
-# This corresponds to version 4.10.00.01
-SRCREV = "0d2fac7187ca1f6af62a98dee5b3621908cf5831"
+# This corresponds to version 4.10.01.02
+SRCREV = "a51d9770021fd16c97fc59b320286a3fa43278bc"
 
-PV = "4.10.00.01+git${SRCPV}"
+PV = "4.10.01.02+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 


