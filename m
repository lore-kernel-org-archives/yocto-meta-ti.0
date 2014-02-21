Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D4EBE007F6
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 22:20:11 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1C000UE1KPNF10@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 21 Feb 2014 00:19:52 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 358842008E; Fri,
	21 Feb 2014 01:19:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 21 Feb 2014 01:19:36 -0500
Message-id: <1392963576-2477-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-omap-psp: specify branch for bitbake to find SRCREV
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
X-List-Received-Date: Fri, 21 Feb 2014 06:20:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
index 8333cc8..8f6a450 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -8,12 +8,14 @@ COMPATIBLE_MACHINE = "omap3"
 # SRCREV corresponds to tag v2.6.37_OMAPPSP_04.02.00.07
 SRCREV= "adcd067326836777c049e3cb32a5b7d9d401fc31"
 
+BRANCH = "OMAPPSP_04.02.00.07"
+
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
 # see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
+SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git;branch=${BRANCH} \
            file://defconfig"
 
 # The following patches below have been upstreamed to linux kernel 2.6.39 tree
-- 
1.8.3.2


