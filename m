Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD95DC7EE24
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:55:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5897.1682546145337644031
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=M2D+NA7Z;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLtfIL029030;
	Wed, 26 Apr 2023 16:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682546141;
	bh=XobNPTR+m1JTIyvIOQChjQxy40Z8E9FqDfqpNFvhK0M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=M2D+NA7Z+srn7hs+umX4Co6hzz4dMNthi8Sbx2A8EfGCuFjObSOW75o0D/gY2DI8O
	 jkuPY4lX7Sc73V6MmEJx/TZWqF+ze8fcB5kVhnx/TcW7iycS6NTAs/OrcnumOWoVJR
	 fha9YtPiflGIwkvCmNyAjElZEbeeErp4dwGQ8x9k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLtfxN008877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:55:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 26
 Apr 2023 16:55:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:55:41 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLtf4C081011;
	Wed, 26 Apr 2023 16:55:41 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 3/4] cairo: resolve opengl version
Date: Wed, 26 Apr 2023 16:55:37 -0500
Message-ID: <20230426215538.3502212-4-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426215538.3502212-1-rs@ti.com>
References: <20230426215538.3502212-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16433

From: Randolph Sapp <rs@ti.com>

Cairo can either be built for use with OpenGL or OpenGLES. By default it
assumes it can use OpenGL if X11 is provided as a distro feature. This
assumption is not true anymore.

Vulkan libraries need some X libs at runtime now, so we need to manually
override the PACKAGECONFIG for cairo to use OpenGLES.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend

diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
new file mode 100644
index 00000000..b41f1a01
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
@@ -0,0 +1,5 @@
+# This is required since cairo expects the opengl distro feature to refer to
+# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
+
+PACKAGECONFIG:remove = "opengl"
+PACKAGECONFIG:append = " glesv2"
-- 
2.40.0


