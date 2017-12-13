Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08334E00D70; Wed, 13 Dec 2017 12:21:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 740BAE00D17
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 12:21:47 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDKLk2K013141
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:21:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513196506;
	bh=KJ5oM6mCGEVe5a+jcyvOr8qj2w0xnFUN3DOuulOHlug=;
	h=From:To:Subject:Date;
	b=vFKRldtofgoFY7Ey87hQVNcw2u5fkoIQNO0tTpmPIkMp66wC9QDDTQvVGpVfxQ1PT
	yXtK3lMzTHL7JBWXA2CkOJDeeZ8scyssC3AfUhyOemI0TdsXl/8vzhx0DVs1dbWzO1
	GKlv1Met6wTPTgZ5+2DeN/lIh/qQFKZGkYzmHtTk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKLkHi005214
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:21:46 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 14:21:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 14:21:46 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKLkcs008783
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:21:46 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Dec 2017 15:21:44 -0500
Message-ID: <1513196504-15487-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] icss-emac-lld: Update to version 1.0.0.10A
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
X-List-Received-Date: Wed, 13 Dec 2017 20:21:48 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index 8e2ffd4..37ff6e0 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
 ICSS_EMAC_LLD_GIT_BRANCH = "master"
 ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
 
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
-ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.10A"
+ICSS_EMAC_LLD_SRCREV = "91f70af3714a823df4f71bde3c4d954728e07856"
 
 BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
-PV = "01.00.00.07C"
+PV = "01.00.00.10A"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


