Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E6AC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 10:32:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.39675.1674469970104122638
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 02:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lYZQTyBF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NAWkbg047392;
	Mon, 23 Jan 2023 04:32:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674469966;
	bh=8nzo97VXbEEQvUmYBkeEqiRx44W8+YRDy/FLpGQlDP0=;
	h=From:To:CC:Subject:Date;
	b=lYZQTyBF3hRmpJaXBEYMAXVDN5uWquhQAZpwY6BryD69ySXXcUPtmG022LUKa/73X
	 0T3c1dFHdhDfRV4lRs4r4t1vRRl+me0zH+khDoV48w9U4wTNLN8LnSwLkKck1Ju309
	 SOJ8A0SQP6muO1ShNj7WVNcJRKPqUdeJl/3n3OPQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NAWkDU021265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 04:32:46 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 04:32:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 04:32:45 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NAWiBb009803;
	Mon, 23 Jan 2023 04:32:45 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH] am62xx: Add support for AM62xx HS-SE evm
Date: Mon, 23 Jan 2023 16:02:42 +0530
Message-ID: <20230123103242.563286-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 10:32:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15620

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


