Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF37C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:58:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.35209.1744293516703846388
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Apr 2025 06:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tSzsfZzq;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ADwWP11149732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 08:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744293512;
	bh=mxWuwGnXj/Bx7zk/txrF5RNUpXFuTj/Vc1Z9uq/C7Yc=;
	h=From:To:CC:Subject:Date;
	b=tSzsfZzqkI7GZyCwgf6rl126aDOqt8bKWx9CgVg2YoLk5QlQKurkadMyvVcPweZUz
	 ftwgkAj/wfDP8WtUfdJcwfmY5GE2DPvOPZsBjr1SBQxtgP1UTu5ZD8E7Hx9J148wAk
	 lG+i+XlQ2gGyi5g0yy4/0ONBUlWH2oUsdK15a82k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ADwWCD095712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 08:58:32 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 08:58:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 08:58:31 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ADwVmt115729;
	Thu, 10 Apr 2025 08:58:31 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: am62lxx-evm: Bump up max_leb_cnt
Date: Thu, 10 Apr 2025 19:28:26 +0530
Message-ID: <20250410135826.1045373-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Apr 2025 13:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18457

* New features added under meta-tisdk [0] require another
increase to max_leb_cnt.

* This patch fixes following errors observed with 11.00.09.04
tag on meta-tisdk,

---
17:03:18 | DEBUG: Python function extend_recipe_sysroot finished
17:03:18 | DEBUG: Executing python function set_image_size
17:03:18 | DEBUG: 8748386.400000 = 6729528 * 1.300000
17:03:18 | DEBUG: 8748386.400000 = max(8748386.400000, 65536)[8748386.400000] + 0
17:03:18 | DEBUG: 8748387.000000 = int(8748386.400000)
17:03:18 | DEBUG: 8748387 = aligned(8748387)
17:03:18 | DEBUG: returning 8748387
17:03:18 | DEBUG: Python function set_image_size finished
17:03:18 | DEBUG: Executing shell function do_image_ubifs
17:03:18 | Error: max_leb_cnt too low (8134 needed)
---

[0]: https://github.com/TexasInstruments/meta-tisdk

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 8d1e1fe2..607092a7 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/ti-extras.inc
 
 IMAGE_FSTYPES += "ubifs ubi"
 
-MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8000"
+MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
 
 UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"
 
-- 
2.34.1


