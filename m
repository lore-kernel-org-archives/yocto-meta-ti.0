Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B37C77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 08:38:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22489.1683275908512243517
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 01:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hid6dYwf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-bhatia1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3458cQUq055817;
	Fri, 5 May 2023 03:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683275906;
	bh=C6o7B3PXiIrjveEO70GDBG96jVA2tl/ITAFLdryaPGg=;
	h=From:To:CC:Subject:Date;
	b=hid6dYwflbyMuCIWh7FcUIJFaEceyLWsHhS3u+6vmHhWp+J7tn8dBCUODKycW0Cpg
	 8Rb3d0vXD+lV3VD8qszn9I/qukgRDEF1mQftfQXgf4lZrW0Q/kOljiQ/qyDtv64Ivx
	 yl7yXGEHGITysuL7KAZa2L1xkT8tKOiOnO32fZ9M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3458cQ52060477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 May 2023 03:38:26 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 May 2023 03:38:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 May 2023 03:38:26 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3458cPfk062640;
	Fri, 5 May 2023 03:38:25 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Aradhya Bhatia
	<a-bhatia1@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Paresh Bhagat
	<p-bhagat@ti.com>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, Gyan Gupta
	<g-gupta@ti.com>
Subject: [kirkstone-next][PATCH] meta-ti: conf: am62xx-lp-evm: Fix DT and DT prefixes
Date: Fri, 5 May 2023 14:08:24 +0530
Message-ID: <20230505083824.27085-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 May 2023 08:38:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16487

The DT name k3-am62-lp-sk.dts was adopted instead of k3-am62x-lp-sk.dts
because the community prefers avoiding the wildcard letter 'x'.[1]

Drop the letter 'x' from the strings in KERNEL_DEVICETREE_PREFIX and
KERNEL_DEVICETREE to accurately reflect the DT names.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

[1]:
https://lore.kernel.org/all/06cbcd7d-bc83-bfeb-0821-72c7caf9a5e7@linaro.org/
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index ba1a12a7fdb7..ce306a2a0e17 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -5,12 +5,12 @@
 require conf/machine/include/am62xx-lp.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
-    ti/k3-am62x-lp \
+    ti/k3-am62-lp \
     ti/k3-am625-sk \
 "
 
 KERNEL_DEVICETREE = " \
-    ti/k3-am62x-lp-sk.dtb \
+    ti/k3-am62-lp-sk.dtb \
 "
 
 SPL_BINARY = "tispl.bin_HS"
-- 
2.40.1


