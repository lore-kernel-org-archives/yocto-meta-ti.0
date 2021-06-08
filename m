Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5864.1623110576915891459
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 17:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=i/mn64wj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15802tcV086436;
	Mon, 7 Jun 2021 19:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623110575;
	bh=2kJ3g49+Jy5/lBhDmrXasurWLHrXSXqC0NMwws+LdC4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=i/mn64wjqQVCwYhC9FI79ELlijPavd24IryqUnqjlz5/nPQK9vQFDIBU6+oFK9ydP
	 Z/xF3BGzkP8MUuunI+8zW4ai/LJ52HNN+zYQfLB0BuxVM9J17mOKi6NoLbnaQHT0Du
	 uJjdLxl6/NaJctANhj2aofIZP2BRn3Y6Q5iLca30=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15802tIj064674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Jun 2021 19:02:55 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 19:02:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 19:02:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15802tsn127050;
	Mon, 7 Jun 2021 19:02:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] conf/machine: am64xx: Add overlay to support icssg1-dualemac
Date: Mon, 7 Jun 2021 19:02:54 -0500
Message-ID: <20210608000254.12042-4-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608000254.12042-1-praneeth@ti.com>
References: <20210608000254.12042-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This patch adds overlay to support icssg1-dualemac
ie: 1 x CPSW3g ports and 2 x ICSSG1 ports configuration

overlay: k3-am642-evm-icssg1-dualemac.dtbo

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am64xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index a46a50ed..95fdc79d 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
     ti/k3-am642-sk.dtb \
+    ti/k3-am642-evm-icssg1-dualemac.dtbo \
 "
 
 # AM64 supports multi-certificate images, use the same
-- 
2.17.1

