Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22AF8E00C14; Thu, 30 May 2019 07:44:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90B8EE00BAA
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 07:44:11 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4UEiBDC008884
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 09:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559227451;
	bh=VAliKLU3en9DSi9f1N/wKB4J6mpi91aDePGsOkzm6+U=;
	h=From:To:Subject:Date;
	b=Rt30+osGNLLZFCD24YlImxLcbaIOSkgjKD0fUixTyFN3OCKRt7Mk9NMQcucNLItA4
	IKNa0RCYjVL3Ihrh132GSl3GtDZY3DsULgLRAKIORnYTse+ktaXG0I2pTEb3dKw5e1
	C2cm7yxMdXRCBBixfPiyWP65xgMqk7fJUfwlqZoo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4UEiBah105295
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 09:44:11 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 30 May 2019 09:44:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 30 May 2019 09:44:10 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4UEiA3B024645
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 09:44:10 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 30 May 2019 10:44:07 -0400
Message-ID: <1559227447-11708-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] serdes-diag-rtos: SRCREV update to 1.0.0.12 and adding support to k3
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
X-List-Received-Date: Thu, 30 May 2019 14:44:12 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
index 6b6792e..ccb2b47 100644
--- a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://serdes_diag.h;beginline=1;endline=42;;md5=68e7ce6fdc0e9328fa7d0ec41c54420c"
 
-COMPATIBLE_MACHINE = "keystone|c66x"
+COMPATIBLE_MACHINE = "keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SERDES_DIAG_GIT_URI = "git://git.ti.com/keystone-rtos/serdes_diag.git"
@@ -13,18 +13,22 @@ SERDES_DIAG_GIT_PROTOCOL = "git"
 SERDES_DIAG_GIT_BRANCH = "master"
 SERDES_DIAG_GIT_DESTSUFFIX = "git/ti/diag/serdes_diag"
 
-# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.11A"
-SERDES_DIAG_SRCREV = "74db059c48ca5a903dab9cfbf665fd8693de8296"
+# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.12"
+SERDES_DIAG_SRCREV = "d6909d21ae9fc6b751fffa1aac761fdb088544d9"
 
 BRANCH = "${SERDES_DIAG_GIT_BRANCH}"
 SRC_URI = "${SERDES_DIAG_GIT_URI};destsuffix=${SERDES_DIAG_GIT_DESTSUFFIX};protocol=${SERDES_DIAG_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SERDES_DIAG_SRCREV}"
-PV = "01.00.00.11A"
+PV = "01.00.00.12"
 PR = "r0"
 
 S = "${WORKDIR}/${SERDES_DIAG_GIT_DESTSUFFIX}"
 
+
+# Build with make instead of XDC for k3
+TI_PDK_XDCMAKE_k3 = "0"
+
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "SERDES Diagnostics"
 
-- 
1.9.1


