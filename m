Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FF7C48260
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 00:03:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.10301.1707177775772983954
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 16:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uUga7k5o;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41602sMa065410;
	Mon, 5 Feb 2024 18:02:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707177774;
	bh=9N4xAfx4nYAkE/5D+VNWzQ47DVkDARpEO8Xtj+XAV+Y=;
	h=From:To:CC:Subject:Date;
	b=uUga7k5oZualsr2NjXrIVnTkHwlyfhzT3hWMTxjiTYhITucNmxeCNFUnhTghnM0o2
	 SxEZ/sG/qx27tMaUoDg7eDHwCNK20o5mTLENxv6hvUAQcStZYY5myQ8rYJppB3hC5+
	 AEcm4QJc0i2gF1iGlpdvQYankA90L35F/T6wlpbM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41602sNR100131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 18:02:54 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 18:02:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 18:02:54 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41602sMt122531;
	Mon, 5 Feb 2024 18:02:54 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] cairo: remove cairo append and include
Date: Mon, 5 Feb 2024 18:02:54 -0600
Message-ID: <20240206000254.2916314-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Feb 2024 00:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17443

From: Randolph Sapp <rs@ti.com>

Cairo versions >= 1.17.8 dropped all GL render backends entirely,
invalidating both the opengl and glesv2 PACKAGECONFIGS. As such this
override is no longer necessary.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 -
 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 -----
 2 files changed, 6 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
 delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
deleted file mode 100644
index 459d8d09..00000000
--- a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
deleted file mode 100644
index b41f1a01..00000000
--- a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# This is required since cairo expects the opengl distro feature to refer to
-# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
-
-PACKAGECONFIG:remove = "opengl"
-PACKAGECONFIG:append = " glesv2"
-- 
2.43.0


