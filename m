Return-Path: <m-karicheri2@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44141E0127D
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 14:20:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47LKSOk004384
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:20:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47LKSrw026557
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:20:28 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 16:20:28 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r47LKSiG026274;	Tue, 7 May 2013 16:20:28 -0500
Received: from a0868495 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <m-karicheri2@ti.com>)	id 1UZpJD-0001Vp-Ky;
	Tue, 07 May 2013 17:20:27 -0400
From: Murali Karicheri <m-karicheri2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 May 2013 17:20:23 -0400
Message-ID: <1367961625-5779-1-git-send-email-m-karicheri2@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Murali Karicheri <m-maricheri2@ti.com>
Subject: [PATCH 1/3] keystone2: boot-monitor: update to pull code from tip of the master
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
X-List-Received-Date: Tue, 07 May 2013 21:20:29 -0000
Content-Type: text/plain

This patch is needed to switch between release tag (when doing release
build) and tip of the master (when building nightly)

Signed-off-by: Murali Karicheri <m-maricheri2@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index c8a022a..a892720 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
 COMPATIBLE_MACHINE = "keystone-evm"
 
-SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
+#SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "1.0"
 PR = "r1+gitr${SRCPV}"
@@ -20,7 +21,8 @@ BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "DEV.MCSDK-03.00.00.07"
+#SRCREV = "DEV.MCSDK-03.00.00.10"
+SRCREV = "${AUTOREV}"
 
 do_compile () {
 	unset LDFLAGS
-- 
1.7.9.5


