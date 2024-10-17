Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7A5D3C534
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 21:03:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8653.1729198990021106501
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 14:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NR8H1j/c;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49HL38jd050699;
	Thu, 17 Oct 2024 16:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729198988;
	bh=T7bT35iqy2+LDMwmkRWnAvOVKl9Ka3HN6H8jAfFt/eI=;
	h=From:To:Subject:Date;
	b=NR8H1j/cLSUUwVNxooPfMe3HyljReyCINVAsHvy5zcGi2vermizJwRAv0Cc+X5Qvu
	 r7v2DHkEucpj4ra3Tw6g6PJrkh9atLQQW83iM5zHQ2RwNvBVcOXPCsbKGdSW/ZRMD/
	 quHGT/9G8QL2QCyW/VA6X5RakTqsM+8TZu59ftm0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49HL38fG090843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Oct 2024 16:03:08 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Oct 2024 16:03:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Oct 2024 16:03:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49HL38CL115574;
	Thu, 17 Oct 2024 16:03:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t1XeG-0007Cr-73; Thu, 17 Oct 2024 16:03:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] linux: Consolidate the SRC_URI variables
Date: Thu, 17 Oct 2024 16:03:08 -0500
Message-ID: <20241017210308.27662-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Oct 2024 21:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18015

It was suggested to move the reproducibility patches out of
ti-kernel.inc and into the respective recipes.

Taking this time to also rework all of the pieces that go into the SRC_URI
and create a standardization for how all of the kernel recipes are done.

Create KERNEL_GIT_URI, KERNEL_GIT_PROTOCOL, KERNEL_GIT_BRANCH,
KERNEL_DEFCONFIG, and KERNEL_REPRODUCIBILITY_PATCHES.  The default for
the above new variables is to the git.ti.com repository and how we manage
the kernel settings.  The other kernel recipes that do something other than
how TI does it can simply override the variables.

This change will make it easier to perform the upstream testing that we
do on a nightly basis.  Additionally, it will simplify the auto generation
of the patches to move the mainline (stable kernel) recipes since the
required patches will be all done in the same recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-kernel/linux/linux-bb.org_git.bb  |  5 +----
 .../linux/linux-ti-mainline_git.bb            |  9 +++++++-
 .../recipes-kernel/linux/linux-ti-next_git.bb |  4 +++-
 .../linux/linux-ti-staging_6.1.bb             |  5 -----
 .../linux/linux-ti-staging_6.12.bb            |  7 +++----
 .../linux/linux-ti-staging_6.6.bb             |  7 +++----
 .../recipes-kernel/linux/ti-kernel.inc        | 21 ++++++++-----------
 7 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index cee9c7cb..ef79bfb7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -62,7 +62,4 @@ SRCREV:aarch64 = "977c75e082620f15c06c72bcced30f787c14b390"
 PV:aarch64 = "6.1.80+git"
 BRANCH:aarch64 = "v6.1.80-ti-arm64-r49"
 
-SRC_URI = " \
-    git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
-    file://defconfig \
-"
+KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index a9048f16..57a29354 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -17,7 +17,14 @@ S = "${WORKDIR}/git"
 SRCREV = "fa7818b3a6dd56c7956f515d287ed9f80c7bf59a"
 PV = "6.11"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=https;branch=master"
+KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
+KERNEL_GIT_BRANCH = "master"
+
+KERNEL_DEFCONFIG = ""
+
+KERNEL_REPRODUCIBILITY_PATCHES = " \
+    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
+"
 
 DEFCONFIG_NAME = "multi_v7_defconfig"
 DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index 3c206754..1feb7564 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -8,4 +8,6 @@ include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('
 SRCREV = "6465e260f48790807eef06b583b38ca9789b6072"
 PV = "6.6.0-rc3+git"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
+KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
+
+KERNEL_REPRODUCIBILITY_PATCHES = ""
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 66f0b562..86851278 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -26,11 +26,6 @@ BRANCH ?= "ti-linux-6.1.y"
 SRCREV ?= "92ce8d7d2ab679e10c1dda309a0fb2ceae78b908"
 PV = "6.1.105+git"
 
-KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "https"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig"
-
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f6f8732b..f8ce3f01 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -28,10 +28,9 @@ BRANCH ?= "ti-linux-6.12.y"
 SRCREV ?= "9852d85ec9d492ebef56dc5f229416c925758edc"
 PV = "6.12-rc1+git"
 
-KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "https"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig"
+KERNEL_REPRODUCIBILITY_PATCHES = " \
+    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
+"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 9a906a0f..5646986a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -26,10 +26,9 @@ BRANCH ?= "ti-linux-6.6.y"
 SRCREV ?= "32ae7316ddc6d9b6bb0d87706cf7daa44c4c1e92"
 PV = "6.6.44+git"
 
-KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "https"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig"
+KERNEL_REPRODUCIBILITY_PATCHES = " \
+    file://0001-vt-conmakehash-improve-reproducibility.patch \
+"
 
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index 09cfdb12..583968a2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -13,19 +13,16 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
 KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
 KERNEL_DTBVENDORED = "1"
 
-KERNEL_PATCHES = ""
+KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL ?= "https"
+KERNEL_GIT_BRANCH ?= "${BRANCH}"
 
-KERNEL_PATCHES:bsp-mainline = " \
-    file://0001-vt-conmakehash-improve-reproducibility-for-v6.10.patch \
-    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
-"
+KERNEL_DEFCONFIG ?= "file://defconfig"
 
-KERNEL_PATCHES:bsp-ti-6_12 = " \
-    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
-"
+KERNEL_REPRODUCIBILITY_PATCHES ?= ""
 
-KERNEL_PATCHES:bsp-ti-6_6 = " \
-    file://0001-vt-conmakehash-improve-reproducibility.patch \
+SRC_URI = " \
+    ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${KERNEL_GIT_BRANCH} \
+    ${KERNEL_DEFCONFIG} \
+    ${KERNEL_REPRODUCIBILITY_PATCHES} \
 "
-
-SRC_URI:append = " ${KERNEL_PATCHES} "
-- 
2.17.1


