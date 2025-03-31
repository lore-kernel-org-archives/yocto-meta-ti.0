Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1939DC3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 22:40:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.5967.1743460804535213733
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 15:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Slt7e27s;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52VMe05Z2782507
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 17:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743460800;
	bh=PEg6GwARAb2jffCni//SVKhM/mIzA6BPcMhKYADXG0c=;
	h=From:To:CC:Subject:Date;
	b=Slt7e27swce2i63BUGeOgD1LO43jEqxljqSsAq2MgeWhM5HfyQNsALeQnPvsLUgk0
	 bi4t9uTJzeYqmNdQGEQPZjeKh4Y1SOGnqqzfMw7apuNguzDp4Up+cQfElSSBLNnTJA
	 n2paN4hXI4VRfshcFJrfhiNDwyW4dAGrLAOq/cAc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52VMe0YP115447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 Mar 2025 17:40:00 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 31
 Mar 2025 17:40:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 31 Mar 2025 17:40:00 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52VMe05v008557;
	Mon, 31 Mar 2025 17:40:00 -0500
From: <rs@ti.com>
To: <u-kumar1@ti.com>, <m-shah@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCHv2] ti-img-rogue-driver: resolve issues with fdinfo
Date: Mon, 31 Mar 2025 17:39:39 -0500
Message-ID: <20250331223938.3408265-2-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 31 Mar 2025 22:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18440

From: Randolph Sapp <rs@ti.com>

Bump the srcrev to include a fix for events where the driver is
requested to show advanced information about file descriptors that are
associated with the device but are not currently associated with a
rendering task.

This should address the kernel fault in pvr_show_fdinfo associated with
fdinfo/lsof.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: fix typo in description

 .../powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
index 96ca8ff5..b356ce48 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "3bcbba9708fe6a882cd0f4820469d026fff7aee5"
+SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.49.0


