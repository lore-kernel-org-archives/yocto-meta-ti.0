Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01D17E00D17; Fri, 15 Dec 2017 15:48:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D295CE00B48
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 15:48:13 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFNmDcv011879
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 17:48:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513381693;
	bh=1Uah77h+pClIehTAqrZxDk+mXNW5uIFNoOHfAKJv1vg=;
	h=From:To:Subject:Date;
	b=Ug/R6VJ29FFLMHgnEqN1d1PbEO7s/wM3H4lwTHZpMN09831HUMfLZneWwv/vipm/N
	5UUgcgyAJrMWD9n0KsBC7i/ed97sRfStiffYb7hHJ+c0EQCNxT8OdwRjXt2XkyX59U
	mi3AspaS598mopxWoNPhGKxbVbAE3XLpCW525A3M=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFNmD10013684
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 17:48:13 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 17:48:12 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 17:48:12 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFNmCdM000469
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 17:48:12 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Dec 2017 18:48:11 -0500
Message-ID: <1513381691-18078-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] serdes-diag-rtos: Update to version 1.0.0.9
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
X-List-Received-Date: Fri, 15 Dec 2017 23:48:15 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
index c14d1be..415f787 100644
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
@@ -13,14 +13,14 @@ SERDES_DIAG_GIT_PROTOCOL = "git"
 SERDES_DIAG_GIT_BRANCH = "master"
 SERDES_DIAG_GIT_DESTSUFFIX = "git/ti/diag/serdes_diag"
 
-# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.08"
-SERDES_DIAG_SRCREV = "a2961be1e6fca2e4aedcbf108d7932a67a5bd189"
+# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.09"
+SERDES_DIAG_SRCREV = "22c47cc6e1784a3d2813424da5b469e4168659a6"
 
 BRANCH = "${SERDES_DIAG_GIT_BRANCH}"
 SRC_URI = "${SERDES_DIAG_GIT_URI};destsuffix=${SERDES_DIAG_GIT_DESTSUFFIX};protocol=${SERDES_DIAG_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SERDES_DIAG_SRCREV}"
-PV = "01.00.00.08"
+PV = "01.00.00.09"
 PR = "r0"
 
 S = "${WORKDIR}/${SERDES_DIAG_GIT_DESTSUFFIX}"
-- 
1.9.1


