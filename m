Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96EEEE00994; Fri, 13 Sep 2019 14:35:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2718BE0096F
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 14:35:51 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DLZpxI028838
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 16:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568410551;
	bh=2os3alfLtHmTjRkjxbhkfp9hOiB83jWfSxx9tIOb5Rg=;
	h=From:To:CC:Subject:Date;
	b=sGpRTvFg4/XXlcOC7XoeLmXnguOTMO21L4GOz4nP7L2okUy1AJlV+8FGFTVMdZVSK
	PuUH2VEdEjPMo6kCz3FJfvbOLrWY78ZJFJWpENX50emEMizP4yUlRSE3Ale4z5KhCB
	8CLZa6c4cgEYp3M8uhhw1XCPV4n5hsNpJz8GAv5c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DLZpRR085406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 16:35:51 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 16:35:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 16:35:50 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DLZoh0020211;
	Fri, 13 Sep 2019 16:35:51 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DLZoZ23653; Fri, 13 Sep 2019 16:35:50 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Fri, 13 Sep 2019 16:37:45 -0500
Message-ID: <20190913213745.4699-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Erick Narvaez <a0226667@ti.com>
Subject: [thud][PATCH] ti-img-rogue-umlibs: Update srcrev to pick latest
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
X-List-Received-Date: Fri, 13 Sep 2019 21:35:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The source repo has been updated with latest nulldrmws artifacts and
debug binaries. Updating srcrev to pick the latest changes.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index a21a43b9..f49830fe 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "linuxws/thud/k4.19/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
-SRCREV = "dc94fecfb74de3384736e215d829d70e97bb612c"
+SRCREV = "237d3736114d0e8c6c0fe00845949f51bb78544f"
 
 PVR_SOC ?= "j721e_linux"
 PVR_BUILD ?= "release"
-- 
2.23.0


