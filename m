Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCA2EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 19:44:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.34091.1688672651433254608
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 12:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C20E40C16;
	Thu,  6 Jul 2023 19:44:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lgclWOUGpoAe; Thu,  6 Jul 2023 19:44:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D8EB40A2F;
	Thu,  6 Jul 2023 19:44:09 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 91B99163BED;
	Thu,  6 Jul 2023 15:44:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] conf/k3: switch mcdepends from do_image_complete
Date: Thu,  6 Jul 2023 19:44:07 +0000
Message-Id: <20230706194407.1891344-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jul 2023 19:44:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16822

From: Denys Dmytriyenko <denys@konsulko.com>

Previously k3 mcdepends for k3r5 artifacts has been changed from do_image=
_wic
to support non-wic builds in other layers and do_image_complete was belie=
ved
to be sufficient. Switching k3r5 to baremetal builds has exposed another =
race
when some pieces come from sstate and hence requires using do_image inste=
ad.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index eb25fa78..69cee843 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -60,7 +60,7 @@ MACHINE_FEATURES +=3D "efi"
 WKS_FILE ?=3D "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-=
2part-efi.wks.in", "sdimage-2part.wks", d)}"
=20
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
-do_image_complete[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy=
"
+do_image[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy"
=20
 SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
--=20
2.25.1


