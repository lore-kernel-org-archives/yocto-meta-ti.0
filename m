Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A1E1E013AB
	for <meta-ti@yoctoproject.org>; Wed,  7 Mar 2012 13:52:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9467B52A57; Wed,  7 Mar 2012 21:52:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120307215250.9467B52A57@arago-project.org>
Date: Wed,  7 Mar 2012 21:52:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap4 3.1.0: patch to workaround installing FW images w/o subdirs
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
X-List-Received-Date: Wed, 07 Mar 2012 21:52:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: aa24c8ba605c38aaa48d2ca7252fc71bfae755ee
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aa24c8ba605c38aaa48d2ca7252fc71bfae755ee

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar  5 17:20:53 2012 -0500

linux-omap4 3.1.0: patch to workaround installing FW images w/o subdirs

This fixes below error found on some distros (Gentoo and Fedora):
*** No rule to make target `lib/firmware/./', needed by `lib/firmware/ti_3410.fw'.  Stop.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...inst-fix-install-breakage-for-FW-images-r.patch |   30 ++++++++++++++++++++
 recipes-kernel/linux/linux-omap4_3.1.0.bb          |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-omap4-3.1.0/0001-Makefile.fwinst-fix-install-breakage-for-FW-images-r.patch b/recipes-kernel/linux/linux-omap4-3.1.0/0001-Makefile.fwinst-fix-install-breakage-for-FW-images-r.patch
new file mode 100644
index 0000000..7455915
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap4-3.1.0/0001-Makefile.fwinst-fix-install-breakage-for-FW-images-r.patch
@@ -0,0 +1,30 @@
+From f6a15304bc2730ba091eb747c413d4ef4124565e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 5 Mar 2012 16:34:53 -0500
+Subject: [PATCH] Makefile.fwinst: fix install breakage for FW images residing
+ in firmware/ dir
+
+This fixes below error found on some distros (Gentoo and Fedora):
+*** No rule to make target `lib/firmware/./', needed by `lib/firmware/ti_3410.fw'.  Stop.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ scripts/Makefile.fwinst |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
+index 6bf8e87..4d908d1 100644
+--- a/scripts/Makefile.fwinst
++++ b/scripts/Makefile.fwinst
+@@ -27,7 +27,7 @@ endif
+ installed-mod-fw := $(addprefix $(INSTALL_FW_PATH)/,$(mod-fw))
+ 
+ installed-fw := $(addprefix $(INSTALL_FW_PATH)/,$(fw-shipped-all))
+-installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/.
++installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/./
+ 
+ # Workaround for make < 3.81, where .SECONDEXPANSION doesn't work.
+ PHONY += $(INSTALL_FW_PATH)/$$(%) install-all-dirs
+-- 
+1.7.8.5
+
diff --git a/recipes-kernel/linux/linux-omap4_3.1.0.bb b/recipes-kernel/linux/linux-omap4_3.1.0.bb
index ea1c26a..3cc48be 100644
--- a/recipes-kernel/linux/linux-omap4_3.1.0.bb
+++ b/recipes-kernel/linux/linux-omap4_3.1.0.bb
@@ -5,7 +5,7 @@ DEFAULT_PREFERENCE = "-1"
 require linux.inc
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap4 see conf/machine/include/omap4.inc
-#MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "a"
 
 CORTEXA8FIXUP = "no"
 
@@ -13,6 +13,7 @@ CORTEXA8FIXUP = "no"
 SRCREV = "a5c60c099296fcfc0c8fa8085c40883971486512"
 
 SRC_URI = "git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.1-1282 \
+           file://0001-Makefile.fwinst-fix-install-breakage-for-FW-images-r.patch \
            file://defconfig \
            "
 


