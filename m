Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C89BC282EC
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 02:02:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2784.1742004147951952547
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 19:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 51B6240C6B;
	Sat, 15 Mar 2025 02:02:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYzQw0-VAhJu; Sat, 15 Mar 2025 02:02:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F93040A2F;
	Sat, 15 Mar 2025 02:02:25 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D8267164371;
	Fri, 14 Mar 2025 22:02:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [master/scarthgap][PATCH] omap-a15.inc: don't include ipu1 firmware in the boot partition
Date: Fri, 14 Mar 2025 22:02:24 -0400
Message-Id: <20250315020224.3100249-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 15 Mar 2025 02:02:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18388

From: Denys Dmytriyenko <denys@konsulko.com>

This reverts commit c58af0b172660ef1248a3454af06251d872770b1.

This adds an undesired dependency on meta-ti-extras - more details:
https://lists.yoctoproject.org/g/meta-ti/topic/110003435

Cc: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index a258decd..be086936 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -48,6 +48,5 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 s=
creen alsa gpu mmip dsp gc3
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
+IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
-do_image_wic[depends] +=3D "ti-ipc-rtos:do_deploy"
--=20
2.25.1


