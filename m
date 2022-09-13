Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B12C6FA8D
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.835.1663041348399963810
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3BE7040D8E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBPTTlgygBX0 for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4E9840D7A
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8B6741749F8
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 44/65] conf: dra7xx-evm: avoid missing dtb
 files for linux-ti-mainline
Date: Tue, 13 Sep 2022 03:55:20 +0000
Message-Id: <20220913035541.2364351-45-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15061

From: Drew Fustini <dfustini@baylibre.com>

Avoid the inclusion of device tree files that do not exist upstream
when virtual/kernel is linux-ti-mainline for the dra7xx-evm MACHINE.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/dra7xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/=
machine/dra7xx-evm.conf
index 5fa1dfa5..813e0e06 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
@@ -12,7 +12,7 @@ KERNEL_DEVICETREE =3D " \
     dra7-evm.dtb \
     ti/dra7x-evm-osd-lcd-common.dtbo \
     dra71-evm.dtb \
-    dra71-evm-nand.dtb \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-=
ti-mainline', '', 'dra71-evm-nand.dtb', d)} \
     ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
     dra72-evm.dtb \
     dra72-evm-revc.dtb \
--=20
2.25.1


