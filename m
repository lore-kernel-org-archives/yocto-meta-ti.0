Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418DBEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 22:02:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.7968.1688594525920074904
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 15:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MgzCnmpR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365M24Fa119680;
	Wed, 5 Jul 2023 17:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688594524;
	bh=g8o07DjrCWkK1Kpy8tfz/GKnZU2O8LIvv+SlvMzzOSs=;
	h=From:To:Subject:Date;
	b=MgzCnmpRwx+NiPsq52n5aN0YEbihAK905oJdDUTfwq6iSnX39uW12oy3i9Y5NXTYh
	 ZK2DtxRuq2hzwWM4vZhOeUomKKT6P0D8lxUuexbCRj11houPwJsXXFmR1AiVWA8qMS
	 Xy2+fb6HUpwsEDd4St6YFbjvuFUN+WM89Nz7hQKY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365M24PZ112801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 17:02:04 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 17:02:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 17:02:04 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365M24YT121689;
	Wed, 5 Jul 2023 17:02:04 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qHAZY-0007mg-DB; Wed, 05 Jul 2023 17:02:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf: am335x-evm and am437x-evm: bump max_leb_cnt
Date: Wed, 5 Jul 2023 17:02:04 -0500
Message-ID: <20230705220204.29883-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 22:02:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16818

New features added require another increase to max_leb_cnt.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
 meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index f19cc441..7518bc8d 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -23,7 +23,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 10800"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 12000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
index d70d591b..a2fb15ca 100644
--- a/meta-ti-bsp/conf/machine/am437x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5200"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5500"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
-- 
2.17.1


