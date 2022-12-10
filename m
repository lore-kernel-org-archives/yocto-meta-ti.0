Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBA4C4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 07:57:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10618.1670659046399055262
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 23:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=j/NXTN6D;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: kamlesh@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BA7vPZ8087810
	for <meta-ti@lists.yoctoproject.org>; Sat, 10 Dec 2022 01:57:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670659045;
	bh=DadT8+FQPDRgP7nXFOcaOyA8OJSPHLP7mf2Z2CZf/dk=;
	h=From:To:CC:Subject:Date;
	b=j/NXTN6DBy2l2AxaAnzMwD5777ub0pVqEHeNIaiZsCFr9sr6vgLFvSv0zg1mJFzYP
	 MOffrytZxL1NVHCAivkvJqIsE7x6KRY/QWruom1/9OG5MTcCZI0zdYzClBkN1cq0Ap
	 8KZ7B46Hrckg21gfMpsFriZeFD8qQCIpP0EBe7RE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BA7vPuJ037232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 10 Dec 2022 01:57:25 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 10
 Dec 2022 01:57:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 10 Dec 2022 01:57:25 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BA7vOU2000573;
	Sat, 10 Dec 2022 01:57:25 -0600
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Kamlesh Gurudasani <kamlesh@ti.com>
Subject: [meta-ti][dunfell][PATCH] optee-os: Revert to lower log level for AM62x
Date: Sat, 10 Dec 2022 13:27:06 +0530
Message-ID: <20221210075706.22278-1-kamlesh@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 10 Dec 2022 07:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15440

While removing SOFTWARE_PRNG support
commit:98506a4a07363a1b57012ccfaee263f47e5b46c4,
accidently removed the changes applied
by commit:27641e1f2d7f6696fd7bbd8f24fcac20766b6234
(optee-os: Lower log level for AM62x).

Reverting those changes back

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 751dc3d0..6ea0773f 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -6,6 +6,9 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
+EXTRA_OEMAKE_append_am62xx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
+
 do_compile_prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 }
-- 
2.17.1


