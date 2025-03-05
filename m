Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14648C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:15:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.17000.1741191336231462570
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 08:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Hm7pcZn+;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525GFZVI3450286
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:15:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741191335;
	bh=zvQ+TLCQx9oBRQOWEGgZZQCiJlPR9OIm8hKMnx0UFcQ=;
	h=From:To:Subject:Date;
	b=Hm7pcZn+vsTpuVTZOG3tLqBauQtD8KGwq7ERhUgMc8+3fQzf/Zi18uIgMVdlLFzyD
	 Q+bMk0KEtVmK8OXtIDX50zuYMINrrzHNxxgYlxqpsrs+QCIrGWq8GxSochfOx5LCnf
	 YsLht11CA+0+oxssu8gVOiBoMnAq4AqFMeOs5PTY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525GFZ1S127973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:15:35 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 10:15:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 10:15:35 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525GFZPH059162
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:15:35 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH v2 0/3] Enabling the gc320 driver for am57xx-evm
Date: Wed, 5 Mar 2025 10:15:32 -0600
Message-ID: <20250305161535.351340-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 16:15:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18345

From: Antonios Christidis <a-christidis@ti.com>

The gc320 driver has been ported from kernel 6.1 to work on kernel 6.12.
This patch series updates and sets up everything required to start building gc320 again for kernel 6.12.

This patch series goes hand in hand with a patch sent to meta-arago
adding ti-gc320-libs-dev to packagegroup-arago-tisdk-graphics.

Regards,
Antonios 

v2: ti-gc320-libs
- No longer include within the ${PN} package /usr/include files and symb link
  to library file. This is done by not changing the FILES/PACKAGES variables, thus creating a -dev
  package including the above.

Antonios Christidis (3):
  recipes-graphics : port gc320 driver to work on kernel 6.12
  recipes-graphics : port gc320 libs to work on kernel 6.12
  conf: machine: am57xx-evm : Enable gc320 machine feature for am57xx

 meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  2 +-
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb         |  4 ++--
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 10 +++++++---
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.34.1


