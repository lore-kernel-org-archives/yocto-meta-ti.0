Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.212.1636996693929910833
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 09:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O/Mj/Up4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFHICwP013636;
	Mon, 15 Nov 2021 11:18:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636996692;
	bh=cypmxdng6lv1EAYI+qoRvNSfZkXQPhpPo1NL+ychmuI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=O/Mj/Up4VPCKHEUVMHiNx5JhQXLbdkGMKX+lnzGTo45HhClufkT0PYCGStJ7681K8
	 rkVJdTxWmOtnaoAVTlbkxiUOYus2PJSGm3gmO8RJg2Ik+g4dZEKGk1IuW5RGomqwWH
	 GLz1tMFiXvsVg57X/Y2ae3FExSnMynMmX4A4s7f8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFHICSx011970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Nov 2021 11:18:12 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 11:18:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 11:18:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFHIBRK017069;
	Mon, 15 Nov 2021 11:18:11 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/2] conf: machine : am65xx: Add missing dtbo
Date: Mon, 15 Nov 2021 17:18:11 +0000
Message-ID: <20211115171811.34908-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115171811.34908-1-yogeshs@ti.com>
References: <20211115171811.34908-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Added missing dtbo k3-am654-evm-ov5640.dtbo required for system test

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/include/am65xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 8516ca4c..1898f19c 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-pcie-usb3.dtbo \
     ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo \
+    ti/k3-am654-evm-ov5640.dtbo \
 "
 
 BBMULTICONFIG += "k3r5-sr2"
-- 
2.17.1

