Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517F910F9956
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 15:44:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109482.1775663077353650680
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 08:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C22440CD5;
	Wed,  8 Apr 2026 15:44:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8Z7Vc2Mrt6q; Wed,  8 Apr 2026 15:44:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 06FFA40CC3;
	Wed,  8 Apr 2026 15:44:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3947417B8CB;
	Wed,  8 Apr 2026 11:44:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] wic: move wks files into files/wic/
Date: Wed,  8 Apr 2026 11:44:33 -0400
Message-Id: <20260408154433.3479958-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Apr 2026 15:44:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19834

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Move our wks files into files/wic/ per [1].

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D07e410600=
c41103098b670f12abe87f64419a624

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-bsp/{ =3D> files}/wic/sdimage-2part-efi.wks.in | 0
 meta-ti-bsp/{ =3D> files}/wic/sdimage-2part.wks        | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/{ =3D> files}/wic/sdimage-2part-efi.wks.in (100%)
 rename meta-ti-bsp/{ =3D> files}/wic/sdimage-2part.wks (100%)

diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/files=
/wic/sdimage-2part-efi.wks.in
similarity index 100%
rename from meta-ti-bsp/wic/sdimage-2part-efi.wks.in
rename to meta-ti-bsp/files/wic/sdimage-2part-efi.wks.in
diff --git a/meta-ti-bsp/wic/sdimage-2part.wks b/meta-ti-bsp/files/wic/sd=
image-2part.wks
similarity index 100%
rename from meta-ti-bsp/wic/sdimage-2part.wks
rename to meta-ti-bsp/files/wic/sdimage-2part.wks
--=20
2.25.1


