Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84643E00D60; Thu, 21 Mar 2019 06:18:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C05E0E00D61
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:25 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGPtt080889
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174185;
	bh=Cd7SprRTz9k5TstwqR/L2x7jdMxNydzbAnwDecQtGLg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ufr3729X2yLJeG1W4pSHKOAxOJl/5AcvmNBfiQQiwlSQrFaujlNrlpeAFZZ2/e8ex
	Q8L/nRQ3FnBlhk6QV4NVeS4+T97JD4nxZZSAWbIQnvqhnJPAh5BU3ekxJuQ8/3GOJr
	KfdMCSU0gRn7OF+f+ZnpQ7+XFsEA1Tw7nD8zt1K0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGP2L066944
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:25 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHa5025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:24 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:16:09 -0400
Message-ID: <1553174173-28679-26-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 25/29] vps-lld-rtos: SRCREV update to 01.00.01.13A
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
X-List-Received-Date: Thu, 21 Mar 2019 13:18:42 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
index 8516fa6..a06aae4 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -13,14 +13,14 @@ VPS_LLD_GIT_PROTOCOL = "git"
 VPS_LLD_GIT_BRANCH = "master"
 VPS_LLD_GIT_DESTSUFFIX = "git/ti/drv/vps"
 
-# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.13
-VPS_LLD_SRCREV = "58020ff07c993e6efe01d78531bc7459b9edeaf2"
+# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.13A"
+VPS_LLD_SRCREV = "f6d7c1f9cee42da1368e6414b4feeb84227d620e"
 
 BRANCH = "${VPS_LLD_GIT_BRANCH}"
 SRC_URI = "${VPS_LLD_GIT_URI};destsuffix=${VPS_LLD_GIT_DESTSUFFIX};protocol=${VPS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${VPS_LLD_SRCREV}"
-PV = "01.00.01.13"
+PV = "01.00.01.13A"
 PR = "r0"
 
 S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


