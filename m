Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AEEEE007D8
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 10:35:33 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXN00CULNMTYRC0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 11 Dec 2013 12:35:18 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 312352016B; Wed,
	11 Dec 2013 13:35:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Dec 2013 13:35:07 -0500
Message-id: <1386786908-6652-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1386786908-6652-1-git-send-email-denis@denix.org>
References: <1386786908-6652-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/4] linux-ti-staging: update to 3.12.4 with more fixes for release
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
X-List-Received-Date: Wed, 11 Dec 2013 18:35:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 8965941..129d67a 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -14,6 +14,7 @@ RDEPENDS_kernel-base += "kernel-devicetree"
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
 RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
+RDEPENDS_kernel-base_append_ti43x = " am33x-cm3 am33x-cm3-initscript"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -31,8 +32,9 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "c077af8403a538e129164081cbe7527f22bb56b6"
-PV = "3.12.2"
+# Corresponds to ti2013.12.00 release
+SRCREV = "3b9c905e7ddbdf94ddaee40c5b8e9745a72afc6b"
+PV = "3.12.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
-- 
1.8.3.2


