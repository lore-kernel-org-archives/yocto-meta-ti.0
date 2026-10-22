Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1047.1792699050760019507
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D7D640CCC;
	Thu, 22 Oct 2026 19:57:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tvt0esPkMlCF; Thu, 22 Oct 2026 19:57:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6488C40CB6;
	Thu, 22 Oct 2026 19:57:28 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A64D817EF04;
	Thu, 22 Oct 2026 15:57:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master/wrynose][PATCH] layer.conf: remove TI_COMMON_DEPLOY path from task signatures
Date: Thu, 22 Oct 2026 15:56:49 -0400
Message-Id: <20261022195649.1501987-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:57:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20486
Content-Type: text/plain; charset="utf-8"

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Normally, bitbake.conf exludes the default DEPLOY_DIR path (which
is under TMPDIR) from getting into task signatures. In our case
we have 2 separate TMPDIRs for multiconfig, but need to share
images and SDKs across them. Hence we setup TI_COMMON_DEPLOY
outside of TMPDIRs for images and SDKs, but keep the default
DEPLOY_DIR inside multiconfig-specific TMPDIR for everything
else, like packages, licenses, SBOMs, etc. To prevent its path
from getting into task signatures for better sstate re-use, need
to add TI_COMMON_DEPLOY to the list of ignored variables.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 5ae078dd..95d1138f 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -40,6 +40,7 @@ TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
 DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images/${MACHINE}"
 SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
 PSEUDO_IGNORE_PATHS:append:ti-soc =3D ",${TI_COMMON_DEPLOY}"
+BB_BASEHASH_IGNORE_VARS:append:ti-soc =3D " TI_COMMON_DEPLOY"
=20
 MIRRORS +=3D " \
     git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;proto=
col=3Dhttps \
--=20
2.25.1

