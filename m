Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 668D2E00C46; Mon, 30 Sep 2019 16:38:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43F13E00B33
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 16:38:26 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UNcQUT056949
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 18:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569886706;
	bh=KI6WnEtlEmhmGAuvavnjEVYZtK9j8wU7LDp7fs0iFZk=;
	h=From:To:CC:Subject:Date;
	b=yOBIMkcPGqVWZpRIsMO2hX+vJOgVdi8pv/5BcQio9BTs6Z0nKInPVb26sKFBMcGo+
	pOCZczd3xp4mgezz0htnt4cvSrlFefeRBm3psBc0OmnX3Iu7nRIY0EXzs1CxndJoHP
	a15vn+xc8v5teXDDMw1SReoySvpXpry4WNUGMtUU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UNcQ9F087128
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 18:38:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 18:38:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 18:38:26 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UNcQcS125410;
	Mon, 30 Sep 2019 18:38:26 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8UNcPZ09883; Mon, 30 Sep 2019 18:38:25 -0500 (CDT)
From: Suman Anna <s-anna@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 30 Sep 2019 18:38:22 -0500
Message-ID: <20190930233822.31836-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Suman Anna <s-anna@ti.com>
Subject: [thud/master PATCH] pru-icss: fix build warnings for j7-evm
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
X-List-Received-Date: Mon, 30 Sep 2019 23:38:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The rpmsg-echo firmwares are not supported for Tx_PRU cores on
J721E SoCs, these cores only support the Halt images. So suppress
the build warnings around Tx_PRU rpmsg-echo firmwares by limiting
the default ALTERNATIVES and updating the list for just the
pru-icss-halt package.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Incremental fix for
 [thud]   1a83bdda9038 ("pru-icss: add J721E Support")
 [master] 494495c4577f ("pru-icss: add J721E Support")

 recipes-bsp/pru/pru-icss_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index b2642fbcc821..6508b6c2bcf3 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-pa
 SRCREV = "1ff0393b3b9454fe9c58399c1b5d2db511e8049c"
 
 PV = "5.5.0"
-PR = "r0"
+PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
@@ -165,7 +165,7 @@ PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
-PRU_ICSS_ALTERNATIVES_j7-evm   = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
+PRU_ICSS_ALTERNATIVES_j7-evm   = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
@@ -215,6 +215,9 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
 # Create the pru-icss-halt firmware alternatives
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
+# Only Halt firmware images are supported for the Tx_PRU cores
+ALTERNATIVE_pru-icss-halt_append_j7-evm = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
+
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
 
-- 
2.23.0


