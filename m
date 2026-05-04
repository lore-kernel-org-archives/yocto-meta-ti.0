Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52154CD342F
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 15:47:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17934.1777909638583957935
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2026 08:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9E6F409EB;
	Mon,  4 May 2026 15:47:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54esTU9MucSE; Mon,  4 May 2026 15:47:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C03E540C8A;
	Mon,  4 May 2026 15:47:16 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7773117D201;
	Mon,  4 May 2026 11:47:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 3/3] meta-ti-test: bc: remove unneeded workaround
Date: Mon,  4 May 2026 11:47:14 -0400
Message-Id: <20260504154714.736175-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260504154714.736175-1-denis@denix.org>
References: <20260504154714.736175-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 15:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19925

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

RM_WORK_EXCLUDE was used as a workaround for sourceipk in Arago, which
is long since gone.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-ti-test/recipes-extended/bc/bc_%.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-ti-test/recipes-extended/bc/bc_%.bbappend

diff --git a/meta-ti-test/recipes-extended/bc/bc_%.bbappend b/meta-ti-tes=
t/recipes-extended/bc/bc_%.bbappend
deleted file mode 100644
index 29d90a9d..00000000
--- a/meta-ti-test/recipes-extended/bc/bc_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-
-RM_WORK_EXCLUDE +=3D "${PN}"
-
--=20
2.25.1


