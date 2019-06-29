Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66187E00D8C; Fri, 28 Jun 2019 21:30:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A48BFE00D94
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 21:30:25 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5T4UPBi086329
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 23:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561782625;
	bh=H40j2KYymJYOi/Zo6Rr7/Yz85lXsbhKjqUS+HA00FiI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PP0J3ULZ6ZzpG9AEemrIm+NPkBZFoeZRADmPKp+wqVNYfQn5FGNAt0Cfr8KT1ZKl6
	nzqWl4aTnng8fe7sZ3al4xvMUW+1eQZtxLKBV8Z/I4IpvAAhRJkiGdwoOkzDZ794GM
	ahlBkeUR0h7sFKqaCCppN0WXJ4IYRPo/iqDZDZUI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5T4UPEY035184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 23:30:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 23:30:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 23:30:24 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5T4UOjS019742;
	Fri, 28 Jun 2019 23:30:24 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5T4UOm20862; Fri, 28 Jun 2019 23:30:24 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Fri, 28 Jun 2019 23:32:14 -0500
Message-ID: <20190629043215.826-3-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190629043215.826-1-g-tammana@ti.com>
References: <20190629043215.826-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 2/3] ti-img-rogue-umlibs: Update SRCREV to pick wayland ws libraries
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
X-List-Received-Date: Sat, 29 Jun 2019 04:30:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../libgles/ti-img-rogue-umlibs_1.10.5187610.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
index 94f078e2..0caed206 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
@@ -6,16 +6,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm"
 
-PR = "r3"
+PR = "r4"
 
 BRANCH = "linuxws/thud/k4.19/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
-SRCREV = "3da5ebfde8a41cd38ab935f3e350d5d195fe7309"
+SRCREV = "ba99e1156c794f8618a743a4bb0f075b2ade9db3"
 
 PVR_SOC ?= "j721e_linux"
 PVR_BUILD ?= "release"
-PVR_WS = "nulldrmws"
+PVR_WS = "wayland"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
2.22.0


