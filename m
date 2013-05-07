Return-Path: <m-karicheri2@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67936E0127D
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 14:24:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47LOLkf010098
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:24:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47LOL2Z031008
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:24:21 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 16:24:20 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r47LOKSI027137;	Tue, 7 May 2013 16:24:20 -0500
Received: from a0868495 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <m-karicheri2@ti.com>)	id 1UZpMy-0001dJ-HP;
	Tue, 07 May 2013 17:24:20 -0400
From: Murali Karicheri <m-karicheri2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 May 2013 17:24:17 -0400
Message-ID: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RESEND: PATCH 1/3] keystone2: boot-monitor: update to pull code from tip of the master
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
X-List-Received-Date: Tue, 07 May 2013 21:24:21 -0000
Content-Type: text/plain

This patch is needed to switch between release tag (when doing release
build) and tip of the master (when building nightly)

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
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


