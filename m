Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39707C77B76
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 17:40:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.21124.1681234841267777404
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 10:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ylkrVtTk;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BHedh3081737;
	Tue, 11 Apr 2023 12:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681234839;
	bh=wEG3S2x6kYXdmGZnFrtLAwOMb5uEOKC1qFQ9b984+Q0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ylkrVtTkSHQyGnzJF/lA+CM1qMUF8/Us60Yqclz7UiqBTgl3deBHV4vUc/T3Yku3B
	 3cdD4FQld9XCf1K25h9afCd141Y/moulDGb1fp6f8dAM+lMPoTscNx+tD+NFiFb2ep
	 F41iAr/GbObyUqkTM58t+/U5cpxkPALvTrf4GXdQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BHedMp124260
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 12:40:39 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 12:40:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 12:40:39 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BHebbr083128;
	Tue, 11 Apr 2023 12:40:38 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 3/5] linux-ti-mainline: Update to v6.2 mainline version
Date: Tue, 11 Apr 2023 12:40:35 -0500
Message-ID: <20230411174037.32244-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411174037.32244-1-afd@ti.com>
References: <20230411174037.32244-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 17:40:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16348

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index d0f1b4e2..294cbef1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -15,9 +15,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 
 S = "${WORKDIR}/git"
 
-# 5.15 Mainline version
-SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
-PV = "5.15+git${SRCPV}"
+# 6.2 Mainline version
+SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
+PV = "6.2+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
-- 
2.39.2


