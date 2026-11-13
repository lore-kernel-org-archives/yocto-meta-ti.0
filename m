Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.168.1794607063418638397
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 13:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C29A40BA9;
	Fri, 13 Nov 2026 21:57:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jI8JTmS1u3SS; Fri, 13 Nov 2026 21:57:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EA319407DD;
	Fri, 13 Nov 2026 21:57:40 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0D5DC17622B;
	Fri, 13 Nov 2026 16:57:40 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
Date: Fri, 13 Nov 2026 16:57:39 -0500
Message-Id: <20261113215739.4178373-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 21:57:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20545
Content-Type: text/plain; charset="utf-8"

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

When the same recipe deploys something in both multiconfigs (default
and k3r5), the corresponding SBOM SPDX files will clash inside our
common TI_COMMON_DEPLOY/images/MAINMACHINE. Let's name them uniquely.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/mu=
lticonfig/k3r5.conf
index fd871dca..49ca3b46 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -8,5 +8,6 @@ TI_TMPDIR_APPEND ?=3D "-k3r5"
 TMPDIR:append =3D "${TI_TMPDIR_APPEND}"
=20
 SDKPKGSUFFIX =3D "k3r5-nativesdk"
+SPDX_DEPLOY_SBOM_NAME =3D "${PN}-k3r5-deploy-sbom"
=20
 EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append =3D " --without-headers"
--=20
2.25.1

