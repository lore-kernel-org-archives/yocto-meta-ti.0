Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2813.1618463468222205047
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 22:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I7YcQzuu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B7CF119575;
	Thu, 15 Apr 2021 00:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618463467;
	bh=LekcrFDD7kAIFvi8jnvLswKi9PsR87AVW2e4u9q90Lg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I7YcQzuuBNPAtnTT+YFKSrFux2TOWGeQI3MNNW9ctTTerViH8RSAaoxpvPmryA3ys
	 dr1q07AW69NkUjhiFN7wGr2hauGY89sQTcIwsCEwG6M0nXFhlupGy55vjUvs+AAm96
	 nXh+k+MAIy1A3ZeC11x8LaX9v7hWWXn2Q4iEm1D0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13F5B69x095617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 00:11:06 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 00:11:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 00:11:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B6Id116201;
	Thu, 15 Apr 2021 00:11:06 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 3/6] Revert "j7-evm: add new infotainment DTBO file"
Date: Thu, 15 Apr 2021 00:11:02 -0500
Message-ID: <20210415051105.1626-4-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415051105.1626-1-praneeth@ti.com>
References: <20210415051105.1626-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit e8a9485db6310252317a68ed155e35d9d6c9f7f2.

Reverting for now, as the support for this overlay is not yet
present on ti-linux-5.10.y

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/j7-evm.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index ad59b502..884c524d 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -11,7 +11,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
-    ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-pcie-backplane.dtbo \
 "
 
-- 
2.17.1

