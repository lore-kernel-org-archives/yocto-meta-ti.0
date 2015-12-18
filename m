Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 792BBE00BDA; Fri, 18 Dec 2015 05:58:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37131E00AB9
	for <meta-ti@yoctoproject.org>; Fri, 18 Dec 2015 05:58:13 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBIDwC5g026789
	for <meta-ti@yoctoproject.org>; Fri, 18 Dec 2015 07:58:12 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBIDwCt1008112
	for <meta-ti@yoctoproject.org>; Fri, 18 Dec 2015 07:58:12 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Dec 2015 07:58:11 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBIDwCuA023048;	Fri, 18 Dec 2015 07:58:12 -0600
Received: from localhost (a0272616local.am.dhcp.ti.com [172.22.176.145])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	tBIDwB917468; Fri, 18 Dec 2015 07:58:11 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 18 Dec 2015 07:58:18 -0600
Message-ID: <1450447098-22234-1-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.0.rc1
MIME-Version: 1.0
Subject: [PATCH] boot-monitor: Update commit sha for boot monitor
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
X-List-Received-Date: Fri, 18 Dec 2015 13:58:17 -0000
Content-Type: text/plain

Update the commit sha to the latest commit for
the boot monitor and uptick the rev as well

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 081e605..e532f21 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,13 +8,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "3.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "28e4fba48f49cc6223d01bffc912fd9f8d1b54e7"
+SRCREV = "035329caed63abe7193c855ad5d561ae783b19d7"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
-- 
2.7.0.rc1


