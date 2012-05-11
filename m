Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4697E01426
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D5B6352AAC; Fri, 11 May 2012 01:55:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015501.D5B6352AAC@arago-project.org>
Date: Fri, 11 May 2012 01:55:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti33x-psp 3.2: for beaglebone set default Asm architecture to armv7-a
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
X-List-Received-Date: Fri, 11 May 2012 01:55:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 051482e3b03ba7e2d6cecc0d8f85cc3be22dc8b2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=051482e3b03ba7e2d6cecc0d8f85cc3be22dc8b2

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May  3 17:20:32 2012 -0400

linux-ti33x-psp 3.2: for beaglebone set default Asm architecture to armv7-a

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
Acked-by: Koen Kooi <koen@circuitco.com>

---

 ...ot-compressed-default-asm-arch-to-armv7-a.patch |   36 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    1 +
 2 files changed, 37 insertions(+), 0 deletions(-)

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
index 63c0532..d1dfaaf 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -958,4 +958,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0031-beaglebone-fix-3.5-cape-support.patch \
 	file://beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch \
 	file://beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch \
+	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
 "


