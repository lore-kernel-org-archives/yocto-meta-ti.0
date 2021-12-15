Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1453.1639602665721765008
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2D8B340A3D
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhLlLkmItk22 for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13D9140C56
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 75FF017471A
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 02/11] vxd-dec-fw: Move firmware one folder up in target
Date: Wed, 15 Dec 2021 16:10:54 -0500
Message-Id: <1639602663-32787-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

The application expects the pvdec_full_bin.fw to be in /lib/fimware
directory.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index 7a184be..3563cc7 100644
--- a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -17,8 +17,8 @@ S = "${WORKDIR}/git"
 TARGET = "pvdec_full_bin.fw"
 
 do_install() {
-        install -d ${D}${base_libdir}/firmware/ti-img
-        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmware/ti-img/${TARGET}
+        install -d ${D}${base_libdir}/firmware
+        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
 }
 
 FILES:${PN} = "${base_libdir}/firmware"
-- 
2.7.4

