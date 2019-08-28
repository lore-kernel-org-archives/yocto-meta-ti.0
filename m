Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4AE58E00D6A; Wed, 28 Aug 2019 05:47:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0867E00D33
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 05:47:18 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7SClI4L068481
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 07:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566996438;
	bh=fCHBbZ5tPu+3VHCKgTl8v4UH0XpGRtF4D20aLl2QHLY=;
	h=From:To:Subject:Date;
	b=ftQr/00kL2BvfYi7nfSUpC1SrfyqvRG2mt/knAZqw/Q50c1yflOwRk4ae7xrMxee4
	UWPu+/PHz6y0uVp/8ftt38ru/KqTlCKu/lKvB/X0HeVkBsU+g7AVx+n0zt4r/5oOXh
	6be9mGNBPjoJWEGG0VwgfMtVuQcrIzPO6oq8V8g4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7SClIIE066419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 07:47:18 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 28 Aug 2019 07:47:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 28 Aug 2019 07:47:17 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7SClHdR058682
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2019 07:47:17 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 28 Aug 2019 08:47:15 -0400
Message-ID: <1566996435-60450-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-pdk.bbclass:j7-evm.conf: Correcting the core list for j7-evm (mpu2/3_x to mcu2/3_x)
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
X-List-Received-Date: Wed, 28 Aug 2019 12:47:19 -0000
Content-Type: text/plain

Correcting the corelist. There is no mpu2_x or mpu3_x instead they
should be  mcu2_x/mcu3_x which is present in j7-evm

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 classes/ti-pdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 563ee2b..7030f70 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -62,7 +62,7 @@ export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
 TI_PDK_XDCMAKE ?= "1"
 
 # By default, only build the cores with available toolchains
-TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 mpu1_0 mcu1_0 mcu1_1 mcu2_0 mpu2_1 mpu3_0 mpu3_1 c66x c66xdsp_1 c66xdsp_2 c7x_1 arm9_0 c674x a9host a8host pru_0 pru_1"
+TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 mpu1_0 mcu1_0 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1 c66x c66xdsp_1 c66xdsp_2 c7x_1 arm9_0 c674x a9host a8host pru_0 pru_1"
 TI_PDK_LIMIT_SOCS ?= ""
 TI_PDK_LIMIT_BOARDS ?= ""
 TI_PDK_MAKE_TARGET ?= "release"
-- 
1.9.1


