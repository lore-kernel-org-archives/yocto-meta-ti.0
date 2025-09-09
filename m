Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21618CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 15:10:31 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.834.1757430630732153624
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 08:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CKFlpizl;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589FASpY4051795;
	Tue, 9 Sep 2025 10:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757430628;
	bh=8xwzhm6nn+nN75y/hhOJWrrBDSMgGi5lcd1TyBynuMI=;
	h=From:To:CC:Subject:Date;
	b=CKFlpizl20Mt9sqwF2tiTPdNOO9mjHtOEY7lOz5kldxjI3sMJww7MWxyrBEf1UYLC
	 kNCqzz1NUiZGlpLvqNxAQysVTeVB6fttrZ483H1qXwobc23vKQaMZsXrmZ+KseGfbf
	 yfm+t7EfTnhc8PqoFtncrE9Z7W6d66pgg97ufLNU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589FASdV3796167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 10:10:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 10:10:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 10:10:28 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589FASUg2825029;
	Tue, 9 Sep 2025 10:10:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][RFC 1/6] ti-sgx-ddk-um: UM side driver depends on KM side driver
Date: Tue, 9 Sep 2025 10:10:23 -0500
Message-ID: <20250909151028.272925-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Sep 2025 15:10:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18984

This also matches what is done for ti-img-rogue-umlibs.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb              | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index b260abdf..b6f5534e 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -40,9 +40,7 @@ TARGET_PRODUCT:ti43x = "ti437x_linux"
 TARGET_PRODUCT:omap-a15 = "ti572x_linux"
 TARGET_PRODUCT:am65xx = "ti654x_linux"
 
-RDEPENDS:${PN} += "libdrm"
-
-RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
+RDEPENDS:${PN} += "libdrm ti-sgx-ddk-km"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


