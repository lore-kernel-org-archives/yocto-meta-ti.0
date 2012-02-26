Return-Path: <ebutera@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAF9DE013A6
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:31 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id e49so869394eek.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.14.37.203 as permitted sender) client-ip=10.14.37.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.14.37.203 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.14.37.203])
	by 10.14.37.203 with SMTP id y51mr6331547eea.61.1330285171695 (num_hops
	= 1); Sun, 26 Feb 2012 11:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Owtpi1I1/AXj4Syt3Zuanr7b3X6VE4ImJHGR++eI868=;
	b=QvT0Cgsha32e6WsOnOoodBlfEpHKsC3VT4Fu1SzFEVMJmgRe5stuy0fzJ+EOHsAkRh
	lUtC2FQpg2eFwqxbC4/9J661k0k0HWUczOp58zNIfwzvX7P/8JBd+NgVWnQhEknfqny/
	igGRNbh777/huU/hzfXu22NFYC12V38NzFaz0=
Received: by 10.14.37.203 with SMTP id y51mr4761060eea.61.1330285171611;
	Sun, 26 Feb 2012 11:39:31 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:30 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:09 +0100
Message-Id: <1330285154-14853-5-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 4/9] bios-syslink: add omap4 bios syslink
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 19:39:32 -0000

This builds the following syslink firmwares:

Notify_MPUSYS_reroute_Test_Core0.xem3
Notify_MPUSYS_Test_Core0.xem3

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/includes/ti-paths.inc          |    2 +
 recipes-ti/syslink/ti-bios-syslink_git.bb |   75 +++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/syslink/ti-bios-syslink_git.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 511b5ae..2b82b0e 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -3,6 +3,7 @@ installdir = "${datadir}/ti"
 # This is where do_install will put it
 export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
 export BIOS_INSTALL_DIR_RECIPE       = "${installdir}/ti-dspbios-tree"
+export BIOS_SYSLINK_INSTALL_DIR_RECIPE = "${installdir}/ti-bios-syslink-tree"
 export BIOSPSP_INSTALL_DIR_RECIPE    = "${installdir}/ti-biospsp-tree"
 export BIOSUTILS_INSTALL_DIR_RECIPE  = "${installdir}/ti-biosutils-tree"
 export C6ACCEL_INSTALL_DIR_RECIPE    = "${installdir}/ti-c6accel-tree"
@@ -45,6 +46,7 @@ export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
+export BIOS_SYSLINK_INSTALL_DIR = "${STAGING_DIR_TARGET}${BIOS_SYSLINK_INSTALL_DIR_RECIPE}"
 export BIOSPSP_INSTALL_DIR    = "${STAGING_DIR_TARGET}${BIOSPSP_INSTALL_DIR_RECIPE}"
 export BIOSUTILS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${BIOSUTILS_INSTALL_DIR_RECIPE}"
 export C6ACCEL_INSTALL_DIR    = "${STAGING_DIR_TARGET}${C6ACCEL_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/syslink/ti-bios-syslink_git.bb b/recipes-ti/syslink/ti-bios-syslink_git.bb
new file mode 100644
index 0000000..5e0d090
--- /dev/null
+++ b/recipes-ti/syslink/ti-bios-syslink_git.bb
@@ -0,0 +1,75 @@
+DESCRIPTION = "SYSLINK Inter-Processor Communications (IPC) for TI ARM/DSP processors"
+HOMEPAGE = "http://dev.omapzoom.org/?p=tisyslink/bios-syslink.git;a=summary"
+SECTION = "devel"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "(omap4430-panda|pandaboard)"
+
+# no license file...
+LIC_FILES_CHKSUM = "file://packages/config.bld;md5=5e5a441c097dc4766790ade7eb2f3d85"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+
+PV = "gitr${SRCPV}"
+PR = "r1"
+
+DEPENDS = "ti-sysbios ti-xdctools ti-cgt6x ti-ipc ti-cgt470"
+DEPENDS += "virtual/kernel"
+
+PROVIDES += "ti-bios-syslink-firmware"
+
+# 2011-10-18: SysLink-IPC: DEH - Add cache flush to the exception handler hook
+SRCREV = "f289b98fcadd781ce0c1ae301a6c752bfc062ef6"
+
+SRC_URI = "git://git.omapzoom.org/platform/hardware/ti/bios-syslink.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+# prevent package strip, if xem3 is stripped it will fail to load with:
+# << D L O A D >> WARNING: Mandatory dynamic tag DT_STRTAB/DT_STRSZ not found!
+# *** DLoad4430_load: Failed load of file!
+#        Error [0x8fade003] at Line no: 719 in file elfload/dload4430.c
+# *** ProcMgr_load: DLoad4430_load failed.
+#        Error [0x8f2ba003] at Line no: 1553 in file ProcMgr.c
+# Error in ProcMgr_load, status [0x8f2ba003]
+INHIBIT_PACKAGE_STRIP = "1"
+
+#export XDCPATH = "${IPC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
+export XDCPATH = "${SYSBIOS_INSTALL_DIR}/packages"
+export XDCBUILDCFG = "${S}/packages/config.bld"
+export TMS470CGTOOLPATH = "${CODEGEN_ARM_INSTALL_DIR}"
+export C6000CGTOOLPATH = "${CODEGEN_INSTALL_DIR}"
+
+do_prepsources () {
+
+	# Prepare the tree for rebuiling - clean and generate interfaces
+	cd ${S}/packages    
+	${XDC_INSTALL_DIR}/xdc --jobs=${BB_NUMBER_THREADS} clean -PR ./ti
+
+}
+
+addtask prepsources after do_configure before do_compile
+
+do_compile() {
+
+	cd ${S}/packages
+	${XDC_INSTALL_DIR}/xdc --jobs=${BB_NUMBER_THREADS} -PR ./ti/sdo ./ti/omap/uart/ ./ti/omap/mem/ ./ti/omap/platform/ ./ti/omap/slpm/ ./ti/omap/deh ./ti/omap/hdmiwa
+	${XDC_INSTALL_DIR}/xdc --jobs=${BB_NUMBER_THREADS} -PR ./ti/omap/samples/notify
+
+}
+
+do_install () {
+
+	# Install firmware
+	install -d ${D}/lib/firmware/omap4
+	install -m 0755 ${S}/packages/ti/omap/samples/notify/ti_omap_platform_core0/whole_program_debug/* ${D}/lib/firmware/omap4
+
+	install -d ${D}${BIOS_SYSLINK_INSTALL_DIR_RECIPE}
+	cp -pPrf ${S}/* ${D}${BIOS_SYSLINK_INSTALL_DIR_RECIPE}
+
+}
+
+PACKAGES =+ "ti-bios-syslink-firmware"
+FILES_ti-bios-syslink-firmware = "/lib/firmware/omap4/*"
+
-- 
1.7.5.4


