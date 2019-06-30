Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26F6FE00C94; Sat, 29 Jun 2019 19:20:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFDFFE00CB9
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 19:20:31 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5U2KVmh105157
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 21:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561861231;
	bh=29MAr80BZlW8C4e2bArlajcXUr4P2wiQYKxvlReWXdk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FY6hauuA/XRSpcdsT8cBaEFop/SGBJJhzxleoTrIl61rNrNeU8GrHMr7Ex1m+qVXn
	Q3klJ+jYuVyIdiYs2hMg+b3kbdGii0qjiNkTixzQNqhgfvclZgCDhqKsVzq9p9cS3R
	q5htuRL9R/rE8SRhRck3MMRtXM2R9svLB+NFQvXA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5U2KVKV106485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 21:20:31 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 29 Jun 2019 21:20:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sat, 29 Jun 2019 21:20:31 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5U2KUoo012570
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 21:20:30 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 29 Jun 2019 22:20:25 -0400
Message-ID: <1561861227-56564-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561861227-56564-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1561861227-56564-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/4] emac-lld-rtos: SRCREV update to 01.00.03.16A
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
X-List-Received-Date: Sun, 30 Jun 2019 02:20:34 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
index 5fd24bc..00cecd2 100644
--- a/recipes-bsp/emac-lld/emac-lld.inc
+++ b/recipes-bsp/emac-lld/emac-lld.inc
@@ -2,8 +2,8 @@ EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
 EMAC_LLD_GIT_PROTOCOL = "git"
 EMAC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16"
-EMAC_LLD_SRCREV = "f90f832dc63b60b234c3f5ae2ff4d774728e83bf"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16A"
+EMAC_LLD_SRCREV = "73511804953577ec36e893498e5d6a4542b74d5c"
 
 BRANCH ="${EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-- 
1.9.1


