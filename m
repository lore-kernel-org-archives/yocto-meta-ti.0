Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.11092.1620397793250390581
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 May 2021 07:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IHwmnTad;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 147ETq8T010846
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 May 2021 09:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620397792;
	bh=6r/PdyPedrC9TSwTO8MOIEMAYDgG0HMSvo6wam9GZl8=;
	h=From:To:CC:Subject:Date;
	b=IHwmnTad43bEjETSvUtsJhzY9/NiHiNFO2fGnEOhiYPDdRnilwiLKh1IspITvHb4e
	 nryiwR2MbZhTqq0R8QpkwjVQ3ymED1y3xRIlCjsMHkTsjepoUxs1aiJOpkBTJA8B1s
	 oyxHyFytNcG3yKcnK2ufeELTSaaU9L2X7VTDVDlE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 147ETqco062272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 May 2021 09:29:52 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 09:29:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 09:29:51 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 147ETnrt051934;
	Fri, 7 May 2021 09:29:50 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [dunfell/master PATCH] conf/machine: am64xx: Include SK dtb for machine am64xx-evm
Date: Fri, 7 May 2021 19:59:49 +0530
Message-ID: <20210507142949.25741-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As a step towards unification for am64xx-evm and am64xx-sk,
start including am64xx-sk dtb for machine=am64xx-evm.

Once U-Boot merges support for unified bootloader, am64xx-sk
machine can be dropped.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 conf/machine/include/am64xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 641bddd0..a46a50ed 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -8,6 +8,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
+    ti/k3-am642-sk.dtb \
 "
 
 # AM64 supports multi-certificate images, use the same
-- 
2.30.0

