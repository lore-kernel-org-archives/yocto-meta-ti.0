Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.6797.1613040664890526876
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 02:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GJekr7a2;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D95AE38C08DD
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 10:51:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BAp3Ef041139
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 04:51:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613040663;
	bh=0KJwkgs6N67MsGUTWWElAbCFr0tGtVF6k5MUlhrbEYc=;
	h=From:To:CC:Subject:Date;
	b=GJekr7a2ApRi6Lqm7ExxH+StzzTi+PhdKcQ5QjkdMYHZ+SfT5Prcgam61U/OrkjXZ
	 /LhexiKIiR7v41vbfRcIpHatoTK4nbEUW4LtnBTjP8USVQXAC0Kch+nJ08HQ9TTzBw
	 6uNOWf/0be3dzwzl3nvuCkyDzPs9Dt5fgIvuL76A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BAp2DN019394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 04:51:03 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 04:51:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Feb 2021 04:51:02 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BAoxIT060504;
	Thu, 11 Feb 2021 04:51:00 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <dmurphy@ti.com>
CC: <lokeshvutla@ti.com>, <kishon@ti.com>, <nsekhar@ti.com>,
        <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] recipes-bsp: wl-fw: New recipe for WiLink firmwares
Date: Thu, 11 Feb 2021 16:20:18 +0530
Message-ID: <20210211105018.10470-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add a new recipe which installs the WiLink firmware from the
official ti-linux-firmware repo.

This is required for supporting the Wireless functionaliy on
the am64xx-sk board.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-bsp/wl-fw/wl-fw_git.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-bsp/wl-fw/wl-fw_git.bb

diff --git a/recipes-bsp/wl-fw/wl-fw_git.bb b/recipes-bsp/wl-fw/wl-fw_git.bb
new file mode 100644
index 00000000..01d8e58b
--- /dev/null
+++ b/recipes-bsp/wl-fw/wl-fw_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Firmware files for Wilink"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec"
+
+PV = "7.3+git${SRCPV}"
+
+SRCREV = "b66ee9ae020c31d7138f0af38518823bb4f5791e"
+BRANCH = "ti-linux-firmware"
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;branch=${BRANCH}"
+
+COMPATIBLE_MACHINE = "k3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CLEANBROKEN = "1"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware/ti-connectivity
+    install -m 644 ${S}/ti-connectivity/* ${D}${base_libdir}/firmware/ti-connectivity/
+}
+
+FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
-- 
2.17.1

