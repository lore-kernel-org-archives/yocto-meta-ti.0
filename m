Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69436E00D77; Wed, 28 Aug 2019 05:46:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18905E00D33
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 05:46:52 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7SCkqWi068379
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 07:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566996412;
	bh=BV9V58VB2dYp+O4I3bQZBHzw+/IuZH1jDS6UE6JlZ0Q=;
	h=From:To:Subject:Date;
	b=M8es95jZKGSq5ovkSDn8XYl9Pw9rmAtZ9HHNhN/Uspqi6gtofyIwBivfTcKGj9Kx+
	UIzPlzSXdNqoJMr9HKN8dIUmCikexlf/oGUDyb+wrlXM9MmFx2WQbF++Hd5NBUt2WX
	HRDtRihMneDSSQC05y2DZb5QFP79BB9DOjdGvvU0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7SCkqgU096791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 07:46:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 28 Aug 2019 07:46:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 28 Aug 2019 07:46:52 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7SCkpPt057468
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 07:46:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 28 Aug 2019 08:46:48 -0400
Message-ID: <1566996408-60116-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] j7-evm.conf: Correcting the core list for j7-evm (mpu2/3_x to mcu2/3_x)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Aug 2019 12:46:54 -0000
Content-Type: text/plain

There is no mpu2_1,mpu3_0,mpu3_1 for j7-evm. They should have been
mcu2_1,mcu3_0 and mcu3_1 respectively.
---
 conf/machine/j7-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index ca594e8..cadf637 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -33,4 +33,4 @@ do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "j721e"
 TI_PDK_LIMIT_BOARDS = "j721e_evm"
-TI_PDK_LIMIT_CORES = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mpu2_1 mpu3_0 mpu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
+TI_PDK_LIMIT_CORES = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
-- 
1.9.1


