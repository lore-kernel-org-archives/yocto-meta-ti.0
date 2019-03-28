Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F13A8E00BAF; Thu, 28 Mar 2019 08:02:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4001E0049A
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2019 08:02:17 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2SF2HDS126514
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2019 10:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553785337;
	bh=aHcDmmVW7Mytr3wdnlMrPGz91kadgXEvh2gYI4TKRwY=;
	h=From:To:Subject:Date;
	b=JWOpJ9sIA29LTZ0nzni8ClMZu7C8N0cdd8ruKOy4hAO8FKNUGe/FHilalkKpqplNS
	o8LjELFboEKH3eGVs70dhfQ9D6uRI+nh0INqIsJsZtm2If2WBIvwpcKhyD70jhrjlP
	dRu8MwYhGl2md78iT+qRHULtPpqk8bGThwISCjak=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2SF2HpD000467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2019 10:02:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 28 Mar 2019 10:02:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 28 Mar 2019 10:02:16 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2SF2GqY091105
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2019 10:02:16 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Mar 2019 11:02:10 -0400
Message-ID: <1553785330-28931-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] common-csl-ip: SRCREV bump to 03.03.00.14D
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
X-List-Received-Date: Thu, 28 Mar 2019 15:02:21 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 3d49c6d..ff6b9c9 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
 
-PV = "03.03.00.14C"
+PV = "03.03.00.14D"
 INC_PR = "r0"
 PE = "1"
 
@@ -13,8 +13,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.14C"
-CSL_SRCREV = "e0e88283f3c9c5afd5b1fd93986f2a67186f5b13"
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.14D"
+CSL_SRCREV = "192be8698c81d31ba096892ca252a25089923823"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
1.9.1


