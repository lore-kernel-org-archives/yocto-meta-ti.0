Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAF3C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 09:23:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.48167.1703150613319659463
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 01:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KU35lc5F;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BL9NWXI107142
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 03:23:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703150612;
	bh=wRw/2/oRTMeI//PKHB9EN2qUKEAmWSti52gpMjyWlcA=;
	h=From:To:CC:Subject:Date;
	b=KU35lc5Fd0KyZkLaE0hRudcpQk9/sw38kPo7Mqzspkf0dVJHoupWVTV3NPYV5m9Yb
	 aTuDI81Fjjl4vvb28F0kqJHfBjfJOUCzGc2NqqlIq4BQpoPEUtBtUFpzpetxFJMFR4
	 CkIxjVK1+yhtCeoBD8pW/j3PYS8aZHooaWG3b3+8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BL9NWj6020300
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 03:23:32 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Dec 2023 03:23:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Dec 2023 03:23:32 -0600
Received: from localhost (paresh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BL9NVbf008990;
	Thu, 21 Dec 2023 03:23:32 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] meta-ti-extras: Update jailhouse recipe to delete irrevelant files
Date: Thu, 21 Dec 2023 14:52:15 +0530
Message-ID: <20231221092215.2598739-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 09:23:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17359

Remove config files from /usr/share/jailhouse as they are not required.
Package only the cell files for respective devices and not all k3 files.
Update FILES:PN to use wildcard.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-ti/jailhouse/jailhouse_git.bb     | 34 +++++--------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 387b0806..70d6a0b6 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -46,6 +46,8 @@ INMATES_DIR ?= "${JH_DATADIR}/inmates"
 
 JH_CELL_FILES ?= "*.cell"
 JH_CELL_FILES:k3 ?= "k3-*.cell"
+JH_CELL_FILES:am62xx ?= "k3-am625-*.cell"
+JH_CELL_FILES:am62pxx ?= "k3-am62p5-*.cell"
 
 JH_INMATE_DTB ?= ""
 JH_INMATE_DTB:am62xx ?= "inmate-k3-am625-sk.dtb"
@@ -147,6 +149,8 @@ do_install() {
 		chmod +x ${D}${JH_DATADIR}/linux-demo.sh
 	fi
 
+	rm ${D}${JH_DATADIR}/root-cell-config.c.tmpl
+	rm ${D}${JH_DATADIR}/jailhouse-config-collect.tmpl
 }
 
 PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
@@ -181,30 +185,10 @@ python __anonymous () {
 
 
 FILES:${PN} = " \
-    /boot \
+    /boot/* \
     /usr/libexec \
-    /usr/sbin/ivshmem-demo \
-    /usr/sbin/jailhouse \
-    /usr/libexec/jailhouse \
-    /usr/libexec/jailhouse/jailhouse-config-check \
-    /usr/libexec/jailhouse/jailhouse-config-collect \
-    /usr/libexec/jailhouse/jailhouse-hardware-check \
-    /usr/libexec/jailhouse/jailhouse-cell-stats \
-    /usr/libexec/jailhouse/linux-loader.bin \
-    /usr/libexec/jailhouse/jailhouse-cell-linux \
-    /usr/libexec/jailhouse/jailhouse-config-create \
-    /usr/share/jailhouse \
-    /usr/share/jailhouse/linux-demo.sh \
-    /usr/share/jailhouse/inmate-k3-am625-sk.dtb \
-    /usr/share/jailhouse/inmates \
-    /usr/share/jailhouse/cells \
-    /usr/share/jailhouse/inmates/gic-demo.bin \
-    /usr/share/jailhouse/inmates/ivshmem-demo.bin \
-    /usr/share/jailhouse/inmates/uart-demo.bin \
-    /usr/share/jailhouse/cells/k3-am625-sk.cell \
-    /usr/share/jailhouse/cells/k3-am625-sk-inmate-demo.cell \
-    /usr/share/jailhouse/cells/k3-am625-sk-linux-demo.cell \
-    /lib/firmware \
-    /lib/firmware/jailhouse.bin \
-    /boot/tisdk-tiny-image-am62xx-evm.cpio \
+    /usr/sbin/* \
+    /usr/libexec/* \
+    /usr/share/* \
+    /lib/firmware/* \
 "
-- 
2.34.1


