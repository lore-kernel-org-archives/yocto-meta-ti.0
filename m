Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07EC7E00D8E; Wed, 18 Sep 2019 11:36:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F321E00C87
	for <meta-ti@yoctoproject.org>; Wed, 18 Sep 2019 11:36:52 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IIaqfc011223
	for <meta-ti@yoctoproject.org>; Wed, 18 Sep 2019 13:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568831812;
	bh=l3EaDVcDb2aotL9Y6O5qsWCPC2iCHCK6XaHLjTw+VBc=;
	h=From:To:Subject:Date;
	b=yhbXTC6oWVN9VEoH3kC+gDXTz1boczQ8+CrxJT+SeUq1PJWJxhsBZi366dzpMkBBt
	6rxt68fQCCRkmkBj4w9Qs6wF5EQuGQBdHwTHQOibKU7moDVKE7r9ZjWMp5D4+B/Kac
	oLOl9h5kNNewSNvQFPc6eeKGXQ2h8TrlNAt6rE5U=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IIaqmq017036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 18 Sep 2019 13:36:52 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 13:36:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 13:36:48 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IIapt5035415
	for <meta-ti@yoctoproject.org>; Wed, 18 Sep 2019 13:36:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 18 Sep 2019 14:36:50 -0400
Message-ID: <1568831810-52021-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] sciclient-rtos: SRCREV update
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
X-List-Received-Date: Wed, 18 Sep 2019 18:36:55 -0000
Content-Type: text/plain

---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index a8dcd56..3453bc9 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -13,14 +13,14 @@ SCICLIENT_GIT_PROTOCOL = "git"
 SCICLIENT_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.03"
-SCICLIENT_SRCREV = "c593925c3d9aecf18a8a1834d0eb098851457098"
+SCICLIENT_SRCREV = "c11ceefc4e4ca820aa1e76292af71680f90e7a63"
 
 BRANCH = "${SCICLIENT_GIT_BRANCH}"
 SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SCICLIENT_SRCREV}"
 PV = "01.00.00.03"
-PR = "r1"
+PR = "r2"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
 
-- 
1.9.1


