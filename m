Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4459DC41513
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 16:01:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.680.1715184077083721900
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 May 2024 09:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uzYvOtYb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448G1F0U060861;
	Wed, 8 May 2024 11:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715184075;
	bh=3jot9rlZQsK2PnF5DJOrm1HN2JO39vEENL3QJUQnxOs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=uzYvOtYbIulQ1EhZgrXV7lkVsiysTreFFuQ30V4fPlLL1v6WgOKobolnPAjvudgTL
	 /KytEgOxV51wACx2ZawEUwxTA448mwVMlxblLaISsS919IG8Uv9mW39Meuqk5WKEj2
	 0ERY3CMuiGE97EdWxCxyAtgpnALKSrSvcw4XON3o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448G1FVr002136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 11:01:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 11:01:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 11:01:15 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448G1Ekq032698;
	Wed, 8 May 2024 11:01:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s4jjG-0004Uq-Qt; Wed, 08 May 2024 11:01:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 2/2] recipes: Update S = WORKDIR recipes to use ${S} correctly
Date: Wed, 8 May 2024 11:01:14 -0500
Message-ID: <20240508160114.17242-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508160114.17242-1-reatmon@ti.com>
References: <20240508160114.17242-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 May 2024 16:01:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17645

This is a corresponding patch to match one from Richard Purdie in
oe-core. [1]

Where recipes use S = ${WORKDIR}, ensure they are referencing ${S} correctly
to access files as soon we want to stop doing this in WORKDIR at which point
they would break unless corrected.

[1] https://git.openembedded.org/openembedded-core/commit/?id=f25dd633fffe6560f191526d1869e657e129bad9

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: After reviewing what all was being changed, I decided to make
smaller changes for this patch series while the whole UNPACKDIR
change is worked out upstream.

 meta-ti-bsp/recipes-core/udev/eudev_%.bbappend         |  4 ++--
 .../recipes-ti/beagleboard/beaglebone-capes.bb         |  4 ++--
 meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb   | 10 +++++-----
 .../recipes-ti/bios/ti-sysbios_6.76.03.01.bb           |  2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb |  2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb   |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend b/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend
index ddb1e75d..8535ac70 100644
--- a/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend
+++ b/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend
@@ -8,6 +8,6 @@ SRC_URI:append:ti-soc = " \
 PR:append:ti-soc = ".3"
 
 do_install:append:ti-soc() {
-    install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/firmware.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${S}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${S}/firmware.rules ${D}${sysconfdir}/udev/rules.d/
 }
diff --git a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
index ceefe0d6..a1f38e48 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -14,13 +14,13 @@ SRC_URI = "file://cape.service \
 
 do_install() {
 	install -d ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/cape.service ${D}${base_libdir}/systemd/system
+	install -m 0644 ${S}/cape.service ${D}${base_libdir}/systemd/system
 
 	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
 	ln -sf ../cape.service ${D}${base_libdir}/systemd/system/basic.target.wants/
 
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/cape*.sh ${D}${bindir}
+	install -m 0755 ${S}/cape*.sh ${D}${bindir}
 }
 
 FILES:${PN} += "${base_libdir}/systemd/system"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
index 3ab00ec3..37a61ca4 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
@@ -22,19 +22,19 @@ SRC_URI = "file://storage-gadget-init.service \
 
 do_install() {
 	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
-	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system
+	install -m 0644 ${S}/*.service ${D}${base_libdir}/systemd/system
 
-	for i in ${WORKDIR}/storage-gadget-init.service ; do
+	for i in ${S}/storage-gadget-init.service ; do
 		install -m 0644 $i ${D}${base_libdir}/systemd/system
 		ln -sf ../$(basename $i) ${D}${base_libdir}/systemd/system/basic.target.wants/
 	done
 
 	install -d ${D}${sysconfdir}/udev/rules.d
-	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d
-	install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
+	install -m 0644 ${S}/*.rules ${D}${sysconfdir}/udev/rules.d
+	install -m 0644 ${S}/*.conf ${D}${sysconfdir}
 
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
+	install -m 0755 ${S}/*.sh ${D}${bindir}
 }
 
 PACKAGES =+ "${PN}-storage ${PN}-network ${PN}-udhcpd"
diff --git a/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
index d242510f..1226bb19 100644
--- a/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
+++ b/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
@@ -10,7 +10,7 @@ SRC_URI[sysbiosbin.md5sum] = "647243209d66d5dd35503b0ec5a84ab9"
 SRC_URI[sysbiosbin.sha256sum] = "b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
 
 TI_BIN_UNPK_CMDS = ""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${S}"
 
 BINFILE = "bios_${PV}.run"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index c96113fe..0a52561b 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -31,7 +31,7 @@ do_install() {
 }
 
 do_install:class-target() {
-    ${WORKDIR}/${BINFILE} --prefix ${D}
+    ${S}/${BINFILE} --prefix ${D}
 }
 
 FILES:${PN} += "${datadir}/ti/*"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index fd34657a..e7fda0f3 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -92,7 +92,7 @@ do_install() {
 }
 
 do_install:class-target() {
-    ${WORKDIR}/${BINFILE} --prefix ${D}
+    ${S}/${BINFILE} --prefix ${D}
 }
 
 FILES:${PN} += "${datadir}/ti/*"
-- 
2.17.1


