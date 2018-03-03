Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E42A3E00F19; Fri,  2 Mar 2018 18:45:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F96CE00DE2
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2018 18:45:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB8C420B80;
	Sat,  3 Mar 2018 02:45:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AYS_Zt-XMlSi; Sat,  3 Mar 2018 02:45:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 882332098D;
	Sat,  3 Mar 2018 02:45:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0B4741632EF;
	Fri,  2 Mar 2018 21:45:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  2 Mar 2018 21:45:50 -0500
Message-Id: <1520045153-26802-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/4] multiprocmgr, mpm-transport: do not depend on syslog-ng, not in meta-ti or oe-core
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
X-List-Received-Date: Sat, 03 Mar 2018 02:45:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 4 +---
 recipes-ti/multiprocmgr/multiprocmgr_git.bb   | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 0e5930a..3c28f28 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -4,12 +4,10 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
 COMPATIBLE_MACHINE = "keystone"
 
-DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv syslog-ng"
+DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv"
 DEPENDS_append_k2hk = " hyplnk-lld srio-lld"
 DEPENDS_append_k2e = " hyplnk-lld"
 
-RDEPENDS_${PN} = "syslog-ng"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index cafcd98..1ec2241 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -8,7 +8,6 @@ SRC_URI_append = " file://mpmsrv-daemon.service"
 PR = "${INC_PR}.1"
 
 DEPENDS = "mpm-transport libdaemon virtual/kernel cmem"
-RDEPENDS_${PN} = "syslog-ng"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.7.4


