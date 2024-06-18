Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F11DC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 19:40:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3548.1718739613782932094
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 12:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D631840CAA;
	Tue, 18 Jun 2024 19:40:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JrGxyZFFLTOq; Tue, 18 Jun 2024 19:40:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BEF0540C2A;
	Tue, 18 Jun 2024 19:40:11 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 97497163FB6;
	Tue, 18 Jun 2024 15:40:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 1/2] beaglebone-ai64: BB.org does not support all SR and HS variants
Date: Tue, 18 Jun 2024 15:39:46 -0400
Message-Id: <20240618193947.2632957-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Jun 2024 19:40:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17763

From: Denys Dmytriyenko <denys@konsulko.com>

Adjust IMAGE_BOOT_FILES list as BB.org BSP does not support all combinati=
ons
of SR1.1, SR2.0, HS-FS and HS-SE variants, same as J721e EVM in mainline.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index 2d681827..56e1ed4e 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -6,6 +6,9 @@ TI_PREFERRED_BSP ?=3D "bb_org"
=20
 require conf/machine/include/j721e.inc
=20
+IMAGE_SR1_1_HS_FS_FILES:bsp-bb_org =3D ""
+IMAGE_SR2_HS_SE_FILES:bsp-bb_org =3D ""
+
 UBOOT_MACHINE =3D "j721e_evm_a72_config"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "j721e_beagleboneai64_a72_defconfig"
=20
--=20
2.25.1


