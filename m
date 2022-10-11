Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF81C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 09:18:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.5272.1665479929076372700
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 02:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w9Rop/yz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29B9Ilhc095375
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665479927;
	bh=VsifuVVgEotaRdLlCgOe4kK+gWg9+yX+OcuTZRqurZI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=w9Rop/yz57GYP8+FhKDRyCLdbDzsE/GiPidO5hl6eYyW9d4hbpicWHM0YTkxsobGN
	 Abm3aEKbof6iql3LADq5arKeBsG+/GXCIZGuY18ELAlLSeuRsqY2Ra000gIXmIrGOT
	 5P/t85UkZAjv7K66enGSVzl2j+UTUUN6O3qbhWK0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29B9IlQk128994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:47 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 04:18:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 04:18:47 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29B9IdG7015392;
	Tue, 11 Oct 2022 04:18:45 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH 3/6] j784s4-hs: changes to support new
 hs platform
Date: Tue, 11 Oct 2022 14:48:36 +0530
Message-ID: <20221011091839.1337077-4-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011091839.1337077-1-m-chawdhry@ti.com>
References: <20221011091839.1337077-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 09:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15141

Changes to support new j784s4-hs platform in:

    1) ti-sci-fw_git: Update firmware prefix for j784s4-hs
    2) atf: sign the image
    4) optee: sign the image

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                       | 1 +
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++++
 recipes-security/optee/optee-os_%.bbappend                   | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 866cd7b2..1510e41c 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -36,6 +36,7 @@ SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
+SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
 
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 53e88d7e..e3c171dc 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -42,3 +42,7 @@ do_compile_append_j7200-hs-evm() {
 do_compile_append_j721s2-hs-evm() {
 	tfa_sign_k3hs
 }
+
+do_compile_append_j784s4-hs-evm() {
+	tfa_sign_k3hs
+}
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index e7de5157..a31e548c 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -10,6 +10,7 @@ EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEV
 EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
+EXTRA_OEMAKE_append_j784s4-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
 
 do_compile_prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
@@ -83,6 +84,10 @@ do_compile_append_j721s2-hs-evm() {
     optee_sign_k3hs
 }
 
+do_compile_append_j784s4-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_install_append_ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
-- 
2.34.1


