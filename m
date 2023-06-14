Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22248EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:33:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13955.1686753191758629748
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 07:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RjWO5iIQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EEXAOj020752;
	Wed, 14 Jun 2023 09:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686753190;
	bh=XbQGGaqaOcaphTsoVllKo4U4HNB5odMh6lDgc8C5zfM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RjWO5iIQzKawo7gkWGcqU6TQtA8pvuaN4BQrtW8oCnhy5OV6AlvnOu7dpudh+Z+Cw
	 XHLCkgYJmI+2+uNujqutY/Ma1n8cVDipMKQMKTzMv4i6Fz1z96Y+PfHqYTrqst6Flf
	 Gf/iK6wAfSqQe6nlf/j/GBTqJyyeLQtnPd9/e+6c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EEXAvi084873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 09:33:10 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 09:33:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 09:33:10 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EEX9qL071871;
	Wed, 14 Jun 2023 09:33:09 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>, <devarsht@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH v2 2/2] conf: machine: am62xx: Add TI logo as image boot file
Date: Wed, 14 Jun 2023 20:03:06 +0530
Message-ID: <20230614143306.1502763-3-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230614143306.1502763-1-devarsht@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 14:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16720

Add TI logo bitmap image as image boot file so that it gets
copied to boot partition and A53 SPL or U-boot proper
can load it and display during board bootup.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: Rename ti logo bitmap image as per suggested changes (same is being
done in ti-u-boot repo)
---
 meta-ti-bsp/conf/machine/include/am62xx.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 0bd5279d..a0ec944f 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -15,6 +15,9 @@ IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
 IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
 
+# Bitmap image tarball for early splashscreen
+IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
+
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-- 
2.34.1


