Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23883C6370B
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:43:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.29814.1670449396179843145
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hJGZzBe4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhER9045384;
	Wed, 7 Dec 2022 15:43:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670449394;
	bh=CNtr0y/yU6nbwYTVGv0ftOz7pXrLWwit7hz/P0ZXv9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hJGZzBe4uqrm2fKb6a4XEFqzdLaGfQm4kwgOXDLHsH8vwBNE10wsCowzi+ezi8Vox
	 T4YoVhNI1MxVUJQ6/2Feff1WA7PqozEHYpzjrHOzPgknIjJn8lzWqHpW8FbsnF06kc
	 oKU9heDY1GSOdpsfcudw/mrPAWdB0/A8Y7kIYONc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7LhEM1001723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 15:43:14 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 15:43:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 15:43:13 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhCOX007888;
	Wed, 7 Dec 2022 15:43:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/7] conf: machine: Remove j7 grouping and j7.inc
Date: Wed, 7 Dec 2022 15:43:09 -0600
Message-ID: <20221207214312.21735-4-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15425

J7 is an unneeded level of grouping that is now causing issues and
leading to mistakes when adding new J7 based platforms. Each J7x
family device should use the SoC name specifically to prevent
accidentally adding or removing features that are not meant
for the new SoC.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/j7.inc     | 5 -----
 meta-ti-bsp/conf/machine/include/j7200.inc  | 5 ++++-
 meta-ti-bsp/conf/machine/include/j721e.inc  | 5 ++++-
 meta-ti-bsp/conf/machine/include/j721s2.inc | 5 ++++-
 meta-ti-bsp/conf/machine/include/j784s4.inc | 5 ++++-
 5 files changed, 16 insertions(+), 9 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/j7.inc

diff --git a/meta-ti-bsp/conf/machine/include/j7.inc b/meta-ti-bsp/conf/machine/include/j7.inc
deleted file mode 100644
index cf4cc440..00000000
--- a/meta-ti-bsp/conf/machine/include/j7.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-require conf/machine/include/k3.inc
-SOC_FAMILY:append = ":j7"
-
-OPTEEMACHINE = "k3-j721e"
-OPTEEOUTPUTMACHINE = "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index ce88567c..3aedb3f8 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -1,2 +1,5 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j7200"
+
+OPTEEMACHINE = "k3-j721e"
+OPTEEOUTPUTMACHINE = "k3"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index fe260178..8a6c2bec 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,6 +1,9 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j721e"
 
+OPTEEMACHINE = "k3-j721e"
+OPTEEOUTPUTMACHINE = "k3"
+
 MACHINE_FEATURES += "gpu"
 
 PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 5cd74683..4959ad8f 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,6 +1,9 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j721s2"
 
+OPTEEMACHINE = "k3-j721e"
+OPTEEOUTPUTMACHINE = "k3"
+
 MACHINE_FEATURES += "gpu"
 
 PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index d7a598d6..83d7c760 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,6 +1,9 @@
-require conf/machine/include/j7.inc
+require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j784s4"
 
+OPTEEMACHINE = "k3-j721e"
+OPTEEOUTPUTMACHINE = "k3"
+
 MACHINE_FEATURES += "gpu"
 
 PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
-- 
2.38.1


