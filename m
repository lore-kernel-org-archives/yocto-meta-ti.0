Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8642DE0027C
	for <meta-ti@yoctoproject.org>; Mon,  6 May 2013 15:49:11 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MME00BMOFD02I70@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 06 May 2013 17:48:51 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 38DE420077; Mon,
	06 May 2013 18:48:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 06 May 2013 18:48:30 -0400
Message-id: <1367880510-22524-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] linux-ti-staging: add package-specifier for RDEPENDS variable
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
X-List-Received-Date: Mon, 06 May 2013 22:49:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Run-time variables are package-specific, not recipe.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 6fe52e2..6e64fc5 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -11,7 +11,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_ti33x += "am33x-cm3"
+RDEPENDS_kernel-base_ti33x += "am33x-cm3"
 
 # Default is to package all dts files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -30,7 +30,7 @@ SRCREV = "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
 PV = "3.8.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.8.2.1


