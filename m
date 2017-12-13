Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D47CEE00D6F; Wed, 13 Dec 2017 14:25:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D857E00D17
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:25:37 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDMPbd9031793
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 16:25:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513203937;
	bh=/QkFtqbq6xb6sRzoW0htrs6T36hP/ksr266E2B1Cm78=;
	h=From:To:Subject:Date;
	b=NCeGr2Qp89kQup/nNmkHwVhceCcnvUExR0TCGwaVgiD4pbsz+J/4NdW5rIoWVV4pb
	Cnrxl7AnGOA5QMZHPzjA2kJ1MKP+GqprdIK1MwM3cW3A67kf8hatcFZ1svvoonnQqg
	+iDmtG3HRmBNrHk1w2wevSFTUZ7CMUlhkpClQTmQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMPbQI018733
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 16:25:37 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 13 Dec 2017 16:25:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 16:25:37 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMPaxG029620
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 16:25:37 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Dec 2017 17:25:35 -0500
Message-ID: <1513203935-24990-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] pm-lld-rtos: Updating to version 1.4.0.3
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
X-List-Received-Date: Wed, 13 Dec 2017 22:25:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 05388e5..4bf0355 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -13,19 +13,22 @@ PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
 PM_LLD_GIT_PROTOCOL = "git"
 PM_LLD_GIT_BRANCH = "int_pm_am335x"
 PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
+PM_LLD_GIT_BRANCH_am57xx-evm = "master"
 PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.01"
-PM_LLD_SRCREV = "c4908f94b3e655e6298aa9bfe9bbffbbc5d16111"
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.03"
+PM_LLD_SRCREV = "7a4d80a607e7ef57015fcebc5c4b6a2ff9c9d26a"
+
+# Below commit ID corresponds to "REL.PDK.TDA.01.08.00.17"
+PM_LLD_SRCREV_dra7xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
+PM_LLD_SRCREV_am57xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
 
-# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"
-PM_LLD_SRCREV_dra7xx-evm = "46ea13503d2991f636197edb206a9f62cea398d4"
 
 BRANCH = "${PM_LLD_GIT_BRANCH}"
 SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.04.00.01"
+PV = "01.04.00.03"
 PR = "r0"
 
 S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


