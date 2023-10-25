Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72023C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:57:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.178854.1698253010456017661
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 09:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gdy2TBog;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PGun6Z048029;
	Wed, 25 Oct 2023 11:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698253009;
	bh=AbS27INcP1cfNFkA7FkAZGENJGg9tGrazA2H0Zeze3I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gdy2TBog1hPLYlursio/tHBlHZcm2mmhwz9qEDVclFEoLMteucKJmiT3qsVA7zRAe
	 0uCTgTpCUjq5bU8jOuwy8vtQxLRRcA4cK6tPXqAjmbdagJgqlTVuGczbPmUdJz2Ruf
	 SH3yIBAFIu75VeDD8fJu71PoF7KfE6xnCpNgSecM=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PGumg9031361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 11:56:49 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 11:56:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 11:56:48 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuVES008415;
	Wed, 25 Oct 2023 11:56:33 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 5/8] vpdma-fw: This firmware blob does not depend on the kernel
Date: Wed, 25 Oct 2023 11:56:27 -0500
Message-ID: <20231025165630.2274889-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025165630.2274889-1-afd@ti.com>
References: <20231025165630.2274889-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Oct 2023 16:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17192

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
index 673634da..2452d111 100644
--- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
+++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS += "virtual/kernel"
-
 SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=http;name=dra7xx-evm"
 SRC_URI[dra7xx-evm.md5sum] = "80176df1350c21d9efa90171789c546e"
 SRC_URI[dra7xx-evm.sha256sum] = "a0b254ffd0c7f481cb3989e632088f5e4a233c73a1c676faa3061721ea60dc90"
-- 
2.39.2


