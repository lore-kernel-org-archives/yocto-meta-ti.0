Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1D7C7EE32
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:58:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1743.1685483913685410962
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 14:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZgT8Ao1x;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34ULwVj0011191;
	Tue, 30 May 2023 16:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685483911;
	bh=u4pGxRRHRwoLOW3EqAPXTu7XY8shVgqY1wJU2/paol0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZgT8Ao1xvYrA9OFI6A4++aLtw9HQK4O9AYvTIuuR6vDdkeUB7k4faPh4LHVZ8qtgd
	 qXJfRQW/fiHqucrdj+CebTESLT+qIqTMqk/DrvceOzRVvAbT+ub4lcMokA+dRkdn8h
	 mnn1s4/bmK1cj1w3Vn2YU/PLiYO8TBQn0/JUhLM4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34ULwVW6000612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 16:58:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 16:58:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 16:58:31 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34ULwVKH003606;
	Tue, 30 May 2023 16:58:31 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCHv2 1/2] libgles: rename subdir to powervr-umlibs
Date: Tue, 30 May 2023 16:58:26 -0500
Message-ID: <20230530215827.3737116-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530215827.3737116-1-rs@ti.com>
References: <20230530215827.3737116-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 21:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16639

From: Randolph Sapp <rs@ti.com>

Move recipes to new subdir since we offer more than just libgles now.
Reusing the naming convention of the subdirectory used for the km
components for now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb                           | 0
 .../{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules      | 0
 .../{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-img-rogue-umlibs_23.1.6404501.bb (100%)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules (100%)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb (100%)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
-- 
2.40.1


