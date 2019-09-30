Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22CB5E00B33; Mon, 30 Sep 2019 10:07:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84A41E00A93
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 10:07:02 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UH718u075923
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 12:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569863221;
	bh=1c6vE0TRI2mWnL97AoviToNw2MUeIv7W2aSHAXEKcUI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TPVIJNL4LhxSPNuYN1LiU7KkULmlf9QwRLRfzOPxg7f/JHxOeyko+CK4cJJphaV+q
	m4BdELtGTB3kMMI+3Y0Nar1bKz89lY/BrbhxuSw0W81h5R/uErO3ooKQ8lf+k6KrFJ
	GbMCG+tNG2UtyD05ZyfNv7vRBK1Tv8Hky5l9rhGs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UH714B116430
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 12:07:01 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 12:07:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 12:07:01 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UH71X1102204;
	Mon, 30 Sep 2019 12:07:01 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8UH70Z07625; Mon, 30 Sep 2019 12:07:00 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 30 Sep 2019 12:08:48 -0500
Message-ID: <20190930170848.15757-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930170848.15757-1-g-tammana@ti.com>
References: <20190930170848.15757-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Erick Narvaez <e-narvaez@ti.com>
Subject: [thud][PATCH 2/2] ti-img-rogue-driver: Update srcrev to pick latest changes
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
X-List-Received-Date: Mon, 30 Sep 2019 17:07:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Picks the following changes
  - Fix dma-api warnings
  - Add flags to support guest instance

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Erick Narvaez <e-narvaez@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index 986d0137..f412d6aa 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
 "
 S = "${WORKDIR}/git"
 
-SRCREV = "2d0f0959c1e449de0c38ce988881437f7d5fcf65"
+SRCREV = "f718a8251eb02c2493a2361c509a29ce634beadc"
 
 PVR_SOC = "j721e_linux"
 PVR_BVNC = "22.104.208.318"
-- 
2.23.0


