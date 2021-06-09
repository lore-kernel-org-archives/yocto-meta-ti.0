Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1709.1623199856836830096
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 17:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cQil1Bao;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1590ouje097338;
	Tue, 8 Jun 2021 19:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623199856;
	bh=YjfRXSscFozahq3DhjlkVKdlnJqkHM6UmG3/1MtlBi0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cQil1BaonsEhkh/6U3nlzwnD8M2nq+xrAXoGHPzRpcQMAHVbG/2/v8JEA5UMAoePu
	 pMQQitwLzNYdw95YHiNwM7eCsths+pDkpQ97fffrdC3epgnlUo5CRF5d00VT9DTKWq
	 Irn0eKMsw8UF/rpMYyJPLADNAaKZVJB2qei7/Qek=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1590ouCR083218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 19:50:56 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 19:50:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 19:50:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1590otcI052361;
	Tue, 8 Jun 2021 19:50:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <lukas@wunner.de>
Subject: [dunfell/master PATCHv2 5/5] conf: j7-evm: ReIntroduce pm1 SOM with tps65917 PMIC
Date: Tue, 8 Jun 2021 19:50:55 -0500
Message-ID: <20210609005055.7975-6-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609005055.7975-1-praneeth@ti.com>
References: <20210609005055.7975-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

commit 8b206b32ec18 ("conf: j7-evm: Remove unavailable dtb/o from 5.10 kernel")
removed all non-existent dtb* for j7-evm as they were not
available on linux 5.10 branch at that time.

Since the support for pm1 SOM with tps65917 PMIC is added in ti-linux-5.10.y by
commit dd97d0bbafb7 ("arm64: dts: ti: k3-j721e: Add support for pm1 SOM with tps65917 PMIC")

This patch adds the support back with the supported dtb.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/j7-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 4e9d18a7..6bdb3cf1 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -11,6 +11,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
+    ti/k3-j721e-proc-board-tps65917.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
 "
 
-- 
2.17.1

