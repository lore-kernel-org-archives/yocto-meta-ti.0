Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36C9EE0098A; Thu,  6 Jun 2019 09:19:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55ED8E00798
	for <meta-ti@yoctoproject.org>; Thu,  6 Jun 2019 09:19:26 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56GJPuK104639
	for <meta-ti@yoctoproject.org>; Thu, 6 Jun 2019 11:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559837965;
	bh=TGX4pe0Ap0n5GtPZTACLAZGnbn8tV9mwfoYV/LKVHN0=;
	h=From:To:CC:Subject:Date;
	b=cryXoePMK+3KU4zxziEDcCZrzqy1QA6V46UbRXoZWkeiNTf4fMm/NQjmcLQEwlEwX
	cLs94HkztX+aHssYwgBrg/nPBqkBX9TGZAKVAWPUpXr9GMbeQV5JRyCChwKv2+64sx
	84InGwGtshGDzK0FlPkG4UuzQYfkn8Y7WYad3c9Q=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56GJPhS027429
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 6 Jun 2019 11:19:25 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 6 Jun 2019 11:19:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 6 Jun 2019 11:19:25 -0500
Received: from udb0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x56GJPiJ027257;
	Thu, 6 Jun 2019 11:19:25 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jun 2019 12:19:20 -0400
Message-ID: <20190606161920.25284-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] dsplib: bump SRCREV to pick up updated test reports
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
X-List-Received-Date: Thu, 06 Jun 2019 16:19:28 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/dsplib/dsplib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index 1dfbcd24..2d0a45ca 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -4,8 +4,8 @@ LICENSE = "BSD-3-Clause"
 
 require ../includes/ti-paths.inc
 
-PV = "3_4_0_3"
-PR = "r2"
+PV = "3_4_0_4"
+PR = "r1"
 
 DEPENDS = "ti-cgt6x-native \
            ti-xdctools-native \
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 DSPLIB_GIT_BRANCH = "master"
 DSPLIB_GIT_PROTOCOL = "git"
 DSPLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git"
-DSPLIB_SRCREV = "2cd21a04913648d040bd63234183cc6f81f5286a"
+DSPLIB_SRCREV = "ec2f933247d5fa59377c801bb23eb3b62b38627b"
 
 SRC_URI = "${DSPLIB_GIT_URI};protocol=${DSPLIB_GIT_PROTOCOL};branch=${DSPLIB_GIT_BRANCH}"
 SRCREV = "${DSPLIB_SRCREV}"
-- 
2.17.1


