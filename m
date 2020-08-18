Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.72735.1597775622115809232
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 11:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LmOTx50y;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nikhil.nd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADD69E0203E; Tue, 18 Aug 2020 11:33:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF9E3E0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 11:33:40 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IIXdxA003198
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597775619;
	bh=BX3SN1KxFmiwiuX2ygwFG1piN2HmXlic25iYF2DN+54=;
	h=From:To:CC:Subject:Date;
	b=LmOTx50yEIHsIrJrR11ZBlHms//MMYHIFeeLV8HlyMOa5jR1fBdD4Lb+Ytfbdp3tJ
	 hJHSaNsoMr3/n9fuK1T6VcWCOrsYRWY20IgG1+UqF6vTKh79+wezl6TCMvbdNtp/2z
	 s7x7OQ5Td1nP8xpWvN2OHZ9V6aBiIfQauimNnCAg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07IIXdqm009565
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:33:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 13:33:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 13:33:39 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IIXbCR065257;
	Tue, 18 Aug 2020 13:33:37 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>, <dmurphy@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] conf: machine: j7200-evm: Add Jailhouse overlay
Date: Wed, 19 Aug 2020 00:03:14 +0530
Message-ID: <20200818183314.6089-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

j7200-evm supports virtualization with Jailhouse hypervisor.
To use Jailhouse, kernel needs to boot with an additional
DTB overlay. Include this in the list of DTBs for the machine.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 conf/machine/j7200-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index d2a81771..dab6d8cb 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
+    ti/k3-j7200-common-proc-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
-- 
2.17.1

