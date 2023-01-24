Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D22C38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 05:17:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.8647.1674537443769970939
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 21:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Jyz1YeHL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30O5HLAB008572;
	Mon, 23 Jan 2023 23:17:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674537441;
	bh=8nzo97VXbEEQvUmYBkeEqiRx44W8+YRDy/FLpGQlDP0=;
	h=From:To:CC:Subject:Date;
	b=Jyz1YeHL6R/gspdD3Ei4as9V2VFoE6V8vkrzNsZER/yYCtoWCi8gfvu2FGieUgoeu
	 8QUR8i0jDFNk7I+LTxE9usiYbqlbCV5gmVoDj3b/KVnVHtPuno9tGbNisiHiZlnDE+
	 UeHPQKqS0AmFxAkK2WMXIQfus8FfVMUk5y2PQODc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30O5HLaS125063
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 23:17:21 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 23:17:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 23:17:20 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30O5HJmX110854;
	Mon, 23 Jan 2023 23:17:20 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH v2 2/2] am62xx-evm: Add support for AM62xx HS-SE evm
Date: Tue, 24 Jan 2023 10:47:17 +0530
Message-ID: <20230124051717.1201571-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Jan 2023 05:17:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15639

- Add ti-sci-firmware overrides.
- Add support to sign ATF and OPTEE.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                       | 3 ++-
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++++
 recipes-security/optee/optee-os_%.bbappend                   | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 0fb3a832..7896c366 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -37,7 +37,8 @@ SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
 SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
+SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
+SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
 SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index a5eb9ff8..920cb737 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -31,6 +31,10 @@ do_compile_append_am64xx-evm() {
 	tfa_sign_k3hs
 }
 
+do_compile_append_am62xx-evm() {
+        tfa_sign_k3hs
+}
+
 do_compile_append_am62xx-lp-evm() {
         tfa_sign_k3hs
 }
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 83eb9c6a..91abbcee 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -72,6 +72,10 @@ do_compile_append_am64xx-evm() {
     optee_sign_k3hs
 }
 
+do_compile_append_am62xx-evm() {
+    optee_sign_k3hs
+}
+
 do_compile_append_am62xx-lp-evm() {
     optee_sign_k3hs
 }
-- 
2.34.1


