Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D9DC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 23:55:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2067.1699401330657091470
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 15:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AF8F740CB3;
	Tue,  7 Nov 2023 23:55:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGZpLWGk79_P; Tue,  7 Nov 2023 23:55:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 42D9340CA7;
	Tue,  7 Nov 2023 23:55:28 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 467DE163D4E;
	Tue,  7 Nov 2023 18:55:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] bsp: fw: point to TI-TFL license within meta-ti-bsp relative to recipes
Date: Tue,  7 Nov 2023 23:55:25 +0000
Message-Id: <20231107235525.3065367-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 23:55:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17263

From: Denys Dmytriyenko <denys@konsulko.com>

Don't try to locate TI-TFL license within meta-ti-bsp relative to OE-Core
using COREBASE, as the directory structure of the layers is not guarantee=
d.
Instead, point to it relative to the recipe itself.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb           | 2 +-
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb         | 2 +-
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/r=
ecipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 8a52a800..da44234c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TI DM prebuilt binary firmware images"
=20
 LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=3D=
a1b59cb7ba626b9dbbcbf00f3fbc438a"
+LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b5=
9cb7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "k3"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp=
/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index b343d268..b2a6526c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TI Ethernet prebuilt binary firmware images"
=20
 LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=3D=
a1b59cb7ba626b9dbbcbf00f3fbc438a"
+LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b5=
9cb7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "k3"
=20
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 3e2e2ada..8d40cffe 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "TI Echo Test prebuilt binary firmware images"
=20
 LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=3D=
a1b59cb7ba626b9dbbcbf00f3fbc438a"
+LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b5=
9cb7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "k3"
=20
--=20
2.25.1


