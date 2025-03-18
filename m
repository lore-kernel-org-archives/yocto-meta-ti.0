Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A369C28B30
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 02:38:40 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2842.1742265517425805784
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 19:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JgIUsl+9;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52I2cavu2483001
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742265516;
	bh=6G0RqnM/Xxj16zfN85RChs0HK3eyq7OtZoIJX0EP7oM=;
	h=From:To:Subject:Date;
	b=JgIUsl+9d2ICMWPQvr9fNrZLD72R7K5pgqJJga1MfA2RTLKGKdnW+RZrswZtQ6WV1
	 WCla7fRZjwLw5RIhky893wxAMiupC8P6PpNXxs+uZhXdIBw1BUtLlZ9dJ4mzgTsNMW
	 AIQlU2M1BaHfQl/34uPUrWAZeOtpuxZtxTasN6z4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52I2ca4J105556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 21:38:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 21:38:36 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52I2cadx043577
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:38:36 -0500
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v5 0/3] Enabiling gc320
Date: Mon, 17 Mar 2025 21:38:33 -0500
Message-ID: <20250318023836.3507801-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 02:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18396

From: Antonios Christidis <a-christidis@ti.com>

The gc320 driver has been ported from kernel 6.1 to 6.12.
This patch series updates and sets up everything required to start
buidling gc320 again for kernel 6.12. 


This patch series goes hand in hand with a patch sent to meta-arago
updating the SRCREV of ti-gc320-tests. 

Regards,
Antonios

Antonios Christidis (3):
  recipe-graphics: port gc320 driver to work on kernel 6.12
  conf: machine: am57xx-evm: Enable gc320 machine feature for am57xx
  recipes-graphics: port gc320 libs to work on kernel 6.12

 meta-ti-bsp/conf/machine/include/ti-bsp.inc               | 3 ---
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb            | 4 ++--
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 +++++---
 3 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.34.1


