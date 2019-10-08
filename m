Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D63CE00D83; Tue,  8 Oct 2019 13:14:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B7ABE00D86
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2019 13:14:18 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98KEIj1084308
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570565658;
	bh=xKAHasfzEZZ26jHfGxoNDpyhTZE2BpjMXISg9uEbHkQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sy0a4jTWXqlF7REr9BfrP7A591bPljIhzT085bF1vZS1KmFpNPGj5TroQpXI99rFM
	4Uvz+8nvOqKGGkiLzsV92vWaQEqbqoRlyMbd/fl9KtECycYhUi490dwu6kt0v0/00N
	BUEqk4cfnUKsOu8SAXUyHfSyY1GaLZy2ByBYxzqs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98KEIcW122529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 8 Oct 2019 15:14:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 8 Oct 2019 15:14:15 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KEG1a014809
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 8 Oct 2019 16:14:15 -0400
Message-ID: <1570565655-33346-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570565655-33346-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570565655-33346-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 5/5] transport-rtos: SRCREV update to 01.00.00.17A
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
X-List-Received-Date: Tue, 08 Oct 2019 20:14:19 -0000
Content-Type: text/plain

---
 recipes-bsp/transport-rtos/transport.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transport-rtos/transport.inc
index 0943b91..345cd6d 100644
--- a/recipes-bsp/transport-rtos/transport.inc
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -6,12 +6,12 @@ TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
 TRANSPORT_GIT_PROTOCOL = "git"
 TRANSPORT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.17"
-TRANSPORT_SRCREV = "666ec8637a16e210dd823daf7a152afe16ae229f"
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.17A"
+TRANSPORT_SRCREV = "9ed171c476a5606777d2dcb4e831c279a5160245"
 
 BRANCH = "${TRANSPORT_GIT_BRANCH}"
 SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TRANSPORT_SRCREV}"
-PV = "01.00.00.17"
+PV = "01.00.00.17A"
 INC_PR = "r0"
-- 
1.9.1


