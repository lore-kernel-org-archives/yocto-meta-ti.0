Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.60396.1638835865339357552
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 16:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EIta8A1H;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B70B0xU078855;
	Mon, 6 Dec 2021 18:11:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638835860;
	bh=iT4reFMQbLoDjO5EIHxI75H9EWI2mhFx3je7akTKi+8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EIta8A1HL0SePfcz3mynirY12+i/Q7xbaDv0QeXOQWZpgHN0U123vZ2DnNXQB+s59
	 1Nj4TOKrhgkkQDrtnp6iZXuv6EgTS4N75ntYTYor0ISSfhXJGle5ZLJ9JBHNeu9APk
	 can5/I50SlSIuBJGNXPiulwjkjq369/ouYAON7r4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B70B04s059969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Dec 2021 18:11:00 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 18:10:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 18:10:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B70AxaD103835;
	Mon, 6 Dec 2021 18:10:59 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/2] u-boot-ti-staging: Bump u-boot version for 08.01.00.006
Date: Mon, 6 Dec 2021 18:10:59 -0600
Message-ID: <20211207001059.5572-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211207001059.5572-1-praneeth@ti.com>
References: <20211207001059.5572-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

u-boot bump for 08.01.00.006 release

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index f65d4fb0..d304df87 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r15"
+PR = "r16"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "d79399bcd770191618bfeb3840506a286a6498df"
+SRCREV = "15769936a559b1840f50b83f94ee0c636b245001"
-- 
2.17.1

