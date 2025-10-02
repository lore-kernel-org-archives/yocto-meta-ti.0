Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1720DCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:52:18 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.9191.1759413134805439475
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tCzE2RW9;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DqEcD3348127;
	Thu, 2 Oct 2025 08:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413134;
	bh=nCCYZwPLzFdpGoLuJQRghqvcNhww/bBA7q/8iVHNW/A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tCzE2RW9p4wSMK4ltilOIK05MbLb8LiXt5xljMK+sNARvpqq5DT7YEJPWJV6866XN
	 xHGcyHZ/sVPW4yJyX8vzYVU8VFyKqlOdOMhz5/J8qm2l2B1VU9XjDmU/0djukHrKMd
	 1m1zlLdksPONNZE39CNZNYdipcaycP7/E5znNccM=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DqE5T1272280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 08:52:14 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 08:52:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:52:13 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DqDGu1918045;
	Thu, 2 Oct 2025 08:52:13 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH 2/2] meta-ti-extras: libaet: Remove this recipe
Date: Thu, 2 Oct 2025 08:52:12 -0500
Message-ID: <20251002135212.1820365-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251002135212.1820365-1-afd@ti.com>
References: <20251002135212.1820365-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:52:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19093

This was only ever used as part of the DSP firmware for OpenCL dispatch.
That is all gone now, so remove this leftover dependency.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/ctoolslib/libaet_git.bb        | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb

diff --git a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
deleted file mode 100644
index f3b03bd6..00000000
--- a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "TI Emulation CTools AET library"
-DESCRIPTION = "The AETLIB library provides programmatic access to the Advanced Event Triggering capability on C6x processor cores"
-
-LICENSE = "BSD-3-Clause"
-
-PV = "4.19.0.0"
-
-LIC_FILES_CHKSUM = "file://../ctoolslib_manifest.html;md5=b7dd369a2e07ef9a71795ee5a9bd01bd"
-
-SRC_URI = "git://git.ti.com/git/sdo-emu/ctoolslib.git;protocol=https;branch=opencl_aetlib_build"
-SRCREV = "de7954abab0f0caa8a2c7b53095c30226d901a31"
-
-DEPENDS = "ti-cgt6x-native"
-PR = "r0"
-
-S = "${WORKDIR}/git/aet"
-
-DEVICE = ""
-DEVICE:dra7xx = "DRA7xx"
-
-EXTRA_OEMAKE = "C6X_C_DIR=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x/include"
-
-do_install() {
-    install -d ${D}${datadir}/ti/ctoolslib/aet
-    install -d ${D}${datadir}/ti/ctoolslib/aet/include
-    install -d ${D}${datadir}/ti/ctoolslib/aet/lib
-    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${S}/include/* ${D}${datadir}/ti/ctoolslib/aet/include/
-    install -m 0644 ${S}/build/c66/libaet.ae66 ${D}${datadir}/ti/ctoolslib/aet/lib/
-}
-
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-FILES:${PN}-dev += "\
-    ${datadir}/ti/ctoolslib/aet \
-"
-
-ALLOW_EMPTY:${PN} = "1"
-- 
2.39.2


