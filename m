Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90685E01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:42:56 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3BC7252A56; Mon, 18 Mar 2013 18:42:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130318184255.3BC7252A56@arago-project.org>
Date: Mon, 18 Mar 2013 18:42:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap-psp: fix alignment issue of 2.6. 37 kernel with gcc-4.7
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
X-List-Received-Date: Mon, 18 Mar 2013 18:42:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0a42d9cf21ba0edceb390a9e289d7226876d9dbe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0a42d9cf21ba0edceb390a9e289d7226876d9dbe

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb 25 23:42:28 2013 -0500

linux-omap-psp: fix alignment issue of 2.6.37 kernel with gcc-4.7

Patch by Steve Sakoman

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../files/0001-arm-fix-builds-with-gcc-4.7.patch   |   26 ++++++++++++++++++++
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb      |    9 +++++++
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch b/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
new file mode 100644
index 0000000..db701e2
--- /dev/null
+++ b/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
@@ -0,0 +1,26 @@
+From 0d12debe917269a013f8eddd42da8d3de5e3174e Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Thu, 24 Jan 2013 15:42:01 -0800
+Subject: [PATCH] arm: fix builds with gcc 4.7
+
+new unaligned access support in GCC was triggering an alignment fault at boot
+---
+ arch/arm/kernel/head.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
+index 6bd82d2..56b02cd 100644
+--- a/arch/arm/kernel/head.S
++++ b/arch/arm/kernel/head.S
+@@ -336,7 +336,7 @@ __secondary_data:
+  *  r13 = *virtual* address to jump to upon completion
+  */
+ __enable_mmu:
+-#ifdef CONFIG_ALIGNMENT_TRAP
++#if defined(CONFIG_ALIGNMENT_TRAP) && __LINUX_ARM_ARCH__ < 6
+ 	orr	r0, r0, #CR_A
+ #else
+ 	bic	r0, r0, #CR_A
+-- 
+1.8.1.2
+
diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
index bafeba5..9eacfc9 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -6,6 +6,10 @@ COMPATIBLE_MACHINE = "omap3"
 
 SRCREV= "20c003f2f024d9f50f59edf9f1b8f5f035fb15b8"
 
+# The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
+# see conf/machine/include/omap3.inc
+MACHINE_KERNEL_PR_append = "a"
+
 SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
            file://defconfig"
 
@@ -83,6 +87,11 @@ SRC_URI += " \
     file://0002-usb-musb-am35x-fix-role-switching-issue.patch \
 "
 
+# Fix alignment issue with gcc-4.7
+SRC_URI += " \
+    file://0001-arm-fix-builds-with-gcc-4.7.patch \
+"
+
 # Updated PIO mode for MUSB help description
 SRC_URI_append_am3517-evm = " file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch"
 


