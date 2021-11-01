Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1194.1635795195387256888
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA89F40C8C
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8j1Gmv-eyJP1 for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C103C40C8A
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7FCEB1746B3
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:13 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 17/22] conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
Date: Mon,  1 Nov 2021 15:33:07 -0400
Message-Id: <1635795192-43144-18-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Sinthu Raja <sinthu.raja@ti.com>

The board name for J721E EdgeAI Kit (EAIK) is changed to J721E SK [1],
so replace the eaik dtb with sk dtb file

[1] https://www.ti.com/tool/SK-TDA4VM

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/j7-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 4a5c41b..267a5e1 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -12,7 +12,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
-    ti/k3-j721e-eaik.dtb \
+    ti/k3-j721e-sk.dtb \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.7.4

