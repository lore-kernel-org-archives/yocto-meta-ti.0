Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1719.1623199856736504709
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 17:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rmlm9Czp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1590ot8o097334;
	Tue, 8 Jun 2021 19:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623199855;
	bh=2kJ3g49+Jy5/lBhDmrXasurWLHrXSXqC0NMwws+LdC4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rmlm9CzpGNEmiIIfDQqF1BiRbXVSK8G8FluvlryMEvOnhoESuZqjyU7R4EX6vmRVT
	 4/TQo/P4NhOE6k/a+jb5eZC9O9XMgjdLznoEGxVthmD1teJGJlCTsBeAAtfxxVfQ/N
	 JaKtTcEzLLwrZRr+/MRrlvRlr6e/tgA95SpifQDE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1590ot9C083215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 19:50:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 19:50:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 19:50:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1590otam047296;
	Tue, 8 Jun 2021 19:50:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <lukas@wunner.de>
Subject: [dunfell/master PATCHv2 4/5] conf/machine: am64xx: Add overlay to support icssg1-dualemac
Date: Tue, 8 Jun 2021 19:50:54 -0500
Message-ID: <20210609005055.7975-5-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609005055.7975-1-praneeth@ti.com>
References: <20210609005055.7975-1-praneeth@ti.com>
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

