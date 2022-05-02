Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C6BC35295
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11527.1651503086694239740
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A3B540CAF
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2L8Xs6WRqtG for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7274140CA8
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 65E45174923
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 14/26] pru-icss_git.bb: add AM62x
Date: Mon,  2 May 2022 14:51:08 +0000
Message-Id: <20220502145120.726632-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14660

From: Nick Saulnier <nsaulnier@ti.com>

This commit adds the PRU Software Support Package (PSSP) to the AM62x Lin=
ux
Processor SDK under example-applications/pru-icss-x.x.x. It also adds pre=
built
PRU firmware to the default AM62x filesystem image under the /lib/firmwar=
e
folder.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/pru/pru-icss_git.bb           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-ext=
ras/recipes-bsp/pru/pru-icss_git.bb
index 49f29086..cb2f8cc2 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -40,6 +40,7 @@ SUBDIRS =3D "examples pru_cape/pru_fw lib/src labs"
 PLATFORM:ti33x =3D "am335x"
 PLATFORM:ti43x =3D "am437x"
 PLATFORM:omap-a15 =3D "am572x"
+PLATFORM:am62xx =3D "am62x"
 PLATFORM:am64xx =3D "am64x"
 PLATFORM:am65xx =3D "am65x"
 PLATFORM:j7 =3D "j721e"
@@ -99,6 +100,16 @@ do_install:append:omap-a15() {
     done
 }
=20
+do_install:append:am62xx() {
+    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
+                   ${D}${nonarch_base_libdir}/firmware/pru
+    for i in 0 1
+    do
+        install -m 0644 ${S}/examples/${PLATFORM}/PRU_RPMsg_Echo_Interru=
pt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
+                        ${D}${nonarch_base_libdir}/firmware/pru
+    done
+}
+
 do_install:append:am64xx(){
     for i in 0 1
     do
@@ -175,6 +186,7 @@ FILES:${PN}-rpmsg-echo =3D "${nonarch_base_libdir}/fi=
rmware/pru/PRU_RPMsg_Echo_Int
 PRU_ICSS_ALTERNATIVES:ti33x    =3D "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES:ti43x    =3D "am437x-pru0_0-fw am437x-pru0_1-fw am=
437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES:omap-a15 =3D "am57xx-pru1_0-fw am57xx-pru1_1-fw am=
57xx-pru2_0-fw am57xx-pru2_1-fw"
+PRU_ICSS_ALTERNATIVES:am62xx   =3D "am62x-pru0-fw am62x-pru1-fw"
 PRU_ICSS_ALTERNATIVES:am64xx   =3D "am64x-pru0_0-fw am64x-pru0_1-fw am64=
x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-=
fw am64x-rtu1_1-fw"
 PRU_ICSS_ALTERNATIVES:am65xx   =3D "am65x-pru0_0-fw am65x-pru0_1-fw am65=
x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-=
fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-=
rtu2_1-fw"
 PRU_ICSS_ALTERNATIVES:j7       =3D "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-=
fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
@@ -193,6 +205,9 @@ ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] =3D "${nonarc=
h_base_libdir}/firmware/am57x
 ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/am57xx-pru2_0-fw"
 ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/am57xx-pru2_1-fw"
=20
+ALTERNATIVE_LINK_NAME[am62x-pru0-fw] =3D "${nonarch_base_libdir}/firmwar=
e/am62x-pru0-fw"
+ALTERNATIVE_LINK_NAME[am62x-pru1-fw] =3D "${nonarch_base_libdir}/firmwar=
e/am62x-pru1-fw"
+
 ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-pru0_0-fw"
 ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/am64x-pru1_0-fw"
@@ -259,6 +274,9 @@ ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] =3D=
 "${nonarch_base_libdir}/fir
 ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] =3D "${nonarch_base_l=
ibdir}/firmware/pru/PRU_Halt.out"
=20
+ALTERNATIVE_TARGET_pru-icss-halt[am62x-pru0-fw] =3D "${nonarch_base_libd=
ir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am62x-pru1-fw] =3D "${nonarch_base_libd=
ir}/firmware/pru/PRU_Halt.out"
+
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_1.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] =3D "${nonarch_base_li=
bdir}/firmware/pru/PRU_Halt_0.out"
@@ -323,6 +341,9 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-=
fw] =3D "${nonarch_base_libdi
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] =3D "${nonarch_=
base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
=20
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am62x-pru0-fw] =3D "${nonarch_bas=
e_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am62x-pru1-fw] =3D "${nonarch_bas=
e_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
+
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] =3D "${nonarch_b=
ase_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
--=20
2.25.1


