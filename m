Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002A0C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 23:20:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3137.1746660056112145974
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 May 2025 16:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B31240C21;
	Wed,  7 May 2025 23:20:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxsPbIS1Kagb; Wed,  7 May 2025 23:20:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5EAA040A22;
	Wed,  7 May 2025 23:20:54 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 183F1167A59;
	Wed,  7 May 2025 19:20:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] gdbc6x: force older GNU/C standard
Date: Wed,  7 May 2025 19:20:53 -0400
Message-Id: <20250507232053.2027601-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 May 2025 23:20:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18543

From: Denys Dmytriyenko <denys@konsulko.com>

This is an old code base and hasn't been updated in a very long
time. It now fails to compile with gcc-15 (C23 standard). Force
compilation with GNU/C11 standard instead.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-=
ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 855de762..777a217f 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -19,7 +19,7 @@ S =3D "${WORKDIR}/git/gdbc6x"
 inherit update-rc.d
 inherit gettext
=20
-CFLAGS +=3D "-fcommon -fpermissive"
+CFLAGS +=3D "-fcommon -fpermissive -std=3Dgnu11"
=20
 do_configure () {
     cd ${S}
--=20
2.25.1


