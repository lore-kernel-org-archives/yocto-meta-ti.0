Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DFDC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:34:50 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.7207.1742420084586239395
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ujwX5/am;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLYiNT3031098
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742420084;
	bh=lLRZI6yDf6Z2wbt9Od3vTTptzlEgmCCYoMKoMcUThaQ=;
	h=From:To:Subject:Date;
	b=ujwX5/amD83kYv59+BRzp0kntfZsq6YhLeMva+aRzdpPgrNi00yUen9dSFjKon+h0
	 a7k6Nq+OEq/9LhbF/dlh7ToLeUybs08/mHbrdIvKRpJoHQJ6qpAA3/AfCVR93WM4XO
	 e2GZykKh2EpyoSojGUXLxyRxLqTAVMH1s8qX3enQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLYiBK078173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:34:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:34:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:34:43 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLYhaN035721;
	Wed, 19 Mar 2025 16:34:43 -0500
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v6 0/3] Enabiling gc320 5 driver for am57 in k6.12
Date: Wed, 19 Mar 2025 16:34:40 -0500
Message-ID: <20250319213443.470976-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:34:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18407

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
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 ++++++--
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.34.1


