Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CDEC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 20:45:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.3462.1656449117112909882
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 13:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IZtlWJ/0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25SKjFln117669;
	Tue, 28 Jun 2022 15:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656449115;
	bh=96YUNiOi9yx1IgiSEq8VTtPmw3PK7OzYSJCiObFUYrY=;
	h=From:To:CC:Subject:Date;
	b=IZtlWJ/056b3yH8pUMGnEwkDUS+CHxohfYMK8/3RGeW3BRElee1TedqqCeKH45D59
	 2E0a5eHlGvChi6tkm2SM7wtklHyFEgaNkaFMMdMfh3QnaZ9hUCYwEaob9XA2iz/B7E
	 iA4GB3KN+Cz5bf8IT9ZXjyCxkZ/gWXBA65BtKVeU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25SKjFF6121111
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jun 2022 15:45:15 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 28
 Jun 2022 15:45:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 28 Jun 2022 15:45:15 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25SKjEKc014035;
	Tue, 28 Jun 2022 15:45:14 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] linux-ti-staging: Unblock SA2UL for AM64x
 and J7200 HS devices
Date: Tue, 28 Jun 2022 15:45:14 -0500
Message-ID: <20220628204514.5159-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jun 2022 20:45:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14846

The SA2UL driver now works on HS devices, unblock this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 75ffa904..59094a9e 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -45,9 +45,3 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
 module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
 KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
-
-# Disable SA2UL for AM64x HS and J7200 HS
-module_conf_sa2ul_am64xx-hs-evm = "blacklist sa2ul"
-KERNEL_MODULE_PROBECONF_append_am64xx-hs-evm = " sa2ul"
-module_conf_sa2ul_j7200-hs-evm = "blacklist sa2ul"
-KERNEL_MODULE_PROBECONF_append_j7200-hs-evm = " sa2ul"
-- 
2.36.1


