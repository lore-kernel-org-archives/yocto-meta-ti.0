Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702ACC6FD19
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.795.1663041348462204926
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4581A40D89
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9a9btrEHfyj for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F0D6A40D9B
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A2F7B1749FB
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 47/65] ti-img-encode-decode: Lock test app
 to j7-evm
Date: Tue, 13 Sep 2022 03:55:23 +0000
Message-Id: <20220913035541.2364351-48-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15063

From: Ryan Eatmon <reatmon@ti.com>

The test app is not compatible with later versions of j7, so
add COMPATIBLE_MACHINE to lock these recipes down to just
j721e.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb   | 2 +-
 .../recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app=
_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_=
1.0.0.bb
index 718fdbe1..ffc3f56e 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.=
bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.=
bb
@@ -6,7 +6,7 @@ DEPENDS =3D "libdrm ffmpeg"
=20
 inherit autotools pkgconfig
=20
-COMPATIBLE_MACHINE =3D "j7"
+COMPATIBLE_MACHINE =3D "j721e"
=20
 PR =3D "r1"
 SRCREV =3D "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app=
_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_=
1.0.0.bb
index 4dc81c54..125a9250 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.=
bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.=
bb
@@ -6,7 +6,7 @@ DEPENDS =3D "libdrm"
=20
 inherit autotools pkgconfig
=20
-COMPATIBLE_MACHINE =3D "j7"
+COMPATIBLE_MACHINE =3D "j721e"
=20
 PR =3D "r0"
 SRCREV =3D "a5e7d820bea1be24f25a8369d4d4521c784f869a"
--=20
2.25.1


