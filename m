Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35332C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 20:03:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4202.1684958596502279331
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 May 2023 13:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RAoF4VM9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OK3CX4045276;
	Wed, 24 May 2023 15:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684958592;
	bh=wT8Cxs+io1X02D0QjBFY+xu+KSjFFB3faeaZiphd9kI=;
	h=From:To:CC:Subject:Date;
	b=RAoF4VM9JtzBTXMYidcUsdMyOcwJOsqJPIszsj0aaRlzegymNcZUosClVSODtH32a
	 m6DnYmq1MKnHsu/xj/8grHPraxUVOplo1wwJmOAkKConGoLsP/QoOH5bK32AAgxoPp
	 fPTJ2dMtqpGAeU7+QeTESNpg4eZQxpBBBw54tqhQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OK3CYH068470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 15:03:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 15:03:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 15:03:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OK3Bkh011053;
	Wed, 24 May 2023 15:03:11 -0500
From: <rs@ti.com>
To: <p-bhagat@ti.com>, <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>, <bb@ti.com>, <nm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: remove extra ttyS* definitions
Date: Wed, 24 May 2023 15:03:10 -0500
Message-ID: <20230524200310.131510-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 May 2023 20:03:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16585

From: Randolph Sapp <rs@ti.com>

Adding serial consoles to this variable makes systemd attempt to start a
Getty instance on them. Getty has no retry limit and no retry timout.
I'm sure you can guess where this is going.

This fixes the endless start / stop Getty on ttyS0/ttyS3 messages that
will flood the log until it's full.

In the case of Jailhouse demos, the getty systemd service should be
invoked upon demo start and stopped upon end of the demo. It should not
be listed as a system serial interface since it will not be present
during normal device operation.

Before anyone asks, SERIAL_CONSOLES_CHECK only works on the sysVinit
script so it's not worth discussing as a solution here.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc | 3 ---
 meta-ti-bsp/conf/machine/include/k3.inc     | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index c98da5f5..1274d3b5 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -25,6 +25,3 @@ TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
 OPTEEMACHINE = "k3-am62x"
-
-# Normally AM62 boards use ttyS2, but our Jailhouse inmate may use ttyS3, so try both
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index c6b55239..97c6da94 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -55,5 +55,5 @@ WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-- 
2.40.1


