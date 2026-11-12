Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4388.1794511954082143478
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 11:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F3418407E4;
	Thu, 12 Nov 2026 19:32:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjoAI7xctSsq; Thu, 12 Nov 2026 19:32:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C81BB407DC;
	Thu, 12 Nov 2026 19:32:31 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E30BF17622B;
	Thu, 12 Nov 2026 14:32:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] ti-sci-fw: Allow empty SPDX deploy artifacts
Date: Thu, 12 Nov 2026 14:32:30 -0500
Message-Id: <20261112193230.3112236-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 12 Nov 2026 19:32:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20532
Content-Type: text/plain; charset="utf-8"

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

OE-Core has added support for deploy tasks to create SPDX [0]. Some
recipes don't deploy anything and need to set SPDX_DEPLOY_ALLOW_EMPTY
so that it doesn't generate an error, similar to [1].

[0] https://git.openembedded.org/openembedded-core/commit/?id=3D1b77fe51e=
c77ae0bdea016fe4bbe76ac73b1f3d1
[1] https://git.openembedded.org/openembedded-core/commit/?id=3D34991d0ce=
3cc5f38dd29e824af7579512d2b917e

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 0d724862..6ee9992f 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -9,6 +9,8 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PV =3D "${TI_SYSFW_VERSION}"
 PR =3D "${INC_PR}.0"
=20
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D "1"
+
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${D}${nonarch_base_libdi=
r}/firmware/ti-sysfw
--=20
2.25.1

