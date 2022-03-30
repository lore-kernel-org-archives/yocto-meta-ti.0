Return-Path: <alessio.bogani@elettra.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843C6C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 10:45:22 +0000 (UTC)
Received: from bacon.elettra.eu (bacon.elettra.eu [140.105.206.12])
 by mx.groups.io with SMTP id smtpd.web10.5627.1648637121167060615
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 03:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: elettra.eu, ip: 140.105.206.12, mailfrom: alessio.bogani@elettra.eu)
X-Envelope-From: <alessio.bogani@elettra.eu>
Received: from zmp.elettra.eu (zmp.elettra.trieste.it [140.105.206.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bacon.elettra.eu (Postfix) with ESMTPS id 1D82141D80
	for <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 12:45:14 +0200 (CEST)
Received: from zmp.elettra.eu (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTPS id 0CF67140180F;
	Wed, 30 Mar 2022 12:45:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmp.elettra.eu (Postfix) with ESMTP id EA246140180B;
	Wed, 30 Mar 2022 12:45:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zmp.elettra.eu
Received: from zmp.elettra.eu ([127.0.0.1])
	by localhost (zmp.elettra.eu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LXLriRXXJatf; Wed, 30 Mar 2022 12:45:13 +0200 (CEST)
Received: from voltumna.elettra.trieste.it (voltumna.elettra.trieste.it
 [192.168.205.44])
	by zmp.elettra.eu (Postfix) with ESMTP id BF436140180A;
	Wed, 30 Mar 2022 12:45:13 +0200 (CEST)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: meta-ti@lists.yoctoproject.org
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [master][PATCH] wl18xx-fw: Make it support usrmerge
Date: Wed, 30 Mar 2022 12:45:11 +0200
Message-Id: <20220330104511.19292-1-alessio.bogani@elettra.eu>
X-Mailer: git-send-email 2.17.1
X-elettra-Libra-ESVA-Information: Please contact elettra for more information
X-elettra-Libra-ESVA-ID: 1D82141D80.A9328
X-elettra-Libra-ESVA: No virus found
X-elettra-Libra-ESVA-From: alessio.bogani@elettra.eu
X-elettra-Libra-ESVA-Watermark: 1649241914.5021@tMFJ4u3cM3lTt8gi1SFCRw
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 10:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14582

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 .../recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index 48b500a8..09968993 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -19,7 +19,11 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake 'DEST_DIR=${D}' install
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+        oe_runmake 'DEST_DIR=${D}/usr' install
+    else
+        oe_runmake 'DEST_DIR=${D}' install
+    fi
 }
 
-FILES:${PN} = "/lib/firmware/ti-connectivity/*"
+FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
-- 
2.17.1


