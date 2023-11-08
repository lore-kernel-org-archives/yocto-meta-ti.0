Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F45CC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 16:58:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.19918.1699462715687404484
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 08:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F82IGt0x;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8GwX3D068142;
	Wed, 8 Nov 2023 10:58:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699462713;
	bh=b2ingKYIqP9Q/jB3dVghbQos+sAjBG62Rng1O9NpayQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F82IGt0x8rzPeXfPjci+SgY5WPCHcdXW+fei0uMFkp5FmWJZoU/76OeSDDbnN0y4R
	 48wckMkLUg8c+Z2m1ahtnRWaCz+b9/PTQUJUVuG+G3JTQUSheZJl+hcdOiDU/9LJXV
	 ET801ZtnOk0bqdL9R/hGzvUgn/L/JDss1yBc+zM8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8GwX9O052479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 10:58:33 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 10:58:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 10:58:33 -0600
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8GwWIt086550;
	Wed, 8 Nov 2023 10:58:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] ffa-debugfs-mod: Allow this package to build on ti-soc
Date: Wed, 8 Nov 2023 10:58:31 -0600
Message-ID: <20231108165831.2774365-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108165831.2774365-1-afd@ti.com>
References: <20231108165831.2774365-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 16:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17279

As all our supported kernels are above 5.10 and can now build this
module, remove this disable.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend             | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend

diff --git a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
deleted file mode 100644
index 67fcf6ec..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/ffa-debugfs/ffa-debugfs-mod_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Added my meta-arm, this needs ceetain backports in 5.10
-# Disable until kernel upgrades to newer than 5.10 where it
-# is already upstreamed
-# Revisit when kernel is upgraded to 5.15 or newer e.g.
-COMPATIBLE_HOST:ti-soc = "null"
-- 
2.39.2


