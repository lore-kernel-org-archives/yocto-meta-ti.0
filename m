Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFD2C77B72
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:42:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.388.1681324965146262193
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 11:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CDpFWCo5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CIghC6011795;
	Wed, 12 Apr 2023 13:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681324963;
	bh=NHBoqzGppXQ580Yss3A4IBk5EV/wbaHxcHz8ww2ukn4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CDpFWCo5Kcjh/q1YAgU7SbqthhtwLFKfMzNU8SIHUn9f048nJExhHgCiQKTpiJe6/
	 SRqCIg8QhR3Rz/MkgKU8c9AUm2lj6uHGD2Iqq3H9pJsqLXWcCQoyw0cLrbG34EOJ6z
	 0CgyAvRPDQAW1kJd1gqGIQ0eBvQWxpLEvLpf6b40=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CIgh7t031904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 13:42:43 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 13:42:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 13:42:43 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CIggZW023440;
	Wed, 12 Apr 2023 13:42:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 2/6] ti-sgx-ddk-um: Remove no longer needed CLEANBROKEN and INSANE_SKIPs
Date: Wed, 12 Apr 2023 13:42:38 -0500
Message-ID: <20230412184242.29743-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412184242.29743-1-afd@ti.com>
References: <20230412184242.29743-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 18:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16378

The "clean" target has been fixed along with some other issues that
caused us to need these set. Remove them now.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 9ea3add7..755cc4f5 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -67,7 +67,5 @@ FILES:${PN} +=  "${sysconfdir}/*"
 FILES:${PN} +=  "${datadir}/*"
 FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
 
-INSANE_SKIP:${PN} += "dev-so ldflags useless-rpaths"
-INSANE_SKIP:${PN} += "already-stripped dev-deps"
-
-CLEANBROKEN = "1"
+INSANE_SKIP:${PN} += "ldflags"
+INSANE_SKIP:${PN} += "already-stripped"
-- 
2.39.2


