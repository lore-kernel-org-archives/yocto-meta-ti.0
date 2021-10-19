Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.808.1634684984151893314
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 16:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F2EB240BE9;
	Tue, 19 Oct 2021 23:09:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id saGCiojPp588; Tue, 19 Oct 2021 23:09:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E3361406B5;
	Tue, 19 Oct 2021 23:09:39 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A7F3117469F;
	Tue, 19 Oct 2021 19:09:39 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] powervr-drivers: teach modules_install to respect "usrmerge" distro feature
Date: Tue, 19 Oct 2021 19:09:38 -0400
Message-Id: <1634684978-3972-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/

When "usrmerge" distro feature is enabled, root directories /bin, /sbin, /lib
are simply symlinks pointing to their counterparts in /usr. Hence, modules
should be installed accordingly into /usr/lib/modules/...

Since IMG Makefiles don't take the direct target directory, such as
${nonarch_base_libdir}/modules/, adjust the top-level rootfs path instead.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb | 2 +-
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
index c3524e9..09f6f03 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
@@ -36,5 +36,5 @@ PVR_WS = "wayland"
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index ff420cd..3848e84 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -42,9 +42,9 @@ do_compile:prepend() {
 }
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
 do_install:k3() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
-- 
2.7.4

