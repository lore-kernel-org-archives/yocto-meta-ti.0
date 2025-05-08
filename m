Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1C1C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 03:08:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6994.1746673706012130851
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 May 2025 20:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25EA440C8A;
	Thu,  8 May 2025 03:08:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwBnfAoEKSOa; Thu,  8 May 2025 03:08:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1199A40A22;
	Thu,  8 May 2025 03:08:24 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6CF4A167A67;
	Wed,  7 May 2025 23:08:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] amx3-cm3: force older GNU/C standard
Date: Wed,  7 May 2025 23:08:23 -0400
Message-Id: <20250508030823.2838127-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 May 2025 03:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18544

From: Denys Dmytriyenko <denys@konsulko.com>

This is an old code base and hasn't been updated in a very long
time. It now fails to compile with gcc-15 (C23 standard). Force
compilation with GNU/C11 standard instead.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/me=
ta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index ecdae123..b14a706b 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "git://git.ti.com/git/processor-firmware/ti=
-amx3-cm3-pm-firmware.git;p
 S =3D "${WORKDIR}/git"
=20
 do_compile() {
-	make CROSS_COMPILE=3D"${TARGET_PREFIX}" CC=3D"${TARGET_PREFIX}gcc ${TOO=
LCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS} ${DEBUG_PREFIX_MAP}"
+	make CROSS_COMPILE=3D"${TARGET_PREFIX}" CC=3D"${TARGET_PREFIX}gcc -std=3D=
gnu11 ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS} ${DEBUG_PREFIX_MAP}"
 }
=20
 do_install() {
--=20
2.25.1


