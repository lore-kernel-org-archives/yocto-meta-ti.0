Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EA1CE014F7; Thu, 19 Jul 2018 10:24:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37023E01548
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHORFX022004
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021067;
	bh=EGkoB1ZXMWc2iN8/Lb+wnzmgCjZ8vMlEHuj7sUgDHnM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NJPmF+BD34F2INtfEDCjQImHmIse0pim7OUxUFcOVra99zChwuiu3UQdSfRZLldDH
	0F1YWXetC1EZ58vsrShWgwdj94mJjBC5HcZ6RIdKMZe+x4YFvh9FOhXb7ZShCEkue8
	naAQytt7YXNd0E3ExvNe4r7PPy/gdxFVu0hCgnu4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHORKK015417
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:27 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORh023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:46 -0400
Message-ID: <1532021058-48916-14-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 13/45] gpio-lld-rtos: Update to version 1.0.0.11
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:33 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
index 0d1d42f..48b5437 100644
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -13,14 +13,14 @@ GPIO_LLD_GIT_PROTOCOL = "git"
 GPIO_LLD_GIT_BRANCH = "master"
 GPIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/gpio"
 
-# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.10"
-GPIO_LLD_SRCREV = "2661a410e5bc00b4769db6ef2692f680a7a42feb"
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.11"
+GPIO_LLD_SRCREV = "0b2ae7c10da0b04d9ff2a34e9c67e8d9cf8de42a"
 
 BRANCH = "${GPIO_LLD_GIT_BRANCH}"
 SRC_URI = "${GPIO_LLD_GIT_URI};destsuffix=${GPIO_LLD_GIT_DESTSUFFIX};protocol=${GPIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${GPIO_LLD_SRCREV}"
-PV = "01.00.00.10"
+PV = "01.00.00.11"
 PR = "r0"
 
 S = "${WORKDIR}/${GPIO_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


