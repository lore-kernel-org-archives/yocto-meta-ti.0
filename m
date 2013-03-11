Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE929E0136C
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 14:36:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BF04252ABC; Mon, 11 Mar 2013 21:36:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311213610.BF04252ABC@arago-project.org>
Date: Mon, 11 Mar 2013 21:36:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update SRCREV and bump MACHINE_KERNEL_PR
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
X-List-Received-Date: Mon, 11 Mar 2013 21:36:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 03974f7c843f521f626707161e148ec81b99bdd4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=03974f7c843f521f626707161e148ec81b99bdd4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 11 17:23:32 2013 -0400

linux-ti-staging: update SRCREV and bump MACHINE_KERNEL_PR

* Update SRCREV for the recent merges in TI staging tree, still 3.8.2
* Bump MACHINE_KERNEL_PR to trigger rebuilding out-of-tree components

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc               |    2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index cf49721..f00c797 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -16,7 +16,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r17"
+MACHINE_KERNEL_PR = "r18"
 
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 9ce507b..dfef76d 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -39,7 +39,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.8.y"
 
-SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
+SRCREV = "e69f39916783a559c499e264359edea315ef44fd"
 PV = "3.8.2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild


