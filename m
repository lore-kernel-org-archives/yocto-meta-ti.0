Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D41E2E0096F; Thu,  6 Jun 2019 09:17:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9249E00942
	for <meta-ti@yoctoproject.org>; Thu,  6 Jun 2019 09:17:05 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56GH5oN060425
	for <meta-ti@yoctoproject.org>; Thu, 6 Jun 2019 11:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559837825;
	bh=GBXWuLnINc//R0BGT+BQF9M13nDCF+Y2TIP1WPJe4+c=;
	h=From:To:CC:Subject:Date;
	b=PJV399X1SnsrttkDb+EVBzKxJa3S5WfCVQ8HYcYvqngF9QmMvLFTD0jsg+ZaVtt7J
	RHb8LFMSa5zFdck3lL3pnHmHwoapcN2UDXO1RTQ8i+GlmBGyPnep/hnvqMXmOaPA/C
	McK+MuRadwwfPxLnU+0FD+m1IiKgpVad84PM4J9Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56GH5AX121013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 6 Jun 2019 11:17:05 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 6 Jun 2019 11:17:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 6 Jun 2019 11:17:05 -0500
Received: from udb0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x56GH4Tv024329;
	Thu, 6 Jun 2019 11:17:04 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jun 2019 12:17:01 -0400
Message-ID: <20190606161701.25207-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] mathlib: bump SRCREV to pick up updated test reports
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
X-List-Received-Date: Thu, 06 Jun 2019 16:17:07 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/mathlib/mathlib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
index b0cd62ec..8b357a85 100644
--- a/recipes-ti/mathlib/mathlib.inc
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -4,8 +4,8 @@ LICENSE = "BSD-3-Clause"
 
 require ../includes/ti-paths.inc
 
-PV = "3_1_2_3"
-PR = "r2"
+PV = "3_1_2_4"
+PR = "r1"
 
 DEPENDS = "ti-cgt6x-native \
            ti-xdctools-native \
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 MATHLIB_GIT_BRANCH = "master"
 MATHLIB_GIT_PROTOCOL = "git"
 MATHLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git"
-MATHLIB_SRCREV = "faedd650c47becb48b2d179242c8310327ef9853"
+MATHLIB_SRCREV = "3035674f97fe34185b7ef6aea5c271039f867c11"
 
 SRC_URI = "${MATHLIB_GIT_URI};protocol=${MATHLIB_GIT_PROTOCOL};branch=${MATHLIB_GIT_BRANCH}"
 SRCREV = "${MATHLIB_SRCREV}"
-- 
2.17.1


