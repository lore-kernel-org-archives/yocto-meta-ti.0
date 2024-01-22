Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D65DC47DDC
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 20:19:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3132.1705954749743888197
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 12:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QReTugtV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40MKJ7Ft000728;
	Mon, 22 Jan 2024 14:19:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705954747;
	bh=BSJpOYYDODhXkuYP5oMSnW4vdwWe2CUuuddjseeS/fQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QReTugtVzzj9gw6nVuek3YvaaZdRbJ0eW7v6SkLoNA7TE8h4LL7YxzKB6fMpK6znI
	 zATU0rFDV9S64+p707u1UOWDNwYU/vIw7RrfVR1kmDXaUs+2SRcHfBk+eacoMKZ1Ez
	 wCFCZVR9Nmfn+9VDMbE0pmGen5rNWnRF2q7hJn3I=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40MKJ7W9020013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jan 2024 14:19:07 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jan 2024 14:19:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jan 2024 14:19:07 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40MKJ7KG076632;
	Mon, 22 Jan 2024 14:19:07 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rS0l9-0005k1-DJ; Mon, 22 Jan 2024 14:19:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/2] u-boot-ti: Add yamllint dependency
Date: Mon, 22 Jan 2024 14:19:07 -0600
Message-ID: <20240122201907.22026-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240122201907.22026-1-reatmon@ti.com>
References: <20240122201907.22026-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jan 2024 20:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17411

A patch has been accepted in mainline u-boot that has binman calling
yamllint to verify the configs during compile.  This means that the
yamllint must be available as a tool at the time.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index ef3ebc70..3a5d8a7d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -27,7 +27,7 @@ PV:append = "+git${SRCPV}"
 DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
 
 # u-boot needs these for binman
-DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-native"
+DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-native python3-yamllint-native"
 
 # SYSFW/TIFS Firmware
 DEPENDS:append:k3 = " ti-sci-fw"
-- 
2.17.1


