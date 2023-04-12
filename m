Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD4DC7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:42:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.421.1681324967038454890
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 11:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OKt2M6Yx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CIgjZ4055432;
	Wed, 12 Apr 2023 13:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681324965;
	bh=x/r/nMHfNgXYW//mDVntOmjjFigaOxzx4iapEkpJQ3Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OKt2M6Yx30dIPC4swpqFeDUJF0XV9Uin291/bY1zNtf76AEOmiMNhiG1OoWr/kwNd
	 n5lcZ2S7GIKV4Y2aN18m9l8ONEWjOoVkAV+0Yq2iFAyi3kYL3u/UXrXPpd32Yh6Qhs
	 AC0eZDxn/hjJ1p2UaFxaH8nupNOfYeFOAzuEW5t4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CIgj3C036817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 13:42:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 13:42:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 13:42:45 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CIggZa023440;
	Wed, 12 Apr 2023 13:42:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 6/6] meta-ti-bsp: graphics: Rename SGX driver recipes to match Rogue
Date: Wed, 12 Apr 2023 13:42:42 -0500
Message-ID: <20230412184242.29743-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412184242.29743-1-afd@ti.com>
References: <20230412184242.29743-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 18:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16381

The names we use for the GPU components are not consistent nor do the
intuitively describe their function. Let's fix that.

We do 3 things, first powervr-drivers/ contains only the kernel-mode
half of the driver, for GPUs most of the driver lives in userspace,
and the "PowerVR" name is no longer correct for the latest GPUs. Rename
this to ti-img-gpu-km/ which matches better with our naming for the
user-mode half and the TI/IMG codecs.

Next, ti-img-rogue-driver is renamed ti-img-rogue-km, same reasoning
as above and matches the SGX version of the same.

The usermode driver lives in a directory named "libgles", but the
driver does not just provide libgles, it also can provide OpenCL,
DRI, and Vulkan. Rename to match the kernel-mode half.

Lastly, the acronym "DDK" is short for "Driver Development Kit".
This kit is provided by Imagination to TI and is what we use to
"Develop" the "Driver". What we ship is not the DDK, it is the
driver itself. The name DDK seems to have just been passed through.
Remove use of "ddk" where we can.

To summarize:

 * powervr-drivers     -> ti-img-gpu-km
 * ti-img-rogue-driver -> ti-img-rogue-km
 * ti-sgx-ddk-km       -> ti-img-sgx-km
 * libgles             -> ti-img-gpu-umlibs
 * ti-sgx-ddk-um       -> ti-img-sgx-umlibs

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...compiler-support-OpenEmbedded-nodistro-internal-aarc.patch | 0
 .../ti-img-rogue-km_1.18.6276027.bb}                          | 0
 .../ti-img-sgx-km_1.17.4948957.bb}                            | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend       | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend          | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc                | 4 ++--
 .../ti-img-rogue-umlibs_1.18.6276027.bb                       | 3 ++-
 .../ti-img-sgx-umlibs}/pvrsrvkm.rules                         | 0
 .../ti-img-sgx-umlibs_1.17.4948957.bb}                        | 2 +-
 9 files changed, 8 insertions(+), 7 deletions(-)
 rename meta-ti-bsp/recipes-bsp/{powervr-drivers/ti-img-rogue-driver => ti-img-gpu-km/ti-img-rogue-km}/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch (100%)
 rename meta-ti-bsp/recipes-bsp/{powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb => ti-img-gpu-km/ti-img-rogue-km_1.18.6276027.bb} (100%)
 rename meta-ti-bsp/recipes-bsp/{powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb => ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb} (97%)
 rename meta-ti-bsp/recipes-graphics/{libgles => ti-img-gpu-umlibs}/ti-img-rogue-umlibs_1.18.6276027.bb (94%)
 rename meta-ti-bsp/recipes-graphics/{libgles/ti-sgx-ddk-um => ti-img-gpu-umlibs/ti-img-sgx-umlibs}/pvrsrvkm.rules (100%)
 rename meta-ti-bsp/recipes-graphics/{libgles/ti-sgx-ddk-um_1.17.4948957.bb => ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb} (98%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
rename to meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km_1.18.6276027.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
rename to meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-rogue-km_1.18.6276027.bb
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb
similarity index 97%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
rename to meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb
index bf4fa98a..a624017d 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-gpu-km/ti-img-sgx-km_1.17.4948957.bb
@@ -45,4 +45,4 @@ do_install:am65xx() {
     make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
-RRECOMMENDS:${PN} += "ti-sgx-ddk-um"
+RRECOMMENDS:${PN} += "ti-img-sgx-umlibs"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
index 912e9e9d..17187330 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
@@ -1 +1 @@
-require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-km ti-img-sgx-km', 'pvr-mesa.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
index 912e9e9d..17187330 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
@@ -1 +1 @@
-require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-km ti-img-sgx-km', 'pvr-mesa.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
index 96c484a7..85f6968e 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 SRCREV = "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
 
 PACKAGECONFIG:append = " \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-km', 'pvr', '', d)} \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-sgx-km', 'sgx', '', d)} \
 "
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-rogue-umlibs_1.18.6276027.bb
similarity index 94%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
rename to meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-rogue-umlibs_1.18.6276027.bb
index 94d14ded..32525d48 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
+++ b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-rogue-umlibs_1.18.6276027.bb
@@ -22,7 +22,8 @@ TARGET_PRODUCT:am62xx = "am62_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
-RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
+RDEPENDS:${PN} += "mesa-megadriver libdrm"
+RDEPENDS:${PN} += "ti-img-rogue-km"
 
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs/pvrsrvkm.rules
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
rename to meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs/pvrsrvkm.rules
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb
similarity index 98%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
rename to meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb
index 755cc4f5..4b34e8b7 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/ti-img-gpu-umlibs/ti-img-sgx-umlibs_1.17.4948957.bb
@@ -36,7 +36,7 @@ inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
 
 RDEPENDS:${PN} += "libdrm"
 
-RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
+RRECOMMENDS:${PN} += "ti-img-sgx-km"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


