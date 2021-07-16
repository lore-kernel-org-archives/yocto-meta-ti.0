Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.292.1626467516908380593
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 13:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DscZzBqK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16GKVujX044802;
	Fri, 16 Jul 2021 15:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626467516;
	bh=DiIFk5vPvPdd7/DIg97RYpxOjWPmtfMxdPPfaUJcE4M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DscZzBqKQzxK+6NP/VH8EzUUOyd/ODegzHzt3g1pEfMxKT7JkKHLangxfEveP8T9O
	 PItYCY91nZ4ycAXUY3sfPRerb2DylD45b7c4OfsXQJov9hN7X/cvNJziIW0gOmelgX
	 ymTkpSujzOM4GAiyMVt38izB0nwIGuCzZ0kvL500=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16GKVtOK020562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jul 2021 15:31:56 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 15:31:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 15:31:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16GKVq2g026539;
	Fri, 16 Jul 2021 15:31:52 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 4/4] ti-sci-fw: Update ti-linux-firmware srcrev to 08.00.00.003
Date: Fri, 16 Jul 2021 20:31:51 +0000
Message-ID: <20210716203151.3989-5-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716203151.3989-1-yogeshs@ti.com>
References: <20210716203151.3989-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update ti-linux-firmware to pick 08.00.00.003

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index acd5ce8f..f3b59222 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2021.05"
 
-SRCREV = "b280fb4da1a200489b7bc5c1a23f74dd065a6f30"
+SRCREV = "b4a3051362f371c8b6f40a33eca258ef1832bec1"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
 SRCREV_FORMAT = "imggen"
-- 
2.17.1

