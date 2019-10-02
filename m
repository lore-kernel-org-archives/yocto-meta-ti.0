Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0E3EE00DB7; Tue,  1 Oct 2019 17:04:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A2DCE00D8D
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 17:04:22 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9204LfM033963
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569974662;
	bh=TW3+4wA0EJi/oXRt++Zg6trSknlGrpefli8L3Nr2QlA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=y+KG5qQSa2NmQ4nqJWUabFlzAjeXzarwRa0xVqaNqeSZD/xXXnNKHnu2hWqdtvEjY
	fHLpS2mdPwNJXyWsjwwDVI16+EIh9xfTtWOmbErZy1oTq3yhQruwCh3KMSEqCh1o0S
	RfdNFl27GdMi8uolbAbdfnyLJwBH/tG7of68BF0k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9204LUq093687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 19:04:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 19:04:21 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204JGX007494
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 20:03:53 -0400
Message-ID: <1569974651-63945-10-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 09/27] mcasp-lld-rtos: SRCREV update to 01.01.00.15
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
X-List-Received-Date: Wed, 02 Oct 2019 00:04:30 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
index 96ff7b5..9cdef70 100644
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -13,14 +13,14 @@ MCASP_LLD_GIT_PROTOCOL = "git"
 MCASP_LLD_GIT_BRANCH = "master"
 MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
 
-# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.14"
-MCASP_LLD_SRCREV = "e9d0f50e8f18052403708974cf7f1116534ca84f"
+# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15"
+MCASP_LLD_SRCREV = "427a910bdb2b2c192de64d8d892da2a7d569b46c"
 
 BRANCH = "${MCASP_LLD_GIT_BRANCH}"
 SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MCASP_LLD_SRCREV}"
-PV = "01.01.00.14"
+PV = "01.01.00.15"
 PR = "r0"
 
 S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


