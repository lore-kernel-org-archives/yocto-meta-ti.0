Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.174.1635799595006705590
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 13:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JY85oHf5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A1KkXHe051119;
	Mon, 1 Nov 2021 15:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635799593;
	bh=3AtZOyfdx6Isxfpn6JgXj3uH7Yw4dPgBWuwugULaXGs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JY85oHf5nSlU7XSOfbW9F416xrv3kLkMsvLWjMV15FK2EuU5tCot4C26rzCyd+7Qu
	 YcK8dRPuL4W5FE91Y5+7dLU2Q53wcgAl42R3DEE7yEE5tZzi/T8qSoBxnUUo1jbKm4
	 pMciREqnvliusq6pjuz3JFkyhmXbelqdeTw5flKE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A1KkX1f088273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Nov 2021 15:46:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Nov 2021 15:45:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Nov 2021 15:45:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A1Kj5n6054717;
	Mon, 1 Nov 2021 15:45:05 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] linux-ti-staging-rt: Bump linux rt version for 08.01.00.002 release
Date: Mon, 1 Nov 2021 20:45:05 +0000
Message-ID: <20211101204505.32309-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211101204505.32309-1-yogeshs@ti.com>
References: <20211101204505.32309-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump linux rt version for 08.01.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 166f40da..3cb7bc24 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "b9f28fcb222bc4508077366b05ad5d44984087b0"
+SRCREV = "a5427455c650cb9d33e3d5f0b009a773370a5428"
 PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

