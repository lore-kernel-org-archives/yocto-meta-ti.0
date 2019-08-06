Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66125E00D77; Tue,  6 Aug 2019 11:54:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44F81E00D77
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:37 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IsbpS025498
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117677;
	bh=XpWKMmVWZAt8igRj3Gam6NU8tJX/56AG/YJD2sjGK9o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CYz/aRWBOXJcH7n0kRq9Ii5b+3L/URGrJWWFRM8iLw/xtNMgdjdZNcfyZDqjrnf/4
	H4YG9qCFYMCZL/x/nBf/6veCi1uyDebSQ+UY4H5Ln4QOwi8unCZIOKCFf27pK7dPPW
	lpD7HVHgk0yIOEsA7H1JsJaSAcATp2YXvU2O0r/g=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76Isab3058359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:36 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:36 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFc070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:01 -0400
Message-ID: <1565117660-52661-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 06/25] fftc-lld-rtos: SRCREV update to 02.02.00.07B
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
index 73666e2..9103639 100644
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -13,14 +13,14 @@ FFTC_LLD_GIT_PROTOCOL = "git"
 FFTC_LLD_GIT_BRANCH = "master"
 FFTC_LLD_GIT_DESTSUFFIX = "git/ti/drv/fftc"
 
-# Below commit ID corresponds to "DEV.FFTC_LLD.02.02.00.07A"
-FFTC_LLD_SRCREV = "7d3b64f42d190260f873b0e6d16489c65ef820b1"
+# Below commit ID corresponds to "DEV.FFTC_LLD.02.02.00.07B"
+FFTC_LLD_SRCREV = "962d899e1e81a4d02ad59368032cf24956cde5f2"
 
 BRANCH = "${FFTC_LLD_GIT_BRANCH}"
 SRC_URI = "${FFTC_LLD_GIT_URI};destsuffix=${FFTC_LLD_GIT_DESTSUFFIX};protocol=${FFTC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${FFTC_LLD_SRCREV}"
-PV = "02.02.00.07A"
+PV = "02.02.00.07B"
 PR = "r0"
 
 S = "${WORKDIR}/${FFTC_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


