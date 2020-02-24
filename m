Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.489.1582560834810580727
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 08:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mCwfUin9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nikhil.nd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OGDs3Q079352;
	Mon, 24 Feb 2020 10:13:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582560834;
	bh=FGzRhQxxVFDcur9FIveV/xHwNnr+2eYTMU4XnMKKmCg=;
	h=From:To:CC:Subject:Date;
	b=mCwfUin93KhElXS98yClToPtqGHWRskj4355I615RJEExP+e65Yhey6iceb/u4lxJ
	 t10OL2QTkrRA+Z/JrqkpxfBZ3NG2+YBZoywnitqtaAXyxb9qKIwaDfLav0BG7UOfp5
	 tsXaT58Tote5nzPSdGRBh+9raoYuEkP/gdrdL5Qk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OGDst1128329;
	Mon, 24 Feb 2020 10:13:54 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 10:13:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 10:13:53 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OGDp3A064555;
	Mon, 24 Feb 2020 10:13:52 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus PATCH v1] conf: j7-evm: Add jailhouse dtbo
Date: Mon, 24 Feb 2020 21:43:46 +0530
Message-ID: <20200224161346.1447-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 conf/machine/j7-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 7451d0b6..e73c75bd 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-proc-board-tps65917.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-pcie-backplane.dtbo \
+    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.17.1

