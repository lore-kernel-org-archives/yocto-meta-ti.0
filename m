Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C151DE00DAF; Thu, 21 Mar 2019 06:16:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60A76E00C45
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:22 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGMAc080856
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174182;
	bh=Pyu43bubgXPBrdR/gj5Qym+e/9ynLjXH9FNBQFSL/34=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UskAahTileKnw36zLgVl6zTNd/uj/km+XCb8reSXON7qscTj/sA1/73lCIeRboYRb
	CO4HF4YddqkdMcjS4jRNhVMXMBEU5WyYif3qluXjQG+q1wtG0WsEn4MbgHXAW6plo4
	+ohuIGGDbcO0BTWFIHvsPaBV2QTtCMGvkvn5x/bA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGMWT047604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:22 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:21 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZr025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:15:57 -0400
Message-ID: <1553174173-28679-14-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 13/29] pcie-lld-rtos: SRCREV update to 02.03.00.03
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:32 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
index 2c57cbb..8aee7e4 100644
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -13,14 +13,14 @@ PCIE_LLD_GIT_PROTOCOL = "git"
 PCIE_LLD_GIT_BRANCH = "master"
 PCIE_LLD_GIT_DESTSUFFIX = "git/ti/drv/pcie"
 
-# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.02"
-PCIE_LLD_SRCREV = "3c6e68d77778a2e655803b8aa1c2b8ac056518b2"
+# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.03"
+PCIE_LLD_SRCREV = "202a89929d8da0ac923978145b4cc44cfafc12d5"
 
 BRANCH = "${PCIE_LLD_GIT_BRANCH}"
 SRC_URI = "${PCIE_LLD_GIT_URI};destsuffix=${PCIE_LLD_GIT_DESTSUFFIX};protocol=${PCIE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PCIE_LLD_SRCREV}"
-PV = "02.03.00.02"
+PV = "02.03.00.03"
 PR = "r0"
 
 DEPENDS_append_k3 = " udma-lld-rtos \
-- 
1.9.1


