Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4726CCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:07:09 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.5925.1760472424387945056
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 13:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sIQ1lc5p;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: jm@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EK72om1584134;
	Tue, 14 Oct 2025 15:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760472422;
	bh=BP+4queOol0jKqccudO+jqWHe04qPkNCbk2iRwCja5U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sIQ1lc5pPYAg3yoGNw+M74JHDMyRW4CTnGGWiMJENgvANvnXD8c+HervgFoFpCEO1
	 mIbg6L88xAyi5o1Lmlfz+PwooUNy21PwjlJ8xbn3yGIabamaj6169Tv3/6essgTkPp
	 seaFfdHsbwUBNgb+uR6CIzeMXXJVnyYlP+3MlgKk=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EK72k5268605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 15:07:02 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 15:07:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 15:07:02 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EK72vY707378;
	Tue, 14 Oct 2025 15:07:02 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] 2/2 conf: machine: Explicitly include overlays for am62 LP
Date: Tue, 14 Oct 2025 15:07:02 -0500
Message-ID: <20251014200702.933617-2-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014200702.933617-1-jm@ti.com>
References: <20251014200702.933617-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Oct 2025 20:07:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19122

AM62 LP SK configuration  includes all PWM/EQEP/MCAN overlay
in KERNEL_DEVICETREE_PREFIX but move to KERNEL_DEVICETREE  and
explicitly state the name of overlays that should be included for
am62 LP SK build.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index d34801f2..94457053 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -7,20 +7,20 @@ require conf/machine/include/am62xx.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
-    ti/k3-am62x-sk-dmtimer-pwm \
-    ti/k3-am62x-sk-eqep \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
-    ti/k3-am62x-sk-mcan \
-    ti/k3-am62x-sk-pwm \
 "
 
 KERNEL_DEVICETREE = " \
     ti/k3-am62-lp-sk-nand.dtbo \
     ti/k3-am62-lp-sk.dtb \
     ti/k3-am625-sk.dtb \
+    ti/k3-am62x-sk-dmtimer-pwm.dtbo \
+    ti/k3-am62x-sk-eqep.dtbo \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
+    ti/k3-am62x-sk-mcan.dtbo \
     ti/k3-am62x-sk-mcspi-loopback.dtbo \
+    ti/k3-am62x-sk-pwm.dtbo \
 "
 
 FIT_CONF_DEFAULT_DTB = "ti/k3-am62-lp-sk.dtb"
-- 
2.34.1


