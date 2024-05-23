Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8D1C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 09:10:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.11065.1716455396021570737
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 May 2024 02:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M9Ip8JzD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: kamlesh@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44N99sHt043322;
	Thu, 23 May 2024 04:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716455394;
	bh=aUsZ6lKfpPcfbYkC7nyoW9luwn2BXmIHMB8GatQrmxo=;
	h=From:Date:Subject:To:CC;
	b=M9Ip8JzDb5SqhxYU0KOM2R+rdEFZbOsQ3CRFDwYGe0jXxe3Rt8+v4dLVO+hJEFhlh
	 NL8sD6dTdZVVEnU2KdKjW9Og3XNsSaS8LaTGcaSj3KakYwZZrDeG/Ky1pKozBSi1+R
	 iPMypaK10Wj/b3bC7tFDg7Cph/tVq4S81Ytomov0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44N99spo012052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2024 04:09:54 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 May 2024 04:09:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 May 2024 04:09:54 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44N99rPM026817;
	Thu, 23 May 2024 04:09:54 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Thu, 23 May 2024 14:39:48 +0530
Subject: [PATCH [meta-ti][Scarthgap/Master] v4] optee: Update to upstream
 4.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-sg-optee-4-2-update-v4-1-4e1366570e10@ti.com>
X-B4-Tracking: v=1; b=H4sIANsHT2YC/43OsU7DMBAG4FepPHNgn+3QdOIFmBijDFf7nHhoE
 tkmKqry7riRQGJBHX/p/7+7m8icImdxOtxE4jXmOE81mKeDcCNNA0P0NQuUaKRFBXmAeSnMYAD
 hc/FUGNTRBm+908pLUZdnygznRJMb79vsKJVxoAUmvpZ7YUkc4nU/24nuwoWgxL77+Cm+vFMun
 HrR1/IYc5nT1/7iqvbJv9+sChRYo/WxsfjaEL6V+Ozmy46t+ACAFVCIQTvjpAv2D6AfAHQFJLa
 2VUa1TWh/gW3bvgGHtwwqcwEAAA==
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716455392; l=12663;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=twzo921NySq0u71L0Zs98SWoYCvr6IfVw4PZgseyjvk=;
 b=U3bERYjQjugGlebeQmeSqFwxjQL3ZR8zBmu+089mjCBURfythUgKOoBtIYKl6FbgxLsLmLt4e
 RRARi3W5P9oD3WAjXDlCn/vltizV1fXUAxgUZ/RFY3Hm8UkqgA1i9cF
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 May 2024 09:10:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17677

Update all of the optee components to the upstream 4.2.0 version.

While at it, remove the patches and fixups which are not needed anymore.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in v4:
- Removed fixup patches that are not needed anymore
- Link to v3: https://lore.kernel.org/r/20240521-sg-optee-4-2-update-v3-1-0295914196f9@ti.com

Current tag prefix is limitation with b4, let me know if it doesn't work.

Changes in v3:
- Subject tag change
- Link to v2: https://lore.kernel.org/r/20240521-sg-optee-4-2-update-v2-1-122f3c4c0cf5@ti.com

Changes in v2:
- Subject tag change and removed SRCPV
- Link to v1: https://lore.kernel.org/r/20240521-sg-optee-4-2-update-v1-1-5433865276a2@ti.com
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc                    |   4 +-
 meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc                  |   2 +-
 .../optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch    | 249 ---------------------------------------
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc                        |   9 +-
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc                      |   8 +-
 5 files changed, 7 insertions(+), 265 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 16fbd6c5..22a363f4 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.1.0+git"
-SRCREV = "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
+PV = "4.2.0+git"
+SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 23cd7580..2d7a95bd 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.0.0+git"
+PV = "4.2.0+git"
 SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch b/meta-ti-bsp/recipes-security/optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch
deleted file mode 100644
index 06a8ff60..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-os-4.0.0/0002ti-core-Define-section-attributes-for-clang.patch
+++ /dev/null
@@ -1,249 +0,0 @@
-
-This is a fixup of the patch in meta-arm.  The file:
-  core/arch/arm/mm/pgt_cache.c
-was moved to:
-  core/mm/pgt_cache.c
-
-Ryan Eatmon <reatmon@ti.com>
-
-
-From 6f588813a170a671ebf1d6b51cebc7bc761295dc Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 21 Dec 2022 10:55:58 +0000
-Subject: [PATCH] core: Define section attributes for clang
-
-Clang's attribute section is not same as gcc, here we need to add flags
-to sections so they can be eventually collected by linker into final
-output segments. Only way to do so with clang is to use
-
-pragma clang section ...
-
-The behavious is described here [1], this allows us to define names bss
-sections. This was not an issue until clang-15 where LLD linker starts
-to detect the section flags before merging them and throws the following
-errors
-
-| ld.lld: error: section type mismatch for .nozi.kdata_page
-| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SHT_PROGBITS
-| >>> output section .nozi: SHT_NOBITS
-|
-| ld.lld: error: section type mismatch for .nozi.mmu.l2
-| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tadevkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT_PROGBITS
-| >>> output section .nozi: SHT_NOBITS
-
-These sections should be carrying SHT_NOBITS but so far it was not
-possible to do so, this patch tries to use clangs pragma to get this
-going and match the functionality with gcc.
-
-[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#specifying-section-names-for-global-objects-pragma-clang-section
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
- core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
- core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
- core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
- core/kernel/thread.c             | 13 +++++++++++-
- 5 files changed, 104 insertions(+), 11 deletions(-)
-
-diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread.c
-index 4487ef026df9..f3624389611b 100644
---- a/core/arch/arm/kernel/thread.c
-+++ b/core/arch/arm/kernel/thread.c
-@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
- #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
- 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
- long thread_user_kdata_sp_offset __nex_bss;
-+#ifdef __clang__
-+#ifndef CFG_VIRTUALIZATION
-+#pragma clang section bss=".nozi.kdata_page"
-+#else
-+#pragma clang section bss=".nex_nozi.kdata_page"
-+#endif
-+#endif
- static uint8_t thread_user_kdata_page[
- 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
- 		SMALL_PAGE_SIZE)]
- 	__aligned(SMALL_PAGE_SIZE)
-+#ifndef __clang__
- #ifndef CFG_NS_VIRTUALIZATION
--	__section(".nozi.kdata_page");
-+	__section(".nozi.kdata_page")
- #else
--	__section(".nex_nozi.kdata_page");
-+	__section(".nex_nozi.kdata_page")
- #endif
-+#endif
-+    ;
-+#endif
-+
-+/* reset BSS section to default ( .bss ) */
-+#ifdef __clang__
-+#pragma clang section bss=""
- #endif
- 
- #ifdef ARM32
-diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mmu_lpae.c
-index 7e79f780ad28..ec4db9dc98c5 100644
---- a/core/arch/arm/mm/core_mmu_lpae.c
-+++ b/core/arch/arm/mm/core_mmu_lpae.c
-@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
- typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_ENTRIES];
- typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
- 
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.base_table"
-+#endif
- static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
- 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
--	__section(".nozi.mmu.base_table");
-+#ifndef __clang__
-+	__section(".nozi.mmu.base_table")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- 
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l2"
-+#endif
- static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
--	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
-+	__aligned(XLAT_TABLE_SIZE)
-+#ifndef __clang__
-+	__section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- 
- #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
- 
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l2"
-+#endif
- /* MMU L2 table for TAs, one for each thread */
- static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
--	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
--
-+#ifndef __clang__
-+	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- /*
-  * TAs page table entry inside a level 1 page table.
-  *
-diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_v7.c
-index 61e703da89c8..1960c08ca688 100644
---- a/core/arch/arm/mm/core_mmu_v7.c
-+++ b/core/arch/arm/mm/core_mmu_v7.c
-@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
- typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
- typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
- 
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l1"
-+#endif
- static l1_xlat_tbl_t main_mmu_l1_ttb
--		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
-+		__aligned(L1_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.l1")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- 
- /* L2 MMU tables */
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l2"
-+#endif
- static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
--		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
-+		__aligned(L2_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- 
- /* MMU L1 table for TAs, one for each thread */
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.ul1"
-+#endif
- static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
--		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
-+		__aligned(UL1_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.ul1")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- 
- struct mmu_partition {
- 	l1_xlat_tbl_t *l1_table;
-diff --git a/core/mm/pgt_cache.c b/core/mm/pgt_cache.c
-index 79553c6d2183..b9efdf42780b 100644
---- a/core/mm/pgt_cache.c
-+++ b/core/mm/pgt_cache.c
-@@ -410,8 +410,18 @@ void pgt_init(void)
- 	 * has a large alignment, while .bss has a small alignment. The current
- 	 * link script is optimized for small alignment in .bss
- 	 */
-+#ifdef __clang__
-+#pragma clang section bss=".nozi.mmu.l2"
-+#endif
- 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
--			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
-+			__aligned(PGT_SIZE)
-+#ifndef __clang__
-+			__section(".nozi.pgt_cache")
-+#endif
-+			;
-+#ifdef __clang__
-+#pragma clang section bss=""
-+#endif
- 	size_t n;
- 
- 	for (n = 0; n < ARRAY_SIZE(pgt_tables); n++) {
-diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index 2a1f22dce635..5516b677141a 100644
---- a/core/kernel/thread.c
-+++ b/core/kernel/thread.c
-@@ -39,13 +39,24 @@ static uint32_t end_canary_value = 0xababab00;
- 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
- #endif
- 
-+#define DO_PRAGMA(x) _Pragma (#x)
-+
-+#ifdef __clang__
-+#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
-+DO_PRAGMA (clang section bss=".nozi_stack." #name) \
-+linkage uint32_t name[num_stacks] \
-+		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
-+			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
-+		__attribute__((aligned(STACK_ALIGNMENT))); \
-+DO_PRAGMA(clang section bss="")
-+#else
- #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
- linkage uint32_t name[num_stacks] \
- 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
- 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
- 		__attribute__((section(".nozi_stack." # name), \
- 			       aligned(STACK_ALIGNMENT)))
--
-+#endif
- #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
- 
- DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 9db67567..790f5f5f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,7 +1,2 @@
-PV = "4.1.0+git"
-SRCREV = "012cdca49db398693903e05c42a254a3a0c0d8f2"
-
-# Fixes for pointing to 4.0.0 before upstream meta-arm
-FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
-SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
-SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
+PV = "4.2.0+git"
+SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 16b2dfc3..fdfa420c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,6 +1,2 @@
-PV = "4.1.0+git"
-SRCREV = "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
-
-# Fixes for pointing to 4.0.0 before upstream meta-arm
-SRC_URI:remove = "file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch"
-
+PV = "4.2.0+git"
+SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"

---
base-commit: de73fc7fe4e81196d4e4ee9054bb805c967bb73e
change-id: 20240521-sg-optee-4-2-update-185fd5dc31d0

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


