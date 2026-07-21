Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669C3C44536
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:43:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29048.1784655801827641546
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 10:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BD48240B88;
	Tue, 21 Jul 2026 17:43:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KW3mmVaKyExV; Tue, 21 Jul 2026 17:43:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A068440CB2;
	Tue, 21 Jul 2026 17:43:19 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id F3CE9176A01;
	Tue, 21 Jul 2026 13:43:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 3/3] layer.conf: remove remnant METATIBASE
Date: Tue, 21 Jul 2026 13:43:11 -0400
Message-Id: <20260721174311.7581-3-denis@denix.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20260721174311.7581-1-denis@denix.org>
References: <20260721174311.7581-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 17:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20175

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

This variable is no longer used. It also gets defined in 2 layers,
making it undeterministic.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-bsp/conf/layer.conf    | 1 -
 meta-ti-extras/conf/layer.conf | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index c8e4cd39..3cc54aa4 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -1,6 +1,5 @@
 # We have a conf and classes directory, append to BBPATH
 BBPATH .=3D ":${LAYERDIR}"
-METATIBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
=20
 # We have a recipes directory, add to BBFILES
 BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbapp=
end"
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.c=
onf
index 23d54095..6f130442 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -1,6 +1,5 @@
 # We have a conf and classes directory, append to BBPATH
 BBPATH .=3D ":${LAYERDIR}"
-METATIBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
=20
 # We have a recipes directory, add to BBFILES
 BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbapp=
end"
--=20
2.35.3


