Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1436.1624926380910630343
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 17:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FWYZkYby;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QJ9X027998;
	Mon, 28 Jun 2021 19:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624926379;
	bh=Wcig7c6EK2E9t3/G2pfGyfI9zXSPzamsYXUdKYVOJ4I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FWYZkYbyqrLpI6CGbsuiwCMNi3EbCyaxpIynJOwiAjqhy1XIiw49czr7dLP1dQVQP
	 XzHDjNfu+ctBevqnoVHUX5VZpELO4gjLoakOuiKcjmQ5/z1CRlAtESSsQ5S1zcDSc9
	 r+WsHg4w6CQf9tYJ7ebbLp4Vyu7p/6PVBIU++6sw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T0QJsE064410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 19:26:19 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 19:26:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 19:26:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QJ7o063051;
	Mon, 28 Jun 2021 19:26:19 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 3/4] linux-ti-staging-rt: Update to 08.00.00.001 release tag
Date: Tue, 29 Jun 2021 00:26:17 +0000
Message-ID: <20210629002618.29822-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629002618.29822-1-yogeshs@ti.com>
References: <20210629002618.29822-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index a8516ae1..860c6331 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "06894f664e012a2df68e6fc28169d21042bb134a"
+SRCREV = "9ccce909e85889e5bcf7590cc1e57646b541a32d"
 PV = "5.10.41+git${SRCPV}"
-- 
2.17.1

