Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.7274.1619583948538245191
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 21:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WPxREZPo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13S4PlgB106400;
	Tue, 27 Apr 2021 23:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619583947;
	bh=9Da2xxIop27oYyBTCJuFqIr+Ew/9jrDvWmI98P96/d8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WPxREZPoU/Th85UngcKH1BlUM24WJnUJLL+gxUUzjWkDr4U9fFfo14/HJFX9Cvn7G
	 MnlZ7qkPv4ftAymm7PMD0VEmIEGiMsspAWT3N5aqObcNu0a6i0yQHwfx4jkj8DD2Q+
	 uAQxFavCCtR2oVn9CbnqoVTRyLkEJMARrC0+hZOc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13S4Pljs002410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 23:25:47 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Apr 2021 23:25:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Apr 2021 23:25:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13S4Pl6C046814;
	Tue, 27 Apr 2021 23:25:47 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 3/3] conf: am65xx-evm: ReIntroduce existent dtbo for 5.10
Date: Tue, 27 Apr 2021 23:25:36 -0500
Message-ID: <20210428042536.6478-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428042536.6478-1-praneeth@ti.com>
References: <20210428042536.6478-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

commit 9ea50db095f9 ("conf: am65xx-evm: Remove non-existent dtb* from 5.10")
removed all non-existent dtb* for am65xx-evm as they were not
available on linux 5.10 branch at that time.

This patch reintroduces overlays present current on ti-linux-5.10.y kernel.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am65xx.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 2a813f20..28733b2b 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -8,6 +8,11 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
+    ti/k3-am654-gp.dtbo \
+    ti/k3-am654-idk.dtbo \
+    ti/k3-am654-sr1.dtbo \
+    ti/k3-am654-pcie-usb2.dtbo \
+    ti/k3-am654-pcie-usb3.dtbo \
 "
 
 BBMULTICONFIG += "k3r5-sr2"
-- 
2.17.1

