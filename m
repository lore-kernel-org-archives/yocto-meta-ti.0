Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BC99E00B53; Tue, 13 Jun 2017 10:42:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32343E00B47
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 10:42:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5DHg517013748
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 12:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497375725;
	bh=iiaTJmPJovwrbOZWf95xV9+H69B5t0pFUgrDGEEuWCw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k8CCJFuCT2Q1rF5yQ0xU+cWC3+qfDtfxwBiHyV3MQtSwaLi2x+qEnUQs8qh1cNelC
	xn84XfGulnFAQ/tUFV4wOI4jW9Hdi0s/3IBSulcmtMLB4Kfq1vfGzM+FUPWq0FtwGZ
	ugwq6zjauVKptC02AaqamPikjMBdmVExf1puVB8U=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5DHg58A002117
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 12:42:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Jun 2017 12:42:04 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5DHg4W7005441;	Tue, 13 Jun 2017 12:42:04 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [128.247.59.156])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v5DHg4324143; Tue, 13 Jun 2017 12:42:04 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Jun 2017 12:41:57 -0500
Message-ID: <20170613174157.26538-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170613174157.26538-1-dmurphy@ti.com>
References: <20170613174157.26538-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] uboot-ti-staging: update to ti2017.02-rc4 tag
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
X-List-Received-Date: Tue, 13 Jun 2017 17:42:09 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index 73aec1c4..4e4b9ab7 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r5"
+PR = "r6"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "40e76546f34e77cf12454137a3f16322b9610d4c"
+SRCREV = "9df421e2401f973b299547db063e2f30fcd62648"
-- 
2.12.2


