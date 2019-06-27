Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA4E6E00D8C; Wed, 26 Jun 2019 21:24:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5871AE00D85
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 21:24:08 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5R4O8J8095904
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561609448;
	bh=Nwb/KEKOTOXHC8xOTFBF8oiaGOeWPAShQjG8K1lY6Oc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=dTZZFcAYPdlD1DtT5PEWIlKJR12W5L1vFZ4lVHLQxxgdcmNr6IVgAo0C0H/p6MrmF
	Vjh8O1djMyfeeuS+iIEyUr0H0wA71Zg1roEvLzpW+W1ns0BEhrCfBEbRHOGwd9Byxd
	0iaHfvTlQZsqyL6u5c8Xyg8Ua49ilRB9K4d8ZnWw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5R4O7NP078563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 23:24:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 23:24:07 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5R4O50Z079141
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:07 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jun 2019 00:23:39 -0400
Message-ID: <1561609436-41672-8-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561609436-41672-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1561609436-41672-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 07/24] icss-emac-lld: SRCREV update to 01.00.00.16
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
X-List-Received-Date: Thu, 27 Jun 2019 04:24:08 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index 9c93b75..3bf4b71 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -9,8 +9,8 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
 ICSS_EMAC_LLD_GIT_BRANCH = "master"
 ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
 
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.15A"
-ICSS_EMAC_LLD_SRCREV = "94536e4f3087b87e0787f00637b00878ee085d1d"
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.16"
+ICSS_EMAC_LLD_SRCREV = "73ba33fe3a83f467102de0e35d25ce17170eab07"
 
 BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -18,7 +18,7 @@ SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};p
 SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
 
 # The LLD version
-PV = "01.00.00.15A"
+PV = "01.00.00.16"
 
 # The FW version(s)
 PV_DUALEMAC_FW = "5.2.7"
-- 
1.9.1


