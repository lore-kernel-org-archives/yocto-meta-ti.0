Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 096EAE0133B; Thu, 19 Jul 2018 10:24:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0B01E01603
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOUUg022036
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021070;
	bh=JJbKoSVUhzp1DkR5TxvpjvZPKwmz+ZmhdS5EXMh3jS8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KXxwoRBYbPb7mOAUFT/I7DtPUF46qAu17hO1jC5GOcF5WtVNZWAoGJqEALDiwxvhj
	iAhObTWZzpOquIUqR8TEi44ZjLZiVCWkN+njoAeYU1svaa15cA9PQnb52zEfI8tCvQ
	Qi96TgfNvKKseHGAFzxwLJ/as0F1jn9WUxOT7MJw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOURm015472
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:30 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:29 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORv023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:29 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:24:00 -0400
Message-ID: <1532021058-48916-28-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 27/45] pm-lld-rtos: Update to version 1.4.0.5A and 1.8.0.18 (am57xx & dra7xx)
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 45a1ef4..3e4e4f7 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -16,19 +16,19 @@ PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
 PM_LLD_GIT_BRANCH_am57xx-evm = "master"
 PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.04"
-PM_LLD_SRCREV = "1c0cae9b001137f68f34bf9168d7c3fa9036b1a6"
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05A"
+PM_LLD_SRCREV = "a5f12b8210ccea4b2e8848e54b4e178534771843"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.17"
-PM_LLD_SRCREV_dra7xx-evm = "720f7df19f1b34cd72d8d3937baf5ff0011fd5dd"
-PM_LLD_SRCREV_am57xx-evm = "720f7df19f1b34cd72d8d3937baf5ff0011fd5dd"
+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.18"
+PM_LLD_SRCREV_dra7xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
+PM_LLD_SRCREV_am57xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
 
 
 BRANCH = "${PM_LLD_GIT_BRANCH}"
 SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.04.00.04"
+PV = "01.04.00.05A"
 PR = "r0"
 
 S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


