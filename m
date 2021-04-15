Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2918.1618463468223682333
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 22:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LqzDHBOp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B7Ff119588;
	Thu, 15 Apr 2021 00:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618463467;
	bh=K99Q7ods6HqqW7aMs3nUFDsQRDN5Pat/EX3qCn68bBw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LqzDHBOpMVrdvwVqO0K8Po4eWr3PLwBzMpxa7YVUVblPwvALKQWRWlI57c303RRuM
	 byHpKgErTvg0XNdjdkk7bvTe31LzLjk+mUaEQ37F0rLzRNFlZACyw2BfhpX9u4mzJY
	 +Hjku/xep2hIMeeQ1rG6DGTqU2qQODqSU6gTlrVQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13F5B7Kd095625
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 00:11:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 00:11:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 00:11:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B66p050056;
	Thu, 15 Apr 2021 00:11:06 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 5/6] Revert "conf: machine: j7200-evm: Add Jailhouse overlay"
Date: Thu, 15 Apr 2021 00:11:04 -0500
Message-ID: <20210415051105.1626-6-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415051105.1626-1-praneeth@ti.com>
References: <20210415051105.1626-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit 00dc1b1cd70f56dba577bb647c118b8df27f5a46.

Reverting for now, as the support for this overlay is not yet
present on ti-linux-5.10.y

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

