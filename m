Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44040E7718B
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 23:32:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8517.1734132726674776598
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 15:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE67140CC4;
	Fri, 13 Dec 2024 23:32:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wtr_6r5AjLsn; Fri, 13 Dec 2024 23:32:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A342F40CC3;
	Fri, 13 Dec 2024 23:32:04 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5851A164127;
	Fri, 13 Dec 2024 18:32:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 03/12] meta-beagle: layer.conf: add lz4c to host tools list
Date: Fri, 13 Dec 2024 18:31:54 -0500
Message-Id: <20241213233203.2688541-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213233203.2688541-1-denis@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 23:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18107

From: Denys Dmytriyenko <denys@konsulko.com>

OE-Core master has switched from lz4c to lz4 host tool, but a correspondi=
ng
change only appears in kernel 6.13. Since bb.org kernels 6.1 and 6.6 enab=
le
LZ4 compression by default, also add a legacy lz4c tool in the list.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
New patch since RFC v2

 meta-beagle/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
index df6a77ed..cb448b21 100644
--- a/meta-beagle/conf/layer.conf
+++ b/meta-beagle/conf/layer.conf
@@ -13,3 +13,5 @@ LAYERSERIES_COMPAT_meta-beagle =3D "scarthgap styhead w=
alnascar"
 LAYERDEPENDS_meta-beagle =3D " \
     meta-ti-bsp \
 "
+
+HOSTTOOLS_NONFATAL +=3D "lz4c"
--=20
2.25.1


