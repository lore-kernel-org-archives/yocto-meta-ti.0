Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53E2C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:21:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.1433.1667812858149950070
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 01:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t6B0fjFk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A79Kvn9127382
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 03:20:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667812857;
	bh=PpRXGzqv7LScp2ltjSEOnwTagKD7Ex+2L7s1S6nvtuY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t6B0fjFkkJKu2RLN1j2EdBO1sdJ66n6mWLVA/r6saHdeLF9yZTx76/CAuI6yTWSrr
	 3NHJqe2DnfkmGcW2xi8MtyhLS0EbWn+rnNx8oBPjPvbxKSA15Gh+ReswyT0EXQ7MZv
	 aLTlaQZ+FvfefLsSCtrP/xe26197mGmcLjmejZeM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A79Kv0A059588
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 03:20:57 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 7 Nov
 2022 03:20:57 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 7 Nov 2022 03:20:57 -0600
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A79KnXL049504;
	Mon, 7 Nov 2022 03:20:55 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][dunfell][PATCH v4 3/6] j784s4-hs: changes to support new hs platform
Date: Mon, 7 Nov 2022 14:50:45 +0530
Message-ID: <20221107092048.555881-4-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107092048.555881-1-m-chawdhry@ti.com>
References: <20221107092048.555881-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 09:21:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15327

Changes to support new j784s4-hs platform in:

    1) ti-sci-fw_git: Update firmware prefix for j784s4-hs
    2) atf: sign the image
    4) optee: sign the image

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                       | 1 +
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++++
 recipes-security/optee/optee-os_%.bbappend                   | 4 ++++
 3 files changed, 9 insertions(+)

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
index 4a4ebfd7..2b591d58 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -81,6 +81,10 @@ do_compile_append_j721s2-hs-evm() {
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


