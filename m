Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.312.1626467517255200754
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 13:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=G7aBpUKd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16GKVumE106589;
	Fri, 16 Jul 2021 15:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626467516;
	bh=570sAGARyWQLiO8aSUTSOEzjwQTAoD3w4ZV2ljgR95I=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=G7aBpUKdU1n0ygLj96l/McufcVYOfSWENUNSXdplctSwcCq1EgDcC62Kv63LKATTg
	 Ed9usxHgEygNn38CyFCAcihHu8z7TX7PO17jImHfwNtr00ITFiNTi/9lJU3gwKOKt6
	 srYD6FZMo/Mx8Gf2y4xJPiz1vtU7+EZuEp57mxHs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16GKVt6l020556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jul 2021 15:31:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 15:31:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 15:31:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16GKVqL0109654;
	Fri, 16 Jul 2021 15:31:52 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 3/4] linux-ti-staging-rt: Update linux-rt srcrev to 08.00.00.003
Date: Fri, 16 Jul 2021 20:31:50 +0000
Message-ID: <20210716203151.3989-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716203151.3989-1-yogeshs@ti.com>
References: <20210716203151.3989-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux-rt to pick 08.00.00.003 tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 2f4817d5..f18e02cf 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "d238e71a2d3157a7faec48d4d3681b537a2e08cc"
+SRCREV = "bee192299392dc41c94f4603968b7a3c02f17a1d"
 PV = "5.10.41+git${SRCPV}"
-- 
2.17.1

