Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F08EE00C6F; Tue,  9 Jul 2019 14:30:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C9E3E00C6A
	for <meta-ti@yoctoproject.org>; Tue,  9 Jul 2019 14:30:24 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69LUOXR127099
	for <meta-ti@yoctoproject.org>; Tue, 9 Jul 2019 16:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562707824;
	bh=1c/WFR5d2/IhgmyQroz6eB4bOPya0KYNzOS8Lyep8qk=;
	h=From:To:CC:Subject:Date;
	b=cxX1Hg6LwYqbClAA08AMg+0vBRhSx1WrBo6nV0duS4634YMTyEdVh3jQLtBVLMvnn
	LWikei6SHE7DFKZhos/94+29NsG2/RoWA2MhMgzkhp7I+Gbih831C2c2/xKFFl3oUK
	3mu7QQ+Jj6uyxLW4vuDZStm5M0MUZne89Exm2M/4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69LUOIZ057748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 9 Jul 2019 16:30:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 9 Jul 2019 16:30:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 9 Jul 2019 16:30:24 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69LUOfm008758;
	Tue, 9 Jul 2019 16:30:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 9 Jul 2019 21:17:35 +0000
Message-ID: <20190709211735.11374-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] arm-trusted-firmware: update to the latest in 2.1
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
X-List-Received-Date: Tue, 09 Jul 2019 21:30:27 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...{arm-trusted-firmware_2.0.bb => arm-trusted-firmware_2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/arm-trusted-firmware/{arm-trusted-firmware_2.0.bb => arm-trusted-firmware_2.1.bb} (97%)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb
similarity index 97%
rename from recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
rename to recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb
index 43312b65..a065cd83 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb
@@ -22,7 +22,7 @@ PV_append = "+git${SRCPV}"
 BRANCH = "ti-atf"
 SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
 
-SRCREV ?= "48ec9e41a27f9b58975e0c6ff571e43f2015f9fc"
+SRCREV ?= "ce3f1512bfc3f346900178c5ef870fbef3ab205e"
 
 # Make ATF "aware" of OPTEE, no build dependency
 PACKAGECONFIG[optee] = "SPD=opteed"
-- 
2.17.1


