Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229F6C63709
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:43:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.29815.1670449396503393115
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EoYZiion;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhEvi045388;
	Wed, 7 Dec 2022 15:43:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670449394;
	bh=ZG0hzhiZDTjFvP0nmsK3wDyqyeifbNqENA9Nh3Cqt4o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EoYZiionrJ0p0D5TU6VDkwqPVve5KczGZfP4f6nZM7QcSiAi2ZqQ2KYLHSnON2wyC
	 cpnAdWDC44lY4cj0zgHIVsqvDaNVuDKEdJqC89nacQu/3dAIM2bcjpCORkOL81zFJ8
	 D2NE0nDc0hYCjr4yVYY1oLMPSMQOTaF5DDJ71anQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7LhEAa001729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 15:43:14 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 15:43:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 15:43:13 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhCOY007888;
	Wed, 7 Dec 2022 15:43:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 5/7] conf: machine: Remove OPTEEOUTPUTMACHINE definition
Date: Wed, 7 Dec 2022 15:43:10 -0600
Message-ID: <20221207214312.21735-5-afd@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207214312.21735-1-afd@ti.com>
References: <20221207214312.21735-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 21:43:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15426

This was used in the base Linaro optee-os_git.bb recipe, it is
no longer used, remove it from our boards.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am437x-hs-evm.conf | 1 -
 meta-ti-bsp/conf/machine/am57xx-hs-evm.conf | 1 -
 meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf | 1 -
 meta-ti-bsp/conf/machine/include/am62xx.inc | 1 -
 meta-ti-bsp/conf/machine/include/am64xx.inc | 1 -
 meta-ti-bsp/conf/machine/include/am65xx.inc | 1 -
 meta-ti-bsp/conf/machine/include/j7200.inc  | 1 -
 meta-ti-bsp/conf/machine/include/j721e.inc  | 1 -
 meta-ti-bsp/conf/machine/include/j721s2.inc | 1 -
 meta-ti-bsp/conf/machine/include/j784s4.inc | 1 -
 10 files changed, 10 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
index 68b808d2..cdd664ac 100644
--- a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
@@ -15,6 +15,5 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
 
 OPTEEMACHINE = "ti-am43xx"
 OPTEEFLAVOR = "am43xx"
-OPTEEOUTPUTMACHINE = "ti"
 
 EXTRA_IMAGEDEPENDS += "optee-os"
diff --git a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
index 5232cbd9..1e63f5d2 100644
--- a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
@@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
 
 OPTEEMACHINE = "ti-am57xx"
 OPTEEFLAVOR = "am57xx"
-OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
 
 EXTRA_IMAGEDEPENDS += "optee-os"
diff --git a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
index 49630081..810d53ed 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
@@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
 
 OPTEEMACHINE = "ti-dra7xx"
 OPTEEFLAVOR = "dra7xx"
-OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
 
 EXTRA_IMAGEDEPENDS += "optee-os"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index a5aad994..9d8bc87c 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -19,4 +19,3 @@ TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
 OPTEEMACHINE = "k3-am62x"
-OPTEEOUTPUTMACHINE = "k3"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 055f6036..7c46b630 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -33,4 +33,3 @@ do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am64x"
-OPTEEOUTPUTMACHINE = "k3"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 80aa6d27..14e0d07f 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -38,4 +38,3 @@ do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 
 OPTEEMACHINE = "k3-am65x"
-OPTEEOUTPUTMACHINE = "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index 3aedb3f8..1eaf7806 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -2,4 +2,3 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j7200"
 
 OPTEEMACHINE = "k3-j721e"
-OPTEEOUTPUTMACHINE = "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 8a6c2bec..34569a01 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j721e"
 
 OPTEEMACHINE = "k3-j721e"
-OPTEEOUTPUTMACHINE = "k3"
 
 MACHINE_FEATURES += "gpu"
 
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 4959ad8f..2a60458e 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j721s2"
 
 OPTEEMACHINE = "k3-j721e"
-OPTEEOUTPUTMACHINE = "k3"
 
 MACHINE_FEATURES += "gpu"
 
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 83d7c760..e2f053ac 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -2,7 +2,6 @@ require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j784s4"
 
 OPTEEMACHINE = "k3-j721e"
-OPTEEOUTPUTMACHINE = "k3"
 
 MACHINE_FEATURES += "gpu"
 
-- 
2.38.1


