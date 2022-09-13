Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F57C6FA8E
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.834.1663041348273061398
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2857740D90
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6lQm9qG8njtp for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3706840D91
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4B0111749F2
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 38/65] optee-os: Use software RNG on AM62x
 and J721s2
Date: Tue, 13 Sep 2022 03:55:14 +0000
Message-Id: <20220913035541.2364351-39-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15052

From: Andrew Davis <afd@ti.com>

The TRNG driver is not currently functional for these two platforms.
Disable the TRNG driver until fixed.

Reported-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 60e8c391..5d50a04f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -5,6 +5,9 @@ DEPENDS:append:ti-soc =3D " python3-cryptography-native"
=20
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
+EXTRA_OEMAKE:append:am62xx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy"
+EXTRA_OEMAKE:append:j721s2 =3D " CFG_WITH_SOFTWARE_PRNG=3Dy"
+
 do_compile:prepend:ti-soc() {
     export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
 }
--=20
2.25.1


