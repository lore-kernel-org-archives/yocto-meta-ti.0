Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1252.1635795196259070388
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5EF4640C98
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvbJfY0QR1L2 for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 519E740C90
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 178D51746B0
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:13 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 08/22] ipc: ti-rpmsg-char: Update library to 0.3.1
Date: Mon,  1 Nov 2021 15:32:58 -0400
Message-Id: <1635795192-43144-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Hari Nagalla <hnagalla@ti.com>

Update the ti-rpmsg-char library to 0.3.1 version that enables the
support for the M4F remote processor on AM64x SoCs.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index df14d63..140536e 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "git"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.3.0 release
-SRCREV = "0e76d13d08f0df5c7e70d58bbf76f7e299906ae1"
+# Initial 0.3.1 release
+SRCREV = "0824546f61bda7715519841d9b9f0fb030ddfaf2"
 
-PV = "0.3.0+git${SRCPV}"
+PV = "0.3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

