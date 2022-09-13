Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5196C6FA8B
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.881.1663041348407775554
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4284440DA4
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQ27S-z0Euih for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDB5240D89
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 962941749F9
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 45/65] conf: am57xx-evm: avoid missing dtb
 files for linux-ti-mainline
Date: Tue, 13 Sep 2022 03:55:21 +0000
Message-Id: <20220913035541.2364351-46-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15060

From: Drew Fustini <dfustini@baylibre.com>

Avoid the inclusion of device tree files that do not exist upstream
when virtual/kernel is linux-ti-mainline for the am57xx-evm MACHINE.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/=
machine/am57xx-evm.conf
index 825bc31d..ca635f43 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -13,9 +13,9 @@ KERNEL_DEVICETREE =3D " \
     am57xx-beagle-x15-revb1.dtb \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
-    am57xx-evm.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-=
ti-mainline', '', 'am57xx-evm.dtb', d)} \
     ti/am57xx-evm-common.dtbo \
-    am57xx-evm-reva3.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-=
ti-mainline', '', 'am57xx-evm-reva3.dtb', d)} \
     ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
     ti/am571x-idk-touchscreen.dtbo \
@@ -25,7 +25,7 @@ KERNEL_DEVICETREE =3D " \
     ti/am572x-idk-touchscreen.dtbo \
     ti/lcd-osd101t2587.dtbo \
     ti/lcd-osd101t2045.dtbo \
-    ti/ov10635.dtbo \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-=
ti-mainline', '', 'ti/ov10635.dtbo', d)} \
 "
=20
 KERNEL_DEVICETREE +=3D "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES',=
 '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk=
-pru-excl-uio.dtb', '', d)}"
--=20
2.25.1


