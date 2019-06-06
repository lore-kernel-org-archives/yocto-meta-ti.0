Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFB6AE00994; Thu,  6 Jun 2019 09:07:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD30DE0096F
	for <meta-ti@yoctoproject.org>; Thu,  6 Jun 2019 09:07:07 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56G76Ki099984
	for <meta-ti@yoctoproject.org>; Thu, 6 Jun 2019 11:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559837226;
	bh=fMaOFVTFxLDA8WrLuGmEFpUZVFWnQnY3jjra5itLbA0=;
	h=From:To:CC:Subject:Date;
	b=OV8HuLV10Y+SmFZmJtv+25xySmsz7R0DfQlQYhmYz9tSDdwcBOaP7zzQx8jL6x2RM
	7BvI3XY12eDErVjT8mEgJ1bygRsoCFK3JjV2yl/lGSzzqXNnR0HkdlPfTJyHKNABMR
	fMgACzZSJ3HVgXJQMSyk6EoNzjvFnnfPI0eNVQRQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56G76Yh109563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 6 Jun 2019 11:07:06 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 6 Jun 2019 11:07:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 6 Jun 2019 11:07:06 -0500
Received: from udb0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x56G76RP010779;
	Thu, 6 Jun 2019 11:07:06 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jun 2019 12:06:58 -0400
Message-ID: <20190606160658.25003-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] swtools: bump SRCREV to compile dsplib/mathlib with "--legacy"
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
X-List-Received-Date: Thu, 06 Jun 2019 16:07:08 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/swtools/swtools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
index 796909f1..3e7105b6 100644
--- a/recipes-ti/swtools/swtools_git.bb
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 SWTOOLS_GIT_BRANCH = "master"
 SWTOOLS_GIT_PROTOCOL = "git"
 SWTOOLS_GIT_URI = "git://git.ti.com/ep-processor-libraries/swtools.git"
-SWTOOLS_SRCREV = "d0c1022954b489d5f3d8d2f5c81d8c6a392f4af4"
+SWTOOLS_SRCREV = "0ef96a3bb9fd8694ae75c4c3f85ad4ab2278f655"
 
 SRC_URI = "${SWTOOLS_GIT_URI};protocol=${SWTOOLS_GIT_PROTOCOL};branch=${SWTOOLS_GIT_BRANCH}"
 SRCREV = "${SWTOOLS_SRCREV}"
-- 
2.17.1


