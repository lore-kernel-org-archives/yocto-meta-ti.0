Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C5C0E006D3
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 16:41:18 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0S0fFE4021981
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 18:41:15 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S0fFqF021300
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 18:41:15 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 18:41:14 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0S0fEeQ015566;	Mon, 27 Jan 2014 18:41:14 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Jan 2014 19:41:11 -0500
Message-ID: <1390869671-10709-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] boot-monitor: keystone-evm: update to latest version
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
X-List-Received-Date: Tue, 28 Jan 2014 00:41:19 -0000
Content-Type: text/plain

- Update SRC URL
- Update Revision string
- Update SRCREV commit id

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 895de6c..47527be 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -11,16 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
 
 COMPATIBLE_MACHINE = "keystone-evm"
 
-SRC_URI = "git://arago-project.org/git/projects/boot-monitor.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
 PV = "1.0"
-PR = "r2+gitr${SRCREV}"
+PR = "r2+gitr${SRCPV}"
 
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "94cab20c4a4725a014d6f815704557d28fec9610"
+#Tag "K2_BM_13.11"
+SRCREV = "ba597d183423971e63295cdd59d3c90245e9170a"
 
 do_compile () {
 	unset LDFLAGS
-- 
1.7.9.5


