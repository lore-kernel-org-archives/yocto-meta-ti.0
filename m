Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50990E00DA9; Wed, 19 Jun 2019 04:56:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11A63E00DA7
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 04:56:10 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JBuArP061190
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 06:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560945370;
	bh=ASys6U1OClP/4Adxqe/VCV3E7ycrDlpco7hWLkwzcKQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ELlpgU1dlsXuD4sdjqr6sIPAmtQNyW+QvV0KJ0CvsI/tuR3KwUduu9l0V2yEfIzGP
	UeP2FeBpu2ocSv2bKjuqEsR501e62xPNiu/rheb1WGREjP0Dadh8pqrcRwtSIBS0jM
	dQ2qDmwSnnN2qkthWR2/aqSK/vsew8kQGGeJYwKw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JBuAh9052979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 06:56:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 06:56:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 06:56:10 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JBu5wt078731; 
	Wed, 19 Jun 2019 06:56:09 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 19 Jun 2019 17:26:02 +0530
Message-ID: <1560945362-8895-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560945362-8895-1-git-send-email-anandb@ti.com>
References: <1560945362-8895-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [[thud] PATCH 2/2] ti-img-rogue-umlibs: add PowerVR Rogue GPU user mode libraries for J721E SoC
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
X-List-Received-Date: Wed, 19 Jun 2019 11:56:12 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../libgles/ti-img-rogue-umlibs_1.10.5187610.bb    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
new file mode 100644
index 0000000..63b6ee9
--- /dev/null
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "j7-evm"
+
+PR = "r1"
+
+BRANCH = "linux/thud/k4.19/${PV}"
+
+SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
+SRCREV = "4dccfbeffa6427a56bf63ab83af9d2140d95045b"
+
+PVR_SOC ?= "j721e_linux"
+PVR_BUILD ?= "release"
+
+INITSCRIPT_NAME = "rc.pvr"
+INITSCRIPT_PARAMS = "defaults 8"
+
+inherit update-rc.d
+
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+DEPENDS += "libdrm"
+RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN} += "python-core"
+RDEPENDS_${PN} += "ti-img-rogue-driver"
+
+RPROVIDES_${PN} = "libegl libgles1 libgles2"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
+
+RREPLACES_${PN} = "libegl libgles1 liblges2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
+
+RCONFLICTS_${PN} = "libegl libgles1 libgles2"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${PVR_SOC} BUILD=${PVR_BUILD}
+    chown -R root:root ${D}
+}
+
+FILES_${PN} += " ${base_libdir}/firmware/"
+FILES_${PN} += " ${datadir}/"
+
+INSANE_SKIP_${PN} += "ldflags arch already-stripped"
+
+CLEANBROKEN = "1"
-- 
1.9.1


