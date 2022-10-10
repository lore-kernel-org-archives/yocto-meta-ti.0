Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECAAC43217
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:31:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.7632.1665415862183962286
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hKS6khSP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV1Ag038657
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665415861;
	bh=etpjdDK1HBROjRbQtOqZLujDjkqajTMDnz+X1Y0r3dM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hKS6khSPcUM6/89pUtX+ES/rnJqcuGnQGPsBW13npG7E1bv9UppRziHpTR1aCdiC2
	 IWTmyBcc2Z3xs7eABmq7bgh2ilWsa5/ZBNMBAH9ZusjeMG8jxh72qkA5F3LNPOP3LU
	 oCUR97A3hSoh0FOGNzyDCVE7pAPSOGAu0M+i2pcg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AFV1G9093112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:01 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 10:31:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 10:31:01 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV0GQ020020;
	Mon, 10 Oct 2022 10:31:00 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH v2 1/4] optee-os: Update SRCREV for OP-TEE
 TRNG in J784S4
Date: Mon, 10 Oct 2022 21:00:55 +0530
Message-ID: <20221010153058.28310-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010153058.28310-1-j-choudhary@ti.com>
References: <20221010153058.28310-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 15:31:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15127

Update the SRCREV to the commit when sa3ul support was
added in upstream OP-TEE for J784S4 platform to access rng.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index e7de5157..ff639baa 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,5 +1,5 @@
 PV_ti-soc = "3.18.0+git${SRCPV}"
-SRCREV_ti-soc = "8e155bae3a5eb9d1a3ed9260bd7281a7a35f5086"
+SRCREV_ti-soc = "6bf4a81a8f5388e6cb6b1d7e8ebe57c5089c0954"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.17.1


