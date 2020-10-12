Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.196.1602545490196466118
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 16:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0DE4E40BD9;
	Mon, 12 Oct 2020 23:31:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbtRJH4vZJ1Y; Mon, 12 Oct 2020 23:31:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B2F8840AB7;
	Mon, 12 Oct 2020 23:31:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 900CA17429C;
	Mon, 12 Oct 2020 19:31:26 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 2/3] linux-ti-mainline: add mainline 5.9 using ti-upstream-tools
Date: Mon, 12 Oct 2020 19:31:18 -0400
Message-Id: <1602545479-715-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602545479-715-1-git-send-email-denis@denix.org>
References: <1602545479-715-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../defconfig                                      |  0
 .../dra7xx/defconfig                               |  0
 .../k2g/defconfig                                  |  0
 .../k3/defconfig                                   |  0
 .../keystone/defconfig                             |  0
 .../omapl138/defconfig                             |  0
 .../ti33x/defconfig                                |  0
 .../ti43x/defconfig                                |  0
 ...-ti-staging_5.4.bb => linux-ti-mainline_git.bb} | 71 +++++++++++++++-------
 9 files changed, 49 insertions(+), 22 deletions(-)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/dra7xx/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/k2g/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/k3/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/keystone/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/omapl138/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/ti33x/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging-5.4 => linux-ti-mainline}/ti43x/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging_5.4.bb => linux-ti-mainline_git.bb} (20%)

diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/defconfig b/recipes-kernel/linux/linux-ti-mainline/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconfig b/recipes-kernel/linux/linux-ti-mainline/k2g/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/k2g/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/k2g/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig b/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/k3/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-mainline/keystone/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/keystone/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/keystone/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defconfig b/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconfig
copy to recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
similarity index 20%
copy from recipes-kernel/linux/linux-ti-staging_5.4.bb
copy to recipes-kernel/linux/linux-ti-mainline_git.bb
index eaf4038..6159725 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -1,43 +1,70 @@
 SECTION = "kernel"
-SUMMARY = "Linux kernel for TI devices"
+SUMMARY = "Mainline Linux kernel for TI devices (with ti-upstream-tools)"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 inherit kernel
 
-DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
+DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/cmem.inc
-require recipes-kernel/linux/ti-uio.inc
-require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
-
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-5.4.y"
+BRANCH = "master"
 
-SRCREV = "f85baf8e2e6374594eb76d4c14ada9d62a2fa98b"
-PV = "5.4.69+git${SRCPV}"
+# 5.9 Mainline version
+SRCREV = "bbf5c979011a099af5dc76498918ed7df445635b"
+PV = "5.9+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
 KERNEL_GIT_PROTOCOL = "git"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig"
+SRC_URI += " \
+    ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
+    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
+    file://defconfig \
+"
 
-FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
+SRCREV_ti-upstream-tools = "3f36f66594d7905f7b97bc7870931173fd2466bd"
+SRCREV_FORMAT = "linux"
+
+KERNEL_DEVICETREE = ""
+
+kernel_do_compile_append() {
+	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+	oe_runmake -C ${WORKDIR}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+}
 
-# Special configuration for remoteproc/rpmsg IPC modules
-module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
-module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
-module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
-KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
-KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
+do_install_append() {
+	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \)`; do
+		dtb="$dtbf"
+		dtb_ext=${dtb##*.}
+		dtb_base_name=`basename $dtb .$dtb_ext`
+		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
+		install -m 0644 $dtbf ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
+	done
+}
+
+do_deploy_append() {
+	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \) -printf '%P\n'`; do
+		dtb="$dtbf"
+		dtb_ext=${dtb##*.}
+		dtb_base_name=`basename $dtb .$dtb_ext`
+		dtb_dir=`dirname $dtb`
+		install -d ${DEPLOYDIR}
+		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
+	done
+}
+
+do_shared_workdir_prepend() {
+	cd ${B}
+	echo >> Module.symvers
+}
+
+FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
-- 
2.7.4

