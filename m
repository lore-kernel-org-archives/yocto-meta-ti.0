Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3299EE00D4D; Mon,  1 Jul 2019 13:34:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A23D1E00A49
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2019 13:34:28 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61KYSkw027088
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2019 15:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562013268;
	bh=8R2opavHraGdtayHd5rWyqeFDZC/4WBO2KqYyv6RArU=;
	h=From:To:CC:Subject:Date;
	b=sq2AT9brT03vFYItmC4NqIkwNhp7sfj/aNsgfzAwEa6DePsmYSM3bpK4MIos6Q2bc
	q+7XYn6ZhdI/aFs3Hb3HxHAJtvw+bOyiroJoXXTKCV6qB0MjCCdKYLfG8Dl0qBM17o
	EGP0nwYo8gAIFs6A1P7HY2Px3I11KXKaXAgceULM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61KYSjv042075
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2019 15:34:28 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 15:34:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 1 Jul 2019 15:34:27 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61KYRuv102442;
	Mon, 1 Jul 2019 15:34:27 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x61KYRm26392; Mon, 1 Jul 2019 15:34:27 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 1 Jul 2019 15:36:21 -0500
Message-ID: <20190701203621.9100-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] ti-img-rogue-umlibs: Add plugins list
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
X-List-Received-Date: Mon, 01 Jul 2019 20:34:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add plugins list to enable symlink creation in the rootfs image.

Based on
  - http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=7abb92c58b3c974f93004fc37829cbb15575ea48
  - http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=f7be8fd6962a502b33d97fbcf0cd5e766d3d3409

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../libgles/ti-img-rogue-umlibs_1.10.5187610.bb          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
index b3ec7af2..f21432e2 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm"
 
-PR = "r5"
+PR = "r6"
 
 BRANCH = "linuxws/thud/k4.19/${PV}"
 
@@ -51,6 +51,13 @@ do_install () {
 FILES_${PN} += " ${base_libdir}/firmware/"
 FILES_${PN} += " ${datadir}/"
 
+PACKAGES =+ "${PN}-plugins"
+FILES_${PN}-plugins = "${libdir}/libGLESv2.so ${libdir}/libGLESv1_CM.so ${libdir}/libEGL.so"
+RDEPENDS_${PN} += "${PN}-plugins"
+
+ALLOW_EMPTY_${PN}-plugins = "1"
+
 INSANE_SKIP_${PN} += "ldflags arch already-stripped"
+INSANE_SKIP_${PN}-plugins = "dev-so"
 
 CLEANBROKEN = "1"
-- 
2.22.0


