Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BAFCE00D88; Tue,  1 Oct 2019 17:04:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E938E00D68
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 17:04:22 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9204MWV075142
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569974662;
	bh=6hmExhp1TjXOxOVtSuypmzBfr8eh/6ypJsGt3378rOA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J+Dye3H7VymPUUhmT/8bheWMwciioAdxwan7eCtCaLeACbvFLGOFCaZwcm6Bff/qq
	hNSgxxGr22/V3RD4yIxp2IAbAukedtebzgkVD/dmKf4EViwGpeDiYrFgBbBW6WVWet
	gQiOrII6+G90V5XJnnxmAe77myzCvsJAGFVlUq1o=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9204Mw9093694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 19:04:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 19:04:11 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204JGY007494
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 20:03:54 -0400
Message-ID: <1569974651-63945-11-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 10/27] mmap-lld: SRCREV update to 02.00.00.08C
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
X-List-Received-Date: Wed, 02 Oct 2019 00:04:23 -0000
Content-Type: text/plain

---
 recipes-bsp/mmap-lld/mmap-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index 7afae4a..7e11a4c 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -9,14 +9,14 @@ MMAP_LLD_GIT_PROTOCOL = "git"
 MMAP_LLD_GIT_BRANCH = "master"
 MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
 
-# Commit correspond to DEV.MMAP.02.00.00.08B
-MMAP_LLD_SRCREV = "20543aff912f03640ec607e3bcef1aaac6b532b6"
+# Commit correspond to DEV.MMAP.02.00.00.08C
+MMAP_LLD_SRCREV = "62e75191ab7144604102dabaa288c5fd5048fc49"
 
 BRANCH="${MMAP_LLD_GIT_BRANCH}"
 SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${MMAP_LLD_SRCREV}"
 
-PV = "2.0.0.8B"
+PV = "2.0.0.8C"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
-- 
1.9.1


