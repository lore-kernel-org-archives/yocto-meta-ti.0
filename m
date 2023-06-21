Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF97CEB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 02:17:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.185.1687313850124641049
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 19:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P3bx/5IZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35L2HSLk059275;
	Tue, 20 Jun 2023 21:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687313848;
	bh=1h4Oz7OfvpEhr/Wk8juJVvQxFedRFj1TfCy5JWTLoxU=;
	h=From:To:Subject:Date;
	b=P3bx/5IZqJBtiNi0jZTbMi3x5gVqJdm47pXp80Fu5++DSvKcDtWTt1wg2ksBz2H8C
	 GQiqJvwVJgPPe5LJ6WppgaXtdwGyn5mWrHIhyT/1Sfu1IQ1ekbym0qKJLI2demd2gI
	 3m8NEz4eGEqfBcxxzAqWiwtgF676yVpGIgQX6AtU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35L2HSKV030861
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 21:17:28 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 21:17:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 21:17:28 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35L2HRP7028418;
	Tue, 20 Jun 2023 21:17:27 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qBnPT-0004GL-JX; Tue, 20 Jun 2023 21:17:27 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2] conf: am335x-evm and am437x-evm: bump max_leb_cnt
Date: Tue, 20 Jun 2023 21:17:27 -0500
Message-ID: <20230621021727.16310-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 02:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16755

New features added require another increase to max_leb_cnt.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Another feature got added that necessitated a bump in the count
again.  Rather than create another patch just push a v2 before this is
accepted.

 meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
 meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index 266f1f20..f19cc441 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -23,7 +23,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 10300"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 10800"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
index 6501a3ef..d70d591b 100644
--- a/meta-ti-bsp/conf/machine/am437x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5200"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
-- 
2.17.1


