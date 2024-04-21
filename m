Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D5EC4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 19:15:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2375.1713726903094204310
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 21 Apr 2024 12:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4983440C6C;
	Sun, 21 Apr 2024 19:15:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GumX6YgHoFEN; Sun, 21 Apr 2024 19:15:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28AB340C2B;
	Sun, 21 Apr 2024 19:14:59 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E9CA2163F00;
	Sun, 21 Apr 2024 15:14:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap/kirkstone][PATCH] wic: prevent boot FAT partition mounting under /boot
Date: Sun, 21 Apr 2024 15:14:58 -0400
Message-Id: <20240421191458.2221303-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 21 Apr 2024 19:15:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17594

From: Denys Dmytriyenko <denys@konsulko.com>

Separate FAT boot partition holds SPL, SYSFW and U-boot images, while
rootfs places kernel images and DTBs into /boot directory. So it is not
desirable to mount boot FAT partition into /boot directory of the rootfs
and shadow its original content - adjust corresponding entry in wic
templates.

While at it, remove unused ondisk parameter when using use-uuid, which
takes precedence and is more flexible.

Note: boot FAT partition will be automounted at /run/media/boot-mmcblk0p1=
/

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 3 ++-
 meta-ti-bsp/wic/sdimage-2part.wks        | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/s=
dimage-2part-efi.wks.in
index 2213a348..bcd08a62 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -2,6 +2,7 @@
 # long-description: Creates a partitioned SD card image for TI platforms=
 that
 # supports EFI.  Boot files are located in the first vfat partition with=
 extra
 # reserved space.  We cannot use a GPT here.
+
 bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4"
-part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-size 128M
+part boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER=
}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed-=
size 128M
 part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
diff --git a/meta-ti-bsp/wic/sdimage-2part.wks b/meta-ti-bsp/wic/sdimage-=
2part.wks
index 3eab9407..247002a0 100644
--- a/meta-ti-bsp/wic/sdimage-2part.wks
+++ b/meta-ti-bsp/wic/sdimage-2part.wks
@@ -2,5 +2,5 @@
 # long-description: Creates a partitioned SD card image for TI platforms=
.
 # Boot files are located in the first vfat partition with extra reserved=
 space.
=20
-part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=3Dvfat -=
-label boot --active --align 1024 --fixed-size 128 --use-uuid
-part / --source rootfs --ondisk mmcblk0 --fstype=3Dext4 --label root --a=
lign 1024 --use-uuid
+part boot --source bootimg-partition --fstype=3Dvfat --label boot --acti=
ve --align 1024 --use-uuid --fixed-size 128
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
--=20
2.25.1


