Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96265E00EAB; Fri,  2 Aug 2019 12:28:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 131E0E00E9E
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 12:28:17 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72JSHc2053004
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564774097;
	bh=r98DNbK7h8vfTtF71r1X0kHujomOk7falUb2jh7hY8Y=;
	h=From:To:CC:Subject:Date;
	b=eGbePJI6c5zdPEEhvAb6EvpQ9hLw6Mi48q3vnvbEHGSa7yTG5q06mq+sChxUqD6Mi
	cvs4C8RIo7N/D+487mMPjeI31J+1E75rWofOl/2LlBdUZcOz2qvPoL1P+n2M9w3DI3
	Ewg+8pnlgQKP5yI8lLsYNCNWxqwBfEQrb/iuRo7E=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72JSHvh006991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:28:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 14:28:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 14:28:17 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72JSHTg095752;
	Fri, 2 Aug 2019 14:28:17 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x72JSGZ08278; Fri, 2 Aug 2019 14:28:16 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
Date: Fri, 2 Aug 2019 14:30:01 -0500
Message-ID: <20190802193001.20559-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-img-rogue-driver: Update recipe to pick newer version
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
X-List-Received-Date: Fri, 02 Aug 2019 19:28:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Updated the recipe to pick the newer version, 1.10.5371573, of rogue
gpu kernel sources.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...er_1.10.5187610.bb => ti-img-rogue-driver_1.10.5371573.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.10.5187610.bb => ti-img-rogue-driver_1.10.5371573.bb} (92%)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
similarity index 92%
rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index 9ae60c4e..fcf35edc 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -20,7 +20,7 @@ BRANCH = "linuxws/thud/k4.19/${PV}"
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "976f73444ef86b231819052bba2020e5b00aeb06"
+SRCREV = "1531b98ba602911359bfded2d683e49b3c731313"
 
 PVR_SOC = "j721e_linux"
 PVR_BVNC = "22.104.208.318"
-- 
2.22.0


