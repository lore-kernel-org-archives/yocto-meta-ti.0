Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3735E0160E; Thu, 19 Jul 2018 10:24:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86586E00E27
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOQIZ121137
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021066;
	bh=b0IS2j0I1ifgJZOkm7RV6VbUI4GlFWNE80+nHaiDRxA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fnqxvJCTdzEAsHXFQQ4Rrh/FnU2A+KPZyQRtk7HHIhzAh8Wv/pYdzPeMPfceWGRwv
	6dZtBJQc09hFCEZULQsi1CFvGxrJjMWU4DlysK/x4CpXl22442yKIYOSliPKgMfzKs
	Sf3SNY1Dv33sDDEoJFXqterTVkRBe7tcsdXwleog=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOQlr015392
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:26 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORc023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:41 -0400
Message-ID: <1532021058-48916-9-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 08/45] dfe-lld: Update to version 1.0.0.9
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:31 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index 84e8509..0117757 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -7,14 +7,14 @@ DFE_LLD_GIT_PROTOCOL = "git"
 DFE_LLD_GIT_BRANCH = "master"
 DFE_LLD_GIT_DESTSUFFIX = "git/ti/drv/dfe"
 
-# Below commit ID corresponds to "DEV.DFE_LLD.01.00.00.08"
-DFE_LLD_SRCREV = "d51482ef18889bbbd8e9cdc207c6fe9e27b1ab03"
+# Below commit ID corresponds to "DEV.DFE_LLD.01.00.00.09"
+DFE_LLD_SRCREV = "da6a84069837b5c9b7a4bdb8824d8a4295866b14"
 
 BRANCH = "${DFE_LLD_GIT_BRANCH}"
 SRC_URI = "${DFE_LLD_GIT_URI};destsuffix=${DFE_LLD_GIT_DESTSUFFIX};protocol=${DFE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${DFE_LLD_SRCREV}"
 
-PV = "1.0.0.8"
+PV = "1.0.0.9"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l"
-- 
1.9.1


