Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.993.1576179336923638488
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Dec 2019 11:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EVIn/G1M;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: tmannan@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2D29E01163; Thu, 12 Dec 2019 11:35:36 -0800 (PST)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 284F9E0049C
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 11:35:35 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCJZZ0J069089
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 13:35:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576179335;
	bh=1mT0zuVGJZraFkWLCFek/TDmCLbGT1/Ww59mjFyzQjU=;
	h=From:To:Subject:Date;
	b=EVIn/G1MezuBdePBgytdGuwq34Q2b01Yn7L9YMVg3o2uctHPzvOtOfHcHxqTDVB4S
	 cIOyBrjxGgSOZjPWDOhBcOhP+8CCLSTmQkAkDfWrKV9bfUFcyss3IC7dRXcI/Ey5Y/
	 gV6udF3Ao6BYRPw3mBUctVjDja/q68QrXdfJ94ag=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCJZZvo117030
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 13:35:35 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 13:35:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 13:35:35 -0600
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCJZYvs060420
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2019 13:35:35 -0600
From: "Tinku Mannan" <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH] udma-lld: update recipe to include j7200_evm in j7 board list
Date: Thu, 12 Dec 2019 14:35:32 -0500
Message-ID: <1576179332-32267-1-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Tinku Mannan <tmannan@ti.com>
---
 conf/machine/j7-evm.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 0a0c5bd..318435d 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -32,6 +32,6 @@ WKS_FILE ?= "sdimage-bootpart.wks"
 do_image_wic[depends] += "u-boot:do_deploy"
 
 # Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "j721e"
-TI_PDK_LIMIT_BOARDS = "j721e_evm"
+TI_PDK_LIMIT_SOCS = "j721e j7200"
+TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
 TI_PDK_LIMIT_CORES = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
-- 
2.7.4

