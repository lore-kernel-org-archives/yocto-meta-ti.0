Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA065E01726; Thu, 19 Jul 2018 10:24:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D287BE0133B
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOQ8j130745
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021066;
	bh=TU3AkPfQ5EHPjom6QIMVzxbXNBMTx//s3UULkbfY0+0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=A0p2J2/KhZEbE2egSanqlsawsfg05x1qM4zBqtygsM/umOOfHUxGSVjUPz1eEsiEH
	CkAmJifyGJbjhU/YKMEyES/04ZbGlJAN3gHKGc1ntpoYp4Ix+vBr9ckpvy7avRpI+c
	imBTt/lLgndmY/ncCRZZSpC1rWcrebhLhhxLftCU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOQb9011520
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORZ023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:38 -0400
Message-ID: <1532021058-48916-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 05/45] cmb-addon-rtos: Update to version 1.1.0.1
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
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
index 0fade74..f8242cf 100644
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -14,11 +14,11 @@ CMB_ADDON_GIT_PROTOCOL = "git"
 CMB_ADDON_GIT_BRANCH = "master"
 CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
 
-# Below commit ID corresponds to "DEV.CMB.01.01.00.00"
-CMB_ADDON_SRCREV = "29c05572b82251bac73cd685afcffdb8549eaaaf"
+# Below commit ID corresponds to "DEV.CMB.01.01.00.01"
+CMB_ADDON_SRCREV = "d60c0887cc479abd09f014c038d0ebe1daa25dad"
 
 SRCREV = "${CMB_ADDON_SRCREV}"
-PV = "01.01.00.00"
+PV = "01.01.00.01"
 PR = "r0"
 
 BRANCH = "${CMB_ADDON_GIT_BRANCH}"
-- 
1.9.1


