Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039D4C7EE3A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:07:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.22933.1750874812551280290
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tA8AD12W;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6o0W2245994;
	Wed, 25 Jun 2025 13:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874810;
	bh=UKW6zs9qn+ThtaAL4LhykRXZcFF7MkMuFhxtrH8rmCs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tA8AD12WwzBS1hy2iOAjWY+VGHO5JHvwwP2+2pLuiHRIGMVEYufgRtEuE191yuukl
	 wkemSM/unTjHIyEQAouU5Fb5Ianhj9kob0q7ApJL73iQ1VyGzpjjMVLcbui+vRohaX
	 2ikC9pvVqwGznfTumQqgpG4Vx1yPPqzAj1AE3S7A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6oEj1224784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6oue3811411;
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUWI-0004eS-EG; Wed, 25 Jun 2025 13:06:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 4/7] meta-ti/all: Handle S when building a subdir of the git repo
Date: Wed, 25 Jun 2025 13:06:47 -0500
Message-ID: <20250625180650.17820-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180650.17820-1-reatmon@ti.com>
References: <20250625180650.17820-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:07:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18682

If a recipe is fetching an entire git repo and then just building a
single dir, then we need to update S to lock into the sub directory.
Easiest fix is to simply append the subdir to whatever the system wants
to set S to by default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb        | 4 ++--
 meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb   | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb               | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb               | 2 +-
 .../recipes-connectivity/cc33calibrator/cc33calibrator_git.bb | 2 +-
 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb  | 2 +-
 meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb    | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb          | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb   | 2 +-
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb  | 2 +-
 meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb             | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index bc2b7fc2..3acdd130 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -14,7 +14,7 @@ SRCREV = "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git/src"
+S:append = "/src"
 
 EXTRA_OEMAKE += "-f Kbuild AQROOT=${S} KERNEL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PATH=${TOOLCHAIN_PATH} CROSS_COMPILE=${TARGET_PREFIX} ARCH_TYPE=${TARGET_ARCH}"
 
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
index 592a0e80..5dc6c211 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
+LIC_FILES_CHKSUM = "file://git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 
 inherit bin_package
 
@@ -15,7 +15,7 @@ PR = "r3"
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
-S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
+S:append = "/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index b1fa3ab8..d8e759d9 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
 
 PV:append = "+git"
 
-S = "${WORKDIR}/git/debugss_module/debugss-mod"
+S:append = "/debugss_module/debugss-mod"
 
 inherit module
 
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
index c725202a..5e8c56b8 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "libulm ncurses"
 
 PR = "${INC_PR}.2"
 
-S = "${WORKDIR}/git/dsptop"
+S:append = "/dsptop"
 
 DEVICE = ""
 DEVICE:dra7xx = "DRA7xx"
diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
index a4670b6e..73c7831e 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -9,7 +9,7 @@ REQUIRED_MACHINE_FEATURES = "dsp"
 DEPENDS = "ti-cgt6x-native"
 PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/git/dsptop/ulm"
+S:append = "/dsptop/ulm"
 
 DEVICE = ""
 DEVICE:dra7xx = "DRA7xx"
diff --git a/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb b/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
index cd5b7dc5..57311667 100644
--- a/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
+++ b/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
@@ -9,7 +9,7 @@ PV = "1.0.0.50"
 
 DEPENDS = "libnl"
 
-S = "${WORKDIR}/git/cc33calibrator"
+S:append = "/cc33calibrator"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
diff --git a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
index 096bf9bc..724be6e5 100644
--- a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
+++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;proto
 
 PV = "1.7.0.120"
 
-S = "${WORKDIR}/git/cc33conf"
+S:append = "/cc33conf"
 
 EXTRA_OEMAKE = "CC="${CC}""
 
diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
index a23db663..8285bf9f 100644
--- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85
 SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
 SRC_URI = "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;branch=master;protocol=https"
 
-S = "${WORKDIR}/git/wlconf"
+S:append = "/wlconf"
 
 EXTRA_OEMAKE = "CC="${CC}""
 
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 27b844cb..b803ac5b 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append = " \
     file://0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch;striplevel=2 \
 "
 
-S = "${WORKDIR}/git/gdbc6x"
+S:append = "/gdbc6x"
 
 inherit update-rc.d
 inherit gettext
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index b09599ad..6c538817 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctoo
 
 PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/git/gdbserver-c6x/src"
+S:append = "/gdbserver-c6x/src"
 
 PLATFORM = ""
 PLATFORM:dra7xx = "DRA7xx_PLATFORM"
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index 1dc2296d..2ee97269 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -9,7 +9,7 @@ SRC_URI:append = "\
     file://0002-Support-Linux-kernels-v6.6.patch;patchdir=../.. \
 "
 
-S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
+S:append = "/kernel_module/gdbproxy-mod"
 
 inherit module
 
diff --git a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
index f3b03bd6..4043da55 100644
--- a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
+++ b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
@@ -13,7 +13,7 @@ SRCREV = "de7954abab0f0caa8a2c7b53095c30226d901a31"
 DEPENDS = "ti-cgt6x-native"
 PR = "r0"
 
-S = "${WORKDIR}/git/aet"
+S:append = "/aet"
 
 DEVICE = ""
 DEVICE:dra7xx = "DRA7xx"
-- 
2.17.1


