Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAECBE006C2
	for <meta-ti@yoctoproject.org>; Wed,  5 Jun 2013 11:31:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4595052A9D; Wed,  5 Jun 2013 18:31:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130605183139.4595052A9D@arago-project.org>
Date: Wed,  5 Jun 2013 18:31:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: update kernel SRCREV
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
X-List-Received-Date: Wed, 05 Jun 2013 18:31:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ed54827bdd5df663a26c0cef425cfe2386fa42c6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ed54827bdd5df663a26c0cef425cfe2386fa42c6

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Wed Jun  5 13:19:48 2013 -0500

linux-ti-staging: update kernel SRCREV

* Update the kernel SRCREV to pickup DSS fixes for the dra7xx
  devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index f62cbe2..39f0e31 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -27,11 +27,11 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.8.y"
 
 # This commit corresponds to ti2013.04.00 release tag
-SRCREV = "54d80897fd69e30702f3b6f115d77d37ad78f9ef"
+SRCREV = "e7460f2acdea5c9b766c7eb76bad5ab2ed7e566c"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


