Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0CDC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:25:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12375.1647966331812546857
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 09:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g0oAE8Wm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPUU8036999;
	Tue, 22 Mar 2022 11:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647966330;
	bh=wcexFblxblpFAk+2LvtA+QP81OG/1JojSEE/WfcN0ZA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=g0oAE8WmLDrRY+qOD2Zra+WYoTFlZ+C0xlqcQEBDg/w15f0v/klG1qCn9Ix3PojWt
	 8oPcXUoAs9OMUunykJ4S5w3JyTIghXft5tPUhxEHTTRzfsH//a/MIEBIgRl2jhhOeO
	 9TSRHyWLZ00aaj6k8pR0f7FbTrKaqlfjwLuoEwos=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MGPUmZ045374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 11:25:30 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 11:25:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 11:25:29 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPTgl098025;
	Tue, 22 Mar 2022 11:25:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWhK5-000407-MA; Tue, 22 Mar 2022 11:25:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 05/11] ti-graphics: Add AM62x GPU (AXE1-16M)
 support v4
Date: Tue, 22 Mar 2022 11:25:22 -0500
Message-ID: <20220322162528.15298-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322162528.15298-1-reatmon@ti.com>
References: <20220322162528.15298-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 16:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14520

From: Krunal Bhargav <k-bhargav@ti.com>

Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/am62xx-evm.conf                  |  2 +
 .../ti-img-rogue-driver_1.13.5776728.bb       | 40 ------------------
 .../ti-img-rogue-driver_1.15.6133109.bb       | 42 +++++++++++++++++++
 ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} | 17 ++++----
 4 files changed, 53 insertions(+), 48 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
 create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
 rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.5776728.bb => ti-img-rogue-umlibs_1.15.6133109.bb} (77%)

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
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
deleted file mode 100644
index a05de0f2..00000000
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
-HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
-LICENSE = "MIT | GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
-
-inherit module features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
-
-MACHINE_KERNEL_PR_append = "b"
-PR = "${MACHINE_KERNEL_PR}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7"
-
-DEPENDS = "virtual/kernel"
-
-PROVIDES = "virtual/gpudriver"
-
-BRANCH = "1.13-5776728/linux-k5.10"
-
-SRC_URI = " \
-    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
-    file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
-"
-
-S = "${WORKDIR}/git"
-
-SRCREV = "35a25875ae8738f82c7cabc6b077ef992b0cca84"
-
-PVR_SOC = "j721e_linux"
-PVR_BVNC = "22.104.208.318"
-PVR_BUILD = "release"
-PVR_WS = "wayland"
-
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
-
-do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
-}
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
new file mode 100644
index 00000000..0dfc50ec
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -0,0 +1,42 @@
+DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
+HOMEPAGE = "https://bitbucket.itg.ti.com/scm/lcpd-priv-sdk/rogue_km"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
+
+inherit module features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "j7|am62xx"
+
+DEPENDS = "virtual/kernel"
+
+PROVIDES = "virtual/gpudriver"
+
+BRANCH = "am62xx-wakeup"
+
+SRC_URI = " \
+    git://git@bitbucket.itg.ti.com/lcpd-priv-sdk/rogue_km.git;protocol=ssh;branch=${BRANCH} \
+    file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
+"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "438ff717ff6d46754fce1e10c6d3a3828cff77c9"
+
+TARGET_PRODUCT_j7 = "j721e_linux"
+TARGET_PRODUCT_am62xx = "am62_linux"
+TARGET_BVNC_j7 = "22.104.208.318"
+TARGET_BVNC_am62xx = "33.15.11.3"
+PVR_BUILD = "release"
+PVR_WS = "wayland"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${TARGET_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+}
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
similarity index 77%
rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 5194015e..611cbabe 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
-HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
+HOMEPAGE = "https://bitbucket.itg.ti.com/scm/lcpd-priv-sdk/rogue_umlibs.git"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 
@@ -8,17 +8,18 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7"
+COMPATIBLE_MACHINE = "j7|am62xx"
 
-PR = "r3"
+PR = "r1"
 
-BRANCH = "linuxws/dunfell/k5.10/${PV}"
+BRANCH = "am62xx-wakeup"
 
-SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
+SRC_URI = "git://git@bitbucket.itg.ti.com/lcpd-priv-sdk/rogue_umlibs.git;protocol=ssh;branch=${BRANCH}"
 
-SRCREV = "5ef38353c38d921a65ea6df75c7b6ce710b66034"
+SRCREV = "4de3317c83c9f5a3681bf3660527673f3226e401"
 
-PVR_SOC ?= "j721e_linux"
+TARGET_PRODUCT_j7 = "j721e_linux"
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


