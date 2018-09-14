Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFAC5E00A16; Fri, 14 Sep 2018 13:07:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 352A5E00726
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2018 13:07:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8EK7f7k094809
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2018 15:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536955661;
	bh=SvGVfE/1CDx8lp7FRBTgsnpHeRqKLfFyEjAnl2eTT6Q=;
	h=From:To:CC:Subject:Date;
	b=HZqy5jzd5Xyc/41R1B3tQDl4en2ZuZx+jl7SLa2nar4cp5z9xt/HyC1g+wkeEfoC8
	xPA9n6+HXl5Mzu6ricoFISXkhFXPbSylZnR+FQJzmwi8/Way3sneMekgLm7p2cE0oe
	9XYcr305Jjadjdbbk2+3VHsAJUPtgEbsrVwMBqfE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EK7fsE002338
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2018 15:07:41 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 15:07:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 15:07:41 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EK7fPS028004;
	Fri, 14 Sep 2018 15:07:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Sep 2018 20:04:03 +0000
Message-ID: <20180914200403.31229-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] arm-trusted-firmware: update to sync up with latest master
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
X-List-Received-Date: Fri, 14 Sep 2018 20:07:43 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
index 27b1591f..fdbf8f14 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
@@ -22,7 +22,7 @@ PV_append = "+git${SRCPV}"
 BRANCH = "ti-atf"
 SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
 
-SRCREV ?= "516abc5fb4826e28be0acdbe6e22fd1b1b476c59"
+SRCREV ?= "d7b4c6e1fdb4553fc23a02776bca111bdcdf6b9f"
 
 # Make ATF "aware" of OPTEE, no build dependency
 PACKAGECONFIG[optee] = "SPD=opteed"
-- 
2.17.1


