Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D87EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 21:18:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2705.1686691126356621838
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 14:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B3AE40C56;
	Tue, 13 Jun 2023 21:18:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ey-gYFcVCkU; Tue, 13 Jun 2023 21:18:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2081940AE9;
	Tue, 13 Jun 2023 21:18:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A06FA163A07;
	Tue, 13 Jun 2023 17:17:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] binutils: apply local fix for packaging of gprofng static library
Date: Tue, 13 Jun 2023 21:18:41 +0000
Message-Id: <20230613211842.2897808-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jun 2023 21:18:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16715

From: Denys Dmytriyenko <denys@konsulko.com>

The fix was submitted upstream to OE-Core[0], but due to other issues,
it is currently sitting in a backlog queue. Apply it locally for now.

[0] https://patchwork.yoctoproject.org/project/oe-core/patch/202306092357=
26.3119540-1-denis@denix.org/

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-devtools/binutils/binutils-cross-canadian_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-ti-bsp/recipes-devtools/binutils/binutils-cross-=
canadian_%.bbappend

diff --git a/meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadia=
n_%.bbappend b/meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canad=
ian_%.bbappend
new file mode 100644
index 00000000..c18bbe7a
--- /dev/null
+++ b/meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian_%.bba=
ppend
@@ -0,0 +1 @@
+FILES:${PN}-staticdev:append:ti-soc =3D " ${libdir}/gprofng/*.a"
--=20
2.25.1


