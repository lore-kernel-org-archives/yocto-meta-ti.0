Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B290BE00C5B; Fri, 13 Apr 2018 10:12:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B54E3E00B65
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 10:12:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3DHCjIm012787
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523639565;
	bh=a9MmdRzxiei8Iz9PVyB43UtmGsMq5jwLxNnmL0uJRho=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b3VJtYWtVTfKZk40AIUHidLGJq3ihbxoUFnQHPguPpT3WnT0q5M6Z/Hd9ZWkKsybb
	R1h1vkOnSAEECdGUGs0UY4X4S3s3/zrmOzRPO0Oz1KfLbpFiB59sy5ip/CXL3Y6S2z
	QafyH5wgdRNi2KxjtsDfoJ6Jj/+5z8R2mSiT04Zs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCjic012434
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:45 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 13 Apr 2018 12:12:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 13 Apr 2018 12:12:45 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCfMB020225;
	Fri, 13 Apr 2018 12:12:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Apr 2018 13:02:09 -0400
Message-ID: <1523638939-28861-14-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 13/23] pm-lld-rtos: Updating to version 01.04.00.04 & 01.08.00.17 for am57xx/dra7xx
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
X-List-Received-Date: Fri, 13 Apr 2018 17:12:46 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 4bf0355..45a1ef4 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -16,19 +16,19 @@ PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
 PM_LLD_GIT_BRANCH_am57xx-evm = "master"
 PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.03"
-PM_LLD_SRCREV = "7a4d80a607e7ef57015fcebc5c4b6a2ff9c9d26a"
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.04"
+PM_LLD_SRCREV = "1c0cae9b001137f68f34bf9168d7c3fa9036b1a6"
 
-# Below commit ID corresponds to "REL.PDK.TDA.01.08.00.17"
-PM_LLD_SRCREV_dra7xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
-PM_LLD_SRCREV_am57xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.17"
+PM_LLD_SRCREV_dra7xx-evm = "720f7df19f1b34cd72d8d3937baf5ff0011fd5dd"
+PM_LLD_SRCREV_am57xx-evm = "720f7df19f1b34cd72d8d3937baf5ff0011fd5dd"
 
 
 BRANCH = "${PM_LLD_GIT_BRANCH}"
 SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.04.00.03"
+PV = "01.04.00.04"
 PR = "r0"
 
 S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-- 
2.7.4


