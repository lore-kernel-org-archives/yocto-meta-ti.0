Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BECB0E00D8C; Tue,  6 Aug 2019 11:54:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D3B6E00D8C
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:39 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IsdcP025520
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117679;
	bh=K3codtwSs1XqueaSv0PQTfYb2k9I7X7zyr7TzK8v2ZE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kvAnTObavPXKEgHlvumFBpJ2/sAkMiZgAOKxPr5zvmzK2R6l4jXXY7W2nlwUGbu4n
	N844GkFOr8pOigyWTStskobUPpTrMo+HYmmh86VAthaBmvXmef22oT1/aZtgqtJhak
	nNA/o3k0pNgw4hAyFUP87q6Xw4qFyeW3oxc4aeiM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IsddB063946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:39 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:39 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFo070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:39 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:13 -0400
Message-ID: <1565117660-52661-19-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 18/25] traceframework: SRCREV udpate to 01.01.01.09A
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:42 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/traceframework/traceframework.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
index 8eae719..33b87d9 100644
--- a/recipes-bsp/traceframework/traceframework.inc
+++ b/recipes-bsp/traceframework/traceframework.inc
@@ -9,14 +9,14 @@ TRACEFRAMEWORK_GIT_PROTOCOL = "git"
 TRACEFRAMEWORK_GIT_BRANCH = "master"
 TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
 
-# Below commit ID corresponds to "DEV.TFWK-01.01.01.09"
-TRACEFRAMEWORK_SRCREV = "47100a261788ffc55cc25d3b2d62f11434b31fc9"
+# Below commit ID corresponds to "DEV.TFWK-01.01.01.09A"
+TRACEFRAMEWORK_SRCREV = "b7aa8d91901d1aabe2e56fabc3233ed66bf08819"
 
 BRANCH = "${TRACEFRAMEWORK_GIT_BRANCH}"
 SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TRACEFRAMEWORK_SRCREV}"
-PV = "01.01.01.09"
+PV = "01.01.01.09A"
 INC_PR = "r0"
 
 DEVICELIST = "k2k k2h k2e k2l"
-- 
1.9.1


