Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.13222.1603292547715890799
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 08:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uHPCmxYU;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6886B38C11C0
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 08:02:17 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LF2GDL108897
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603292536;
	bh=5CqliAQy7yzK6cG8kruJgdx1R6G9UFals7/7AM4ELZg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uHPCmxYUUiuDmIyg4ONcGV30w3cVvZLRVfBi0o5VModsEAjI7B7UyJz7achhcl5C2
	 2qTzTNenBUYswmF/3otQf6suYGRtsE3DE04TbQDK6216XkVgBq5lRz6N3/nIRCmevG
	 bbqi70TBpsvkU95N5c6268BCTw969Yl2+/MiE7fU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LF2GRI072983
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:02:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 10:02:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 10:02:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LF2FYf102751;
	Wed, 21 Oct 2020 10:02:16 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>
CC: <s-anna@ti.com>, <praneeth@ti.com>, <meta-ti@yoctoproject.org>,
        Dan Murphy
	<dmurphy@ti.com>
Subject: [PATCH 3/3] u-boot-ti-staging: Update to latest HEAD for j7 build
Date: Wed, 21 Oct 2020 10:02:10 -0500
Message-ID: <20201021150210.29966-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021150210.29966-1-dmurphy@ti.com>
References: <20201021150210.29966-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 5b09cb579eff..dd213d5d670d 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r18"
+PR = "r19"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "eea73800730b3d9125f5c12a629db2f88e566b71"
+SRCREV = "bf0a77ee8e102e921c8f08f8e919a45ffb270ebe"
-- 
2.17.1

