Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FCBFE00D4C; Tue, 25 Jun 2019 17:08:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 824EEE00D46
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2019 17:08:13 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5Q08CIq001756
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2019 19:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561507692;
	bh=cXBtJWjvt1ooIc1Tim/EyuAGzbG9B3QKGxRd2ho0AvI=;
	h=From:To:CC:Subject:Date;
	b=NZXBQSUMID0rnsAVtaHexXPySUnPRgqtG/5AB9iFbUalTffV9Dh/75nwaO7+yZHYK
	jN8SEdGY6NZL2lBQuzgEvU4m++VzpfatA1Go+mHQ8YDu1OmVc5oSjaZkObY82n0trF
	GABkNffk6QQ0rp/BkzHCDGdkSUGosvwUWYHJg6H4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5Q08CV9053513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2019 19:08:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 25 Jun 2019 19:08:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 25 Jun 2019 19:08:12 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5Q08Ctd003630;
	Tue, 25 Jun 2019 19:08:12 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5Q08Bm04608; Tue, 25 Jun 2019 19:08:11 -0500 (CDT)
From: <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Tue, 25 Jun 2019 19:09:56 -0500
Message-ID: <20190626000956.14763-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] ti-img-rogue-driver: bump SRCREV to pick compiler error fixes
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
X-List-Received-Date: Wed, 26 Jun 2019 00:08:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Gowtham Tammana <g-tammana@ti.com>

Picks up compiler error/warning fixes on rt-linux and debug
builds.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
index 1c733628..92156e18 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -20,7 +20,7 @@ BRANCH = "linux/thud/k4.19/${PV}"
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "4dd7ff1382e7dfe6aaec8cc118b976facbc4b138"
+SRCREV = "21160dca62b4cc58cdb8600f660f15a660c7f524"
 
 PVR_SOC = "j721e_linux"
 PVR_BVNC = "22.104.208.318"
-- 
2.22.0


