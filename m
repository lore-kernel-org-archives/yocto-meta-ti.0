Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB49CC63797
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 18:12:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.63287.1673547135536275429
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 10:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B50E740AB7;
	Thu, 12 Jan 2023 18:12:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XiK54ULCsgrD; Thu, 12 Jan 2023 18:12:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F25F40A3F;
	Thu, 12 Jan 2023 18:12:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2F9B31636F6;
	Thu, 12 Jan 2023 13:11:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] optee-os: sync up with upstream meta-arm update
Date: Thu, 12 Jan 2023 18:12:12 +0000
Message-Id: <20230112181212.1133414-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Jan 2023 18:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15562

From: Denys Dmytriyenko <denys@konsulko.com>

Upstream meta-arm has updated optee-os to 3.19 and our local changes
conflict with that. Update bbappend to match upstream.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 8640d7b0..6f711101 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -1,12 +1,3 @@
-PV:ti-soc =3D "3.19.0+git${SRCPV}"
-SRCREV:ti-soc =3D "afacf356f9593a7f83cae9f96026824ec242ff52"
-
-# These patches are from upstream against v3.18, but we moved to v3.19 a=
nd the
-# patches are now invalid.  These can be removed once upstream moves up =
to or
-# beyond v3.19.
-SRC_URI:remove:ti-soc =3D "file://0008-no-warn-rwx-segments.patch"
-SRC_URI:remove:ti-soc =3D "file://0009-add-z-execstack.patch"
-
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
 EXTRA_OEMAKE:append:am62xx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy CFG_TEE_CORE=
_LOG_LEVEL=3D1"
--=20
2.25.1


