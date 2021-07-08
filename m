Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7903.1625721154890228394
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 22:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MMqyRV3N;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1685CXbR119073;
	Thu, 8 Jul 2021 00:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625721153;
	bh=6iVhafjj/ydcR35SJCbHfyzJhRoFz2gCITe5+uUsrXc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MMqyRV3N0RNp9G3hmBG7HklSBv93Wfh0K8cURyx258mh6OE144oKiq97Pt8UynnYD
	 CGDYjeDaUQPRijUYIRWpC4AV92MTxkVN9vO29mAn3Ioq86e24zKMtwUr0mBZTbCKUK
	 E6GxWtkJRMIfZ/+KWsAbDYBNQHeNTeGT07DJFPNI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1685CX8V106586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 00:12:33 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 00:12:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 00:12:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1685CWFQ041301;
	Thu, 8 Jul 2021 00:12:32 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 1/4] linux-ti-staging: Update to 08.00.00.002 release tag
Date: Thu, 8 Jul 2021 05:12:29 +0000
Message-ID: <20210708051232.10077-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708051232.10077-1-yogeshs@ti.com>
References: <20210708051232.10077-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update to 08.00.00.002 release tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index ff807108..59c9bba9 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
+SRCREV = "08058130545674a175939922532dc3ca76d8bbad"
 PV = "5.10.41+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

