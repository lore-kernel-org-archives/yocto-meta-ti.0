Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC9FAE0098A; Mon, 16 Sep 2019 08:09:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E794E006B6
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 08:09:08 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GF98pu077299
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568646548;
	bh=nN0ZpXL+drQOCPiY1VsA8b4pYhbhWJTrXqFmT+fPxA0=;
	h=From:To:Subject:Date;
	b=TcptDZSkGuBIqd0P0MWKm2ZShf+bDD7rO4R3F2qLqSIwCRII7CMkka1cgFnynfEzI
	vel5wDmrPuoc5ByGvaA9wAS7wuo4qp0jFksjjZ+dk+ngZn0hXJY8TAcQzEb9Ffjgbd
	CbVHgpEaViT1AqGPDwEOFxY/5lSKlPF+4GeGa8BA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GF981L036686
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:09:08 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 10:09:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 10:09:05 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GF9706016497
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:09:08 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 16 Sep 2019 11:09:05 -0400
Message-ID: <1568646545-28643-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ibl-boot-rtos: SRCREV bump to address b2ccs utils packaging issue on windows
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
X-List-Received-Date: Mon, 16 Sep 2019 15:09:09 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
index b70ea6c..59b75b3 100644
--- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
+++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
@@ -19,10 +19,17 @@ COMPATIBLE_MACHINE = "c66x"
 
 CLEANBROKEN = "1"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/ibl.git;protocol=git;branch=${BRANCH}"
-SRCREV = "8a3c14da3f0808854367cae38afe9d47ab80dce6"
-PR = "r1"
+IBL_BOOT_GIT_URI = "git://git.ti.com/keystone-rtos/ibl.git"
+IBL_BOOT_GIT_PROTOCOL = "git"
+IBL_BOOT_GIT_BRANCH = "master"
+IBL_BOOT_SRCREV = "ed3f0989d8cdc813b7ca1ed899c4d84b63de3a75"
+
+BRANCH = "${IBL_BOOT_GIT_BRANCH}"
+SRC_URI = "${IBL_BOOT_GIT_URI};protocol=${IBL_BOOT_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${IBL_BOOT_SRCREV}"
+
+
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
@@ -33,8 +40,8 @@ IBLTARGETS_c665x-evm = "evm_c6657_i2c"
 IBLTARGETS_c667x-evm = "evm_c6678_i2c"
 
 IBLENDIAN = ""
-IBLENDIAN_c665x-evm = "little big"
-IBLENDIAN_c667x-evm = "little big"
+IBLENDIAN_c665x-evm = "little"
+IBLENDIAN_c667x-evm = "little"
 
 export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
 export TOOLSC6X="${C6X_BASE_DIR}"
-- 
1.9.1


