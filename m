Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DF9C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 03:08:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.66473.1744081690022909398
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Apr 2025 20:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2359F40C37;
	Tue,  8 Apr 2025 03:08:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qs9HtJfwTLfX; Tue,  8 Apr 2025 03:08:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0BE8F407E5;
	Tue,  8 Apr 2025 03:08:08 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2CAB91657B2;
	Mon,  7 Apr 2025 23:08:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] optee-client: remove patch that got accepted upstream
Date: Mon,  7 Apr 2025 23:08:07 -0400
Message-Id: <20250408030807.1978102-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Apr 2025 03:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18447

From: Denys Dmytriyenko <denys@konsulko.com>

meta-arm adds a patch that was sent and accepted upstream, remove
it since mta-ti pulls a more recent verstion.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 2c8977dd..a628e446 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,6 @@
 PV =3D "4.4.0+git"
 SRCREV =3D "d221676a58b305bddbf97db00395205b3038de8e"
+
+SRC_URI:remove =3D " \
+    file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.pat=
ch \
+"
--=20
2.25.1


