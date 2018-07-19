Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A38FE0130D; Thu, 19 Jul 2018 10:24:38 -0700 (PDT)
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
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5793CE0172C
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOVDO130796
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021071;
	bh=MLrK53JJGzYCQWGANlDwNxKZgaQRsSmD+2o78EmWv5c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ym4GemacAjWeJHVCtLaPJp4rwc7qZhihQKlt/2LgE60ZnbG9iDIA+gkcpRisCbe/K
	GvYCp8vzHND1icyQFYga09jQmQH4bR36MBHH4na01k9PRmi2e5nyhmT6uUt1QCA/RV
	qcXhSFXC5ddZhqp/JPT/ad6z5aRWl3n4Yd2qYaLc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOVOm015515
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:31 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:31 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOOS6023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:24:09 -0400
Message-ID: <1532021058-48916-37-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 36/45] tcp3d-lld-rtos: Update to version 2.1.0.6
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
index 5ec3851..9130920 100644
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
+++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
@@ -13,14 +13,14 @@ TCP3D_LLD_GIT_PROTOCOL = "git"
 TCP3D_LLD_GIT_BRANCH = "master"
 TCP3D_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
 
-# Below commit ID corresponds to "DEV.TCP3D_LLD.02.01.00.05"
-TCP3D_LLD_SRCREV = "8eb2edfc694982633e0dd01ba7b067ac9f634da9"
+# Below commit ID corresponds to "DEV.TCP3D_LLD.02.01.00.06"
+TCP3D_LLD_SRCREV = "f76b6da0a31e4232c0f728703f8dece3d8d88aaa"
 
 BRANCH = "${TCP3D_LLD_GIT_BRANCH}"
 SRC_URI = "${TCP3D_LLD_GIT_URI};destsuffix=${TCP3D_LLD_GIT_DESTSUFFIX};protocol=${TCP3D_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TCP3D_LLD_SRCREV}"
-PV = "02.01.00.05"
+PV = "02.01.00.06"
 PR = "r0"
 
 S = "${WORKDIR}/${TCP3D_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


