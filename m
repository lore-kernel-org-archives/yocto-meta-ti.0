Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B996EE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 20:38:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.115106.1734554315224615323
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 12:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 33C0B40CBB;
	Wed, 18 Dec 2024 20:38:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etnJ9xq9Kadh; Wed, 18 Dec 2024 20:38:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 179BD40AC9;
	Wed, 18 Dec 2024 20:38:33 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 09082164131;
	Wed, 18 Dec 2024 15:38:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 1/2] ti-ipc: fix accidental reference to UNPACKDIR from master
Date: Wed, 18 Dec 2024 15:38:24 -0500
Message-Id: <20241218203825.2600189-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Dec 2024 20:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18127

From: Denys Dmytriyenko <denys@konsulko.com>

There was a fix for "buildpaths" QA error in master that got backported
to scarthgap, but out of 2 references to the new UNPACKDIR, one got
corrected, but the other one was left behind. Since scarthgap has no
notion of UNPACKDIR, replace it with corresponding WORKDIR.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recip=
es-ti/ipc/ti-ipc_git.bb
index c05de508..90472e48 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -18,7 +18,7 @@ SRC_URI +=3D "file://tiipclad-daemon.sh \
             file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel=
.patch \
            "
=20
-CFLAGS +=3D "-I${WORKDIR} -fdebug-prefix-map=3D${UNPACKDIR}=3D${TARGET_D=
BGSRC_DIR}"
+CFLAGS +=3D "-I${WORKDIR} -fdebug-prefix-map=3D${WORKDIR}=3D${TARGET_DBG=
SRC_DIR}"
=20
 DAEMON =3D "UNKNOWN"
 DAEMON:dra7xx =3D "lad_dra7xx"
--=20
2.25.1


