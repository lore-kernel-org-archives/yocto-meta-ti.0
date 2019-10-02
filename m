Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92FCBE00D86; Tue,  1 Oct 2019 17:04:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1375E00DA3
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 17:04:26 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9204POI033986
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569974665;
	bh=HjOBHWbf0A65vna0qLpy9kjhlbgUrWKPQwr1tKiy9G0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YRVUbCCdK1XWHKT6fJBaeUqRbaWtvKiYCqJf7FR4veQqRXF8wCZ/wyaIEz59Kvtr7
	QNVhIDnLFzSaPryc5WNQ5uIU9wS9Z+7t/kiCKlyXJQMBG6E8V+NOb0lm6tMbyVrK7C
	TLvtKkpvk0M8cO/YoKguxyf9ltVP5ravE/p1r6i8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9204PK1093775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:25 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 19:04:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 19:04:14 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204JGn007494
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:24 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 20:04:09 -0400
Message-ID: <1569974651-63945-26-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 25/27] profiling-rtos: SRCREV update to 01.00.00.10
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
X-List-Received-Date: Wed, 02 Oct 2019 00:04:32 -0000
Content-Type: text/plain

---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
index 4acb5d8..134a0f9 100644
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -12,14 +12,14 @@ PROFILING_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
 PROFILING_GIT_PROTOCOL = "git"
 PROFILING_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.09"
-PROFILING_SRCREV = "84802d7a787a53f33a24254069c90208c5d87d1e"
+# Below commit ID corresponds to "DEV.UTILS.01.00.00.10"
+PROFILING_SRCREV = "dbd2683d80326165d078282b1ef7dce44667e972"
 
 BRANCH = "${PROFILING_GIT_BRANCH}"
 SRC_URI = "${PROFILING_GIT_URI};protocol=${PROFILING_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PROFILING_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.10"
 PR = "r0"
 
 S = "${WORKDIR}/git/profiling"
-- 
1.9.1


