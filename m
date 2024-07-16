Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EB1C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 01:40:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1085.1721094023328184391
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 18:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A329D40C6C;
	Tue, 16 Jul 2024 01:40:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDCYn9Q8aqyi; Tue, 16 Jul 2024 01:40:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 589F7407DA;
	Tue, 16 Jul 2024 01:40:21 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0A4BF163FF0;
	Mon, 15 Jul 2024 21:40:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] ti-cgt-pru: remove install log to avoid "buildpaths" QA error
Date: Mon, 15 Jul 2024 21:40:20 -0400
Message-Id: <20240716014020.3050640-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Jul 2024 01:40:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17865

From: Denys Dmytriyenko <denys@konsulko.com>

Installer log contains absolute paths and is not really needed.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/met=
a-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index 47bd6a51..b77aa612 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -28,6 +28,7 @@ do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
     cp -r ${UNPACKDIR}/ti-cgt-pru_${PV}/. \
           ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
+    rm ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/*installer_install.log
 }
=20
 do_install:class-target() {
--=20
2.25.1


