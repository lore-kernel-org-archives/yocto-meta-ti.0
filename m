Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0E5EE3F0B
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 18:32:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2423.1694543554533993956
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 11:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58F5040C2A;
	Tue, 12 Sep 2023 18:32:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6cp6Vp-77RI; Tue, 12 Sep 2023 18:32:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DF0540952;
	Tue, 12 Sep 2023 18:32:31 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A6494163CA7;
	Tue, 12 Sep 2023 14:32:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone/master][PATCH] ti-rtos-firmware: cleanup leftover alternative entries for Jacinto
Date: Tue, 12 Sep 2023 18:32:29 +0000
Message-Id: <20230912183229.199368-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 18:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16955

From: Denys Dmytriyenko <denys@konsulko.com>

Jacinto platforms use first R5 MCU core for DM firmware. When DM firmware=
 was
split out into own recipe[1], ALTERNATIVE_TARGET entries got removed from
ti-rtos-firmware recipe, but corresponding ALTERNATIVE_LINK_NAME entries
remained, causing warnings. Clean up those now.

[1] https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-ti/ti=
-rtos-bin/ti-rtos-firmware.bb?id=3Db21d29d94694ac49b97a1f4ba428c7d8cd6fb6=
4a

Fixes these warnings:

| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j7-mcu-r5f0_0-fw or /usr/lib/firm=
ware/j7-mcu-r5f0_0-fw.ti-rtos-firmware) does not exist, skipping...
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j7-mcu-r5f0_0-fw-sec or /usr/lib/=
firmware/j7-mcu-r5f0_0-fw-sec.ti-rtos-firmware) does not exist, skipping.=
..
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j7-mcu-r5f0_0-fw: /usr=
/lib/firmware/j7-mcu-r5f0_0-fw.ti-rtos-firmware does not exist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j7-mcu-r5f0_0-fw-sec: =
/usr/lib/firmware/j7-mcu-r5f0_0-fw-sec.ti-rtos-firmware does not exist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j7-mcu-r5f0_0-fw =3D=3D /=
usr/lib/firmware/j7-mcu-r5f0_0-fw
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j7-mcu-r5f0_0-fw-sec =3D=3D=
 /usr/lib/firmware/j7-mcu-r5f0_0-fw-sec

| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j7200-mcu-r5f0_0-fw or /usr/lib/f=
irmware/j7200-mcu-r5f0_0-fw.ti-rtos-firmware) does not exist, skipping...
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j7200-mcu-r5f0_0-fw-sec or /usr/l=
ib/firmware/j7200-mcu-r5f0_0-fw-sec.ti-rtos-firmware) does not exist, ski=
pping...
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j7200-mcu-r5f0_0-fw: /=
usr/lib/firmware/j7200-mcu-r5f0_0-fw.ti-rtos-firmware does not exist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j7200-mcu-r5f0_0-fw-se=
c: /usr/lib/firmware/j7200-mcu-r5f0_0-fw-sec.ti-rtos-firmware does not ex=
ist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j7200-mcu-r5f0_0-fw =3D=3D=
 /usr/lib/firmware/j7200-mcu-r5f0_0-fw
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j7200-mcu-r5f0_0-fw-sec =3D=
=3D /usr/lib/firmware/j7200-mcu-r5f0_0-fw-sec

| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j721s2-mcu-r5f0_0-fw or /usr/lib/=
firmware/j721s2-mcu-r5f0_0-fw.ti-rtos-firmware) does not exist, skipping.=
..
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j721s2-mcu-r5f0_0-fw-sec or /usr/=
lib/firmware/j721s2-mcu-r5f0_0-fw-sec.ti-rtos-firmware) does not exist, s=
kipping...
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j721s2-mcu-r5f0_0-fw: =
/usr/lib/firmware/j721s2-mcu-r5f0_0-fw.ti-rtos-firmware does not exist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j721s2-mcu-r5f0_0-fw-s=
ec: /usr/lib/firmware/j721s2-mcu-r5f0_0-fw-sec.ti-rtos-firmware does not =
exist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j721s2-mcu-r5f0_0-fw =3D=3D=
 /usr/lib/firmware/j721s2-mcu-r5f0_0-fw
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j721s2-mcu-r5f0_0-fw-sec =
=3D=3D /usr/lib/firmware/j721s2-mcu-r5f0_0-fw-sec

| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j784s4-mcu-r5f0_0-fw or /usr/lib/=
firmware/j784s4-mcu-r5f0_0-fw.ti-rtos-firmware) does not exist, skipping.=
..
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alternative target (/usr/lib/firmware/j784s4-mcu-r5f0_0-fw-sec or /usr/=
lib/firmware/j784s4-mcu-r5f0_0-fw-sec.ti-rtos-firmware) does not exist, s=
kipping...
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j784s4-mcu-r5f0_0-fw: =
/usr/lib/firmware/j784s4-mcu-r5f0_0-fw.ti-rtos-firmware does not exist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: NOT adding alternative provide /usr/lib/firmware/j784s4-mcu-r5f0_0-fw-s=
ec: /usr/lib/firmware/j784s4-mcu-r5f0_0-fw-sec.ti-rtos-firmware does not =
exist
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j784s4-mcu-r5f0_0-fw =3D=3D=
 /usr/lib/firmware/j784s4-mcu-r5f0_0-fw
| WARNING: ti-rtos-firmware-08.02.00.04-r4.1 do_package: ti-rtos-firmware=
: alt_link =3D=3D alt_target: /usr/lib/firmware/j784s4-mcu-r5f0_0-fw-sec =
=3D=3D /usr/lib/firmware/j784s4-mcu-r5f0_0-fw-sec

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index c560e7b4..751b10d6 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -128,7 +128,6 @@ ALTERNATIVE:${PN}:am62axx =3D "\
                     "
=20
 ALTERNATIVE:${PN}:j721e =3D "\
-                    j7-mcu-r5f0_0-fw    j7-mcu-r5f0_0-fw-sec \
                     j7-mcu-r5f0_1-fw    j7-mcu-r5f0_1-fw-sec \
                     j7-main-r5f0_0-fw   j7-main-r5f0_0-fw-sec \
                     j7-main-r5f0_1-fw   j7-main-r5f0_1-fw-sec \
@@ -140,14 +139,12 @@ ALTERNATIVE:${PN}:j721e =3D "\
                     "
=20
 ALTERNATIVE:${PN}:j7200 =3D "\
-                    j7200-mcu-r5f0_0-fw    j7200-mcu-r5f0_0-fw-sec \
                     j7200-mcu-r5f0_1-fw    j7200-mcu-r5f0_1-fw-sec \
                     j7200-main-r5f0_0-fw   j7200-main-r5f0_0-fw-sec \
                     j7200-main-r5f0_1-fw   j7200-main-r5f0_1-fw-sec \
                     "
=20
 ALTERNATIVE:${PN}:j721s2 =3D "\
-                    j721s2-mcu-r5f0_0-fw    j721s2-mcu-r5f0_0-fw-sec \
                     j721s2-mcu-r5f0_1-fw    j721s2-mcu-r5f0_1-fw-sec \
                     j721s2-main-r5f0_0-fw   j721s2-main-r5f0_0-fw-sec \
                     j721s2-main-r5f0_1-fw   j721s2-main-r5f0_1-fw-sec \
@@ -158,7 +155,6 @@ ALTERNATIVE:${PN}:j721s2 =3D "\
                     "
=20
 ALTERNATIVE:${PN}:j784s4 =3D "\
-                    j784s4-mcu-r5f0_0-fw    j784s4-mcu-r5f0_0-fw-sec \
                     j784s4-mcu-r5f0_1-fw    j784s4-mcu-r5f0_1-fw-sec \
                     j784s4-main-r5f0_0-fw   j784s4-main-r5f0_0-fw-sec \
                     j784s4-main-r5f0_1-fw   j784s4-main-r5f0_1-fw-sec \
@@ -200,8 +196,6 @@ ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw-sec] =3D "$=
{nonarch_base_libdir}/firmwar
 ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]     =3D "${nonarch_base_libdir}/fi=
rmware/am62a-c71_0-fw"
 ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] =3D "${nonarch_base_libdir}/fi=
rmware/am62a-c71_0-fw-sec"
=20
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]     =3D "${nonarch_base_libdir}/=
firmware/j7-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw-sec] =3D "${nonarch_base_libdir}/=
firmware/j7-mcu-r5f0_0-fw-sec"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw]     =3D "${nonarch_base_libdir}/=
firmware/j7-mcu-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw-sec] =3D "${nonarch_base_libdir}/=
firmware/j7-mcu-r5f0_1-fw-sec"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw]     =3D "${nonarch_base_libdir}=
/firmware/j7-main-r5f0_0-fw"
@@ -219,8 +213,6 @@ ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] =3D "${nonarch=
_base_libdir}/firmware/j7-c66
 ALTERNATIVE_LINK_NAME[j7-c71_0-fw]     =3D "${nonarch_base_libdir}/firmw=
are/j7-c71_0-fw"
 ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] =3D "${nonarch_base_libdir}/firmw=
are/j7-c71_0-fw-sec"
=20
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]     =3D "${nonarch_base_libdi=
r}/firmware/j7200-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw-sec] =3D "${nonarch_base_libdi=
r}/firmware/j7200-mcu-r5f0_0-fw-sec"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw]     =3D "${nonarch_base_libdi=
r}/firmware/j7200-mcu-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw-sec] =3D "${nonarch_base_libdi=
r}/firmware/j7200-mcu-r5f0_1-fw-sec"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw]     =3D "${nonarch_base_libd=
ir}/firmware/j7200-main-r5f0_0-fw"
@@ -228,8 +220,6 @@ ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] =3D "=
${nonarch_base_libdir}/firmwa
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw]     =3D "${nonarch_base_libd=
ir}/firmware/j7200-main-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] =3D "${nonarch_base_libd=
ir}/firmware/j7200-main-r5f0_1-fw-sec"
=20
-ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw]     =3D "${nonarch_base_libd=
ir}/firmware/j721s2-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw-sec] =3D "${nonarch_base_libd=
ir}/firmware/j721s2-mcu-r5f0_0-fw-sec"
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw]     =3D "${nonarch_base_libd=
ir}/firmware/j721s2-mcu-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw-sec] =3D "${nonarch_base_libd=
ir}/firmware/j721s2-mcu-r5f0_1-fw-sec"
 ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw]     =3D "${nonarch_base_lib=
dir}/firmware/j721s2-main-r5f0_0-fw"
@@ -245,8 +235,6 @@ ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] =3D "${non=
arch_base_libdir}/firmware/j7
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw]     =3D "${nonarch_base_libdir}/f=
irmware/j721s2-c71_1-fw"
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] =3D "${nonarch_base_libdir}/f=
irmware/j721s2-c71_1-fw-sec"
=20
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw]     =3D "${nonarch_base_libd=
ir}/firmware/j784s4-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw-sec] =3D "${nonarch_base_libd=
ir}/firmware/j784s4-mcu-r5f0_0-fw-sec"
 ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw]     =3D "${nonarch_base_libd=
ir}/firmware/j784s4-mcu-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw-sec] =3D "${nonarch_base_libd=
ir}/firmware/j784s4-mcu-r5f0_1-fw-sec"
 ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw]     =3D "${nonarch_base_lib=
dir}/firmware/j784s4-main-r5f0_0-fw"
--=20
2.25.1


