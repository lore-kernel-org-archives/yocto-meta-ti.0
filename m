Return-Path: <tmannan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1EE9E00D83; Wed, 17 Jul 2019 11:20:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3531FE00D55
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 11:20:20 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HIKKE8095924
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563387620;
	bh=F/kLSnAn0YSsEbVSGJiGO/lq4Lx4a8RGla9rwOT6Nt0=;
	h=From:To:Subject:Date;
	b=E8KCIKhguYPzKTjeYGcJXzbc+XwDqrdGQkbFFxj0h3spzUI+NW/9W8KB0xEYv8ZWk
	nwDpoK36/nlJaMtPOCCEhDj1ORjSb2UMrUWMrX3MKU71c5byxzEapWr2H6CtOSWjC9
	lQkK72GyrlHJAWBpf5jB2goldi1OnT8oDWGABEHU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HIKK97105964
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:20:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 17 Jul 2019 13:20:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 17 Jul 2019 13:20:20 -0500
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HIKKC3042648
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:20:20 -0500
From: Tinku Mannan <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 17 Jul 2019 14:20:17 -0400
Message-ID: <1563387617-31021-1-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] profiling-rtos: SRCREV update to 1.00.00.09
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
X-List-Received-Date: Wed, 17 Jul 2019 18:20:22 -0000
Content-Type: text/plain

Signed-off-by: Tinku Mannan <tmannan@ti.com>
---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
index f578b7e..4acb5d8 100644
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -12,14 +12,14 @@ PROFILING_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
 PROFILING_GIT_PROTOCOL = "git"
 PROFILING_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.08"
-PROFILING_SRCREV = "9c30f4df9ece2d5589d5f7e977d54acf1062185c"
+# Below commit ID corresponds to "DEV.UTILS.01.00.00.09"
+PROFILING_SRCREV = "84802d7a787a53f33a24254069c90208c5d87d1e"
 
 BRANCH = "${PROFILING_GIT_BRANCH}"
 SRC_URI = "${PROFILING_GIT_URI};protocol=${PROFILING_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PROFILING_SRCREV}"
-PV = "01.00.00.08"
+PV = "01.00.00.09"
 PR = "r0"
 
 S = "${WORKDIR}/git/profiling"
-- 
2.7.4


