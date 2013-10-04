Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C6B1E016B2
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 06:17:07 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MU5003N5BK30YC0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 04 Oct 2013 08:17:07 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1CA5D20179; Fri,
	04 Oct 2013 09:16:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 04 Oct 2013 09:16:50 -0400
Message-id: <1380892610-27047-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2] linux-ti-kernel: update with more merges, get devtree files in to rootfs
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
X-List-Received-Date: Fri, 04 Oct 2013 13:17:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Set up the run-time dependency on the package with devicetree files to be
installed in /boot directory of the rootfs. The new U-boot prefers to load
them from /boot directory of the rootfs instead of the separate boot partition.
Also, there are some specific requirements for naming DTB files in /boot
directory (like no extra prefixes), but that should be addressed separately.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - drop unclear statement about this being U-boot dependency

 recipes-kernel/linux/linux-ti-staging_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 8267afa..80ebde8 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -8,6 +8,9 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
 RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
@@ -28,11 +31,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "f7579525de9f1d6086c407a6980f4f1c1c574256"
+SRCREV = "e34b95baedccea12af9c0e81be77ed0a18ddae82"
 PV = "3.11+3.12-rc3"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
-- 
1.8.3.2


