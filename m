Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2931.1626986588622915417
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 13:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l4xcF76b;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh78A114016;
	Thu, 22 Jul 2021 15:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626986587;
	bh=lGtkMp94vA7bycLyoWYQ1QUMsUDItU5O8WX2g9faecU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=l4xcF76bHlqQgZ5XW1FbnqqqIrl91KScrDZnatiaWJK/UAwWHSmSFSCrVH6myrl9t
	 wdZioBhD11cVhMJl8t5z3T0HxRSy0JS8YS+rKubFwyWOj36E2Pw8XT7dGuIogxJ3pU
	 Iozpdem5BaACO43kIl4VnFO/VX7eksX2qP6UY6Zw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16MKh7co117570
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jul 2021 15:43:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Jul 2021 15:43:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Jul 2021 15:43:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh661123706;
	Thu, 22 Jul 2021 15:43:06 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 2/3] linux-ti-staging: Update linux to 08.00.00.004 release
Date: Thu, 22 Jul 2021 20:43:05 +0000
Message-ID: <20210722204306.37166-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210722204306.37166-1-yogeshs@ti.com>
References: <20210722204306.37166-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to pick the 08.00.00.004 release tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index a75fd50a..27dc4113 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "4d2f380d7b799fca168f0474531a4efe59cec426"
+SRCREV = "4c2eade9f722838b0e457650368cba1c6c7483c2"
 PV = "5.10.41+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

