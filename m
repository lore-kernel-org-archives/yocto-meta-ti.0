Return-Path: <baptiste.durand@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73A82E006B7
	for <meta-ti@yoctoproject.org>; Tue,  4 Feb 2014 12:40:42 -0800 (PST)
Received: by mail-we0-f176.google.com with SMTP id q58so4633053wes.7
	for <meta-ti@yoctoproject.org>; Tue, 04 Feb 2014 12:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=k2cvifjMmbqBW5aUzdPuH//zK8YP1xFR0Ms71mvmpBA=;
	b=lLbJH09EX9NgN/a0STEMiEFZR+qE0Cku2RXYYw/g46Is0qvtTP3k7oTcPshyNbcw4b
	xXmI8BVmm0tQwbmz3zHJymcV/mOLaSYp/fMhJ3lAp9MLRyjjl5UqF+r+DZBcbzp87ItG
	2/h69TuSzaHojKTjcJ689JQcOQ7KarKB79ZefMPq3W/X792OzHhI3URNU0+nqPXf2Gf+
	l+JtL3LLzXEkyG7ngPbZylpY794ZBuPkr12QoFr1UNiIeti/68wtUxqVp9Czl4Zh7HPc
	hUvYpO/3OY14W5YoYxvaWB4QUBwa2sgfDid2o7YpNc5qcW0aefE89V3WNrvAKGNSw773
	QDhw==
X-Received: by 10.181.13.82 with SMTP id ew18mr11788999wid.22.1391546440581;
	Tue, 04 Feb 2014 12:40:40 -0800 (PST)
Received: from localhost.localdomain (chl35-1-88-163-124-246.fbx.proxad.net.
	[88.163.124.246])
	by mx.google.com with ESMTPSA id h9sm39212875wjz.16.2014.02.04.12.40.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Feb 2014 12:40:39 -0800 (PST)
From: Baptiste DURAND <baptiste.durand@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  4 Feb 2014 21:40:01 +0100
Message-Id: <1391546401-15482-1-git-send-email-baptiste.durand@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-omap4 3.4 : Fix random segfaults and boot issues seen with gcc 4.8
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
X-List-Received-Date: Tue, 04 Feb 2014 20:40:47 -0000

Based on work
https://github.com/koenkooi/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b

Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
---
 ...fix-memset-related-crashes-caused-by-rece.patch | 256 +++++++++++++++++++++
 .../0004-ARM-7670-1-fix-the-memset-fix.patch       |  83 +++++++
 recipes-kernel/linux/linux-omap4_3.4.bb            |   2 +
 3 files changed, 341 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-omap4-3.4/pandaboard/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch
 create mode 100644 recipes-kernel/linux/linux-omap4-3.4/pandaboard/0004-ARM-7670-1-fix-the-memset-fix.patch

diff --git a/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch b/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch
new file mode 100644
index 0000000..7b4e652
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch
@@ -0,0 +1,256 @@
+From b9ebe46e251c5c8becd02f92893ef514e834bf67 Mon Sep 17 00:00:00 2001
+From: Ivan Djelic <ivan.djelic@parrot.com>
+Date: Wed, 6 Mar 2013 20:09:27 +0100
+Subject: [PATCH 3/4] ARM: 7668/1: fix memset-related crashes caused by recent
+ GCC (4.7.2) optimizations
+
+Recent GCC versions (e.g. GCC-4.7.2) perform optimizations based on
+assumptions about the implementation of memset and similar functions.
+The current ARM optimized memset code does not return the value of
+its first argument, as is usually expected from standard implementations.
+
+For instance in the following function:
+
+void debug_mutex_lock_common(struct mutex *lock, struct mutex_waiter *waiter)
+{
+	memset(waiter, MUTEX_DEBUG_INIT, sizeof(*waiter));
+	waiter->magic = waiter;
+	INIT_LIST_HEAD(&waiter->list);
+}
+
+compiled as:
+
+800554d0 <debug_mutex_lock_common>:
+800554d0:       e92d4008        push    {r3, lr}
+800554d4:       e1a00001        mov     r0, r1
+800554d8:       e3a02010        mov     r2, #16 ; 0x10
+800554dc:       e3a01011        mov     r1, #17 ; 0x11
+800554e0:       eb04426e        bl      80165ea0 <memset>
+800554e4:       e1a03000        mov     r3, r0
+800554e8:       e583000c        str     r0, [r3, #12]
+800554ec:       e5830000        str     r0, [r3]
+800554f0:       e5830004        str     r0, [r3, #4]
+800554f4:       e8bd8008        pop     {r3, pc}
+
+GCC assumes memset returns the value of pointer 'waiter' in register r0; causing
+register/memory corruptions.
+
+This patch fixes the return value of the assembly version of memset.
+It adds a 'mov' instruction and merges an additional load+store into
+existing load/store instructions.
+For ease of review, here is a breakdown of the patch into 4 simple steps:
+
+Step 1
+======
+Perform the following substitutions:
+ip -> r8, then
+r0 -> ip,
+and insert 'mov ip, r0' as the first statement of the function.
+At this point, we have a memset() implementation returning the proper result,
+but corrupting r8 on some paths (the ones that were using ip).
+
+Step 2
+======
+Make sure r8 is saved and restored when (! CALGN(1)+0) == 1:
+
+save r8:
+-       str     lr, [sp, #-4]!
++       stmfd   sp!, {r8, lr}
+
+and restore r8 on both exit paths:
+-       ldmeqfd sp!, {pc}               @ Now <64 bytes to go.
++       ldmeqfd sp!, {r8, pc}           @ Now <64 bytes to go.
+(...)
+        tst     r2, #16
+        stmneia ip!, {r1, r3, r8, lr}
+-       ldr     lr, [sp], #4
++       ldmfd   sp!, {r8, lr}
+
+Step 3
+======
+Make sure r8 is saved and restored when (! CALGN(1)+0) == 0:
+
+save r8:
+-       stmfd   sp!, {r4-r7, lr}
++       stmfd   sp!, {r4-r8, lr}
+
+and restore r8 on both exit paths:
+        bgt     3b
+-       ldmeqfd sp!, {r4-r7, pc}
++       ldmeqfd sp!, {r4-r8, pc}
+(...)
+        tst     r2, #16
+        stmneia ip!, {r4-r7}
+-       ldmfd   sp!, {r4-r7, lr}
++       ldmfd   sp!, {r4-r8, lr}
+
+Step 4
+======
+Rewrite register list "r4-r7, r8" as "r4-r8".
+
+Signed-off-by: Ivan Djelic <ivan.djelic@parrot.com>
+Reviewed-by: Nicolas Pitre <nico@linaro.org>
+Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/arm/lib/memset.S | 85 ++++++++++++++++++++++++++-------------------------
+ 1 file changed, 44 insertions(+), 41 deletions(-)
+
+diff --git a/arch/arm/lib/memset.S b/arch/arm/lib/memset.S
+index 650d592..d912e73 100644
+--- a/arch/arm/lib/memset.S
++++ b/arch/arm/lib/memset.S
+@@ -19,9 +19,9 @@
+ 1:	subs	r2, r2, #4		@ 1 do we have enough
+ 	blt	5f			@ 1 bytes to align with?
+ 	cmp	r3, #2			@ 1
+-	strltb	r1, [r0], #1		@ 1
+-	strleb	r1, [r0], #1		@ 1
+-	strb	r1, [r0], #1		@ 1
++	strltb	r1, [ip], #1		@ 1
++	strleb	r1, [ip], #1		@ 1
++	strb	r1, [ip], #1		@ 1
+ 	add	r2, r2, r3		@ 1 (r2 = r2 - (4 - r3))
+ /*
+  * The pointer is now aligned and the length is adjusted.  Try doing the
+@@ -29,10 +29,14 @@
+  */
+ 
+ ENTRY(memset)
+-	ands	r3, r0, #3		@ 1 unaligned?
++/*
++ * Preserve the contents of r0 for the return value.
++ */
++	mov	ip, r0
++	ands	r3, ip, #3		@ 1 unaligned?
+ 	bne	1b			@ 1
+ /*
+- * we know that the pointer in r0 is aligned to a word boundary.
++ * we know that the pointer in ip is aligned to a word boundary.
+  */
+ 	orr	r1, r1, r1, lsl #8
+ 	orr	r1, r1, r1, lsl #16
+@@ -43,29 +47,28 @@ ENTRY(memset)
+ #if ! CALGN(1)+0
+ 
+ /*
+- * We need an extra register for this loop - save the return address and
+- * use the LR
++ * We need 2 extra registers for this loop - use r8 and the LR
+  */
+-	str	lr, [sp, #-4]!
+-	mov	ip, r1
++	stmfd	sp!, {r8, lr}
++	mov	r8, r1
+ 	mov	lr, r1
+ 
+ 2:	subs	r2, r2, #64
+-	stmgeia	r0!, {r1, r3, ip, lr}	@ 64 bytes at a time.
+-	stmgeia	r0!, {r1, r3, ip, lr}
+-	stmgeia	r0!, {r1, r3, ip, lr}
+-	stmgeia	r0!, {r1, r3, ip, lr}
++	stmgeia	ip!, {r1, r3, r8, lr}	@ 64 bytes at a time.
++	stmgeia	ip!, {r1, r3, r8, lr}
++	stmgeia	ip!, {r1, r3, r8, lr}
++	stmgeia	ip!, {r1, r3, r8, lr}
+ 	bgt	2b
+-	ldmeqfd	sp!, {pc}		@ Now <64 bytes to go.
++	ldmeqfd	sp!, {r8, pc}		@ Now <64 bytes to go.
+ /*
+  * No need to correct the count; we're only testing bits from now on
+  */
+ 	tst	r2, #32
+-	stmneia	r0!, {r1, r3, ip, lr}
+-	stmneia	r0!, {r1, r3, ip, lr}
++	stmneia	ip!, {r1, r3, r8, lr}
++	stmneia	ip!, {r1, r3, r8, lr}
+ 	tst	r2, #16
+-	stmneia	r0!, {r1, r3, ip, lr}
+-	ldr	lr, [sp], #4
++	stmneia	ip!, {r1, r3, r8, lr}
++	ldmfd	sp!, {r8, lr}
+ 
+ #else
+ 
+@@ -74,54 +77,54 @@ ENTRY(memset)
+  * whole cache lines at once.
+  */
+ 
+-	stmfd	sp!, {r4-r7, lr}
++	stmfd	sp!, {r4-r8, lr}
+ 	mov	r4, r1
+ 	mov	r5, r1
+ 	mov	r6, r1
+ 	mov	r7, r1
+-	mov	ip, r1
++	mov	r8, r1
+ 	mov	lr, r1
+ 
+ 	cmp	r2, #96
+-	tstgt	r0, #31
++	tstgt	ip, #31
+ 	ble	3f
+ 
+-	and	ip, r0, #31
+-	rsb	ip, ip, #32
+-	sub	r2, r2, ip
+-	movs	ip, ip, lsl #(32 - 4)
+-	stmcsia	r0!, {r4, r5, r6, r7}
+-	stmmiia	r0!, {r4, r5}
+-	tst	ip, #(1 << 30)
+-	mov	ip, r1
+-	strne	r1, [r0], #4
++	and	r8, ip, #31
++	rsb	r8, r8, #32
++	sub	r2, r2, r8
++	movs	r8, r8, lsl #(32 - 4)
++	stmcsia	ip!, {r4, r5, r6, r7}
++	stmmiia	ip!, {r4, r5}
++	tst	r8, #(1 << 30)
++	mov	r8, r1
++	strne	r1, [ip], #4
+ 
+ 3:	subs	r2, r2, #64
+-	stmgeia	r0!, {r1, r3-r7, ip, lr}
+-	stmgeia	r0!, {r1, r3-r7, ip, lr}
++	stmgeia	ip!, {r1, r3-r8, lr}
++	stmgeia	ip!, {r1, r3-r8, lr}
+ 	bgt	3b
+-	ldmeqfd	sp!, {r4-r7, pc}
++	ldmeqfd	sp!, {r4-r8, pc}
+ 
+ 	tst	r2, #32
+-	stmneia	r0!, {r1, r3-r7, ip, lr}
++	stmneia	ip!, {r1, r3-r8, lr}
+ 	tst	r2, #16
+-	stmneia	r0!, {r4-r7}
+-	ldmfd	sp!, {r4-r7, lr}
++	stmneia	ip!, {r4-r7}
++	ldmfd	sp!, {r4-r8, lr}
+ 
+ #endif
+ 
+ 4:	tst	r2, #8
+-	stmneia	r0!, {r1, r3}
++	stmneia	ip!, {r1, r3}
+ 	tst	r2, #4
+-	strne	r1, [r0], #4
++	strne	r1, [ip], #4
+ /*
+  * When we get here, we've got less than 4 bytes to zero.  We
+  * may have an unaligned pointer as well.
+  */
+ 5:	tst	r2, #2
+-	strneb	r1, [r0], #1
+-	strneb	r1, [r0], #1
++	strneb	r1, [ip], #1
++	strneb	r1, [ip], #1
+ 	tst	r2, #1
+-	strneb	r1, [r0], #1
++	strneb	r1, [ip], #1
+ 	mov	pc, lr
+ ENDPROC(memset)
+-- 
+1.8.2.1
+
diff --git a/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0004-ARM-7670-1-fix-the-memset-fix.patch b/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0004-ARM-7670-1-fix-the-memset-fix.patch
new file mode 100644
index 0000000..0658413
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0004-ARM-7670-1-fix-the-memset-fix.patch
@@ -0,0 +1,83 @@
+From 78429023fbec3428238e8dbdd81fa67e4619d04c Mon Sep 17 00:00:00 2001
+From: Nicolas Pitre <nicolas.pitre@linaro.org>
+Date: Tue, 12 Mar 2013 13:00:42 +0100
+Subject: [PATCH 4/4] ARM: 7670/1: fix the memset fix
+
+Commit 455bd4c430b0 ("ARM: 7668/1: fix memset-related crashes caused by
+recent GCC (4.7.2) optimizations") attempted to fix a compliance issue
+with the memset return value.  However the memset itself became broken
+by that patch for misaligned pointers.
+
+This fixes the above by branching over the entry code from the
+misaligned fixup code to avoid reloading the original pointer.
+
+Also, because the function entry alignment is wrong in the Thumb mode
+compilation, that fixup code is moved to the end.
+
+While at it, the entry instructions are slightly reworked to help dual
+issue pipelines.
+
+Signed-off-by: Nicolas Pitre <nico@linaro.org>
+Tested-by: Alexander Holler <holler@ahsoftware.de>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+---
+ arch/arm/lib/memset.S | 33 +++++++++++++--------------------
+ 1 file changed, 13 insertions(+), 20 deletions(-)
+
+diff --git a/arch/arm/lib/memset.S b/arch/arm/lib/memset.S
+index d912e73..94b0650 100644
+--- a/arch/arm/lib/memset.S
++++ b/arch/arm/lib/memset.S
+@@ -14,31 +14,15 @@
+ 
+ 	.text
+ 	.align	5
+-	.word	0
+-
+-1:	subs	r2, r2, #4		@ 1 do we have enough
+-	blt	5f			@ 1 bytes to align with?
+-	cmp	r3, #2			@ 1
+-	strltb	r1, [ip], #1		@ 1
+-	strleb	r1, [ip], #1		@ 1
+-	strb	r1, [ip], #1		@ 1
+-	add	r2, r2, r3		@ 1 (r2 = r2 - (4 - r3))
+-/*
+- * The pointer is now aligned and the length is adjusted.  Try doing the
+- * memset again.
+- */
+ 
+ ENTRY(memset)
+-/*
+- * Preserve the contents of r0 for the return value.
+- */
+-	mov	ip, r0
+-	ands	r3, ip, #3		@ 1 unaligned?
+-	bne	1b			@ 1
++	ands	r3, r0, #3		@ 1 unaligned?
++	mov	ip, r0			@ preserve r0 as return value
++	bne	6f			@ 1
+ /*
+  * we know that the pointer in ip is aligned to a word boundary.
+  */
+-	orr	r1, r1, r1, lsl #8
++1:	orr	r1, r1, r1, lsl #8
+ 	orr	r1, r1, r1, lsl #16
+ 	mov	r3, r1
+ 	cmp	r2, #16
+@@ -127,4 +111,13 @@ ENTRY(memset)
+ 	tst	r2, #1
+ 	strneb	r1, [ip], #1
+ 	mov	pc, lr
++
++6:	subs	r2, r2, #4		@ 1 do we have enough
++	blt	5b			@ 1 bytes to align with?
++	cmp	r3, #2			@ 1
++	strltb	r1, [ip], #1		@ 1
++	strleb	r1, [ip], #1		@ 1
++	strb	r1, [ip], #1		@ 1
++	add	r2, r2, r3		@ 1 (r2 = r2 - (4 - r3))
++	b	1b
+ ENDPROC(memset)
+-- 
+1.8.2.1
+
diff --git a/recipes-kernel/linux/linux-omap4_3.4.bb b/recipes-kernel/linux/linux-omap4_3.4.bb
index 449e4eb..52629de 100644
--- a/recipes-kernel/linux/linux-omap4_3.4.bb
+++ b/recipes-kernel/linux/linux-omap4_3.4.bb
@@ -13,6 +13,8 @@ SRCREV = "c34a43ec74168b892a948b45695486f1a3d700af"
 
 SRC_URI = "git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487 \
            file://defconfig \
+           file://0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch \
+           file://0004-ARM-7670-1-fix-the-memset-fix.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.8.3.2


