Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7904.1625721154960823164
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 22:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PNt7GPHJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1685CXFK119081;
	Thu, 8 Jul 2021 00:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625721153;
	bh=670lw+dK5FWMvuL6/EJ5DHC43v6/bz/FVcEDCMkqJkQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PNt7GPHJdqgYYRJgqEsE96xSEgdmJqd3/3i/7kQi2r75D6Cx2HZlv0lGH+Lq28L4H
	 5JhBYgFQTnRLm89+7AXCyjL8vBsxZpe9pNyeX69xwBUJpnoUILwTe5xS1iPac09kE+
	 lsoe1Uo0y3Prz89fatPjP7KJ1QstsCfeCqFgVzqU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1685CX7G106589
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 00:12:33 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 00:12:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 00:12:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1685CXQN073175;
	Thu, 8 Jul 2021 00:12:33 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 4/4] ti-sci-fw: Update linux firmware repo to 08.00.00.002
Date: Thu, 8 Jul 2021 05:12:32 +0000
Message-ID: <20210708051232.10077-5-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708051232.10077-1-yogeshs@ti.com>
References: <20210708051232.10077-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update linux firmware repo to 08.00.00.002

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 96604282..acd5ce8f 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2021.05"
 
-SRCREV = "1e73d9387980f4d425742738968e55395c19e26c"
+SRCREV = "b280fb4da1a200489b7bc5c1a23f74dd065a6f30"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
 SRCREV_FORMAT = "imggen"
-- 
2.17.1

