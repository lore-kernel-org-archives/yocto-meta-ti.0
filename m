Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4365AC7EE2F
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 15:42:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.719.1685461341445893669
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 08:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Mqd98EyC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UFgKQW109587;
	Tue, 30 May 2023 10:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685461340;
	bh=9yEHMX1UzveplYyrKUSCwL6SstdL5PmXlCk778+DCtk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Mqd98EyCoFNALyhx1Dh6rFGds2VMP25ejtIhh4KoyQ9d+qB3lRgkoI802Q6/ZMUFy
	 +mbLpY2ZzYql49ySm+snLy2bcmi6GIkpavRsxGnXK+psK5fzwDhFhY0uj3Uo+3wlo2
	 dltKJZaMeZarNQm5FCOjCbaR69T7p5+7x9YfwTq8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UFgKPv092671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 10:42:20 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 10:42:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 10:42:20 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UFgJDo089570;
	Tue, 30 May 2023 10:42:19 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] conf: machine: am62xx-lp: Default to HS-FS instead of GP
Date: Tue, 30 May 2023 10:42:18 -0500
Message-ID: <20230530154218.21641-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530154218.21641-1-afd@ti.com>
References: <20230530154218.21641-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 15:42:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16622

This matches how we had the symlink for tiboot3.bin before binman.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index d2064b27..aa9422cd 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -6,6 +6,6 @@ require conf/machine/include/k3r5.inc
 
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
+SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
-- 
2.39.2


