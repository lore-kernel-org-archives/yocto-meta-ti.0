Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.9478.1634649137204087083
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 06:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vv/tvhg3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19JDCFUl099914;
	Tue, 19 Oct 2021 08:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634649135;
	bh=BRAHSdeSzmJ1fgZFA7vqo5lzOn3fZQDFgb1ANMRHbKQ=;
	h=From:To:Subject:Date;
	b=vv/tvhg3LTaY4GcdzyIVkqCx6VJEhb0DI22qvkb4K6pdvhQeNVedinf8282XXCaUS
	 2Tk+2EAUfHpu+xlXmRcY+n8matBx/ocX+66+aT6mL7KVkj117AUARUhzswaG02bXzL
	 n9UxA5qSfczqWbfOTlB1lL4gUVEH8iDH6tfgfk18=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19JDCF7F025399
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 08:12:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 08:12:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 08:12:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19JDCFK6068288;
	Tue, 19 Oct 2021 08:12:15 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH] ti-linux-fw: Support common inc for all firmware
Date: Tue, 19 Oct 2021 13:12:15 +0000
Message-ID: <20211019131215.43797-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Change to support common INC for all firmware
This will help with:
1) Eliminating requirement to change multiple recipes for firmware
update
2) This will help support AUTOREV

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 .../{ti-sci-fw/ti-sci-fw.inc => ti-linux-fw/ti-linux-fw.inc}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-bsp/{ti-sci-fw/ti-sci-fw.inc => ti-linux-fw/ti-linux-fw.inc} (100%)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw.inc
rename to recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-- 
2.17.1

