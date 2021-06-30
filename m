Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.566.1625076091501035133
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 11:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DGQMa2fF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15UI1UwU079615;
	Wed, 30 Jun 2021 13:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625076090;
	bh=GAUPQeqIZbcTItfKOtqzs51RTe9tmcxqGpatJeW8Wog=;
	h=From:To:CC:Subject:Date;
	b=DGQMa2fF99NdPiVgvkyFNtG+DaaH/OP/6eCrna8ZCXrtBvXk6yn8G2n9oN1jL2yy0
	 isngTxLFMghVFDC1C8kSZNsNblxBsPs9tvFKR3yWCTd2TyoLw5cYUF1+ceu63k1VPU
	 +tDHlBrmkynyDC7tMUDdQYCdvARD3j5Lw3slH5z4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15UI1UHD002326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Jun 2021 13:01:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 30
 Jun 2021 13:01:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 30 Jun 2021 13:01:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15UI1Us1055573;
	Wed, 30 Jun 2021 13:01:30 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>
CC: Tom Rini <trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Nishanth
 Menon <nm@ti.com>
Subject: [dunfell PATCH] ti-sci-fw: Update linux firmware repo to 08.00.00.001
Date: Wed, 30 Jun 2021 13:01:28 -0500
Message-ID: <20210630180128.13766-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Just updating imggen to a configuration compatible with latest firmware
should not have been accepted, we should have ensured that firmware
commit has moved correspondingly as well. Fix the same, else we get a
broken system.

Fixes: 406f5998227e ("ti-sci-fw: Update imggen to release 08.00.00.001 tag")

Signed-off-by: Nishanth Menon <nm@ti.com>
---

NOTE: NOTHING has gotten into master for the last 6 weeks, so I might as
well not tag master - This is just going to creep back at us.

 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 9e22e461354d..966042820aac 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2021.05"
 
-SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
+SRCREV = "1e73d9387980f4d425742738968e55395c19e26c"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
 SRCREV_FORMAT = "imggen"
-- 
2.32.0

