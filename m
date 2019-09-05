Return-Path: <>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13BB6E00E47; Thu,  5 Sep 2019 09:38:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCBEFE00E24
	for <meta-ti@yoctoproject.org>; Thu,  5 Sep 2019 09:38:55 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x85GctNR124756
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567701535;
	bh=qxO5htsma0pKUHt2EHTZRrm540L5Kcd06vsBW0gRKhE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iWUkzkpZMLyAR5iac8UbOM5zxe5q4p3FxCx3Al8Hg/Z/GpKCd/na1x2xQ9lPaDgKo
	+tUEByatrJ487yeN4tFZnfq/S3hPcd6w4fdEFaVWU4y8kwzuvDp0QorI5N2sJOwmTL
	t8HLpQ6v5pFWThmjaG4uRVBMsrh31gfMOsskva0s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x85Gcttd012806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 5 Sep 2019 11:38:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 5 Sep 2019 11:38:54 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85GcsiS071593;
	Thu, 5 Sep 2019 11:38:54 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x85GcqZ15490; Thu, 5 Sep 2019 11:38:52 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>,
	Anand Balagopalakrishnan <anandb@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Thu, 5 Sep 2019 12:38:45 -0400
Message-ID: <20190905163847.18928-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905163847.18928-1-afd@ti.com>
References: <20190905163847.18928-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: [thud/master][PATCH 3/5] ti-sgx-ddk-um: Add wayland-protocols as build dependency
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
X-List-Received-Date: Thu, 05 Sep 2019 16:38:57 -0000
Content-Type: text/plain

Although not needed for the IMG default EGL implementation this is needed
when building the Mesa EGL version of the DDK.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 0a62cc35..0695ca0a 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -25,8 +25,8 @@ inherit update-rc.d
 
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm omap5-sgx-ddk-um-linux"
 
-DEPENDS += "libdrm udev wayland libffi expat"
-RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland libffi expat"
+DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
+RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
 RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
-- 
2.17.1


