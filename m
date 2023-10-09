Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C6BE95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 07:09:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.55620.1696835374220870048
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 00:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tlNYeIp4;
 spf=none, err=SPF record not found (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39979XYg078635
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 02:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696835373;
	bh=I9ZIVWzLZ6KSCzbyByBnuvA7Uss7AiWx7e5c38TYm74=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tlNYeIp4akBc0JLTKuXzKpqcnEpyoJTeP0QjEjuJrtW3B0/pf7wSqcwVecKxookKA
	 MwbXarbjmRZEZoTxxifLMw1Soy188MQ/AYI8dygIOqyoe0BHtccPlP4D6MhWuKmdTc
	 rF6vjnawmJk22gjb/iiytAhgcHJiTXnXR4mlqQho=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39979XmT070338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 02:09:33 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 02:09:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 02:09:33 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39979Q0f125024;
	Mon, 9 Oct 2023 02:09:31 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <srk@ti.com>, <r-gunasekaran@ti.com>
Subject: [kirkstone][PATCH v3 2/2] linux-ti-staging_6.1: Remove packaging of PRU-ICSSM firmwares
Date: Mon, 9 Oct 2023 12:39:26 +0530
Message-ID: <20231009070926.21629-3-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231009070926.21629-1-r-gunasekaran@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 07:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17074

Support for PRU-ICSSM driver is not available in linux
kernel version 6.1. So do not package the firmwares in the SDK.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 60c03e1d..5a13fa94 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -9,6 +9,7 @@ inherit kernel
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
+require recipes-kernel/linux/prueth-fw.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
-- 
2.17.1


