Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D95BE00BEA
	for <meta-ti@yoctoproject.org>; Tue,  8 Apr 2014 07:48:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3P003YEVT3D4B0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 08 Apr 2014 09:48:54 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0C2B72016D; Tue,
	08 Apr 2014 10:48:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 08 Apr 2014 10:48:38 -0400
Message-id: <1396968518-11701-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] linux-ti-staging: update to the latest stable 3.12.17 version
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
X-List-Received-Date: Tue, 08 Apr 2014 14:48:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 1668c28..96be621 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,12 +36,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-# Corresponds to tag ti2013.12.01
-SRCREV = "2325bb5680986b6914d8fd0b5d0bdc20081fe8d3"
-PV = "3.12.10"
+SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
+PV = "3.12.17"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "k+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
-- 
1.9.1


