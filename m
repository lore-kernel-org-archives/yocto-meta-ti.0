Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FEE6E014C1
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 13:49:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F2302529B9; Thu, 28 Mar 2013 20:49:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130328204913.F2302529B9@arago-project.org>
Date: Thu, 28 Mar 2013 20:49:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: one more update to latest 3.8.5
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
X-List-Received-Date: Thu, 28 Mar 2013 20:49:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 913f722e9ed17a45ace3c56aaaf74e3c1eada023
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=913f722e9ed17a45ace3c56aaaf74e3c1eada023

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 28 16:47:04 2013 -0400

linux-ti-staging: one more update to latest 3.8.5

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 3353792..21202f4 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -40,11 +40,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "a0a13c3cf6ff2ca9bf1b1c9163ba04c3c71811bd"
-PV = "3.8.4"
+SRCREV = "f6ce51c2d6e5489262beb6f42cc39ac19e49bc9e"
+PV = "3.8.5"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


