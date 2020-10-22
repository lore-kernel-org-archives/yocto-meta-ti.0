Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.706.1603381725857774628
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2020 08:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pFcIHs9Y;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MFmj30046000
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2020 10:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603381725;
	bh=cbiYWIwycFwZ8Q02QgUDODh/IWZtBtc5ryxXQi93SP0=;
	h=From:To:CC:Subject:Date;
	b=pFcIHs9YjxBPME9TWuhLg+OKNY6RhrYj1LpnNQGSi20psj154bJ6iTeAimVvKRTft
	 MxdTICOpW/PWned8tlknhSv2FhqbUyh3v3MCAsafVRWtxUUOobgi8H8dM2wIqdhDlz
	 CU5eV8NzvLF1CcbZBKPAwviPVmfi5EMipNucjqaY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MFmjja087773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2020 10:48:45 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 22
 Oct 2020 10:48:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 22 Oct 2020 10:48:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MFmivO043613;
	Thu, 22 Oct 2020 10:48:44 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] u-boot-ti-staging: Update to latest HEAD for bug fix
Date: Thu, 22 Oct 2020 10:48:44 -0500
Message-ID: <20201022154844.3478-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index dd213d5d670d..3956a3092679 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r19"
+PR = "r20"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "bf0a77ee8e102e921c8f08f8e919a45ffb270ebe"
+SRCREV = "31c183d1c46b69a2f1e5dc1cc2173b8ce82a3ed9"
-- 
2.28.0.585.ge1cfff676549

