Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8684E00D97; Tue,  1 Oct 2019 17:04:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33162E00D8A
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 17:04:23 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9204Ms9010885
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569974662;
	bh=AD01Lo36UeH94egFPkmgJ/OBXdSXLRbMVfUGPrdsHM4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zUBhTmG8Kfv6ZGVAxt/sGb0wZ/e02G5VX5GSMMMBez115BF4si2fRpQSmq8cAZ6lN
	voInsQm5LQGs4xEeqHnCNsmYSsIFjIRgnILsy3E/ktaqjsi53geUvNChylouoSyaYh
	pjqdmNWwARWJfBudJtvjy2SkAoOKDFDsfB9Cabv0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204M2q099515
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:22 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 19:04:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 19:04:22 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204JGc007494
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:22 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 20:03:58 -0400
Message-ID: <1569974651-63945-15-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 14/27] pcie-lld-rtos: SRCREV update to 02.03.00.05
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
X-List-Received-Date: Wed, 02 Oct 2019 00:04:28 -0000
Content-Type: text/plain

---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
index f839ecb..51a24e7 100644
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -13,14 +13,14 @@ PCIE_LLD_GIT_PROTOCOL = "git"
 PCIE_LLD_GIT_BRANCH = "master"
 PCIE_LLD_GIT_DESTSUFFIX = "git/ti/drv/pcie"
 
-# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.04"
-PCIE_LLD_SRCREV = "6a5868f7ab46052b51644bbc1765b742528e90e0"
+# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.05"
+PCIE_LLD_SRCREV = "3cdbb5e4e4ccced496a4ca91b203965fafffc3e9"
 
 BRANCH = "${PCIE_LLD_GIT_BRANCH}"
 SRC_URI = "${PCIE_LLD_GIT_URI};destsuffix=${PCIE_LLD_GIT_DESTSUFFIX};protocol=${PCIE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PCIE_LLD_SRCREV}"
-PV = "02.03.00.04"
+PV = "02.03.00.05"
 PR = "r0"
 
 DEPENDS_append_k3 = " udma-lld-rtos \
-- 
1.9.1


