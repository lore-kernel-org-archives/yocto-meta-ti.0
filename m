Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B1DC021A4
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 20:18:39 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.26331.1739391511101636210
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 12:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zjbj0x4o;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CKIUWe504101
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739391510;
	bh=ycT9/ZuWIss7iqCwi1pE6d43Lv/3fZK8FK7LtEDVsh4=;
	h=From:To:Subject:Date;
	b=Zjbj0x4obleNmxyTCGwpSuRYyesAigHTmwiavbHYlDkJhFWFGfil2NKX1EbFf5j8H
	 jHE1bDfSDljkWYA1xcb8f+uV7RSSz4OdIDiB/O17qO/j/ZhMLMYNRB13PXcbX2vrOD
	 87v3qdO1kLZuKzmKDlir+2V7Grz4k91cB6h7ww8E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CKIU2M006855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 14:18:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 14:18:30 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CKIUdD049546
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 14:18:30 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH 0/3] Enabling the gc320 driver for am57xx-evm
Date: Wed, 12 Feb 2025 14:18:27 -0600
Message-ID: <20250212201830.2090247-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 20:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18302

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

The gc320 driver has been ported from kernel 6.1 to work on kernel 6.12.
This patch series updates and sets up everything required to start building gc320 again for kernel 6.12.

Regards,
Antonios Christidis


Antonios Christidis (3):
  recipes-graphics : port gc320 driver to work on kernel 6.12
  recipes-graphics : port gc320 libs to work on kernel 6.12
  conf: machine: am57xx-evm : Enable gc320 machine feature for am57xx

 meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  3 ---
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb         |  4 ++--
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 10 +++++++---
 3 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.34.1


