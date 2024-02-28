Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD890C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 19:22:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5997.1709148128372550397
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 11:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CEdPYtv6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41SJM710054680;
	Wed, 28 Feb 2024 13:22:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709148127;
	bh=oPb2p8tGXIsEXYV5TXvMeUzXo10pcnhTHzuoFzbCMs4=;
	h=From:To:Subject:Date;
	b=CEdPYtv63p53vC1XrnqBPMgHb1MOkGdbO4OL/QvLseE1udVIkgXbryUlX9k2k2fTC
	 WxWjCrmu8iVkheagbNJGqqkHewiEHfPIc7BydBtmhuZLru6PEY4M5x/v7D9AV/mBFj
	 oC7MlibJBMUrDD8ITp5NuP2zoD8IZWwX30xhDs+A=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41SJM6n6032037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Feb 2024 13:22:07 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Feb 2024 13:22:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Feb 2024 13:22:06 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41SJM6j1099344;
	Wed, 28 Feb 2024 13:22:06 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rfPVG-0005WZ-FD; Wed, 28 Feb 2024 13:22:06 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] Drop SRCPV
Date: Wed, 28 Feb 2024 13:22:06 -0600
Message-ID: <20240228192206.21196-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Feb 2024 19:22:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17492

From: Denys Dmytriyenko <denys@konsulko.com>

A change in master from last year [1] dropped setting SRCPV.  Since it is now empty,
we do not need to use when setting PV.

[1] https://git.openembedded.org/openembedded-core/commit/?id=a8e7b0f932b9ea69b3a218fca18041676c65aba0

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/cmem/cmem.inc                         | 2 +-
 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb    | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                  | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb             | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb          | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb         | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb      | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb      | 2 +-
 .../recipes-security/optee/optee-client-ti-version.inc        | 2 +-
 .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc                  | 2 +-
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb        | 2 +-
 18 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
index 683e1763..e8dbbe8f 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
@@ -7,7 +7,7 @@ BRANCH = "master"
 # This corresponds to version 4.20.00.01
 SRCREV = "86269258a48e0a9008dd9d5ebfae9da7ce843393"
 
-PV = "4.20.00.01+git${SRCPV}"
+PV = "4.20.00.01+git"
 
 SRC_URI = "git://git.ti.com/git/ipc/ludev.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 6e2996ce..61b1b986 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "R5 PSDK CPSW9G Ethernet Switch Firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
 
-PV = "6.2+git${SRCPV}"
+PV = "6.2+git"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit update-alternatives
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index fb161726..291259c0 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,4 +1,4 @@
-PV:k3 = "2.10+git${SRCPV}"
+PV:k3 = "2.10+git"
 SRCREV_tfa:k3 = "00f1ec6b8740ccd403e641131e294aabacf2a48b"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 6412cb94..855307d9 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -21,7 +21,7 @@ UBOOT_GIT_URI ?= "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 
-PV:append = "+git${SRCPV}"
+PV:append = "+git"
 
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index f7a38da8..c1286176 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a56bddef00b39fb0f45488fdc4ce108f"
 
 inherit cmake
 
-PV = "0.3+git${SRCPV}"
+PV = "0.3+git"
 
 COMPATIBLE_MACHINE = "k3"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index d6c4b993..144028e5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -21,12 +21,12 @@ S = "${WORKDIR}/git"
 
 # 6.1.69 version for 32-bit
 SRCREV:armv7a = "a1f26a19581970f76220c68c438981796ce5b767"
-PV:armv7a = "6.1.69+git${SRCPV}"
+PV:armv7a = "6.1.69+git"
 BRANCH:armv7a = "v6.1.69-ti-r22"
 
 # 6.1.69 version for 64-bit
 SRCREV:aarch64 = "bc76b5d278271f66a6faeb2d09cb09fc6c57dd3c"
-PV:aarch64 = "6.1.69+git${SRCPV}"
+PV:aarch64 = "6.1.69+git"
 BRANCH:aarch64 = "v6.1.69-ti-arm64-r24"
 
 SRC_URI = " \
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 16fe2eb1..5c495d46 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 # 6.6 Mainline version
 SRCREV = "ffc253263a1375a65fa6c9f62a893e9767fbebfa"
-PV = "6.6+git${SRCPV}"
+PV = "6.6+git"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index b3f5f9eb..f1a14ab1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 # 6.6.0-rc3+ version
 SRCREV = "6465e260f48790807eef06b583b38ca9789b6072"
-PV = "6.6.0-rc3+git${SRCPV}"
+PV = "6.6.0-rc3+git"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index 1c4f51dc..e78707f4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -10,4 +10,4 @@ SRCREV = "bdebf4319d95b46edd39be72d937d1e0086865fe"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
-PV = "6.1.69+git${SRCPV}"
+PV = "6.1.69+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
index 8be1cfa3..266a222c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
@@ -12,4 +12,4 @@ SRCREV = "357d8fe8189aa5c61b4e311ef810f7e0a2c49be9"
 
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
-PV = "6.6.14+git${SRCPV}"
+PV = "6.6.14+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 778b17ac..ee7da386 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -24,7 +24,7 @@ S = "${WORKDIR}/git"
 BRANCH ?= "ti-linux-6.1.y"
 
 SRCREV ?= "77aa27cbdca359bf0735b36ada464ec65b520943"
-PV = "6.1.69+git${SRCPV}"
+PV = "6.1.69+git"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index eaeaac7c..e932645b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/git"
 BRANCH ?= "ti-linux-6.6.y"
 
 SRCREV ?= "cb84067eaf83e8287003bf17c3aed93ecd946a05"
-PV = "6.6.14+git${SRCPV}"
+PV = "6.6.14+git"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 0f1da594..16fbd6c5 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.1.0+git${SRCPV}"
+PV = "4.1.0+git"
 SRCREV = "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index d6ddc907..23cd7580 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.0.0+git${SRCPV}"
+PV = "4.0.0+git"
 SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 36d18142..9db67567 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,4 +1,4 @@
-PV = "4.1.0+git${SRCPV}"
+PV = "4.1.0+git"
 SRCREV = "012cdca49db398693903e05c42a254a3a0c0d8f2"
 
 # Fixes for pointing to 4.0.0 before upstream meta-arm
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index ac812f36..16b2dfc3 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,4 +1,4 @@
-PV = "4.1.0+git${SRCPV}"
+PV = "4.1.0+git"
 SRCREV = "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
 
 # Fixes for pointing to 4.0.0 before upstream meta-arm
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 78782e6a..d9f101b1 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};bra
 # 0.6.4 release
 SRCREV = "439a13cf24662224d5dfa672c6a50d7c43899886"
 
-PV = "0.6.4+git${SRCPV}"
+PV = "0.6.4+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index ff715ce0..feee1cf9 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -24,7 +24,7 @@ TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
 TI_RTOS_METADATA_FILE:am64xx ?= "${S}${TI_RTOS_METADATA_DIR}/mcusdk_metadata.inc"
 
-PV = "1.0.0+git${SRCPV}"
+PV = "1.0.0+git"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


