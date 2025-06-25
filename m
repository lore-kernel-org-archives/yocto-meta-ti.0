Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EEBC7EE3A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 17:17:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.21730.1750871835944296186
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 10:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j9v9it5g;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PHHFP52239274
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750871835;
	bh=LpUw1JHsgOY7Covh+NY1QvVdITDtGzhGRKkT+BWKKww=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j9v9it5gYPPwZwNBaVhGLbYrGmBdsykVrroYNHEkVD5gwTYQuKl98xUnveyrx/jky
	 TOWpSfi87kMKq4oM3e9G3VDQzhJ2Lj8VU0mmwZWwfhctZxSjJdIL5JfGhLa3E0N+X+
	 YDPY8YrGSQ6OX5qtj2SUd4pSZf/Vl2VIAX8QuhTU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PHHFWc1454641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 12:17:15 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 12:17:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 12:17:14 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PHHEwb4012715;
	Wed, 25 Jun 2025 12:17:14 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1 3/4] meta-ti-bsp: optee: add build flags for am62xxsip-evm
Date: Wed, 25 Jun 2025 22:46:23 +0530
Message-ID: <20250625171626.2863841-4-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625171626.2863841-1-anshuld@ti.com>
References: <20250625171626.2863841-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 17:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18673

Due to 512MiB DDR limitation of am62x SiP, the memory map has
beenmodified with OP-TEE moved to bottom of DDR after atf to
0x80080000,this requires modifications to OPTEE's CFG_TZDRAM_START.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index d1de4368..e5c3af63 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -11,6 +11,7 @@ EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62xxsip-evm:bsp-ti-6_12 = " CFG_TZDRAM_START=0x80080000"
 
 do_compile:append:k3() {
     cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
-- 
2.49.0


