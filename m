Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319B9C7EE39
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:11:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.18760.1685038296260556040
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Er2+OQON;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBZIA020385;
	Thu, 25 May 2023 13:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685038295;
	bh=CcwkgKg82bGdFJv4MfCwxGbxOQKX9NAUKIxSMUb3Fj8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Er2+OQONT1wUnzJifbUuCjZ5hn9OtmlL779iZuF+rDww61nsLKgrC76T1brOa1AAO
	 JFNyLKyRZ/IXkGiNrYQVzvTpZT7z4VQAiOOTkQKF5QldQDWtn6O7ZHj97d+idUh2j4
	 CE+ZiDAxqrib6qnoC08ETQTabjOBbgZgBeYC0vMc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PIBZW3059576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 13:11:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 13:11:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 13:11:35 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBXGu102467;
	Thu, 25 May 2023 13:11:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/9] ti-sci-fw: Remove source package recipe
Date: Thu, 25 May 2023 13:11:26 -0500
Message-ID: <20230525181132.417197-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525181132.417197-1-afd@ti.com>
References: <20230525181132.417197-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 18:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16587

K3-image-gen is going away and we don't do SRCIPK packages like this
anymore anyway. Remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-sci-fw/ti-sci-fw-source_git.bb         | 45 -------------------
 1 file changed, 45 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
deleted file mode 100644
index bab4acf0..00000000
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-# ti-sci-fw builds and packages multiple config variants via multiconfig
-# Let's take a page from gcc-source as a common recipe for all gcc stages,
-# but also to provide a single package for MAINMACHINE of all multiconfigs
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-SUMMARY += "- sources"
-
-COMPATIBLE_MACHINE = "k3"
-
-EXCLUDE_FROM_WORLD = "1"
-INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = ""
-
-PACKAGES = "${PN}"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-
-SRCIPK_SRC_DIR = "${WORKDIR}/imggen"
-SRCIPK_INSTALL_DIR = "board-support/k3-image-gen-${PV}"
-FILES:${PN} = "${SRCIPK_INSTALL_DIR}"
-
-do_install() {
-    # Copy sources for packaging
-    mkdir -p ${D}/${SRCIPK_INSTALL_DIR}
-    if [ -e ${SRCIPK_SRC_DIR} ]; then
-        if [ "${SRCIPK_SRC_DIR}" = "${WORKDIR}" ]; then
-            excludes='--exclude ./temp --exclude ${D}'
-        fi
-        tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C ${D}/${SRCIPK_INSTALL_DIR} -xpf -
-    fi
-
-    # Fix up patches/ directory to contain actual patches instead of symlinks
-    if [ -e ${D}/${SRCIPK_INSTALL_DIR}/patches ]
-    then
-        mv ${D}/${SRCIPK_INSTALL_DIR}/patches ${D}/${SRCIPK_INSTALL_DIR}/patches-links
-        cp -rL ${D}/${SRCIPK_INSTALL_DIR}/patches-links ${D}/${SRCIPK_INSTALL_DIR}/patches
-        rm -rf ${D}/${SRCIPK_INSTALL_DIR}/patches-links
-    fi
-}
-
-# Do not perform any QA checks on source package
-INSANE_SKIP:${PN} += "${ALL_QA}"
-- 
2.39.2


