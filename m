Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0604AE00546; Wed, 22 Aug 2018 13:05:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A69BE00460
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 13:05:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7MK5uBK095948
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 15:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534968356;
	bh=uQcaAg2ZYMZp1raOtC4RttUExsU1aLYAEcr2SFYzklE=;
	h=From:To:CC:Subject:Date;
	b=GeivUmPeUAgWzKI0sixXlas+8IN36cs5iS0yo7I1P5zozJ9ED5mwdqPACdAXXLbJn
	+ePoiGQ/+aicAWjHDB3HqvtNiII4Q26bhEb3y+chb+3SVs27VX9L2Fp2zdYYLTmYYH
	9usFMbRmuZWQ5S/reIOKZghvlrABdufxqo4IEsGY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MK5uQo024253
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 15:05:56 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 15:05:56 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 15:05:56 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MK5uNq009637;
	Wed, 22 Aug 2018 15:05:56 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 22 Aug 2018 16:05:51 -0400
Message-ID: <1534968351-4480-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] am65xx-evm: Add am65xx specific soc, boards and cores configuration
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
X-List-Received-Date: Wed, 22 Aug 2018 20:05:58 -0000
Content-Type: text/plain

Specifies the pdk soc names, board names and core names supported

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 conf/machine/am65xx-evm.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 08dbc9e..82ee02c 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -25,3 +25,8 @@ WKS_FILE = "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES = "u-boot.img"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "am65xx"
+TI_PDK_LIMIT_BOARDS = "am65xx_evm am65xx_idk"
+TI_PDK_LIMIT_CORES = "mcu1_0 mpu1_0"
-- 
1.9.1


