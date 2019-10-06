Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35D47E00D94; Sun,  6 Oct 2019 09:53:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B1A4E00D97
	for <meta-ti@yoctoproject.org>; Sun,  6 Oct 2019 09:52:57 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x96GquCD100618
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570380776;
	bh=41FMzPkKUcheKEH5shB3qnzBt2n8TSsgVZqzB3FvnYs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VcGVZ2L2OuQR1Ksb+oj3WV4q99yespe4xUqUUwJRj2IGdUTWyiZeRCb0v6KMmb303
	96RkSpTfYxlZjjpzpDAn5O9gx5AFJ/9Q2Y2U+ERXaKTnvs5P7XpkUzHTpX5Lfhl0sf
	Unpp0ADFWZ2pnvn9YLl9ZfmyDU2x6J1DyggfwCyg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x96Gqup1037689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:56 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 6 Oct 2019 11:52:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 6 Oct 2019 11:52:56 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x96GqsK6103999
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:56 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 6 Oct 2019 12:52:47 -0400
Message-ID: <1570380771-1351-10-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 09/13] pruss-lld: SRCREV update to 01.00.00.15A
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
X-List-Received-Date: Sun, 06 Oct 2019 16:53:01 -0000
Content-Type: text/plain

---
 recipes-bsp/pruss-lld/pruss-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
index 313254b..278a630 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -9,13 +9,13 @@ PRUSS_LLD_GIT_PROTOCOL = "git"
 PRUSS_LLD_GIT_BRANCH = "master"
 PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
 
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15"
-PRUSS_LLD_SRCREV = "b4f0059fafebef66967e6e0e5f2559de2082145a"
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15A"
+PRUSS_LLD_SRCREV = "914a5aab5080413fe848fa2903ace4d15e43699a"
 
 BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
 SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PRUSS_LLD_SRCREV}"
-PV = "01.00.00.15"
+PV = "01.00.00.15A"
 INC_PR = "r0"
 
-- 
1.9.1


