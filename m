Return-Path: <alessio.bogani@elettra.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3308EC433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 13:09:09 +0000 (UTC)
Received: from bacon.elettra.eu (bacon.elettra.eu [140.105.206.12])
 by mx.groups.io with SMTP id smtpd.web10.6867.1648645747610825651
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 06:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: elettra.eu, ip: 140.105.206.12, mailfrom: alessio.bogani@elettra.eu)
X-Envelope-From: <alessio.bogani@elettra.eu>
Received: from zmp.elettra.eu (zmp.elettra.trieste.it [140.105.206.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bacon.elettra.eu (Postfix) with ESMTPS id 5864F41D80
	for <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 15:08:59 +0200 (CEST)
Received: from zmp.elettra.eu (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTPS id 47691140180A;
	Wed, 30 Mar 2022 15:08:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTP id 35B41140180F;
	Wed, 30 Mar 2022 15:08:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zmp.elettra.eu
Received: from zmp.elettra.eu ([127.0.0.1])
	by localhost (zmp.elettra.eu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oeoZL8zQP61P; Wed, 30 Mar 2022 15:08:59 +0200 (CEST)
Received: from voltumna.elettra.trieste.it (voltumna.elettra.trieste.it
 [192.168.205.44])
	by zmp.elettra.eu (Postfix) with ESMTP id 1B06D140180A;
	Wed, 30 Mar 2022 15:08:59 +0200 (CEST)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: meta-ti@lists.yoctoproject.org
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [master][PATCH v2] ti-cgt-pru: Update to version 2.3.3
Date: Wed, 30 Mar 2022 15:08:56 +0200
Message-Id: <20220330130856.10404-1-alessio.bogani@elettra.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cdfe0adb-7e51-27b0-2193-8d9f4e2aaf5d@ti.com>
References: <cdfe0adb-7e51-27b0-2193-8d9f4e2aaf5d@ti.com>
X-elettra-Libra-ESVA-Information: Please contact elettra for more information
X-elettra-Libra-ESVA-ID: 5864F41D80.AC835
X-elettra-Libra-ESVA: No virus found
X-elettra-Libra-ESVA-From: alessio.bogani@elettra.eu
X-elettra-Libra-ESVA-Watermark: 1649250541.07855@2rDtyJ4OxE67kk4WSFsfAw
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 13:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14585

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 .../devtools/{ti-cgt-pru_2.3.2.bb => ti-cgt-pru_2.3.3.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-ti-extras/recipes-ti/devtools/{ti-cgt-pru_2.3.2.bb => ti-cgt-pru_2.3.3.bb} (82%)

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
similarity index 82%
rename from meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index 8b3e2a07..c96113fe 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -18,11 +18,11 @@ BINFILE_NAME:class-target = "cgt-pru-arm"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt-pru-x86.md5sum] = "270a0ecca383f66cad3a0e2a738c6ab0"
-SRC_URI[cgt-pru-x86.sha256sum] = "af1178a059d46d67d5672df053dd2fbebb0b89a513b17b8739dbe915b4a5d71a"
+SRC_URI[cgt-pru-x86.md5sum] = "abb76fac986993aafaf467915985ec4f"
+SRC_URI[cgt-pru-x86.sha256sum] = "1f1405167214f2c0ef848591b17a7799fdcd9f55f11bc90db9ace3490d426215"
 
-SRC_URI[cgt-pru-arm.md5sum] = "fbf10083af1b0e5d69b018126603bb58"
-SRC_URI[cgt-pru-arm.sha256sum] = "75ac84775a5624ea7e4fad4efc1acb7e869c79160550d48ba780068a3dce879c"
+SRC_URI[cgt-pru-arm.md5sum] = "648a6d7d8162fd6a89f381c7b974e6b0"
+SRC_URI[cgt-pru-arm.sha256sum] = "8390cb77b46b728ce2940595b81406f76d86dfed58c21258e3206a7c1232ccf2"
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
-- 
2.17.1


