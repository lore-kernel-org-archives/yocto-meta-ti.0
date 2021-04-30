Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.3586.1619814071878540377
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 13:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wjv+/Rww;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13UKLAPh027117;
	Fri, 30 Apr 2021 15:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619814070;
	bh=0Mhu1iQ5uV3qZZRMKtn/8fmCOISCOFnmKs6aXXLc0wo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wjv+/RwwRLizPvfXdTV90Bvc4mK482vaEAVRno67L94fWYCQhDEiOVigPyVMJwt7D
	 4KGBs5pZC+BuK1c6kFXCIznVGNxVF7W5tPNlu5HFK3VkKaewV7JzLcJjlAS5HhusRw
	 1o61q5bUV/ZRr0BxfW2h4BfaU8ECzqiFiAfOutNw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13UKLAOP122691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Apr 2021 15:21:10 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Apr 2021 15:21:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 30 Apr 2021 15:21:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13UKLA6A049708;
	Fri, 30 Apr 2021 15:21:10 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] conf: am65xx-evm: ReIntroduce AM65 SR1.0 overlay
Date: Fri, 30 Apr 2021 15:21:10 -0500
Message-ID: <20210430202110.31235-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430202110.31235-1-praneeth@ti.com>
References: <20210430202110.31235-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

ReIntroduce AM65x SR1.0 Overlay as the support for it
is added in the ti-linux-5.10.y kernel now.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am65xx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 28733b2b..7cc3ddcc 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -8,8 +8,10 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
+    ti/k3-am654-base-board-sr1.dtbo \
     ti/k3-am654-gp.dtbo \
     ti/k3-am654-idk.dtbo \
+    ti/k3-am654-idk-sr1.dtbo \
     ti/k3-am654-sr1.dtbo \
     ti/k3-am654-pcie-usb2.dtbo \
     ti/k3-am654-pcie-usb3.dtbo \
-- 
2.17.1

