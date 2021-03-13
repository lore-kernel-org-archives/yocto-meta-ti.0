Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2418.1615611149857872855
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 20:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D3E2740BEC
	for <meta-ti@lists.yoctoproject.org>; Sat, 13 Mar 2021 04:52:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2KUa9wlUTMk for <meta-ti@lists.yoctoproject.org>;
	Sat, 13 Mar 2021 04:52:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C24E940429
	for <meta-ti@lists.yoctoproject.org>; Sat, 13 Mar 2021 04:52:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1B053174540;
	Fri, 12 Mar 2021 23:52:28 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [dunfell/master][PATCH] common-csl-ip-rtos: drop unnecessary dependency on ti-sysbios
Date: Fri, 12 Mar 2021 23:52:27 -0500
Message-Id: <1615611147-28437-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

It appears common-csl-ip-rtos does not require ti-sysbios dependency to build,
but ti-pdk.bbclass adds it by default. While most of PDK-based components do
require ti-sysbios to be built from sources, it is safe to remove it from CSL,
reducing the dependency tree for special cases like PRU FW based on CSL, but
not needing ti-sysbios.

This only affects firmwares built from sources against PDK and CSL, not when
RTOS firmwares are delivered in binary form for newer K3 platforms.

Build-tested on am335x, am57xx, k2g and am65xx.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 98b2d13..6479d9f 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -7,6 +7,7 @@ COMPATIBLE_MACHINE_append = "|c66x|k3"
 inherit ti-pdk
 
 DEPENDS_remove = "${PN}"
+DEPENDS_remove = "ti-sysbios"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
2.7.4

