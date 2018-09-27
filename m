Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8441E00C7E; Thu, 27 Sep 2018 13:44:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 495ACE00C70
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:43:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKhh5p071862
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081023;
	bh=SzA2IYBsW7x3ZjKaCao1Gg5u2FDC+UF08l3BTPpNywo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yTmntYlPeOlm5T/jrU5KIfgYbL7P7T0DYXtL/Wsc5URx99XSC4pHhvFq1ce9SNxm3
	yRcnuzjoMP0vOkoV/W4RTnWZ1fD9vq5WALBghsetaCdOnKNPSrdrGzym0mCwWpdsNj
	xWy3Q/qrBCWTA7a/8utde76bRTdwmG+/4Qo84Rdw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhgId030661
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:42 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:43:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:43:42 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhbiS003847
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:42 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 16:43:26 -0400
Message-ID: <1538081009-52859-28-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 27/30] vps-lld-rtos: Updated to version 01.00.01.13
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
X-List-Received-Date: Thu, 27 Sep 2018 20:44:05 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
index f771aa2..8516fa6 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -13,14 +13,14 @@ VPS_LLD_GIT_PROTOCOL = "git"
 VPS_LLD_GIT_BRANCH = "master"
 VPS_LLD_GIT_DESTSUFFIX = "git/ti/drv/vps"
 
-# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.11A"
-VPS_LLD_SRCREV = "a62dab146b2c41259ce334b804e44f49767767da"
+# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.13
+VPS_LLD_SRCREV = "58020ff07c993e6efe01d78531bc7459b9edeaf2"
 
 BRANCH = "${VPS_LLD_GIT_BRANCH}"
 SRC_URI = "${VPS_LLD_GIT_URI};destsuffix=${VPS_LLD_GIT_DESTSUFFIX};protocol=${VPS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${VPS_LLD_SRCREV}"
-PV = "01.00.01.11A"
+PV = "01.00.01.13"
 PR = "r0"
 
 S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


