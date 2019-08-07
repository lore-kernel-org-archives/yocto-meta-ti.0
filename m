Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C474E00DA4; Wed,  7 Aug 2019 15:26:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27512E00D9F
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2019 15:26:42 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77MQgb6064535
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 17:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565216802;
	bh=wn+IGnwUVm0c89pTJ6HIv0zwZV9tFJiUFE7ZgTDcKZQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hOQTuit/ypyAfAfmfz/FuGf5iKKEXRSYI8yTS0MFifL/0oM56Q6NwDjc+N5flnONC
	tWKNj7DR/6wgDCObzR8r/nkyvuFril/trI1p+qBF/Ocw5sFCVIWzqmWuW9ixpkkhbc
	X77qwI9IzccWCYT35h3QzsKm/oPzFjzipJXyWulM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77MQgLj100455
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 17:26:42 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 7 Aug 2019 17:26:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 7 Aug 2019 17:26:42 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77MQfF2114624
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 17:26:42 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 7 Aug 2019 18:26:40 -0400
Message-ID: <1565216800-63806-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565216800-63806-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565216800-63806-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] emac-lld:SRCREV bump to 01.00.03.17A
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
X-List-Received-Date: Wed, 07 Aug 2019 22:26:43 -0000
Content-Type: text/plain

---
 recipes-bsp/emac-lld/emac-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
index 55bd3ec..8abc813 100644
--- a/recipes-bsp/emac-lld/emac-lld.inc
+++ b/recipes-bsp/emac-lld/emac-lld.inc
@@ -2,8 +2,8 @@ EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
 EMAC_LLD_GIT_PROTOCOL = "git"
 EMAC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16C"
-EMAC_LLD_SRCREV = "ec4a839e5db4b351524b2162d0c5dab8a9da367b"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.17A"
+EMAC_LLD_SRCREV = "696ba15f8fc73d0138e92a9335997ab3436b228c"
 
 BRANCH ="${EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -11,4 +11,4 @@ SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH
 SRCREV = "${EMAC_LLD_SRCREV}"
 
 # The LLD version
-PV = "01.00.03.16+git${SRCPV}"
+PV = "01.00.03.17A+git${SRCPV}"
-- 
1.9.1


