Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F3BDE00C81; Mon,  9 Sep 2019 10:16:12 -0700 (PDT)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3308E008E3
	for <meta-ti@yoctoproject.org>; Mon,  9 Sep 2019 10:16:11 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89HGBUh003784
	for <meta-ti@yoctoproject.org>; Mon, 9 Sep 2019 12:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568049371;
	bh=K7xjy5aa5ajv9URQWFL2bkPKoW+LIRuogc0QxPX/ZGs=;
	h=From:To:CC:Subject:Date;
	b=ki/E9YvSNf0R1nuF1CB41IUMu4jKhW23jW97v7O4UrhXi823yc9MwLlUTNzq/eYZ0
	u01BcLp2VhKLZe44xUQV7BCUmFKpHi72e23PhUM9+zBab4CxYYxlee5c1idX1TgRcW
	hcv2Yoc8RVJIWcsUcwxgzVU+3hwAAjtX/8GRbVso=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89HGBWq050278
	for <meta-ti@yoctoproject.org>; Mon, 9 Sep 2019 12:16:11 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 9 Sep 2019 12:16:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 9 Sep 2019 12:16:10 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89HGAHq060319;
	Mon, 9 Sep 2019 12:16:10 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x89HGAZ08836; Mon, 9 Sep 2019 12:16:10 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 9 Sep 2019 12:17:57 -0500
Message-ID: <20190909171757.13864-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Erick Narvaez <a0226667@ti.com>
Subject: [thud][PATCH] ti-img-rogue-driver: Update src to pick virt changes
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
X-List-Received-Date: Mon, 09 Sep 2019 17:16:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Virtualization support is added to the driver. Updating srcrev here to
pick the relevant sources.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index fcf35edc..067c3b69 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -20,7 +20,7 @@ BRANCH = "linuxws/thud/k4.19/${PV}"
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "1531b98ba602911359bfded2d683e49b3c731313"
+SRCREV = "12594852f8a46ead75b5ce3309372e4a1054be05"
 
 PVR_SOC = "j721e_linux"
 PVR_BVNC = "22.104.208.318"
-- 
2.23.0


