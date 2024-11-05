Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FEAD36113
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:11:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.28724.1730833879301776168
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 11:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B3E240C16;
	Tue,  5 Nov 2024 19:11:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vt6iXjddghss; Tue,  5 Nov 2024 19:11:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48A2040CD6;
	Tue,  5 Nov 2024 19:11:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 686291640CD;
	Tue,  5 Nov 2024 14:11:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 2/6] meta-beagle: create a separate layer for Beagle platforms
Date: Tue,  5 Nov 2024 14:10:56 -0500
Message-Id: <20241105191100.532413-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105191100.532413-1-denis@denix.org>
References: <20241105191100.532413-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Nov 2024 19:11:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18041

From: Denys Dmytriyenko <denys@konsulko.com>

The new meta-beagle will host all supported Beagle platforms that
use TI SoCs and hence need to depend on meta-ti-bsp. The default
BSP for the platforms in this layer will use BeagleBoard.org
official trees for the Linux kernel and U-boot.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/layer.conf | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-beagle/conf/layer.conf

diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
new file mode 100644
index 00000000..ca920f29
--- /dev/null
+++ b/meta-beagle/conf/layer.conf
@@ -0,0 +1,15 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .=3D ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbapp=
end"
+
+BBFILE_COLLECTIONS +=3D "meta-beagle"
+BBFILE_PATTERN_meta-beagle :=3D "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-beagle =3D "6"
+
+LAYERSERIES_COMPAT_meta-beagle =3D "scarthgap styhead walnascar"
+
+LAYERDEPENDS_meta-bealge =3D " \
+    meta-ti-bsp \
+"
--=20
2.25.1


