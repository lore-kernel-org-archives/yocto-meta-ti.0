Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E28CCA481
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 17:14:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.17.1654708461503722553
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 10:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TqXKjjLP;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258HEJA7034231;
	Wed, 8 Jun 2022 12:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654708459;
	bh=EU2223Jc9XVohdc/eiQ8490Ryqpc+vgBIQdGWWerPw8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TqXKjjLPPZg9J5EnDTsEkxaDOlNXcamoFtWkqVvKBKZol+IxQYWyUfmJVkNBh6MZY
	 lC/1qK7qVAWyBprxrGuQcrbvbnENy/VrdS5V81L0UtR6t4IBA94k1/DjnJ4bBt3f8Z
	 ldR9nOOoq1Wkeej0KQ40s28wVEzHoTNHrgOEhIic=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258HEJBF087087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jun 2022 12:14:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 12:14:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 12:14:19 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258HEIGx114380;
	Wed, 8 Jun 2022 12:14:19 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 2/2] optee: Upgrade to upstream 3.17.0
Date: Wed, 8 Jun 2022 12:14:18 -0500
Message-ID: <20220608171418.576-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608171418.576-1-afd@ti.com>
References: <20220608171418.576-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 17:14:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14793

Update to the latest upstream master which is 3.17.
The extra patches do not look to be needed anymore.

While here switch to git checkout with https.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../optee/optee-client_%.bbappend             |  4 +++
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 -------------------
 ...0007-allow-setting-sysroot-for-clang.patch | 29 ----------------
 recipes-security/optee/optee-os_%.bbappend    | 12 +++----
 recipes-security/optee/optee-test_%.bbappend  |  7 ++++
 5 files changed, 15 insertions(+), 71 deletions(-)
 create mode 100644 recipes-security/optee/optee-client_%.bbappend
 delete mode 100644 recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 recipes-security/optee/optee-test_%.bbappend

diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
new file mode 100644
index 00000000..0324c1ab
--- /dev/null
+++ b/recipes-security/optee/optee-client_%.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_prepend_ti-soc := "${THISDIR}/${PN}:"
+
+PV_ti-soc = "3.17.0+git${SRCPV}"
+SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
diff --git a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
deleted file mode 100644
index 17005396..00000000
--- a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH] allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
-for the compiler libraries as there's no easy way to reliably pass --sysroot
-otherwise.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- mk/gcc.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..81bfa78a 100644
---- a/mk/gcc.mk
-+++ b/mk/gcc.mk
-@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
- 			-print-file-name=include 2> /dev/null)
- 
- # Get location of libgcc from gcc
--libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
- 			-print-libgcc-file-name 2> /dev/null)
--libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
-+libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=libstdc++.a 2> /dev/null)
--libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
-+libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=libgcc_eh.a 2> /dev/null)
- 
- # Define these to something to discover accidental use
diff --git a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch b/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
deleted file mode 100644
index 5c0d0a56..00000000
--- a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index 0f48c836..47465523 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
- 
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
- # libgcc for clang
--libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
- 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
- 
- # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 4e01ea74..c5bc3bf8 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,14 +1,10 @@
 FILESEXTRAPATHS_prepend_ti-soc := "${THISDIR}/${PN}:"
 
-PV_ti-soc = "3.12.0+git${SRCPV}"
+PV_ti-soc = "3.17.0+git${SRCPV}"
+SRCREV_ti-soc = "332dec4a4bb9935e650b9925577cef5d485af724"
+SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
-SRCREV_ti-soc = "3d47a131bca1d9ed511bfd516aa5e70269e12c1d"
-
-SRC_URI_ti-soc = " \
-    git://github.com/OP-TEE/optee_os.git \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-"
+DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes-security/optee/optee-test_%.bbappend
new file mode 100644
index 00000000..85f2b03f
--- /dev/null
+++ b/recipes-security/optee/optee-test_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_prepend_ti-soc := "${THISDIR}/${PN}:"
+
+PV_ti-soc = "3.17.0+git${SRCPV}"
+SRCREV_ti-soc = "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
+SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_test.git;protocol=https"
+
+DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.36.1


