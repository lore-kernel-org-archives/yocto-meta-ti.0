Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246FBEE7FF3
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:14:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.38432.1694178878098506837
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 06:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Kwv2qDJB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388DEX50124718;
	Fri, 8 Sep 2023 08:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694178873;
	bh=NLXAAmk90RlzDWcXnfkQmEr7fqsHTzzVDBF1LwQPluo=;
	h=From:To:CC:Subject:Date;
	b=Kwv2qDJBa9tma5U86ec1I/nEVq8qdPChKyaSIt/mwYuYZn1+3TZ4aWyIQ8DdxT7rO
	 j9cM8UBE4u57IDR6yTqtLYsI6A62VSv1sfH5BsjtzH04no0wiTmdthQQAoMqfzTYF5
	 B3REJ2XzXYXb4vkmvCDzM8hdLTIb4LPImp+Oe97E=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388DEX0g114657
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 08:14:33 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 08:14:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 08:14:32 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388DEWIE024290;
	Fri, 8 Sep 2023 08:14:32 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] recipes-bsp: u-boot: Add logic to handle fragment u-boot configs
Date: Fri, 8 Sep 2023 18:44:27 +0530
Message-ID: <20230908131427.2237438-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 13:14:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16934

- Add u-boot-mergeconfig.inc which will ensure we handle fragment u-boot configs.
- Include u-boot-mergeconfig.inc in u-boot-ti.inc.
- Add a new variable UBOOT_CONFIG_FRAGMENT which stores the name of fragment defconfig to be used.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf     | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc

diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
index 472da1cc..a5be1130 100644
--- a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
@@ -9,3 +9,4 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+UBOOT_CONFIG_FRAGMENT = "am62xsip_sk_r5.config"
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


