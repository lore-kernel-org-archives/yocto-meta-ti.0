Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFF0C77B7F
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.85704.1682443428533991621
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g0B4C0U2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNlWP094307;
	Tue, 25 Apr 2023 12:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443427;
	bh=CcwkgKg82bGdFJv4MfCwxGbxOQKX9NAUKIxSMUb3Fj8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g0B4C0U2M1cjF1YnJAf3xF5+deJwTaPXtEjkI49ECMfdWD5o0+6ne3p4LLd8T5EBU
	 9/ae1JOPDL+qjKRZMZGGnwehQ/NcYm8lMnPdaxbTj9Zx4pUAtxW+7z95QeArDq+Z0X
	 BPjLTfTyRKZx5q3ZtbswQxDsARZjQPLyEc1WUkP0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNl4o007703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:47 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0q030178;
	Tue, 25 Apr 2023 12:23:46 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 3/9] ti-sci-fw: Remove source package recipe
Date: Tue, 25 Apr 2023 12:23:39 -0500
Message-ID: <20230425172345.12293-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425172345.12293-1-afd@ti.com>
References: <20230425172345.12293-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 17:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16420

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


