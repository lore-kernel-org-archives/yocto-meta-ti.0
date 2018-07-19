Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E21BE010F0; Thu, 19 Jul 2018 10:24:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A838E01548
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOXIZ130808
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021073;
	bh=4p1AMq0d1cY7n3CfNEPllX18AZWCiLZCBSJpib1JFXc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wMDBzeETLTGJld8dNc41j3E6PCIrLWXzfD7UuGuTD/wB41QNe8lSzMcnPF/heh/8s
	skphOadJk6p49tFXY0YjST6uMpQ44gz2BUHa3d8UVDjN6qFoeGS5cEgETdg81FlXZ+
	muyiN+9t+sHQZxLVxSvgoRSyOvfAOIQUuzl3jbIw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOX4m011678
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:33 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:32 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOOSD023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:32 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:24:16 -0400
Message-ID: <1532021058-48916-44-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 43/45] vps-lld-rtos: Update to version 1.0.1.11A
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
index 88f79e1..f771aa2 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -13,14 +13,14 @@ VPS_LLD_GIT_PROTOCOL = "git"
 VPS_LLD_GIT_BRANCH = "master"
 VPS_LLD_GIT_DESTSUFFIX = "git/ti/drv/vps"
 
-# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.06B"
-VPS_LLD_SRCREV = "58729317b65bdb24d4343cbb1f7f6cb90ca2faf0"
+# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.11A"
+VPS_LLD_SRCREV = "a62dab146b2c41259ce334b804e44f49767767da"
 
 BRANCH = "${VPS_LLD_GIT_BRANCH}"
 SRC_URI = "${VPS_LLD_GIT_URI};destsuffix=${VPS_LLD_GIT_DESTSUFFIX};protocol=${VPS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${VPS_LLD_SRCREV}"
-PV = "01.00.01.06B"
+PV = "01.00.01.11A"
 PR = "r0"
 
 S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


