Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4E8C46467
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:41:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.64376.1674178854697875405
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 17:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C82E540C8F
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWdxDyktF5Wg for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC35340C98
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id ACF081636FE
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 1/7] conf: machine: Remove multi-certificate image comment
Date: Fri, 20 Jan 2023 01:40:44 +0000
Message-Id: <20230120014050.1988728-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15605

From: Andrew Davis <afd@ti.com>

Multi-cert is already now the default, no need to add a comment on that.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2 - no changes

 meta-ti-bsp/conf/machine/include/j7.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j7.inc b/meta-ti-bsp/conf/m=
achine/include/j7.inc
index 4ea3a5d8..cf4cc440 100644
--- a/meta-ti-bsp/conf/machine/include/j7.inc
+++ b/meta-ti-bsp/conf/machine/include/j7.inc
@@ -3,5 +3,3 @@ SOC_FAMILY:append =3D ":j7"
=20
 OPTEEMACHINE =3D "k3-j721e"
 OPTEEOUTPUTMACHINE =3D "k3"
-
-# Use default IMAGE_BOOT_FILES_LEGACY files
--=20
2.25.1


