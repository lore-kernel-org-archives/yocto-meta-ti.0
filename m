Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E397C77B61
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6408.1679283526955853801
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C88F140CB1
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3xOyVu0aGeu for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B083540CD3
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 752151637C5
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 51/54] ti-linux-fw: update to the latest from Dunfell
Date: Mon, 20 Mar 2023 03:38:37 +0000
Message-Id: <20230320033840.1193963-52-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16049

From: Denys Dmytriyenko <denys@konsulko.com>

Match the latest sha used in Dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 74c26707..1a5ea534 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -16,12 +16,12 @@ IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.00"
 TIFS_LPM_STUB_FW_VERSION =3D "08.06.04"
=20
-TI_LINUX_FW_SRCREV ?=3D "340194800a581baf976360386dfc7b5acab8d948"
+TI_LINUX_FW_SRCREV ?=3D "79c498ef6ab1558b699a2243a26c4a65a1c44d26"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
=20
-K3_IMAGE_GEN_SRCREV ?=3D "ffae8800a5c81c149835ed1aa5e2fbbe65a49c0d"
+K3_IMAGE_GEN_SRCREV ?=3D "1319f46f3899e62d88e0a5cedad5b454d0432ddb"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
--=20
2.25.1


