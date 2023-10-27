Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFADAC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:17:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.11141.1698423458415072731
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 09:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LUg45yb6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RGHaDG109339;
	Fri, 27 Oct 2023 11:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698423456;
	bh=qgASUgs+EOU7R5EYN0hw2t8f+kBlrAGa0+2PLZoQN+Q=;
	h=From:To:Subject:Date;
	b=LUg45yb6C/HZxOKv/rFb4BE6Nb7nKKHsWuY8kiLxZTmi9MnhKGda0asqvZwohWo5a
	 +oli9o2H0vM8f1qya3a8qbYBVEY7UIo6CHaP+N01piFOz7gef6WAADm1g6d7ujEx+C
	 TR/D+YbHiFVjTzCYP2YoAtrCP81e00A5vG9vUOEI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RGHaen029062
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 11:17:36 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 11:17:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 11:17:36 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RGHa9V114818;
	Fri, 27 Oct 2023 11:17:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qwPWi-0001Ta-AR; Fri, 27 Oct 2023 11:17:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] optee: Update to upstream 4.0.0
Date: Fri, 27 Oct 2023 11:17:36 -0500
Message-ID: <20231027161736.5634-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 16:17:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17212

Update all of the optee components to the upstream 4.0.0 version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added patch updates that meta-arm upstream has not run into yet.

 .../optee/optee-client-ti.inc                 |   7 +
 .../optee/optee-client_%.bbappend             |   4 +
 .../optee/optee-examples-ti.inc               |   2 +
 .../optee/optee-examples_%.bbappend           |   4 +
 ...-Define-section-attributes-for-clang.patch | 249 ++++++++++++++++++
 .../optee/optee-os-tadevkit-ti.inc            |   8 +
 .../recipes-security/optee/optee-os-ti.inc    |   8 +
 .../recipes-security/optee/optee-test-ti.inc  |   6 +
 .../optee/optee-test_%.bbappend               |   4 +
 9 files changed, 292 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
new file mode 100644
index 00000000..f64a90c3
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
@@ -0,0 +1,7 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
+
+inherit pkgconfig
+DEPENDS += "util-linux"
+
+EXTRA_OEMAKE += "PKG_CONFIG=pkg-config"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
new file mode 100644
index 00000000..08c5256b
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -0,0 +1,4 @@
+OPTEE_TI = ""
+OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
new file mode 100644
index 00000000..d6ddc907
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
@@ -0,0 +1,2 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
new file mode 100644
index 00000000..08c5256b
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
@@ -0,0 +1,4 @@
+OPTEE_TI = ""
+OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch b/meta-ti-bsp/recipes-security/optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch
new file mode 100644
index 00000000..06a8ff60
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch
@@ -0,0 +1,249 @@
+
+This is a fixup of the patch in meta-arm.  The file:
+  core/arch/arm/mm/pgt_cache.c
+was moved to:
+  core/mm/pgt_cache.c
+
+Ryan Eatmon <reatmon@ti.com>
+
+
+From 6f588813a170a671ebf1d6b51cebc7bc761295dc Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 21 Dec 2022 10:55:58 +0000
+Subject: [PATCH] core: Define section attributes for clang
+
+Clang's attribute section is not same as gcc, here we need to add flags
+to sections so they can be eventually collected by linker into final
+output segments. Only way to do so with clang is to use
+
+pragma clang section ...
+
+The behavious is described here [1], this allows us to define names bss
+sections. This was not an issue until clang-15 where LLD linker starts
+to detect the section flags before merging them and throws the following
+errors
+
+| ld.lld: error: section type mismatch for .nozi.kdata_page
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SHT_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+|
+| ld.lld: error: section type mismatch for .nozi.mmu.l2
+| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT_PROGBITS
+| >>> output section .nozi: SHT_NOBITS
+
+These sections should be carrying SHT_NOBITS but so far it was not
+possible to do so, this patch tries to use clangs pragma to get this
+going and match the functionality with gcc.
+
+[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#specifying-section-names-for-global-objects-pragma-clang-section
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
+ core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
+ core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
+ core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
+ core/kernel/thread.c             | 13 +++++++++++-
+ 5 files changed, 104 insertions(+), 11 deletions(-)
+
+diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
+index 4487ef026df9..f3624389611b 100644
+--- a/core/arch/arm/kernel/thread.c
++++ b/core/arch/arm/kernel/thread.c
+@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
+ #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
+ 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
+ long thread_user_kdata_sp_offset __nex_bss;
++#ifdef __clang__
++#ifndef CFG_VIRTUALIZATION
++#pragma clang section bss=".nozi.kdata_page"
++#else
++#pragma clang section bss=".nex_nozi.kdata_page"
++#endif
++#endif
+ static uint8_t thread_user_kdata_page[
+ 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
+ 		SMALL_PAGE_SIZE)]
+ 	__aligned(SMALL_PAGE_SIZE)
++#ifndef __clang__
+ #ifndef CFG_NS_VIRTUALIZATION
+-	__section(".nozi.kdata_page");
++	__section(".nozi.kdata_page")
+ #else
+-	__section(".nex_nozi.kdata_page");
++	__section(".nex_nozi.kdata_page")
+ #endif
++#endif
++    ;
++#endif
++
++/* reset BSS section to default ( .bss ) */
++#ifdef __clang__
++#pragma clang section bss=""
+ #endif
+ 
+ #ifdef ARM32
+diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mmu_lpae.c
+index 7e79f780ad28..ec4db9dc98c5 100644
+--- a/core/arch/arm/mm/core_mmu_lpae.c
++++ b/core/arch/arm/mm/core_mmu_lpae.c
+@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
+ typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
+ typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.base_table"
++#endif
+ static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
+ 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
+-	__section(".nozi.mmu.base_table");
++#ifndef __clang__
++	__section(".nozi.mmu.base_table")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
++	__aligned(XLAT_TABLE_SIZE)
++#ifndef __clang__
++	__section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ /* MMU L2 table for TAs, one for each thread */
+ static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
+-	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
+-
++#ifndef __clang__
++	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ /*
+  * TAs page table entry inside a level 1 page table.
+  *
+diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_v7.c
+index 61e703da89c8..1960c08ca688 100644
+--- a/core/arch/arm/mm/core_mmu_v7.c
++++ b/core/arch/arm/mm/core_mmu_v7.c
+@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
+ typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
+ typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
+ 
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l1"
++#endif
+ static l1_xlat_tbl_t main_mmu_l1_ttb
+-		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
++		__aligned(L1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ /* L2 MMU tables */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
+-		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
++		__aligned(L2_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.l2")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ /* MMU L1 table for TAs, one for each thread */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.ul1"
++#endif
+ static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
+-		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
++		__aligned(UL1_ALIGNMENT)
++#ifndef __clang__
++       __section(".nozi.mmu.ul1")
++#endif
++;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 
+ struct mmu_partition {
+ 	l1_xlat_tbl_t *l1_table;
+diff --git a/core/mm/pgt_cache.c b/core/mm/pgt_cache.c
+index 79553c6d2183..b9efdf42780b 100644
+--- a/core/mm/pgt_cache.c
++++ b/core/mm/pgt_cache.c
+@@ -410,8 +410,18 @@ void pgt_init(void)
+ 	 * has a large alignment, while .bss has a small alignment. The current
+ 	 * link script is optimized for small alignment in .bss
+ 	 */
++#ifdef __clang__
++#pragma clang section bss=".nozi.mmu.l2"
++#endif
+ 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
+-			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
++			__aligned(PGT_SIZE)
++#ifndef __clang__
++			__section(".nozi.pgt_cache")
++#endif
++			;
++#ifdef __clang__
++#pragma clang section bss=""
++#endif
+ 	size_t n;
+ 
+ 	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
+diff --git a/core/kernel/thread.c b/core/kernel/thread.c
+index 2a1f22dce635..5516b677141a 100644
+--- a/core/kernel/thread.c
++++ b/core/kernel/thread.c
+@@ -39,13 +39,24 @@ static uint32_t end_canary_value = 0xababab00;
+ 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
+ #endif
+ 
++#define DO_PRAGMA(x) _Pragma (#x)
++
++#ifdef __clang__
++#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
++DO_PRAGMA (clang section bss=".nozi_stack." #name) \
++linkage uint32_t name[num_stacks] \
++		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
++			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
++		__attribute__((aligned(STACK_ALIGNMENT))); \
++DO_PRAGMA(clang section bss="")
++#else
+ #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
+ linkage uint32_t name[num_stacks] \
+ 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
+ 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
+ 		__attribute__((section(".nozi_stack." # name), \
+ 			       aligned(STACK_ALIGNMENT)))
+-
++#endif
+ #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
+ 
+ DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
index df46e243..55453366 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
@@ -1 +1,9 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
+
+# Fixes for pointing to 4.0.0 before upstream meta-arm
+FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
+SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
+SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
+
 EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
index de13d282..6d192bbe 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -1,3 +1,11 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
+
+# Fixes for pointing to 4.0.0 before upstream meta-arm
+FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
+SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
+SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
+
 # Use TI SECDEV for signing
 inherit ti-secdev
 
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
new file mode 100644
index 00000000..1dea1fbd
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
@@ -0,0 +1,6 @@
+PV = "4.0.0+git${SRCPV}"
+SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
+
+# Fixes for pointing to 4.0.0 before upstream meta-arm
+SRC_URI:remove = "file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch"
+
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
new file mode 100644
index 00000000..08c5256b
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
@@ -0,0 +1,4 @@
+OPTEE_TI = ""
+OPTEE_TI:ti-soc = "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
-- 
2.17.1


