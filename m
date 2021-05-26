Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2217.1622057480922909475
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 May 2021 12:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Sp9elrYZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QJVJnj037485;
	Wed, 26 May 2021 14:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622057479;
	bh=zmXUrQ6hs0JOxTLiheK1hEPGdErnoh7oqqn/5jJhcdY=;
	h=From:To:CC:Subject:Date;
	b=Sp9elrYZwGZX699cF1J4pFBrYBx4u26fhKkKCDWpviMfXndD6WR50lGObwmg7PSEl
	 GZNntkvOJ8VTmUGWvoJuvgI8yBKFmPC0Qqg/q976giQM03SJAnToQj9vH91bKJXyC5
	 7j3QV7xdfJ0emwW9cLt/oMQHFdye87e18ESzMxnk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QJVJJp033089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 May 2021 14:31:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 14:31:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 14:31:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QJVJNa002963;
	Wed, 26 May 2021 14:31:19 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Nishant Menon <nm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH v3] linux-ti-staging: Add extra dtc flags to support dtb overlays
Date: Wed, 26 May 2021 14:31:19 -0500
Message-ID: <20210526193119.25596-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Added KERNEL_DTB_OVERLAY_SUPPORT to common ti-soc include. This fixes the issue 
where the dtbs are build without symbols causing issue with overlays.

Please note this increases the size of the dtb for all platform
derived from ti-soc. So for custom boards disable it from local.conf to
reduce size.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
Changes:
Moved the KERNEL_DTB_OVERLAY_SUPPORT to common ti-soc.inc
This makes it more maintainable and with weak assignement can be
override from local.conf

 conf/machine/include/ti-soc.inc               | 1 +
 recipes-kernel/linux/linux-ti-mainline_git.bb | 6 ++++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ++++--
 recipes-kernel/linux/ti-kernel.inc            | 9 +++++++++
 4 files changed, 18 insertions(+), 4 deletions(-)
 create mode 100644 recipes-kernel/linux/ti-kernel.inc

diff --git a/conf/machine/include/ti-soc.inc b/conf/machine/include/ti-soc.inc
index 227d8972..2792d2a0 100644
--- a/conf/machine/include/ti-soc.inc
+++ b/conf/machine/include/ti-soc.inc
@@ -1,4 +1,5 @@
 # This is a generic TI SOC family. It is a superset of all other SOCs
 # and platforms defined in meta-ti to allow BSP-level overrides.
 SOC_FAMILY = "ti-soc"
+KERNEL_DTB_OVERLAY_SUPPORT ?= "1"
 require conf/machine/include/soc-family.inc
diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index fc16485d..6770adca 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -8,10 +8,12 @@ inherit kernel
 DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
+require recipes-kernel/linux/ti-kernel.inc
 
 DEPENDS += "gmp-native"
 
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
@@ -23,7 +25,7 @@ SRCREV = "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
 PV = "5.12+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 4ec19af7..0a134f93 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -11,11 +11,13 @@ require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
+require recipes-kernel/linux/ti-kernel.inc
 
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
@@ -25,7 +27,7 @@ SRCREV = "d85aee3e19aa7403bd157d2ae30917e736096a7f"
 PV = "5.10.30+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
diff --git a/recipes-kernel/linux/ti-kernel.inc b/recipes-kernel/linux/ti-kernel.inc
new file mode 100644
index 00000000..a7eb476e
--- /dev/null
+++ b/recipes-kernel/linux/ti-kernel.inc
@@ -0,0 +1,9 @@
+# Add DTC FLAGS -@ when KERNEL_DTB_OVERLAY_SUPPORT is enabled
+
+def get_extra_dtc_args(d):
+    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
+        return "DTC_FLAGS=-@"
+    else:
+        return ""
+
+EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
-- 
2.17.1

