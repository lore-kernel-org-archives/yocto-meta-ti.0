Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1709.1623199856703742109
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 17:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mt7a57b3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1590otUW097330;
	Tue, 8 Jun 2021 19:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623199855;
	bh=D5jKFARWxq+9JlmDxmux9N9STPkPgLB7irLW5WaPx1w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mt7a57b3U7mKD2b0jEUE/t2lv9Y7PIWsKcp95/moCuOgK9UZ5BAGbgD49DFpt8SVl
	 s2dnTfZ6E1DOPukxeT0XK6asBaiwRt3Zyf442eX4ApLuxGmX9n6qknVtSUq6NNZ3dE
	 VUIzK38LkrZ9zcRbRBRsOKIy7jn4eZgEknIQzG4Q=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1590ot0u083212
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 19:50:55 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 19:50:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 19:50:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1590otlr010414;
	Tue, 8 Jun 2021 19:50:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <lukas@wunner.de>
Subject: [dunfell/master PATCHv2 3/5] conf: am65xx-evm: ReIntroduce display overlays for 5.10
Date: Tue, 8 Jun 2021 19:50:53 -0500
Message-ID: <20210609005055.7975-4-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609005055.7975-1-praneeth@ti.com>
References: <20210609005055.7975-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

commit 9ea50db095f9 ("conf: am65xx-evm: Remove non-existent dtb* from 5.10")
removed all non-existent dtb* for am65xx-evm as they were not
available on linux 5.10 branch at that time.

This patch reintroduces following display overlays.
- k3-am654-evm-tc358876.dtbo
- k3-am654-evm-oldi-lcd1evm.dtbo

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am65xx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 7cc3ddcc..8516ca4c 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -15,6 +15,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-sr1.dtbo \
     ti/k3-am654-pcie-usb2.dtbo \
     ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am654-evm-tc358876.dtbo \
+    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
 "
 
 BBMULTICONFIG += "k3r5-sr2"
-- 
2.17.1

