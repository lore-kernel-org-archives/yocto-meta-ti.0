Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D22C25B06
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 01:41:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5970.1660268494033592855
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 18:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kIPpe2Kr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27C1fVND051196;
	Thu, 11 Aug 2022 20:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660268491;
	bh=Qi+kXOvQMG2EK71O7Of2pkEK5AL8cyOy66VkXH/Ikoo=;
	h=From:To:CC:Subject:Date;
	b=kIPpe2KrMzN+yEqPujlelC0DRkQTo5spulM/aKEbCUzVQh8a4pb2aWHdgOaxWDnzq
	 KP+RuUr3ZrbApIDmpkGdvreTKBHycBYAj+/XUFrFje4UYnyfBu67NhYA9NXQwIoHxM
	 /qJLaTOb2QVDpiPUTlc8fVi2IhpAGcghdl79n88I=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27C1fVZm093231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Aug 2022 20:41:31 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 20:41:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 20:41:30 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27C1fUVp026781;
	Thu, 11 Aug 2022 20:41:30 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/3] recipies-ti: Add TI K3 Security
 Development Package
Date: Thu, 11 Aug 2022 20:41:26 -0500
Message-ID: <20220812014128.1185-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Aug 2022 01:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14956

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-ti/includes/ti-paths.inc      |  2 ++
 recipes-ti/secdev/ti-k3-secdev_git.bb | 36 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-ti/secdev/ti-k3-secdev_git.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 52a93cf5..44731a4e 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -61,6 +61,7 @@ export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
 export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro-baremetal"
 export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-linaro-baremetal-aarch64"
 export TI_CGT7X_INSTALL_DIR_RECIPE        = "${installdir}/cgt-c7x"
+export TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${installdir}/ti-k3-secdev"
 
 
 # This is where the tools will end up in sysroot
@@ -116,6 +117,7 @@ export TI_CGT6X_7_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${TI_CGT6X_7_INSTALL_DIR
 export GCC_LINARO_BAREMETAL_TOOLCHAIN         =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}"
 export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN =  "${STAGING_DIR_NATIVE}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}"
 export TI_CGT7X_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${TI_CGT7X_INSTALL_DIR_RECIPE}"
+export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
 
 
 DSPSUFFIX_omapl137 = "x674"
diff --git a/recipes-ti/secdev/ti-k3-secdev_git.bb b/recipes-ti/secdev/ti-k3-secdev_git.bb
new file mode 100644
index 00000000..28dbe9ee
--- /dev/null
+++ b/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Security development tools for High-Security(HS) TI K3 processors."
+HOMEPAGE = "https://git.ti.com/cgit/security-development-tools/core-secdev-k3"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
+
+# Native host tool only
+COMPATIBLE_MACHINE = "null"
+COMPATIBLE_MACHINE_class-native = "(.*)"
+COMPATIBLE_MACHINE_class-nativesdk = "(.*)"
+
+GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
+GIT_PROTOCOL = "https"
+GIT_BRANCH = "master"
+GIT_SRCREV = "eb2c4d734487e5095b94cef3fd7213ee71d9e016"
+
+SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${GIT_BRANCH}"
+SRCREV = "${GIT_SRCREV}"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    CP_ARGS="-Prf --preserve=mode,links,timestamps --no-preserve=ownership"
+    install -d ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS} ${S}/* ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
+}
+
+FILES_${PN} += "${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.36.1


