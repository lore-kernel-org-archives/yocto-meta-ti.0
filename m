Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFF3C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 15:26:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2172.1754407596486155457
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 08:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WdXKOWKy;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 575FQYiW312995;
	Tue, 5 Aug 2025 10:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754407594;
	bh=Wd7J2mxsMK11Q6b+otFOfNfiZHneJkUfqcJLXF2tJyE=;
	h=From:To:CC:Subject:Date;
	b=WdXKOWKyuKCvBF+nQnkY5dwpQZG7QsCAufYYyG4B48bKGXwrmviVqt46nxYx+FTXZ
	 s9Z1FItHeF5+DxMtk7ncqH+qorygFvDeYu43b5Se2/PImme+ouHNUTwpw+RCO4xaJZ
	 vcuPiLadnNhdL8wvt+Jsdy77g/LlcPmijhKvXBwg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 575FQYDw2391570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 10:26:34 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 10:26:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 10:26:34 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 575FQX5h2345958;
	Tue, 5 Aug 2025 10:26:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Daniel Schultz <D.Schultz@phytec.de>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] recipes-graphics: weston: Remove hyphen from package revision
Date: Tue, 5 Aug 2025 10:26:33 -0500
Message-ID: <20250805152633.200342-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Aug 2025 15:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18890

Seems having hyphens in the revision tag causes issues with
RPM packaging. Remove this hyphen.

Reported-by: Daniel Schultz <D.Schultz@phytec.de>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
index fafef724..42e6b6ac 100644
--- a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/weston:"
 
-PR:append = ".ti-soc1"
+PR:append = ".tisoc1"
 
 SRC_URI += " \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
-- 
2.39.2


