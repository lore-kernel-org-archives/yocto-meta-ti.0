Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.104442.1597895291248228469
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 20:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B19A40C49;
	Thu, 20 Aug 2020 03:48:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFJmiRQvd4E9; Thu, 20 Aug 2020 03:48:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7001340B2D;
	Thu, 20 Aug 2020 03:48:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8779617341D;
	Wed, 19 Aug 2020 23:48:08 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 1/2] ti-rtos-metadata: add recipe to fetch and deploy metadata.inc for RTOS FW binary integration
Date: Wed, 19 Aug 2020 23:48:06 -0400
Message-Id: <1597895287-29065-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
new file mode 100644
index 0000000..985ff8a
--- /dev/null
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -0,0 +1,41 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit nopackages deploy
+
+PLAT_SFX = ""
+PLAT_SFX_j7 = "/j721e"
+PLAT_SFX_j7200-evm = "/j7200"
+PLAT_SFX_am65xx = "/am65xx"
+
+# Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
+TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
+TI_RTOS_METADATA_PROTOCOL ?= "git"
+TI_RTOS_METADATA_SRCREV ?= "2290c123a0c4ba4804d794c39532296a9c7b9587"
+TI_RTOS_METADATA_BRANCH ?= "master"
+TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
+TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
+
+PV = "1.0.0"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "${TI_RTOS_METADATA_URI};branch=${TI_RTOS_METADATA_BRANCH};protocol=${TI_RTOS_METADATA_PROTOCOL}"
+SRCREV = "${TI_RTOS_METADATA_SRCREV}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${TI_RTOS_METADATA_FILE} ${DEPLOYDIR}/
+}
+
+addtask deploy before do_build after do_compile
-- 
2.7.4

