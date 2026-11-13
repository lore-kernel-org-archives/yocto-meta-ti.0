Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.500.1794608147208072942
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 14:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 355F140BA9;
	Fri, 13 Nov 2026 22:15:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgLNPjwCfOSd; Fri, 13 Nov 2026 22:15:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 09B5D407DD;
	Fri, 13 Nov 2026 22:15:44 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A39D0176170;
	Fri, 13 Nov 2026 17:15:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH v2] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
Date: Fri, 13 Nov 2026 17:15:42 -0500
Message-Id: <20261113221542.4188789-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 22:15:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20546
Content-Type: text/plain; charset="utf-8"

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

When the same recipe deploys something in both multiconfigs (default
and k3r5), the corresponding SBOM SPDX files will clash inside our
common TI_COMMON_DEPLOY/images/MAINMACHINE. Let's name them uniquely.

Also, deploy the SBOM SPDX files into its own sbom/ subdirectory in
TI_COMMON_DEPLOY/images/MAINMACHINE.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
v2 - deploy SBOM SPDX into subdirectory

 meta-ti-bsp/conf/layer.conf            | 1 +
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index c92e927c..3b9085ac 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -44,6 +44,7 @@ DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images=
/${MACHINE}"
 SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
 PSEUDO_IGNORE_PATHS:append:ti-soc =3D ",${TI_COMMON_DEPLOY}"
 BB_BASEHASH_IGNORE_VARS:append:ti-soc =3D " TI_COMMON_DEPLOY"
+SPDX_DEPLOY_SBOM_NAME =3D "sbom/${PN}-deploy-sbom"
=20
 MIRRORS +=3D " \
     git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;proto=
col=3Dhttps \
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/mu=
lticonfig/k3r5.conf
index fd871dca..a995b46e 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -8,5 +8,6 @@ TI_TMPDIR_APPEND ?=3D "-k3r5"
 TMPDIR:append =3D "${TI_TMPDIR_APPEND}"
=20
 SDKPKGSUFFIX =3D "k3r5-nativesdk"
+SPDX_DEPLOY_SBOM_NAME =3D "sbom/${PN}-k3r5-deploy-sbom"
=20
 EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append =3D " --without-headers"
--=20
2.25.1

