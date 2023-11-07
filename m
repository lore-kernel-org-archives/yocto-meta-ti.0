Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822E3C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 23:56:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2087.1699401363931806104
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 15:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A65E40CCB;
	Tue,  7 Nov 2023 23:56:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsVub0xySc9N; Tue,  7 Nov 2023 23:56:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 326D440CA7;
	Tue,  7 Nov 2023 23:56:02 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E8FAA163D4E;
	Tue,  7 Nov 2023 18:56:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] conf/machine: drop deprecated SERIAL_CONSOLES_CHECK
Date: Tue,  7 Nov 2023 23:56:01 +0000
Message-Id: <20231107235601.3065458-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 23:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17264

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core master/nanbield recently introduced ttyrun for spawning gettys on=
ly
on existing terminals:
https://git.openembedded.org/openembedded-core/commit/?id=3D8e48297621311=
116d3edd7e3aa0de1b8ef2431b1

With that, SERIAL_CONSOLES_CHECK has been deprecated even for SysVinit se=
tups.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf | 1 -
 meta-ti-bsp/conf/machine/beagleplay.conf | 1 -
 meta-ti-bsp/conf/machine/include/k3.inc  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/=
machine/am335x-evm.conf
index 7518bc8d..97a4b8b0 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -10,7 +10,6 @@ IMAGE_FSTYPES +=3D "ubifs ubi"
=20
 # Normally AM335 boards use ttyS0, but ICE uses ttyS3, so try both
 SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS3"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 # UBI information.  Note that this is board and kernel specific.  Change=
s
 # in your kernel port may require changes in these variables.  For more
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 978bbc5a..495b2e99 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -8,7 +8,6 @@ SOC_FAMILY:append =3D ":am62xx"
 MACHINE_FEATURES +=3D "screen gpu"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 2415f0ba..e3da9e12 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -65,4 +65,3 @@ do_image_wic[depends] +=3D "virtual/bootloader:do_deplo=
y"
 do_image[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy"
=20
 SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
--=20
2.25.1


