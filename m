Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10510.1589198691575792401
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 May 2020 05:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=axZ7h8tV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-stiffler@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04BC4oB5110614
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 May 2020 07:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589198690;
	bh=/kzgdb/a4GSjPOZLiyiseZM3+x5lnyyiOK35bK3SpAg=;
	h=From:To:CC:Subject:Date;
	b=axZ7h8tV9w18O/OzhHvWSD3/rHzwXfNqOmOfK5PeqImw5QdwPhBRknZ4Sd1GSSEd1
	 vuY95t1Wjxzg4RyGJv7g3hXgumUQLWHeL/UuYxW2wdFrW2yXiLA4BpXTrb2N0Ti8Dn
	 qhsDrP3Cfl4Ejt+PMP4NxuPh3OnkFOxZGnSMEiPE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04BC4owb061062
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 May 2020 07:04:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 May 2020 07:04:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 May 2020 07:04:49 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BC4nVe019917;
	Mon, 11 May 2020 07:04:49 -0500
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/dunfell][PATCH] ti-xdctools: add more PRIVATE_LIBS
Date: Mon, 11 May 2020 08:04:47 -0400
Message-ID: <1589198687-14340-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

* libjli.so and libawt_xawt.so are now detected within the
  ti-xdctools packages.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-xdctools-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
index 27f8f90..c21e479 100644
--- a/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -60,6 +60,8 @@ libjvm.so \
 libhpi.so \
 lib.so \
 libcairo.so.2 \
+libjli.so \
+libawt_xawt.so \
 "
 
 COMPATIBLE_HOST ?= "null"
-- 
2.7.4

