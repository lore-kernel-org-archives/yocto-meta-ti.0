Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E741FCF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 15:07:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.39037.1727104063483231517
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Sep 2024 08:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NhrTzzdV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48NF7gLe038076;
	Mon, 23 Sep 2024 10:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727104062;
	bh=9VtmAaaUyGSaUKNXon+/V5JbVb0GTkgMPVFy56bn2lo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NhrTzzdVQ47QltPeKdDht8PxbS0tTxk/PaJIVrGUa9hJ06WJ4weXqwB5+Y3TNUQ5r
	 IBA+z3KEEO3ro1/Lx2+PWWq2r3I8aIpgA1LAgU6HdqFPML6xXWKE1fUBSsz1m/UPFg
	 UE9yNnqmDH685PCh3XUwYE3pF0VTOb5LWNwmYL4w=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48NF7gUT007645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Sep 2024 10:07:42 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Sep 2024 10:07:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Sep 2024 10:07:41 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48NF7f3F113717;
	Mon, 23 Sep 2024 10:07:41 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/2] meta-ti-extras: ti-osal: Remove this recipe
Date: Mon, 23 Sep 2024 10:07:40 -0500
Message-ID: <20240923150740.78316-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240923150740.78316-1-afd@ti.com>
References: <20240923150740.78316-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Sep 2024 15:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17970

Last user was dspdce-fw which is removed. Remove this now unused
support library.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/includes/ti-paths.inc          |  2 --
 meta-ti-extras/recipes-ti/osal/ti-osal.inc    | 24 -------------------
 .../recipes-ti/osal/ti-osal_1.24.00.09.bb     |  9 -------
 3 files changed, 35 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/osal/ti-osal.inc
 delete mode 100644 meta-ti-extras/recipes-ti/osal/ti-osal_1.24.00.09.bb

diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
index e8b0f17b..9f8b5897 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -20,7 +20,6 @@ export MATHLIB_C66_INSTALL_DIR_RECIPE  = "${installdir}/ti-mathlib-c66x-tree"
 export MATHLIB_C674_INSTALL_DIR_RECIPE = "${installdir}/ti-mathlib-c674x-tree"
 export MPM_INSTALL_DIR_RECIPE          = "${installdir}/ti-mpm-tree"
 export OMP_INSTALL_DIR_RECIPE          = "${installdir}/ti-omp-tree"
-export OSAL_INSTALL_DIR_RECIPE         = "${installdir}/ti-osal-tree"
 export PDK_INSTALL_DIR_RECIPE          = "${installdir}/ti-pdk-tree"
 export SYSBIOS_INSTALL_DIR_RECIPE      = "${installdir}/ti-sysbios-tree"
 export SWTOOLS_INSTALL_DIR_RECIPE      = "${installdir}/ti-swtools-tree"
@@ -48,7 +47,6 @@ export MATHLIB_C66_INSTALL_DIR  = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DI
 export MATHLIB_C674_INSTALL_DIR = "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
 export MPM_INSTALL_DIR          = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
 export OMP_INSTALL_DIR          = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
-export OSAL_INSTALL_DIR         = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
 export PDK_INSTALL_DIR          = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
 export SWTOOLS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
 export SYSBIOS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECIPE}"
diff --git a/meta-ti-extras/recipes-ti/osal/ti-osal.inc b/meta-ti-extras/recipes-ti/osal/ti-osal.inc
deleted file mode 100644
index b0470793..00000000
--- a/meta-ti-extras/recipes-ti/osal/ti-osal.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "TI Operating System Abstraction Library (OSAL)"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
-LICENSE = "BSD-3-Clause & EPL-1.0"
-SECTION = "devel"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-
-S = "${WORKDIR}/osal_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal/${PV}/exports/osal_${PV}.tar.gz;name=osaltarball"
-
-do_install() {
-    install -d ${D}${OSAL_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${OSAL_INSTALL_DIR_RECIPE}
-}
-
-INSANE_SKIP:${PN}-dev = "staticdev"
-
-ALLOW_EMPTY:${PN} = "1"
-FILES:${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
diff --git a/meta-ti-extras/recipes-ti/osal/ti-osal_1.24.00.09.bb b/meta-ti-extras/recipes-ti/osal/ti-osal_1.24.00.09.bb
deleted file mode 100644
index 226458be..00000000
--- a/meta-ti-extras/recipes-ti/osal/ti-osal_1.24.00.09.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-osal.inc
-
-PV = "1_24_00_09"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://osal_${PV}_Manifest.html;md5=c110191994d011cee4cd02189ed3c9f4"
-
-SRC_URI[osaltarball.md5sum] = "a7ea85447fa0ff0f786d527a52fa6e8b"
-SRC_URI[osaltarball.sha256sum] = "d14f1f43c8a7965e86add69bd813cea56ea7e38abeb55de3fdcdaf4a69f19bf3"
-- 
2.39.2


