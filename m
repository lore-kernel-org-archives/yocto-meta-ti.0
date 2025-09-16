Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4B4CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 13:10:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.19552.1758028231684975754
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 06:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XZea5Jxo;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58GDATTH017080;
	Tue, 16 Sep 2025 08:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758028229;
	bh=TZaQpLhNyJ2oJcdePzyleZ0XkBgPH++pdmp5Qjf2qL0=;
	h=From:To:Subject:Date;
	b=XZea5JxoBlVXVqMNWaqyNnCuvRvx4hjyQ5pwizWP1xtADavBl2hz9TOe69RkiaCvm
	 lFN34Y2jroZ2C1N/6RmSfz2olxjqs5knX98qHTwhSFWYhJXd4oj65ORIssQLel4+x5
	 UhDRSY9SPTUb9cPzHyDohNBzeeV+5Nt16xqd9x+k=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58GDATGH744624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 16 Sep 2025 08:10:29 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 16
 Sep 2025 08:10:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Sep 2025 08:10:28 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58GDASpj1652383;
	Tue, 16 Sep 2025 08:10:28 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uyVRz-00024K-NH; Tue, 16 Sep 2025 08:10:27 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee-test: Remove unneeded patch
Date: Tue, 16 Sep 2025 08:10:27 -0500
Message-ID: <20250916131027.7909-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Sep 2025 13:10:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19013

The recent SRCREV change now includes the patch, so we no longer need
it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../optee/optee-test-ti-version.inc           |  1 -
 ...-15-Wunterminated-string-initializat.patch | 68 -------------------
 2 files changed, 69 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch

diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 4a4a2f92..2d8fd8b2 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -3,4 +3,3 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/optee-test:"
 PV = "4.7.0+git"
 SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
 
-SRC_URI += "file://0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch b/meta-ti-bsp/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
deleted file mode 100644
index 018952f8..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From a8e58203dcb4c13ee340259cd2692202ac8414d1 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@konsulko.com>
-Date: Tue, 6 May 2025 21:35:55 -0400
-Subject: [PATCH] Suppress new gcc-15 -Wunterminated-string-initialization
-
-GCC 15 now warns when character arrays are being initialized by strings
-and terminating NUL character doesn't fit. GCC 15.1 also allows marking
-such arrays with nonstring attribute to suppress the warning. W/o such
-attribute, the warning becomes error due to the global -Werror. Add the
-attribute accordingly.
-
-Fixes these errors:
-
-| ./regression_4000_data.h:7919:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (20 chars into 19 available) [-Werror=unterminated-string-initialization]
-|  7919 |         "encryption standard";
-|       |         ^~~~~~~~~~~~~~~~~~~~~
-| ./regression_4000_data.h:8387:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (113 chars into 112 available) [-Werror=unterminated-string-initialization]
-|  8387 |         "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
-|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| ./regression_4000.c:1295:47: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (4 chars into 3 available) [-Werror=unterminated-string-initialization]
-|  1295 | static const uint8_t hash_data_sm3_a1_in[3] = "abc";
-|       |                                               ^~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
----
- host/xtest/regression_4000.c      | 2 +-
- host/xtest/regression_4000_data.h | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/host/xtest/regression_4000.c b/host/xtest/regression_4000.c
-index 3aa15be..46e6f8e 100644
---- a/host/xtest/regression_4000.c
-+++ b/host/xtest/regression_4000.c
-@@ -1292,7 +1292,7 @@ static const uint8_t hash_data_shake256_out2[] = {
-  * https://tools.ietf.org/html/draft-sca-cfrg-sm3-02
-  * Appendix A.1
-  */
--static const uint8_t hash_data_sm3_a1_in[3] = "abc";
-+static const uint8_t hash_data_sm3_a1_in[3] __attribute__((nonstring)) = "abc";
-
- static const uint8_t hash_data_sm3_a1_out[] = {
-	0x66, 0xc7, 0xf0, 0xf4, 0x62, 0xee, 0xed, 0xd9,
-diff --git a/host/xtest/regression_4000_data.h b/host/xtest/regression_4000_data.h
-index 0881ac3..eb101b2 100644
---- a/host/xtest/regression_4000_data.h
-+++ b/host/xtest/regression_4000_data.h
-@@ -7914,7 +7914,7 @@ static struct derive_key_ecdh_t {
- };
-
- /* G/MT 0003 (SM2) Part 5 Annex C.2 - encryption/decryption */
--static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] =
-+static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] __attribute__((nonstring)) =
- /* M */
-	"encryption standard";
- static const uint8_t gmt_0003_part5_c2_sm2_testvector_private[] = {
-@@ -8383,7 +8383,7 @@ static const uint8_t mac_data_sha3_512_out1[] = {
-  * GM/T 0042-2015
-  * Section D.3 Test vector 1
-  */
--static const uint8_t mac_data_sm3_d31_in[112] =
-+static const uint8_t mac_data_sm3_d31_in[112] __attribute__((nonstring)) =
-	"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
-	"opnopqabcdbcdecdefdefgefghfghighijhijkijkljklmklmn"
-	"lmnomnopnopq";
---
-2.25.1
-- 
2.17.1


