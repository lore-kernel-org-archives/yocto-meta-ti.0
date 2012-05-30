Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD9CBE01433
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 15:19:40 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4U00A68WNXUD20@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 30 May 2012 17:19:19 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3C916201C2; Wed,
	30 May 2012 18:19:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 30 May 2012 18:18:55 -0400
Message-id: <1338416335-4453-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.6
In-reply-to: <1338416335-4453-1-git-send-email-denis@denix.org>
References: <1338416335-4453-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] linux-ti33x-psp 3.2: set PV accordingly, when not using tipspkernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 22:19:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

The patchset in PATCHES_OVER_PSP updates the kernel to 3.2.x, so make PV match.
This doesn't need PR or MACHINE_KERNEL_PR bumps since both the kernel ABI and
file locations remain the same.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 38202fa..cd10044 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -10,6 +10,9 @@ S = "${WORKDIR}/git"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
 
+# the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
+PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
+
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
 MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
-- 
1.7.8.6


