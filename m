Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75668C02199
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:12:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.9866.1738753944550373563
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 03:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hxLroUcA;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCMta3410966
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 05:12:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738753942;
	bh=99nDSUBC6c7rcOw7uin3TBXielRzj4QB0bxXCOyLRFc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hxLroUcAn67kAUTe1iXWVgXVftAeZFtwYadeIWGxnlq0xpbaXOL5tCMMaC/gP3L+S
	 ho7u1L12S/eeTrZI4fDoXqGtBJXnaRrq47Rsy1aUM2H+NT23Y/khzOMnecV6nWeyVs
	 r/Z9zTYa/h6ZCbuxC4QqkBjq/HMZqmIj7LyctLB4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCMwQ003769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 05:12:22 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:12:21 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:12:21 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BCKCY012661;
	Wed, 5 Feb 2025 05:12:21 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 1/5] recipes-security: optee: Update to v4.5.0+
Date: Wed, 5 Feb 2025 16:42:07 +0530
Message-ID: <20250205111211.1847450-2-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205111211.1847450-1-c-shilwant@ti.com>
References: <20250205111211.1847450-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 11:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18273

Bump up SRCREV of optee-os to ef1ebdc23034a804a72da2207f1a825ce96a1464

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 0fab9c9a..89f7f818 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV = "4.4.0+git"
-SRCREV = "8f645256efc0dc66bd5c118778b0b50c44469ae1"
+PV = "4.5.0+git"
+SRCREV = "ef1ebdc23034a804a72da2207f1a825ce96a1464"
 
 SRC_URI:remove = " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
-- 
2.34.1


