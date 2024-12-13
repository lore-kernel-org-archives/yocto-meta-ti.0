Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0BCE77180
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 16:26:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.19989.1734107159729761893
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 08:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lP5zfEdu;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDGPwW03169440
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 10:25:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734107158;
	bh=ArqsX3uXUPYNXIq2dfhEoL66/LprZrS16vy9akDqdTA=;
	h=From:To:CC:Subject:Date;
	b=lP5zfEdubAZknWQAKNfJWkdbxHDYXIjKSX7VfK9n3zadzjzLpENOuPwTXd7AwBfgp
	 KCDUDayQ7gS/v0vmuIy8ccZ5NQyV7OFTko91rs+QOhEMbnL7DUcjriHEUs/WPfILDK
	 Mk+2trDsTdoA++FMy7qxwEJcfJwYlbyTo+pAjSxM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDGPwVW061645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Dec 2024 10:25:58 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 10:25:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 10:25:58 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDGPw7l069143;
	Fri, 13 Dec 2024 10:25:58 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH v2] meta-ti-bsp: ti-rtos-bin: Move this with the other firmware recipes
Date: Fri, 13 Dec 2024 10:25:58 -0600
Message-ID: <20241213162558.59592-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 16:26:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18106

All other firmware recipes are in recipes-bsp. There is nothing much
special about this set of firmware so move it to match.

This firmware is the pre-compiled "echo test" example for various
remote cores. The directory name is not very clear on that, so fix
that up too.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Change the recipe name to be more specific also

 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb}                           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/{recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb => recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb} (100%)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
rename to meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
-- 
2.39.2


