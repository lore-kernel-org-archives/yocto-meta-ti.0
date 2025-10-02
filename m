Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18090CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:52:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.9190.1759413134633852586
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H1JJVhWP;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DqDeN2892162;
	Thu, 2 Oct 2025 08:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413133;
	bh=QLyWwcgAmNmD0vPuNSQvjg6ovgwdUJuKpAa4Xt6juOo=;
	h=From:To:CC:Subject:Date;
	b=H1JJVhWPoD6lApT2LMaXezKDSmJ2BK9IIR3BEOZAyCHe//lvtnhcecxVQb+hDJN32
	 W0bR7nGdl21b1XgMuopgMkwANQ97ZLyDVYtBBlsJRjdC1sq1D0R0NasVb2tHK+lxrm
	 /v0RSgUmuC9zMrw/C6s4P+pLGnD1q9flHMQ9YZww=
Received: from DLEE210.ent.ti.com (dlee210.ent.ti.com [157.170.170.112])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DqDI4470071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 08:52:13 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 08:52:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:52:13 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DqDGt1918045;
	Thu, 2 Oct 2025 08:52:13 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH 1/2] meta-ti-bsp: vpe-tests: Remove this recipe
Date: Thu, 2 Oct 2025 08:52:11 -0500
Message-ID: <20251002135212.1820365-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:52:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19092

vpe-tests is obsolete, it was replaced with "testvpe" as part of
glsdk-example-apps about 10 years ago in meta-arago, so long ago even
its replacement has been obsoleted and removed. Yet, this unbuildable
recipe still lives on here in meta-ti. Send it out to sea.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/vpe-tests/vpe-tests_git.bb    | 30 -------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
deleted file mode 100644
index 274cc735..00000000
--- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "VPE test program"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
-
-DEPENDS = "virtual/kernel vpdma-fw"
-
-PR = "r3"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
-BRANCH ?= "master"
-
-SRC_URI = "git://git.ti.com/git/vpe_tests/vpe_tests.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-FLOATABI = "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-
-# The test application needs additional include headers from the kernel
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
-
-do_install() {
-    oe_runmake DESTDIR="${D}" install
-    rm -rf ${D}${nonarch_base_libdir}/firmware/vpdma-*.bin
-    rmdir -p ${D}${nonarch_base_libdir}/firmware || true
-}
-- 
2.39.2


