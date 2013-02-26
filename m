Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2525CE00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 19:48:58 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIT0075Y6KZM8T3@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 25 Feb 2013 21:48:50 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0A86C200BD; Mon,
	25 Feb 2013 22:48:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Feb 2013 22:48:33 -0500
Message-id: <1361850513-12048-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] linux-omapl138: fix alignment issue of 2.6.37 kernel with gcc-4.7
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
X-List-Received-Date: Tue, 26 Feb 2013 03:48:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Patch by Steve Sakoman

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index d569a8f..9e08c7b 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -6,7 +6,7 @@ KERNEL_IMAGETYPE = "uImage"
 require multi-kernel.inc
 require tipspkernel.inc
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 S = "${WORKDIR}/git"
 
@@ -34,3 +34,8 @@ PATCHES_OVER_PSP = " \
 
 # Updated PIO mode for MUSB help description
 PATCHES_OVER_PSP += "file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch"
+
+# Fix alignment issue with gcc-4.7
+PATCHES_OVER_PSP += " \
+    file://0001-arm-fix-builds-with-gcc-4.7.patch \
+"
-- 
1.8.1.2


