Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 396C3E007D9
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 15:49:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5544352A94; Wed, 11 Dec 2013 23:49:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131211234946.5544352A94@arago-project.org>
Date: Wed, 11 Dec 2013 23:49:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 3.12. 4 with more fixes for release
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
X-List-Received-Date: Wed, 11 Dec 2013 23:49:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: ac5e361a84f416b17c6064b40c5ea74687283085
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ac5e361a84f416b17c6064b40c5ea74687283085

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Dec  9 13:37:16 2013 -0500

linux-ti-staging: update to 3.12.4 with more fixes for release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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


