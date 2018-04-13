Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07273E00C36; Fri, 13 Apr 2018 10:12:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F431E00C58
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 10:12:45 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3DHCiGv024594
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523639564;
	bh=bjh0zQ5eMpMEQAe8ruig6lGTO+xE1JIOQt2hsMAmfsk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jpe8GOiMn2Bo1+Shwdur0GMfr7iLl/hWfbleryXG5T7jeiqH0ZH534w3Pah624Gbs
	jQXcUdMeBkgiEfNYEK64vqK9JIZICgV/YKWNlVMOcd/TEtlktRdeulELOY7aHPnEs5
	UCYQi5XEn5FUq/s/C+GUYNylXkdeNrgP98zDIlnU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCiSS031944
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 13 Apr 2018 12:12:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 13 Apr 2018 12:12:44 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCfM9020225;
	Fri, 13 Apr 2018 12:12:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Apr 2018 13:02:07 -0400
Message-ID: <1523638939-28861-12-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 11/23] pcie-lld-rtos: Update to version 02.02.00.12
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
X-List-Received-Date: Fri, 13 Apr 2018 17:12:47 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
index d0f536b..02275f5 100644
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -13,14 +13,14 @@ PCIE_LLD_GIT_PROTOCOL = "git"
 PCIE_LLD_GIT_BRANCH = "master"
 PCIE_LLD_GIT_DESTSUFFIX = "git/ti/drv/pcie"
 
-# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.11"
-PCIE_LLD_SRCREV = "07ad9c62da03bb8b6aa65e2507deab92e56ef83a"
+# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.12"
+PCIE_LLD_SRCREV = "90c85b801cc8524deb57d897d204597b11fa26c4"
 
 BRANCH = "${PCIE_LLD_GIT_BRANCH}"
 SRC_URI = "${PCIE_LLD_GIT_URI};destsuffix=${PCIE_LLD_GIT_DESTSUFFIX};protocol=${PCIE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PCIE_LLD_SRCREV}"
-PV = "02.02.00.11"
+PV = "02.02.00.12"
 PR = "r0"
 
 S = "${WORKDIR}/${PCIE_LLD_GIT_DESTSUFFIX}"
-- 
2.7.4


