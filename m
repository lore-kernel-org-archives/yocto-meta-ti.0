Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B72EC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:27:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1412.1685125655691126329
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xf7XK2UR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRXuJ022768;
	Fri, 26 May 2023 13:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685125653;
	bh=3trzyvGDX14T6w3yQQyNDmRI0GC2TTCGmYIZablT8+o=;
	h=From:To:CC:Subject:Date;
	b=xf7XK2URr5nIbyHWtiFZ9bLOgC6WtJN2v96RkA5BUICNde1OehEf8My5LP+ePpayK
	 /wt6CSI/E0oMNF8SzjdHqYzOXUp/y+fGgSW6lWFQIMIxv76QXr8QPonMmlsBmupB7U
	 yznp6H+KE/0j+mafs9gu8m49RqbxxGJ7LCH30SRU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QIRXlU011697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 13:27:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 13:27:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 13:27:33 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRWlp013297;
	Fri, 26 May 2023 13:27:32 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/8] conf: machine: Remove leftover k3r5 SOC_FAMILY names
Date: Fri, 26 May 2023 13:27:24 -0500
Message-ID: <20230526182731.284783-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 18:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16600

These are not used anymore and most have been removed, these look
to be leftovers, remove them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 1 -
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 1 -
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
index 80b6497f..2af3317e 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62A EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-hs-fs"
 
 SYSFW_SOC = "am62ax"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 54059dd7..d2064b27 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-gp"
 
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
index 4369becc..e932928a 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":am64xx"
 
 SYSFW_SOC = "am64x_sr2"
 SYSFW_CONFIG = "evm"
-- 
2.39.2


