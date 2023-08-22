Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718E9EE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 20:15:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6517.1692735350274923817
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 13:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vg/r+2MB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37MKFmf2108247;
	Tue, 22 Aug 2023 15:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692735348;
	bh=DMAiSjM/mNcDdwEC6jWFdKrjWwukdM8wyr+f2my1Po4=;
	h=From:To:Subject:Date;
	b=Vg/r+2MBA33hln3WBmuusfixajNg8utAxSiOKb9fDGsPhP0/9JSjPt8G6QvTcNigd
	 eOPFwOUcLp7B0c8sXwXZGgZfoj6xmelqjmROmOT6y81l6qZHD4kHBPdJHetg9hpffy
	 uY+YVa0KMU36VrAuQKkdxpu7mByWnyBCCK517coQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37MKFmPa026232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Aug 2023 15:15:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Aug 2023 15:15:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Aug 2023 15:15:36 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37MKFaOZ051373;
	Tue, 22 Aug 2023 15:15:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qYXmp-0008C5-Ss; Tue, 22 Aug 2023 15:15:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] conf: am335x-evm and am437x-evm: bump max_leb_cnt
Date: Tue, 22 Aug 2023 15:15:35 -0500
Message-ID: <20230822201535.31458-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Aug 2023 20:15:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16885

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
index d70d591b..58b7996f 100644
--- a/meta-ti-bsp/conf/machine/am437x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5200"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 6000"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
-- 
2.17.1


