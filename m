Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 286BFE00DA9; Sun,  6 Oct 2019 09:52:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05745E008D9
	for <meta-ti@yoctoproject.org>; Sun,  6 Oct 2019 09:52:55 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x96GqtwU100613
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570380775;
	bh=7iRRTmlM0nMl9sP4vVeKCnh2X1xbTX5cUna76Xj0j8g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QaburywewPoEmTcu5kp6MnUX7Bfr0fxnYcVVVEcxkDoLKxiT2V9UIGNLrSNwlpW6X
	BzK90zcoHmRfpRs2ms0Damge7Y24NJhZobZaeygJTvPWH/jRHsxVrLDB8EISNqhRKV
	pm3olcIu46WJQbPjMUmi0F9EJB9Rfs4TDMNZmi7s=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x96GqtxJ037670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 6 Oct 2019 11:52:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 6 Oct 2019 11:52:53 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x96GqsK0103999
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:55 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 6 Oct 2019 12:52:41 -0400
Message-ID: <1570380771-1351-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 03/13] emac-lld: SRCREV udpate to 01.00.03.18
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
X-List-Received-Date: Sun, 06 Oct 2019 16:52:58 -0000
Content-Type: text/plain

---
 recipes-bsp/emac-lld/emac-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
index 5a6eeb5..318be3d 100644
--- a/recipes-bsp/emac-lld/emac-lld.inc
+++ b/recipes-bsp/emac-lld/emac-lld.inc
@@ -2,8 +2,8 @@ EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
 EMAC_LLD_GIT_PROTOCOL = "git"
 EMAC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.18"
-EMAC_LLD_SRCREV = "118523ed921e79a1c105cc0f07bd04d78f8a22ce"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.18A"
+EMAC_LLD_SRCREV = "42716931cfddac093de9b5e885b0a5139f7403fb"
 
 BRANCH ="${EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -11,4 +11,4 @@ SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH
 SRCREV = "${EMAC_LLD_SRCREV}"
 
 # The LLD version
-PV = "01.00.03.18+git${SRCPV}"
+PV = "01.00.03.18A+git${SRCPV}"
-- 
1.9.1


