Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA83BC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:08:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4092.1682629675944184328
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QIa0kIqb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7rE4127528;
	Thu, 27 Apr 2023 16:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682629673;
	bh=TUEPgcIZZnC7JJRZj67WuimgXj6O/DDwHCfCIheF3uw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QIa0kIqbSzby8sZ5dovDDvXCRjP/pdRBKBObrWsz+pHiftwuWZhv1PvsTW0et5Z1P
	 eFkGoBkSbO2Wc/lM5/NscvL99gskbXULSyaZff5LBmdKoXFLQlEQDNtgEPMUPCM2XL
	 W1Pl7SiqSeT4PBKYe2kVlm5bSHkjyyDFfcGLTNCg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RL7rVM052974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:07:53 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:07:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:07:53 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7k8a002940;
	Thu, 27 Apr 2023 16:07:52 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 3/4] cairo: resolve opengl version
Date: Thu, 27 Apr 2023 16:07:45 -0500
Message-ID: <20230427210746.1915362-4-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427210746.1915362-1-rs@ti.com>
References: <20230427210746.1915362-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16449

From: Randolph Sapp <rs@ti.com>

Cairo can either be built for use with OpenGL or OpenGLES. By default it
assumes it can use OpenGL if X11 is provided as a distro feature. This
assumption is not true when using the proprietary SGX / Rogue drivers.

Vulkan libraries need some X libs at runtime now, so we need to manually
override the PACKAGECONFIG for cairo to use OpenGLES.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 +
 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
new file mode 100644
index 00000000..459d8d09
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
new file mode 100644
index 00000000..b41f1a01
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
@@ -0,0 +1,5 @@
+# This is required since cairo expects the opengl distro feature to refer to
+# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
+
+PACKAGECONFIG:remove = "opengl"
+PACKAGECONFIG:append = " glesv2"
-- 
2.40.0


