Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A74C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 16:54:48 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.86296.1753721681098694432
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 09:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xzHja/gI;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SGscOt2771877;
	Mon, 28 Jul 2025 11:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753721678;
	bh=8Haq1RAGdCDQWLgxBiBw2tEomD7/Mu1YU3wEmYNfhj0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xzHja/gIxdlXn4boyK/Vwf6/g6sAA+Zytda7WG5TFAt2bY9ovL4bD/IcI8CBDNSbQ
	 lZ8OpqOGEvaByYqrv/MLHKCYOIuJLUICvyXOsgcB0sqvMwfCy9hyER1rXhkJ2RuAg9
	 c0uAvRkNiB5b4hj9KBNa3OeV0egV44cz/79kdpr4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SGsc7u2153945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 11:54:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 11:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 11:54:38 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SGsbUa2375292;
	Mon, 28 Jul 2025 11:54:38 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 2/3] wic: sdimage-2part-efi: Add console kernel param
Date: Mon, 28 Jul 2025 11:54:36 -0500
Message-ID: <20250728165437.571427-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250728165437.571427-1-afd@ti.com>
References: <20250728165437.571427-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 16:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18838

This is already set for AM64x as that platform requires it, it is valid
for all K3 platforms. Like AM64x other platforms might drop this from
the DTB making it required for them also.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 2 --
 meta-ti-bsp/conf/machine/include/k3.inc     | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 56b56afe..49e996c8 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -34,5 +34,3 @@ TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am64x"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
-
-TI_WKS_BOOTLOADER_APPEND="console=ttyS2,115200n8"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 7ec6b51e..572eb1cc 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -51,7 +51,7 @@ MACHINE_FEATURES += "efi"
 
 WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
 
-TI_WKS_BOOTLOADER_APPEND ?= ""
+TI_WKS_BOOTLOADER_APPEND ?= "console=ttyS2,115200n8"
 
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 
-- 
2.39.2


