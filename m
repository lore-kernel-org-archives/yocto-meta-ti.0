Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF76C636D7
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2564.1676489640429296796
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pUsd/Z7J;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXwY5097995;
	Wed, 15 Feb 2023 13:33:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489638;
	bh=XbZmEj/uKqtuWmM6ngPL5/P+Xkaq10JY9XV2OACtIdA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pUsd/Z7Jb/tNtAt65rPWgQj2RYpEd3nqd6ylgsej6KHGYcsQa/gHXm9WP8ultZdXD
	 XMGd+jqRgmxmZlpRSNMZDj1sREXIUScYHd+mSy+SChrWGdP3qyZTvyDk6u+FI4ndei
	 /jlTZe+WAA7V/quI50RYxCUBtomInssapPYrFO2w=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXwvD016211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:58 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:58 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:58 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6l014221;
	Wed, 15 Feb 2023 13:33:58 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 08/15] ti-k3-secdev: Remove inclusion of ti-paths.inc
Date: Wed, 15 Feb 2023 13:33:48 -0600
Message-ID: <20230215193355.9676-9-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15865

Since this directory path will not change, let's avoid use
of ti-paths.inc which is set to be removed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 5 ++---
 meta-ti-extras/recipes-ti/includes/ti-paths.inc   | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index 6a28add7..b4c26f68 100644
--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -4,9 +4,8 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
 
-# set a default value for TI_K3_SECDEV_INSTALL_DIR_RECIPE
-export TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${datadir}/ti/ti-k3-secdev"
-include recipes-ti/includes/ti-paths.inc
+# set a default install location
+TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${datadir}/ti/ti-k3-secdev"
 
 # Native host tool only
 COMPATIBLE_MACHINE = "null"
diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
index 63c00e8c..b443d2f0 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -51,7 +51,6 @@ export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
 export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
-export TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${installdir}/ti-k3-secdev"
 
 
 # This is where the tools will end up in sysroot
@@ -101,7 +100,6 @@ export TI_CGT6X_7_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT6X_7_INSTALL_DIR
 export GCC_LINARO_BAREMETAL_TOOLCHAIN         =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}"
 export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}"
 export TI_CGT7X_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${TI_CGT7X_INSTALL_DIR_RECIPE}"
-export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
 
 
 DSPSUFFIX:omapl138 = "x674"
-- 
2.39.1


