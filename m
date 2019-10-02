Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81646E00D72; Tue,  1 Oct 2019 17:04:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3EFDE00CB9
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 17:04:20 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9204Ko6033948
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569974660;
	bh=UYRYiNDNKUZugjx27xM3CO99poxJ85ljdPwBwahm4SM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ttaR+Haq3t72kKbkoCjqBYOdm+o0gZGibIJNqD26xmLLpjM/i+8OnDojCbtIfoopM
	Y1pHcm8e90S2JY3ACfC1jI3LmwBWAFXWp8ZYDpJ5qpySHpNwnrDB6Om+Nge/o17Mad
	fN1juagv0yZ/nsKo+jDhHhj51xOVhxPtuOO/i6fY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204KWD099478
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 19:04:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 19:04:10 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204JGR007494
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:20 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 20:03:47 -0400
Message-ID: <1569974651-63945-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 03/27] dfe-lld:SRCREV to 01.00.00.09A
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
X-List-Received-Date: Wed, 02 Oct 2019 00:04:21 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index 0117757..1f278a2 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -7,14 +7,14 @@ DFE_LLD_GIT_PROTOCOL = "git"
 DFE_LLD_GIT_BRANCH = "master"
 DFE_LLD_GIT_DESTSUFFIX = "git/ti/drv/dfe"
 
-# Below commit ID corresponds to "DEV.DFE_LLD.01.00.00.09"
-DFE_LLD_SRCREV = "da6a84069837b5c9b7a4bdb8824d8a4295866b14"
+# Below commit ID corresponds to "DEV.DFE_LLD.01.00.00.09A"
+DFE_LLD_SRCREV = "023af1b39ec1df7f463797cb8be94e5985dbaefd"
 
 BRANCH = "${DFE_LLD_GIT_BRANCH}"
 SRC_URI = "${DFE_LLD_GIT_URI};destsuffix=${DFE_LLD_GIT_DESTSUFFIX};protocol=${DFE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${DFE_LLD_SRCREV}"
 
-PV = "1.0.0.9"
+PV = "1.0.0.9A"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l"
-- 
1.9.1


