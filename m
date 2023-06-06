Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACCFC7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 19:34:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6342.1686080038411569983
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 12:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qDTf3xvq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356JXuUB035518;
	Tue, 6 Jun 2023 14:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686080036;
	bh=wT8Cxs+io1X02D0QjBFY+xu+KSjFFB3faeaZiphd9kI=;
	h=From:To:CC:Subject:Date;
	b=qDTf3xvq1nQ4yY6C7yUUAnLSXgPzhsz0o+5xEGKrtKjYIMStZJg5D3oYO+NqpwQR6
	 lS+G9QQRNDD2yFsoDuQn68Y94A/VnJ6ptc4NdSzimeQzsGGCNI3BzydC2UH/uWHao3
	 +W1Wnq0MPlmT0SjWb/QO/+Y8EVuBpioRUVMzS+mw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356JXus0092670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 14:33:56 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 14:33:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 14:33:55 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356JXtqt107072;
	Tue, 6 Jun 2023 14:33:55 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: k3: remove the ttyS0 definition
Date: Tue, 6 Jun 2023 14:33:53 -0500
Message-ID: <20230606193353.910110-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 19:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16677

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


