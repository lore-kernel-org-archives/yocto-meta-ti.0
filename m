Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7668.1589440694891564794
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 May 2020 00:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nEM9a2Rv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rogerq@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04E7IELV046549
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 May 2020 02:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589440694;
	bh=ct+1c8MZt/QrnX2NYAw6Bw0ZM1f3WrC7g86Xl9a1i4k=;
	h=From:To:CC:Subject:Date;
	b=nEM9a2RvvMgfJDr3lykYlaMrEKHy4eLXs47gOuSpEl7qU57HoHMRokEeSKgL10K8C
	 68bh8fSzqz/KXymM7984/a0gMRS1QS/qOQ5topw4dD6T3BTpwW1jIBz0NZm8dOjgxJ
	 32frVwy6XPFG6kdTfY9auG9c5Pql7Up+WI826K7g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04E7IEjF100063
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 May 2020 02:18:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 02:18:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 02:18:14 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04E7ICjL111799;
	Thu, 14 May 2020 02:18:13 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Roger Quadros <rogerq@ti.com>
Subject: [dunfell/master PATCH] am65xx-evm: Add missing k3-am654-idk-sr1.dtbo
Date: Thu, 14 May 2020 10:18:10 +0300
Message-ID: <20200514071810.5719-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

For SR1.0 we use a different overlay for IDK card.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 conf/machine/am65xx-evm.conf    | 1 +
 conf/machine/am65xx-hs-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index e5766f18..0007377c 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -16,6 +16,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board-sr1.dtb \
     ti/k3-am654-gp.dtbo \
     ti/k3-am654-idk.dtbo \
+    ti/k3-am654-idk-sr1.dtbo \
     ti/k3-am654-evm-hdmi.dtbo \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo \
     ti/k3-am654-evm-tc358876.dtbo \
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index 6d20a0de..702ba308 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -12,6 +12,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
     ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
+    ti/k3-am654-idk-sr1.dtbo \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
     ti/k3-am654-base-board-jailhouse.dtbo \
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

