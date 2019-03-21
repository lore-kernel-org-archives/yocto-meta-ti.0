Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89937E00DB5; Thu, 21 Mar 2019 06:16:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8D4CE00D07
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:22 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGMd3105489
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174182;
	bh=JNaTjmSasXhk4fJM0ZvwfMW1WWWwXuJvB3StTKw97HM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=aICyT+YEvH4fD8o+Hp61jTnt1fyuMlSKxkXlvZa952z9wlBjS3KH0Rx91/G+XAt3f
	czY/6bado0zGBqH7Pa6RlKHHZRzC6luPLPhfTt7fuQWen519xM4qqHP/DImWkYV/xg
	IY4TrJsdZQ/EUJh/JMXqofKuUqM7QHiPBWai/En0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGMRn047610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:22 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZs025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:15:58 -0400
Message-ID: <1553174173-28679-15-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 14/29] pm-lld-rtos: SRCREV update to 01.08.00.21 & 01.04.00.05C (for ti33x, ti43x, k2g)
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:50 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index e11231a..33ed5ff 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -20,19 +20,19 @@ PM_LLD_GIT_BRANCH_k2g = "int_pm_am335x"
 
 PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.20"
-PM_LLD_SRCREV = "bcff5a6436275b225636e8604f8bb5c11c1bdb4c"
+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.21"
+PM_LLD_SRCREV = "73d6a8536a420de7e7c40a4f3fd49e9e3b93ac6a"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05B"
-PM_LLD_SRCREV_ti33x = "bac16125842f08d05156dccabec74947756d831b"
-PM_LLD_SRCREV_ti43x = "bac16125842f08d05156dccabec74947756d831b"
-PM_LLD_SRCREV_k2g = "bac16125842f08d05156dccabec74947756d831b"
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05C"
+PM_LLD_SRCREV_ti33x = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
+PM_LLD_SRCREV_ti43x = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
+PM_LLD_SRCREV_k2g = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
 
 BRANCH = "${PM_LLD_GIT_BRANCH}"
 SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.08.00.20"
+PV = "01.08.00.21"
 PR = "r0"
 
 S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


