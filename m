Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486AFC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 19:37:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1621.1648064234101494008
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 12:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qbB5nj/4;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NJb9m6096129;
	Wed, 23 Mar 2022 14:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648064229;
	bh=zh8QYltf0pK9nCxU7lEZCNFGiKB9fSwe2CRCT7cIB8s=;
	h=From:To:Subject:Date;
	b=qbB5nj/4eGj0WDAtD7R3UdYCR4Ez1KnYNpD8qRXyUhJSE84lOwi4OJWavoSSnGll4
	 eL4+iorXdEsyFYtQXnXKL+qka/tWTZnqf3wVn3K9Xbb8KI8rm2q5T9XCOM4g33w82U
	 fB/CkcELwHXwi56hRIlz6EU5QkavRVabLlUUE7oc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NJb9un014708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 14:37:09 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 14:37:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 14:37:09 -0500
Received: from uda0867391.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NJb9Ph044790;
	Wed, 23 Mar 2022 14:37:09 -0500
From: Darren Etheridge <detheridge@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
Subject: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move all
 platforms to ddk 1.15
Date: Wed, 23 Mar 2022 14:37:07 -0500
Message-ID: <20220323193707.28162-1-detheridge@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Mar 2022 19:37:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14545

Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15

Migrate Imagination DDK 1.13 to DDK 1.15 for J721e

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---

No changes in the content of the patch, however I regenerated it with the 
similarity threshold reduced as requested by Denys.

 conf/machine/am62xx-evm.conf                  |  2 ++
 conf/machine/j721s2-evm.conf                  |  2 ++
 ...bb => ti-img-rogue-driver_1.15.6133109.bb} | 20 +++++++++++--------
 ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} | 13 ++++++------
 4 files changed, 23 insertions(+), 14 deletions(-)
 rename recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.13.5776728.bb => ti-img-rogue-driver_1.15.6133109.bb} (48%)
 rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.5776728.bb => ti-img-rogue-umlibs_1.15.6133109.bb} (84%)

diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index 600abb58..086e40e4 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/am62xx.inc
 
+MACHINE_FEATURES += "gpu"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
     ti/k3-am625-sk-lpmdemo.dtb \
diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 82fd33da..e5ed0b73 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/j7.inc
 
+MACHINE_FEATURES += "gpu"
+
 SERIAL_CONSOLES = "115200;ttyS10"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
similarity index 48%
rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index a05de0f2..fbff6c51 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -7,17 +7,17 @@ inherit module features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7"
+COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
 
 DEPENDS = "virtual/kernel"
 
 PROVIDES = "virtual/gpudriver"
 
-BRANCH = "1.13-5776728/linux-k5.10"
+BRANCH = "linuxws/dunfell/k5.10/${PV}"
 
 SRC_URI = " \
     git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
@@ -26,15 +26,19 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "35a25875ae8738f82c7cabc6b077ef992b0cca84"
+SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
 
-PVR_SOC = "j721e_linux"
-PVR_BVNC = "22.104.208.318"
+TARGET_PRODUCT_j7-evm = "j721e_linux"
+TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
+TARGET_PRODUCT_am62xx = "am62_linux"
+TARGET_BVNC_j7-evm = "22.104.208.318"
+TARGET_BVNC_j721s2-evm = "36.53.104.796"
+TARGET_BVNC_am62xx = "33.15.11.3"
 PVR_BUILD = "release"
 PVR_WS = "wayland"
 
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${TARGET_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
similarity index 84%
rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 5194015e..e00dce99 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -8,17 +8,18 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7"
+COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
 
-PR = "r3"
+PR = "r1"
 
 BRANCH = "linuxws/dunfell/k5.10/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
+SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
 
-SRCREV = "5ef38353c38d921a65ea6df75c7b6ce710b66034"
-
-PVR_SOC ?= "j721e_linux"
+TARGET_PRODUCT_j7-evm = "j721e_linux"
+TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
+TARGET_PRODUCT_am62xx = "am62_linux"
 PVR_BUILD ?= "release"
 PVR_WS = "wayland"
 
@@ -50,7 +51,7 @@ RRECOMMENDS_${PN} += "ti-img-rogue-driver"
 S = "${WORKDIR}/git"
 
 do_install () {
-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${PVR_SOC} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
     chown -R root:root ${D}
 }
 
-- 
2.17.1


