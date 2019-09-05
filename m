Return-Path: <>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E29BE00E14; Thu,  5 Sep 2019 09:38:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E91F9E00E0D
	for <meta-ti@yoctoproject.org>; Thu,  5 Sep 2019 09:38:49 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x85Gcnek037885
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567701529;
	bh=FQ3RsE47yk0IjFCoWCwdxrR5o+dzDxn36ZUiPoUl2OI=;
	h=From:To:CC:Subject:Date;
	b=oZNDYI4pU34VfixMgYTPQyecBdnCUxA1vU/uwsweZZsk9fQ0bqjMptT9DQJwUDrBv
	NBY9U+CK5Lrv7h5ktOh3TWQul+I+gsXBXdCH6Srz4oxhkoYkfoS5LakqBP9qPFUWjW
	HNfoka9crT4lW4CepaXzJDSkyK91h2Sew7hcB2zk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x85GcnrG023829
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 5 Sep 2019 11:38:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 5 Sep 2019 11:38:49 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85GcmEL086713;
	Thu, 5 Sep 2019 11:38:49 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x85GcmZ15478; Thu, 5 Sep 2019 11:38:48 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>,
	Anand Balagopalakrishnan <anandb@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Thu, 5 Sep 2019 12:38:43 -0400
Message-ID: <20190905163847.18928-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: [thud/master][PATCH 1/5] ti-sgx-ddk-um: libgbm is now part of this project
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
X-List-Received-Date: Thu, 05 Sep 2019 16:38:51 -0000
Content-Type: text/plain

The GBM library is tightly coupled with the system graphics systems,
other hardware GPU vendors (including our Rogue DDK) and Mesa all deploy
a version of the library as part of their GPU driver. We SGX does the
same. This should ease integration for us as we now don't rely on a
separate project for this library and our deployment strategy can match
across Mesa/RGX recipes, allowing for better re-use of common components.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 recipes-graphics/gbm/libgbm_10.0.0.bb         | 23 --------------
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 30 +++++++++----------
 2 files changed, 14 insertions(+), 39 deletions(-)
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
index 02c9b750..80570ef0 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -10,7 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/thud/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "9e63d5ac0b40d6a70463173c597122b6645c8a95"
+SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
@@ -22,23 +22,23 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r33"
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
+PR = "r34"
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


