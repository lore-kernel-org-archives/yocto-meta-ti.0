Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E33ACE00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 14:30:10 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3G00M9BUDTZ420@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 May 2012 16:29:54 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1BB5820088; Thu,
	03 May 2012 17:29:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 03 May 2012 17:29:52 -0400
Message-id: <1336080592-17322-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] linux-ti33x-psp 3.2: for beaglebone set default Asm architecture to armv7-a
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
X-List-Received-Date: Thu, 03 May 2012 21:30:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Beaglebone kernel needs to be built in Thumb2 mode to achieve fast boot
times. Unfortunately, that build is broken under newer binutils-2.22 with
the below Assembler error. The fix is to pass the specific -march=armv7-a
flag to the Assembler to make it work.

| arch/arm/boot/compressed/head.S: Assembler messages:
| arch/arm/boot/compressed/head.S:127: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'
| arch/arm/boot/compressed/head.S:134: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'
| arch/arm/boot/compressed/head.S:136: Error: selected processor does not support requested special purpose register -- `msr cpsr_c,r2'
| make[2]: *** [arch/arm/boot/compressed/head.o] Error 1
| make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ot-compressed-default-asm-arch-to-armv7-a.patch |   36 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    1 +
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch
new file mode 100644
index 0000000..5037880
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch
@@ -0,0 +1,36 @@
+From 6b87752bd00d12ac7c8db994480c077857e23bf0 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 3 May 2012 16:04:16 -0400
+Subject: [PATCH] arch/arm/boot/compressed: set default Asm architecture to armv7-a
+
+This enables building compressed kernel with newer binutils-2.22 when kernel is
+built in Thumb2 mode. Otherwise it fails with the following Assembler error:
+
+| arch/arm/boot/compressed/head.S: Assembler messages:
+| arch/arm/boot/compressed/head.S:127: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'
+| arch/arm/boot/compressed/head.S:134: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'
+| arch/arm/boot/compressed/head.S:136: Error: selected processor does not support requested special purpose register -- `msr cpsr_c,r2'
+| make[2]: *** [arch/arm/boot/compressed/head.o] Error 1
+| make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ arch/arm/boot/compressed/Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
+index 21f56ff..e01d370 100644
+--- a/arch/arm/boot/compressed/Makefile
++++ b/arch/arm/boot/compressed/Makefile
+@@ -123,7 +123,7 @@ KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
+ endif
+ 
+ ccflags-y := -fpic -fno-builtin -I$(obj)
+-asflags-y := -Wa,-march=all
++asflags-y := -Wa,-march=armv7-a
+ 
+ # Supply kernel BSS size to the decompressor via a linker symbol.
+ KBSS_SZ = $(shell size $(obj)/../../../../vmlinux | awk 'END{print $$3}')
+-- 
+1.7.8.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index f560a1d..c801c94 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -826,4 +826,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch \
 	file://beaglebone/0029-beaglebone-also-report-cape-revision.patch \
 	file://beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch \
+	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
 "
-- 
1.7.8.5


