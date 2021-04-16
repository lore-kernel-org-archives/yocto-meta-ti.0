Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.4958.1618549565780027483
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 22:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cN2x2a1G;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13G565Pf095391;
	Fri, 16 Apr 2021 00:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618549565;
	bh=/sUAwK3c86sfVhafyRpRa8gj+ehXnWPfQMEMzUeARAc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cN2x2a1GAuSKLXcuKzKq3/Q6uQo3A5IqMJ+v54vSmqaj/RxCk9aTWSv7ay4Vqj0QE
	 TjOJ507S906fczE32bCVRg/beJTRWBzye3f4Fkksm20gieFCeAgD4OL7PANck91zMP
	 qM1G4mWs+lHp9Ejcc94xN8tU6n1+AChGGUoBS4Zw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13G564Fk115470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 00:06:05 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 00:06:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 00:06:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13G564vn036808;
	Fri, 16 Apr 2021 00:06:04 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2 2/6] conf: j7200-evm: Remove jailhouse overlay from 5.10 kernel
Date: Fri, 16 Apr 2021 00:05:56 -0500
Message-ID: <20210416050600.16593-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416050600.16593-1-praneeth@ti.com>
References: <20210416050600.16593-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove jailhouse overlay as it is not currently available in
ti-linux-5.10.y branch.

Removing for now, and shall be added back once they are
available in 5.10 kernel.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/j7200-evm.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index 5ee6c89c..2565c90c 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -9,7 +9,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
-    ti/k3-j7200-common-proc-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
-- 
2.17.1

