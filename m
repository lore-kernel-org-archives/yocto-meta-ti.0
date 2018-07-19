Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C29BE0130D; Thu, 19 Jul 2018 10:24:30 -0700 (PDT)
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
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF699E01406
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOQLL130749
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021066;
	bh=+7KdYNfFuFq6mq0xCs1mnmGTzdOH58b14B4kih5cLCo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=p3BbweASX9xQx+JR1U6X8MPnSXkI+h4RM7xyO98pXrBd8Y/k1I+5lr3gL6B1DSht4
	VVAhw/tg8xGxMmYI6FFLqosHBedIc+OdetHol95Cdamfy/eHGl1jJUm7J5N96MfTI3
	rAg1J26xcHS9d9H+HyaGi60nQfngzkU0MpyhfWpc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOQgE015384
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORW023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:35 -0400
Message-ID: <1532021058-48916-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 02/45] aif2-lld: Update to version 1.2.0.2
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:30 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/aif2-lld/aif2-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
index 9b5f279..a0f606c 100644
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -7,14 +7,14 @@ AIF2_LLD_GIT_PROTOCOL = "git"
 AIF2_LLD_GIT_BRANCH = "master"
 AIF2_LLD_GIT_DESTSUFFIX = "git/ti/drv/aif2"
 
-# The following commit correspond to DEV.AIF2LLD.01.02.00.01
-AIF2_LLD_SRCREV = "a701bbb5ed2976d5723c955c87a685f7517cffa3"
+# The following commit correspond to DEV.AIF2LLD.01.02.00.02
+AIF2_LLD_SRCREV = "e0c978cf1de9007c99a67d4683abaece1fca3617"
 
 BRANCH = "${AIF2_LLD_GIT_BRANCH}"
 SRC_URI = "${AIF2_LLD_GIT_URI};destsuffix=${AIF2_LLD_GIT_DESTSUFFIX};protocol=${AIF2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${AIF2_LLD_SRCREV}"
 
-PV = "1.2.0.1"
+PV = "1.2.0.2"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2hk"
-- 
1.9.1


