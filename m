Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F33AC3DA62
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 19:22:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1729.1721244163177847106
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 12:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oVl/WumY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HJMcdi086587;
	Wed, 17 Jul 2024 14:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721244158;
	bh=wVvtVV8sYraUXCKwbX9lbzjQTXNhrrr1TEGdAD4uDck=;
	h=From:To:Subject:Date;
	b=oVl/WumYrDEEnd8q2DDO6lJvGtylIhQ+sfXGyVQcZl9vGgJEhAAAuV796K8dv04BA
	 EzIU5HvzL0Oppa/izKar64go4oWila4mruUbaqnmsNZd+uPegkdA3tUGOW6uHMEWDi
	 4hEA4F3BaFemBpTzPmMYup77Wrs0uwrIu4Py9fJg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HJMcKv020621
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 14:22:38 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 14:22:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 14:22:38 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HJMcbp020537;
	Wed, 17 Jul 2024 14:22:38 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sUAEY-0001wb-Fj; Wed, 17 Jul 2024 14:22:38 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] linux: Fix assignment of SRC_URI for patches
Date: Wed, 17 Jul 2024 14:22:38 -0500
Message-ID: <20240717192238.7433-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 19:22:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17880

Testing shows that the SRC_URI += does not work for adding the new
patches.  += takes place during parsing, we want :append instead to make
sure that no matter what SRC_URI is in the various kernel recipes, that
we we append the patches to the end.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fixed commit message.

 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index 43d2341a..f24fbe51 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -13,7 +13,7 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
 KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
 KERNEL_DTBVENDORED = "1"
 
-SRC_URI += " \
+SRC_URI:append = " \
 file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
 file://0001-vt-conmakehash-improve-reproducibility.patch \
 file://0001-pnmtologo-use-relocatable-file-name.patch \
-- 
2.17.1


