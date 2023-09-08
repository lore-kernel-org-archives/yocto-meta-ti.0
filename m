Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCF4EEB56F
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 20:30:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3957.1694205028638874550
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 13:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hwC68Hrl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388KUKgm127638;
	Fri, 8 Sep 2023 15:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694205020;
	bh=h7LB5EMh9IcLnhmSRvRtoMcS4WD944TAZIypSGJEs14=;
	h=From:To:CC:Subject:Date;
	b=hwC68HrlivBbynvkBGz9S8VH1pd9Q3ULVMXqMCsDtj5vMsrEzJXRT4rSL8bNeyEBE
	 PgBUugVBsUF4q2Ehq4SBSl8nw+n/yNHo3NqChNdMB+DgHM7WMEhyIFtyQU2wv7Xwrz
	 e+wPJKcUF9uSDqTCsb13IEf7JVrFVv8cfdTaQxRw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388KUJXL023253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 15:30:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 15:30:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 15:30:19 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388KUIEw120481;
	Fri, 8 Sep 2023 15:30:19 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] recipes-bsp: u-boot: Add u-boot-mergeconfig.inc to handle fragment u-boot config
Date: Sat, 9 Sep 2023 02:00:04 +0530
Message-ID: <20230908203004.2764200-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 20:30:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16942

- Add a new file u-boot-mergeconfig.inc which will ensure we handle fragment u-boot configs
using a new variable UBOOT_CONFIG_FRAGMENT which stores the name of fragment u-boot config 
to be used.

- Include u-boot-mergeconfig.inc in u-boot-ti.inc

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
new file mode 100644
index 00000000..69db6260
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
@@ -0,0 +1,7 @@
+do_compile:prepend () {
+   if [ -n "${UBOOT_CONFIG_FRAGMENT}" ]
+   then
+       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENT}
+       oe_runmake -C ${S} O=${B} olddefconfig
+   fi
+}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index f3285c23..5292517b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -7,6 +7,7 @@ SPL_BINARY ?= "MLO"
 
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-mergeconfig.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
 
-- 
2.34.1


