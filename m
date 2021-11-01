Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.149.1635799507495639230
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 13:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NN6dO6yb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A1Kj5Ib084806;
	Mon, 1 Nov 2021 15:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635799505;
	bh=JGoNp3rPVJhXLKitwBGSbEU5ZiWnqlSG3R9qMzFNZv8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NN6dO6ybch4mVALfN+GtfKriLJr5elaKkh6icWpHHwo43pVEy5DCFEpEv+X/pwDAF
	 SQAi86uE+TxCJWEjRf7B4Qq8Jrfl4WJR5DO2j0HhS4EuaH0rfuDRTnsoay40qnR6No
	 Dq992r03QvlE9DkyaRYcQTmZiV9QNSoWJRbt6C80=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A1Kj58D046920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Nov 2021 15:45:05 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Nov 2021 15:45:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Nov 2021 15:45:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A1Kj5wJ061079;
	Mon, 1 Nov 2021 15:45:05 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] linux-ti-staging: Bump linux version for 08.01.00.002
Date: Mon, 1 Nov 2021 20:45:04 +0000
Message-ID: <20211101204505.32309-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211101204505.32309-1-yogeshs@ti.com>
References: <20211101204505.32309-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump linux version for 08.01.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index d620b022..6b61d9d0 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "f22103162c771ddd47372b579682445e6dc8dd0e"
+SRCREV = "33574931b48f50c37abb58e0a9c617cbec472b01"
 PV = "5.10.65+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

