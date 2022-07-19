Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A2C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 18:41:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.44344.1658256103173500284
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 11:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9AE8C40C8C;
	Tue, 19 Jul 2022 18:41:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1amRpsPPfUA; Tue, 19 Jul 2022 18:41:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8723840C85;
	Tue, 19 Jul 2022 18:41:41 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 300931749A0;
	Tue, 19 Jul 2022 14:41:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] j721e-hs-evm-k3r5: do not create generic
 sysfw.itb symlink
Date: Tue, 19 Jul 2022 18:41:37 +0000
Message-Id: <20220719184137.1770974-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Jul 2022 18:41:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14882

From: Denys Dmytriyenko <denys@konsulko.com>

Commit bdceaa05aca9d3685ebfefbe7b7b60e2fd33789f added SR1.1 support for
J721e HS with the idea that the default sysfw.itb will point to SR1.1.
For that to work, the config for SR1 has to explicitly disable creating
such symlink.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/j721e-hs-evm-k3r5.conf
index 80f3b969..9c285bae 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -7,6 +7,7 @@ require conf/machine/include/k3r5.inc
 SYSFW_SOC =3D "j721e"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
+SYSFW_SYMLINK =3D ""
=20
 UBOOT_MACHINE =3D "j721e_hs_evm_r5_defconfig"
=20
--=20
2.25.1


