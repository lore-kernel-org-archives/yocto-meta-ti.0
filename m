Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1505.1624669748079376824
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 18:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vWjuZWI9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15Q196fb004283;
	Fri, 25 Jun 2021 20:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624669746;
	bh=r5tw1IaJJ98TEsxpod2N20MKsNwdqYfSmpEVgFeDyR4=;
	h=From:To:CC:Subject:Date;
	b=vWjuZWI9q7eANwKVXVKIYIC+VxJTSaKXi0pAOgHw9WYChOUjxs5m8IrrAuRW58DgP
	 a2PEvzXvonBeqD7R25VkPR0TsDrecScrKqAiMkVeQD39QGDIMWmttqDJQnBqDxSbWe
	 94SVSukcxil5v7Kct/PH//3ZWvl7xzSfyCzid/cU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15Q196uE096428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Jun 2021 20:09:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 25
 Jun 2021 20:09:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 25 Jun 2021 20:09:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15Q196uo053326;
	Fri, 25 Jun 2021 20:09:06 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH] optee-os: upgrade to upstream 3.12.0
Date: Fri, 25 Jun 2021 20:09:06 -0500
Message-ID: <20210626010906.20835-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Upgrade optee-os to upstream 3.12.0 on dunfell branch.

upstream optee 3.13.0 tag has the following patches.
f50962e3 ta_dev_kit.mk: make sure that libutils is linked second time
73196b58 link.mk: implement support for libnames-after-libgcc variable
36e784f6 libutils: provide empty __getauxval() implementation

Hence removing from here.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 ...ide-empty-__getauxval-implementation.patch | 62 -------------------
 ...t-support-for-libnames-after-libgcc-.patch | 55 ----------------
 ...ke-sure-that-libutils-is-linked-seco.patch | 44 -------------
 recipes-security/optee/optee-os_%.bbappend    |  7 +--
 4 files changed, 2 insertions(+), 166 deletions(-)
 delete mode 100644 recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
 delete mode 100644 recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
 delete mode 100644 recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch

diff --git a/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch b/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
deleted file mode 100644
index 0120f5c2..00000000
--- a/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 36e784f621bf5d5be9183beba35f39426277c110 Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Tue, 13 Oct 2020 22:45:39 +0300
-Subject: [PATCH 1/3] libutils: provide empty __getauxval() implementation
-
-Never version of libgcc are built with LSE implementation in mind. To
-determine if LSE is available on platform it calls __getauxval(), so in
-some cases we can get undefined reference to __getauxval() error.
-
-Prominent case is libgcc_eh.a library, which is used by C++ TAs. Exception
-handler depends on atomic operations, so it tries to call
-init_have_lse_atomics() first. This function in turn calls __getauxval(),
-which causes linking error.
-
-In the future we can make __getauxval() to return actual platform
-capabilities.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- lib/libutils/ext/arch/arm/auxval.c | 12 ++++++++++++
- lib/libutils/ext/arch/arm/sub.mk   |  1 +
- 2 files changed, 13 insertions(+)
- create mode 100644 lib/libutils/ext/arch/arm/auxval.c
-
-diff --git a/lib/libutils/ext/arch/arm/auxval.c b/lib/libutils/ext/arch/arm/auxval.c
-new file mode 100644
-index 00000000..98bca850
---- /dev/null
-+++ b/lib/libutils/ext/arch/arm/auxval.c
-@@ -0,0 +1,12 @@
-+// SPDX-License-Identifier: BSD-2-Clause
-+/*
-+ * Copyright (c) 2020, EPAM Systems
-+ */
-+
-+#include <compiler.h>
-+
-+unsigned long int __getauxval (unsigned long int type);
-+unsigned long int __getauxval (unsigned long int type __unused)
-+{
-+	return 0;
-+}
-diff --git a/lib/libutils/ext/arch/arm/sub.mk b/lib/libutils/ext/arch/arm/sub.mk
-index dc5eed67..2e779066 100644
---- a/lib/libutils/ext/arch/arm/sub.mk
-+++ b/lib/libutils/ext/arch/arm/sub.mk
-@@ -3,6 +3,7 @@ srcs-$(CFG_ARM32_$(sm)) += aeabi_unwind.c
- endif
- srcs-$(CFG_ARM32_$(sm)) += atomic_a32.S
- srcs-$(CFG_ARM64_$(sm)) += atomic_a64.S
-+srcs-y += auxval.c
- ifneq ($(sm),ldelf) # TA, core
- srcs-$(CFG_ARM32_$(sm)) += mcount_a32.S
- srcs-$(CFG_ARM64_$(sm)) += mcount_a64.S
--- 
-2.25.1
-
diff --git a/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch b/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
deleted file mode 100644
index 11296c8c..00000000
--- a/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 73196b58ea6978ffa5e581738030f51c5789ef73 Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Tue, 13 Oct 2020 22:54:13 +0300
-Subject: [PATCH 2/3] link.mk: implement support for libnames-after-libgcc
- variable
-
-Newer versions of libgcc depend on external __getauxval() symbol, which is
-now provided by libutils. But libgcc is linked after libutils, so linker
-can't resolve that symbol. We can't include libgcc into linking group with
-libtutils, because libgcc provides symbols that conflict with libutil's
-ones, like __aeabi_idiv with friends for instance.
-
-So, to resolve libgcc dependency on libutils we need to link with libutils
-second time. To make things more generic, we will introduce
-$(libnames-after-libgcc) variable for libraries that should be linked after
-libgcc.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- ta/arch/arm/link.mk | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
-index 445c285d..3025acb1 100644
---- a/ta/arch/arm/link.mk
-+++ b/ta/arch/arm/link.mk
-@@ -55,8 +55,11 @@ link-ldflags += --eh-frame-hdr
- link-ldadd += $(libstdc++$(sm)) $(libgcc_eh$(sm))
- endif
- link-ldadd += --end-group
--ldargs-$(user-ta-uuid).elf := $(link-ldflags) $(objs) $(link-ldadd) $(libgcc$(sm))
- 
-+link-ldadd-after-libgcc += $(addprefix -l,$(libnames-after-libgcc))
-+
-+ldargs-$(user-ta-uuid).elf := $(link-ldflags) $(objs) $(link-ldadd) \
-+				$(libgcc$(sm)) $(link-ldadd-after-libgcc)
- 
- link-script-cppflags-$(sm) := \
- 	$(filter-out $(CPPFLAGS_REMOVE) $(cppflags-remove), \
-@@ -76,6 +79,7 @@ $(link-script-pp$(sm)): $(link-script$(sm)) $(conf-file) $(link-script-pp-makefi
- 		$(link-script-cppflags-$(sm)) $$< -o $$@
- 
- $(link-out-dir$(sm))/$(user-ta-uuid).elf: $(objs) $(libdeps) \
-+					  $(libdeps-after-libgcc) \
- 					  $(link-script-pp$(sm)) \
- 					  $(dynlistdep) \
- 					  $(additional-link-deps)
--- 
-2.25.1
-
diff --git a/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch b/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
deleted file mode 100644
index 88ba5f85..00000000
--- a/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From f50962e3f56f0932662b2ffa10afe53339a335dd Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Fri, 16 Oct 2020 16:36:08 +0300
-Subject: [PATCH 3/3] ta_dev_kit.mk: make sure that libutils is linked second
- time
-
-libgcc depends on __getauxval symbol from libuils. As, generally libutils
-is linked before libgcc, we will get "unresolved symbol" error. To resolve
-this dependency we need to link libutils second time - after libgcc.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- ta/mk/ta_dev_kit.mk | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
-index e28be677..d0e66317 100644
---- a/ta/mk/ta_dev_kit.mk
-+++ b/ta/mk/ta_dev_kit.mk
-@@ -78,6 +78,16 @@ endif
- libnames += dl
- libdeps += $(ta-dev-kit-dir$(sm))/lib/libdl.a
- 
-+# libutils provides __getauxval symbol which is needed by libgcc 10.x. We can't
-+# link libutils after libgcc, because libgcc will replace some symbols provided
-+# by libutils, which will cause further linking issues.
-+#
-+# But if we place libutils before libgcc, linker will not be able to resolve
-+# __getauxval. So we need to link with libutils twice: before and after libgcc.
-+# Hence it included both in $(libnames) and in $(libnames-after-libgcc)
-+libnames-after-libgcc += utils
-+libdeps-after-libgcc += $(ta-dev-kit-dir$(sm))/lib/libutils.a
-+
- # Pass config variable (CFG_) from conf.mk on the command line
- cppflags$(sm) += $(strip \
- 	$(foreach var, $(filter CFG_%,$(.VARIABLES)), \
--- 
-2.25.1
-
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 8072490f..c90d85ea 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,16 +1,13 @@
 FILESEXTRAPATHS_prepend_ti-soc := "${THISDIR}/${PN}:"
 
-PV_ti-soc = "3.11.0+git${SRCPV}"
+PV_ti-soc = "3.12.0+git${SRCPV}"
 
-SRCREV_ti-soc = "c4def2a8262a03244d9a88461699b9b8e43c6b55"
+SRCREV_ti-soc = "3d47a131bca1d9ed511bfd516aa5e70269e12c1d"
 
 SRC_URI_ti-soc = " \
     git://github.com/OP-TEE/optee_os.git \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
-    file://0001-libutils-provide-empty-__getauxval-implementation.patch \
-    file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch \
-    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch \
 "
 
 do_compile_prepend_ti-soc() {
-- 
2.17.1

