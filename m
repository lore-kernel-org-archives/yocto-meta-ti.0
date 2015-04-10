Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00098E009A4; Fri, 10 Apr 2015 14:54:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A889AE00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 14:54:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ALslnA012601
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:54:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ALskQ6003305
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 16:54:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 16:54:45 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3ALsjg1008664;	Fri, 10 Apr 2015 16:54:45 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 10 Apr 2015 17:54:44 -0400
Message-ID: <1428702884-23501-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mmap-lld: Update to new version 2.0.0.4
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
X-List-Received-Date: Fri, 10 Apr 2015 21:54:49 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/mmap-lld/mmap-lld.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index b8a5b32..7c19ee8 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
-# Commit correspond to DEV.MMAP.02.00.00.03
-SRCREV = "601f9284c392f67bb7f69ed1a5df5231a43c3137"
+# Commit correspond to DEV.MMAP.02.00.00.04
+SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
 
-PV="2.0.0"
-PR = "r0"
+PV = "2.0.0.4"
+PR = "r1"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
\ No newline at end of file
-- 
1.7.9.5


