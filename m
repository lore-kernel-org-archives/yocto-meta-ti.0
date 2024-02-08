Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC52C4829F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:54:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3446.1707418488360948191
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 10:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h48l7mV4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418Isl4X040998;
	Thu, 8 Feb 2024 12:54:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707418487;
	bh=4bCMm50UER3HQ42O6Gy0xZwZm1GGuXssdUy6tPRrkB4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=h48l7mV4aXocN65VH/DYwOj7Gt47ymGdQwWxS8V4N0ML3QgeJLpLzxkzEGFmvOK2G
	 y+gRQXHUvdT7pc8aW39Py85GZ/DwSkAWqjKxANO5l2n32wlRKM0XzjNSgXJRMJglSf
	 cs5HoI2MJU03lkWwCQsAsDNtzK82ot8UAOMR0+pw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418Islng039000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 12:54:47 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 12:54:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 12:54:46 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418Isk3W125263;
	Thu, 8 Feb 2024 12:54:46 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rY9Xq-0000X5-Ji; Thu, 08 Feb 2024 12:54:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] gdbc6x: Fix Upstream-Status tag
Date: Thu, 8 Feb 2024 12:54:46 -0600
Message-ID: <20240208185446.1999-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208185446.1999-1-reatmon@ti.com>
References: <20240208185446.1999-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 18:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17457

We should be using Inactive-Upstream instead of Pending for these
patches.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-Support-Linux-kernels-v5.15.patch                      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch
index cb56a470..fdf7e95f 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch
@@ -8,7 +8,7 @@ put_tty_driver was removed and write_room return type has changed.
 Function tty_driver_kref_put has been around a while, so no need
 to do a kernel version check.
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream
 Signed-off-by: Andrew Davis <afd@ti.com>
 ---
  kernel_module/gdbproxy-mod/gdbserverproxy.c | 6 +++++-
-- 
2.17.1


