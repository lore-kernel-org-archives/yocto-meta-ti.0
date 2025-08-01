Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4AEC87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:44:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.80464.1754023490029695157
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 21:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VpvxApau;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5714indB3191697;
	Thu, 31 Jul 2025 23:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754023489;
	bh=88CtNGSBApAACxl0UDIFjlzN+Kwb2mEv/gk0npyeQ6Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VpvxApauXQ2N/vqFHovER61s00a1161wRq5jfC6hLCkqGGJFl5UuWT2AOcQ/azVGB
	 eChx2O9gBCsrqNGgoQK/LFVl+ZAQ8N+Aghtcjre0J12K51FVtzXIMNCeXGE8kqHS6n
	 KhPG8XR2cVWnZk+mRcBfEOOy+3aRr0q/vtOhxRwk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5714in9m520290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 23:44:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 23:44:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 23:44:48 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5714if0J3708319;
	Thu, 31 Jul 2025 23:44:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 2/2] ti-pka-fw: Update license to PKA-FW
Date: Fri, 1 Aug 2025 10:14:41 +0530
Message-ID: <20250801044441.1059527-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801044441.1059527-1-b-padhi@ti.com>
References: <20250801044441.1059527-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 04:44:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18866

The PKA-FW license has been added to meta-ti. Point to that license in
the PKA firmware recipe.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
index 49ae0251..bd31726c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "PKA prebuilt binary firmware image"
 
-LICENSE = "TI-TFL & INSIDE Secure"
-LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
+LICENSE = "PKA-FW"
+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/PKA-FW;md5=251316268d8e7d1a546e5e6a08af6d9c"
 
 COMPATIBLE_MACHINE = "k3"
 
-- 
2.34.1


