Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57161FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 15:47:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17935.1777909638584160247
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2026 08:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E21B240CB4;
	Mon,  4 May 2026 15:47:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2KshpRe0BjU; Mon,  4 May 2026 15:47:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B8E6440C85;
	Mon,  4 May 2026 15:47:16 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6CB4817D1FD;
	Mon,  4 May 2026 11:47:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 2/3] meta-ti-test: layer.conf: recommend dynamic layers
Date: Mon,  4 May 2026 11:47:13 -0400
Message-Id: <20260504154714.736175-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260504154714.736175-1-denis@denix.org>
References: <20260504154714.736175-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 15:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19926

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Set additional LAYERRECOMMENDS for dynamic layers.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-test/conf/layer.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-ti-test/conf/layer.conf b/meta-ti-test/conf/layer.conf
index ac28c002..5e370d31 100644
--- a/meta-ti-test/conf/layer.conf
+++ b/meta-ti-test/conf/layer.conf
@@ -24,6 +24,11 @@ LAYERDEPENDS_meta-ti-test =3D " \
     meta-python \
 "
=20
+LAYERRECOMMENDS_meta-ti-test =3D " \
+    qt6-layer \
+    flutter-layer \
+"
+
 BBFILES_DYNAMIC +=3D " \
     qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend=
 \
     flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.=
bbappend \
--=20
2.25.1


