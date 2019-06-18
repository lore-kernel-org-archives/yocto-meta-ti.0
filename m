Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50ECDE00D98; Tue, 18 Jun 2019 12:16:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B354FE00D4C
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 12:16:21 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGLn7089321
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560885381;
	bh=enTJRwkFS6Zusg+4PpDSn4K+CYJgHU8vZ7f7Cr/HtMA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zOvP6N9FMM327q23E8fG12kVMR3y5QRRd9iDsKTSEq2/zYl1E8zxduvN+7ECj/ta7
	yGWp+9LXXXOv30NLPABn2MxjK/TtD7+Al2EhuqB2NQ4hfd1Cc0B/mbBJUdA33fUBS5
	0vuC8+XNDCr6ifRAvL5m2h/sDZY3LBwE9gUvRRBQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IJGLdQ092888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:21 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 14:16:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 14:16:20 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGKUY113016;
	Tue, 18 Jun 2019 14:16:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jun 2019 15:00:14 -0400
Message-ID: <1560884418-23216-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
References: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: [master/thud][PATCH 1/5] emac-lld-rtos: update to version 01.00.03.15
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
X-List-Received-Date: Tue, 18 Jun 2019 19:16:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
index efa4528..e451b75 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -12,14 +12,14 @@ EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
 EMAC_LLD_GIT_PROTOCOL = "git"
 EMAC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.14B"
-EMAC_LLD_SRCREV = "9ad95cde88aae23aaedf95d2146cab4a388e70d3"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.15"
+EMAC_LLD_SRCREV = "6838a58d68ebc72e9225663b3529a096baa2d1eb"
 
 BRANCH ="${EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${EMAC_LLD_SRCREV}"
-PV = "01.00.03.14B"
+PV = "01.00.03.15"
 PR = "r0"
 
 DEPENDS_append = " board-rtos osal-rtos"
-- 
2.7.4


