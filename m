Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2868.1626986588725637417
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 13:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y7o5NBVd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh7We067237;
	Thu, 22 Jul 2021 15:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626986587;
	bh=uUG1CRAd4J3RoVdN6QhPrnXZIoxQdgoedawibSAL7q4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Y7o5NBVd9C2XR9RHUSLKJuEVWcboaPjws1QOJ5YoEpS8Bo9q7vr4HVQDA3tjTsncc
	 DyZSUJJnsP9ehnD8RGIRqh9NMe92zZFI28zmwz7+IHD7nJJZM9VFP1tgQPX7a0Wrlk
	 k6n8S3yewLkEOnsoSZTfNIOyqUN3bRGatTSX/JJM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16MKh7Je070331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jul 2021 15:43:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Jul 2021 15:43:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Jul 2021 15:43:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh7fO114543;
	Thu, 22 Jul 2021 15:43:07 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 3/3] linux-ti-staging-rt: Update linux rt to 08.00.00.004 release
Date: Thu, 22 Jul 2021 20:43:06 +0000
Message-ID: <20210722204306.37166-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210722204306.37166-1-yogeshs@ti.com>
References: <20210722204306.37166-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to pick 08.00.00.004 release tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index f18e02cf..f039d6c2 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "bee192299392dc41c94f4603968b7a3c02f17a1d"
+SRCREV = "0701a5b58c943909a38be9df38a3b4bdd8234340"
 PV = "5.10.41+git${SRCPV}"
-- 
2.17.1

