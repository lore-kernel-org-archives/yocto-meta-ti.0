Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12735E00C45; Thu, 27 Sep 2018 13:43:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EAECE0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:43:40 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKhdQl071833
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081020;
	bh=dTh6L5fqPmDlvNbxCmi2y4nEFjUHPegkwrvLsaMQEW0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YpE6nCcz8Wahn+l5Hb82yJPajQFwanYdheLnB52PAb/luDuho6m7d1LOruCoesQz5
	zrk3NpzpH6LL9/W/zEopR4cJW+E6eqSTX1c8wzUY0gIncm/HKl+FI0u1SLrFdSbSg1
	YXLPHGS9+Le2J5knRxcHHAFJ+vKUsWeYhzxUbVyw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhd20030578
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:39 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:43:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:43:39 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhbiC003847
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:39 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 16:43:10 -0400
Message-ID: <1538081009-52859-12-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 11/30] starterware: Update to version 02.01.01.08
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
X-List-Received-Date: Thu, 27 Sep 2018 20:43:56 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/starterware/starterware.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starterware/starterware.inc
index cd41ba1..9474659 100644
--- a/recipes-bsp/starterware/starterware.inc
+++ b/recipes-bsp/starterware/starterware.inc
@@ -8,14 +8,14 @@ STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
 STARTERWARE_GIT_PROTOCOL = "git"
 STARTERWARE_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.07"
-STARTERWARE_SRCREV = "965d4f71fe9bb9e5455bdcad5741dfe286217694"
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.08"
+STARTERWARE_SRCREV = "70d44f0ae67c110a5898805fca7878ae5001d22c"
 
 BRANCH = "${STARTERWARE_GIT_BRANCH}"
 SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${STARTERWARE_SRCREV}"
-PV = "02.01.01.07"
+PV = "02.01.01.08"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


