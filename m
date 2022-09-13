Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BD4C6FA86
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.826.1663041344552917780
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 93AC340D22
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnJ4GCTihRNm for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8169B40D68
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D8CA31749CE
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 02/65] ti-tros-firmware: Add DM firmware
 binary to deploy directory for am62xx-evm
Date: Tue, 13 Sep 2022 03:54:38 +0000
Message-Id: <20220913035541.2364351-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15025

From: Aparna M <a-m1@ti.com>

The DM firmware binary is required for building uboot binaries for
am62xx-evm  using toplevel makefile in SDK. Add this file to deploy
directory so it can be included in prebuilt-images directory of SDK
for am62xx-evm.

Signed-off-by: Aparna M <a-m1@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 93429570..317ff4c4 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -167,6 +167,16 @@ do_install:am62xx() {
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
 }
=20
+
+do_deploy() {
+    install -d ${DEPLOYDIR}
+}
+
+do_deploy:am62xx() {
+    install -d ${DEPLOYDIR}
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${DEPLOYDIR}
+}
+
 # Set up names for the firmwares
 ALTERNATIVE:${PN}:am65xx =3D "\
                     am65x-mcu-r5f0_0-fw \
@@ -355,3 +365,5 @@ INSANE_SKIP:${PN} +=3D "arch"
 # we don't want to configure and build the source code
 do_compile[noexec] =3D "1"
 do_configure[noexec] =3D "1"
+
+addtask deploy after do_install
--=20
2.25.1


