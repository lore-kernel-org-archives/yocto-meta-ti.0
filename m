Return-Path: <>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19D13E00DD9; Fri, 19 Jul 2019 14:06:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA2CFE00DAF
	for <meta-ti@yoctoproject.org>; Fri, 19 Jul 2019 14:06:24 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6JL6NSP112808
	for <meta-ti@yoctoproject.org>; Fri, 19 Jul 2019 16:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563570384;
	bh=rdi2Mgxtjc618EjbwcYy36gacZYM7LN9DNbJK+1Qqwc=;
	h=From:To:CC:Subject:Date;
	b=CbB4CuJqJHP8tMP2v+ZuXb4BRHOa1YW5GTe/GD+UUsktdcPyp2jguulT4UNLY8yXp
	WtNyXZlktbJ+2CBNVOMRllP8rHs6KKtjitZe0Bv1g90aUT1MTCsgPs6UweZqnwvq+U
	JvIKQqLIOc//aLsiOZBwPICEjD/iGjIeBOqpFHAs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6JL6NSB087703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 19 Jul 2019 16:06:23 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 19 Jul 2019 16:06:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 19 Jul 2019 16:06:23 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6JL6Nl9107257;
	Fri, 19 Jul 2019 16:06:23 -0500
Received: from localhost ([10.250.86.29])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x6JL6MZ17475; Fri, 19 Jul 2019 16:06:22 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Fri, 19 Jul 2019 17:06:17 -0400
Message-ID: <20190719210619.18583-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: [thud/master][RFC PATCH 1/3] ti-sgx-ddk-um: libgbm is now part of this project
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
X-List-Received-Date: Fri, 19 Jul 2019 21:06:26 -0000
Content-Type: text/plain

The GBM library is tightly coupled with the system graphics systems,
other hardware GPU vendors (including our Rogue DDK) and Mesa all deploy
a version of the library as part of their GPU driver. We SGX does the
same. This should ease integration for us as we now don't rely on a
separate project for this library and our deployment strategy can match
across Mesa/RGX recipes, allowing for better re-use of common components.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---

This set is an RFC as the patch on the SGX DDK UM to make this change has
not yet been merged. When it is I will update the rev as part of this
patch to a version of the UM libs that contains libgbm.

 recipes-graphics/gbm/libgbm_10.0.0.bb         | 23 ----------------
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 26 +++++++++----------
 2 files changed, 12 insertions(+), 37 deletions(-)
 delete mode 100644 recipes-graphics/gbm/libgbm_10.0.0.bb

diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb b/recipes-graphics/gbm/libgbm_10.0.0.bb
deleted file mode 100644
index 6d058b72..00000000
--- a/recipes-graphics/gbm/libgbm_10.0.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Userspace interface for the kernel GBM services"
-HOMEPAGE = "http://git.ti.com/glsdk/libgbm.git"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
-
-DEPENDS = "libdrm udev"
-
-PROVIDES += "virtual/libgbm"
-
-inherit autotools pkgconfig
-
-BRANCH = "next"
-
-SRCREV = "96f37555c7e82a417b02051661377b10e6b3966e"
-
-SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH} \
-            file://0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch"
-
-S = "${WORKDIR}/git"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 02c9b750..3c0242e2 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -23,22 +23,22 @@ INITSCRIPT_PARAMS = "defaults 8"
 inherit update-rc.d
 
 PR = "r33"
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm omap5-sgx-ddk-um-linux"
 
-DEPENDS += "libdrm udev libgbm wayland libffi"
-RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
+DEPENDS += "libdrm udev wayland libffi"
+RDEPENDS_${PN} += "libdrm libudev wayland libffi libdrm-omap"
 
-RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
-RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
-RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
 
-RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
-RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
 
-RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
-RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
-RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
 
 # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
 RPROVIDES_${PN} += "libGLESv2.so.1"
@@ -47,8 +47,6 @@ S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    mkdir -p ${D}${libdir}/gbm
-    ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
     ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
 
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-- 
2.17.1


