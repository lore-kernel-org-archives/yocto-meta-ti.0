Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7901.1625721154879973906
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 22:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wGY0trv8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1685CXfv119077;
	Thu, 8 Jul 2021 00:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625721153;
	bh=0kBrvdvGhhPnL1RgWuLCB0tGZNkpzC+MoahLBtqJQPk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wGY0trv8SA56WKNRSI1hEA+QcTPQDhFW/17LV4ReqgAQxWZt02IAbPki48M9FlHEi
	 ie7mhXYJZlwU5A6tn7JvugMn3vwlyWmkyWjYSkmq651E8ZcBa8gNY5peDiUAax/R4d
	 LzfryqmQ2wTQ2jUAqom1F3txK+3GcNKilopsprVE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1685CXOX053324
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 00:12:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 00:12:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 00:12:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1685CWBW041304;
	Thu, 8 Jul 2021 00:12:32 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 2/4] linux-ti-staging-rt: Update to 08.00.00.002 release tag
Date: Thu, 8 Jul 2021 05:12:30 +0000
Message-ID: <20210708051232.10077-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708051232.10077-1-yogeshs@ti.com>
References: <20210708051232.10077-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update to 08.00.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 860c6331..2f4817d5 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "9ccce909e85889e5bcf7590cc1e57646b541a32d"
+SRCREV = "d238e71a2d3157a7faec48d4d3681b537a2e08cc"
 PV = "5.10.41+git${SRCPV}"
-- 
2.17.1

