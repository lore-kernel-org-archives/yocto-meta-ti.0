Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8B43E00D5C; Mon,  1 Jul 2019 16:45:39 -0700 (PDT)
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
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD998E00736
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2019 16:45:38 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61Njcsl070245
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2019 18:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562024738;
	bh=3ece43pxhRAifTUkb4g8zBYi1xwe8N63WorxTnB9Vfg=;
	h=From:To:CC:Subject:Date;
	b=c4giX0UDAN6WjV1bmCDh5+eo0MazSa4JQDnRFzx8oJxAbjX36LYa87BTe4DmpmHbe
	HNBVMpONaJs0TCna6u0OP1vELc9E+xoHmzGT4yiLL3ude3h7eIgaMO9OxrSexAEYNq
	91SVVUhDjoV0UVpuGuG4SHOja7qBVf22to6GfjtE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61Njcts003783
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2019 18:45:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 18:45:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 1 Jul 2019 18:45:37 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61NjblG023229;
	Mon, 1 Jul 2019 18:45:37 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x61Njbm04120; Mon, 1 Jul 2019 18:45:37 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 1 Jul 2019 18:47:27 -0500
Message-ID: <20190701234727.20511-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] ti-img-rogue-umlibs: Add missing wayland, expat rdepends
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
X-List-Received-Date: Mon, 01 Jul 2019 23:45:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../libgles/ti-img-rogue-umlibs_1.10.5187610.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
index f21432e2..26dfb7ca 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm"
 
-PR = "r6"
+PR = "r7"
 
 BRANCH = "linuxws/thud/k4.19/${PV}"
 
@@ -24,10 +24,10 @@ inherit update-rc.d
 
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 
-DEPENDS += "libdrm"
+DEPENDS += "libdrm wayland expat"
 RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN} += "python-core"
-RDEPENDS_${PN} += "ti-img-rogue-driver"
+RDEPENDS_${PN} += "ti-img-rogue-driver wayland expat"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
 RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
-- 
2.22.0


