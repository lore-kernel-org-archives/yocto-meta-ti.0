Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CFFDE00EBE; Fri,  2 Aug 2019 12:33:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0D9DE00EB0
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 12:33:12 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72JXCeU116983
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564774392;
	bh=63bAEWIy5IpfdkmfWNp8TtaMQ/CQBg3tTO/v6augUbI=;
	h=From:To:CC:Subject:Date;
	b=oQh6KjUSUqotJiihYbwObuW7ZRBpKbxXbR+VNT3lBM+vM8HMNZc5Kz36hR8suFQyB
	fZPufxf1ubv72/sUK8tvq+37vR1LWcbqOOcWCEk64hTFxR0in7FNq2iVFU5hTsGLYS
	9jVVkM8GNx6+es5JgLyf0doGle/3LctYJSmxH1VY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72JXC5k091319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 14:33:12 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 14:33:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 14:33:12 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72JXCrF080488;
	Fri, 2 Aug 2019 14:33:12 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x72JXBZ11490; Fri, 2 Aug 2019 14:33:11 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
Date: Fri, 2 Aug 2019 14:35:05 -0500
Message-ID: <20190802193505.25313-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] ti-img-rogue-umlibs: Update recipe to pick newer version
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
X-List-Received-Date: Fri, 02 Aug 2019 19:33:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Updated the recipe to pick newer version, 1.10.5371573, of libgles
libraries.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...bs_1.10.5187610.bb => ti-img-rogue-umlibs_1.10.5371573.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.10.5187610.bb => ti-img-rogue-umlibs_1.10.5371573.bb} (96%)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
similarity index 96%
rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index a8030aae..8c05fd1c 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm"
 
-PR = "r9"
+PR = "r0"
 
 BRANCH = "linuxws/thud/k4.19/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
-SRCREV = "9ca36686e248675b709e5072672f987a2d95ed86"
+SRCREV = "a6875532315d71f036104a5cb49efa5857b4d953"
 
 PVR_SOC ?= "j721e_linux"
 PVR_BUILD ?= "release"
-- 
2.22.0


