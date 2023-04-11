Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C673C77B70
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 17:40:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.21259.1681234841770474908
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 10:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LmtCf80y;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BHeejh081741;
	Tue, 11 Apr 2023 12:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681234840;
	bh=xni85s1QSkVvGFQ43yp6/JhlOtYcEfmktxJMWjA+mKo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LmtCf80yOzAx/yGJeC1rjSFIfWpqFidEYiXvYt5z8NgiKKICOb+WE57ti6SnD+BtW
	 XnyAWkHuRUWCnrLRBE7NtmJlc5djzp13ZYqbE4qiTNwpSiEX4BkRgdXkxmJnIWnJwR
	 TQhXcsHhKtTn/jMSJ/w3DbCuxyu9+wC7GyyOA38E=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BHeeni124285
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 12:40:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 12:40:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 12:40:39 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BHebbt083128;
	Tue, 11 Apr 2023 12:40:39 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 5/5] linux-ti-next: Remove unneeded do_compile append
Date: Tue, 11 Apr 2023 12:40:37 -0500
Message-ID: <20230411174037.32244-5-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16350

Was used to build kernel DTBs prior to KERNEL_DEVICETREE getting populated
with the list of preset of upstream DTBs. Not needed anymore so remove.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index 62831c9c..1e86ed97 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -23,7 +23,3 @@ DEFCONFIG_NAME = "multi_v7_defconfig"
 DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
 DEFCONFIG_NAME:k3 = "defconfig"
 KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
-
-kernel_do_compile:append() {
-	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-}
-- 
2.39.2


