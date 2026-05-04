Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512D2CD3427
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 15:47:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17936.1777909638584286568
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2026 08:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E014140C8E;
	Mon,  4 May 2026 15:47:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cg3SpY5QcvTW; Mon,  4 May 2026 15:47:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6D3F409EB;
	Mon,  4 May 2026 15:47:16 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5F71F17D1FB;
	Mon,  4 May 2026 11:47:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 1/3] meta-ti-test: layer.conf: explicitly depend on meta-ti-bsp
Date: Mon,  4 May 2026 11:47:12 -0400
Message-Id: <20260504154714.736175-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 15:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19927

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Set meta-ti-test layer to explicitly depend on meta-ti-bsp for ti-soc
definition.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-test/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-test/conf/layer.conf b/meta-ti-test/conf/layer.conf
index 216ab344..ac28c002 100644
--- a/meta-ti-test/conf/layer.conf
+++ b/meta-ti-test/conf/layer.conf
@@ -17,6 +17,7 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
 LAYERDEPENDS_meta-ti-test =3D " \
     core \
+    meta-ti-bsp \
     openembedded-layer \
     networking-layer \
     filesystems-layer \
--=20
2.25.1


