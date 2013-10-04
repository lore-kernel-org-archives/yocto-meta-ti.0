Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85A19E0163D
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 11:42:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9CAF1529D0; Fri,  4 Oct 2013 18:42:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131004184208.9CAF1529D0@arago-project.org>
Date: Fri,  4 Oct 2013 18:42:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-kernel: update with more merges, get devtree files in to rootfs
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
X-List-Received-Date: Fri, 04 Oct 2013 18:42:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b739286d690bdaada952a2376bd7aa1ba221badd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b739286d690bdaada952a2376bd7aa1ba221badd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Oct  4 01:50:12 2013 -0400

linux-ti-kernel: update with more merges, get devtree files in to rootfs

Set up the run-time dependency on the package with devicetree files to be
installed in /boot directory of the rootfs. The new U-boot prefers to load
them from /boot directory of the rootfs instead of the separate boot partition.
Also, there are some specific requirements for naming DTB files in /boot
directory (like no extra prefixes), but that should be addressed separately.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_git.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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


