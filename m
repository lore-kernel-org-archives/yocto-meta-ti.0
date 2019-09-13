Return-Path: <d-huang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D67CAE00994; Fri, 13 Sep 2019 11:54:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E116BE0096F
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 11:54:23 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DIsNjp037735
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 13:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568400863;
	bh=BMi0ajNwdUE2ILWxneLZg29SMezJMdR3AEzhJqpAW9c=;
	h=From:To:CC:Subject:Date;
	b=VpJ7D8Ws6U+NpnsTlVJTTFiqpJM9LB9RomkioYMwE5Z2wlcpC/TPikpmqTXaAIwln
	++8NrumtkqhWL3UvxKK0nKCiqtdknEC/9CkAJHW/estLNGarsISEU7G2xStTteHs65
	KLNsQ60+KMg1AlojCE1+regS2djFvG8Y7j+5PymU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DIsN9h016685
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 13:54:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 13:54:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 13:54:22 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DIsN7H023443;
	Fri, 13 Sep 2019 13:54:23 -0500
Received: from ulb0226152.dhcp.ti.com (ulb0226152.dhcp.ti.com [128.247.77.143])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DIsMZ27743; Fri, 13 Sep 2019 13:54:22 -0500 (CDT)
From: David Huang <d-huang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Sep 2019 13:54:16 -0500
Message-ID: <1568400856-25544-1-git-send-email-d-huang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] viddec-test-app: Update the viddec-test-app recipe
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
X-List-Received-Date: Fri, 13 Sep 2019 18:54:26 -0000
Content-Type: text/plain

---
 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index 26f7c2d57a46..48a1753777ee 100644
--- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -6,8 +6,8 @@ DEPENDS = "libdrm ffmpeg"
 
 inherit autotools pkgconfig
 
-PR = "r0"
-SRCREV = "9d5b3c11ac24dbed9284e849c0db9daeb47704e7"
+PR = "r1"
+SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


