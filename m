Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.11807.1603108600166441129
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 04:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Jku39Jin;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JBucB2000583
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603108598;
	bh=GzpuP9lmbgHNewz+acOUEg++R8gs2wiyKUa1UDxhdoA=;
	h=From:To:CC:Subject:Date;
	b=Jku39Jin4P+oRN0/MEfzQgymwZcF1uatVJINGI1HNzlzoMsYJE2GfG1QvB20CLvOd
	 JhH8W9AurOKTQs764u7hLyjCeAQIUMlFDH6xs0ZDG4zamJoqjQTJ6JjV780iF6TNeK
	 76lwqhNEcV8LF2cOhq+LmZF9MtbtaWO2NOZkzYgw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JBucFa069470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:56:38 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 06:56:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 06:56:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JBubkS059537;
	Mon, 19 Oct 2020 06:56:38 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <s-anna@ti.com>, <d-gerlach@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] u-boot-ti-staging: Update to latest SHA
Date: Mon, 19 Oct 2020 06:56:37 -0500
Message-ID: <20201019115637.1047-1-dmurphy@ti.com>
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
index 5b09cb579eff..25e19092a00b 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r18"
+PR = "r19"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "eea73800730b3d9125f5c12a629db2f88e566b71"
+SRCREV = "6cd79efcfdcf482549dafe775b259924baa2c995"
-- 
2.28.0.585.ge1cfff676549

