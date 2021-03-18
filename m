Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2328.1616027178227786538
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 17:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tBhno7rg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12I0QHk6124376;
	Wed, 17 Mar 2021 19:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616027177;
	bh=rF7AcPyNXXMQ3UR9s+X41dE6dsKW1e6hWBvzIejoDlc=;
	h=From:To:CC:Subject:Date;
	b=tBhno7rg86eZWYhNixQPCZBs3kan2np0trGhcCwVwwgyRo4L+IQxZdSVwF7uVRxVb
	 ezxUK2wF3vJJFRU5TrcLa4TsYjYX/lo9DTa1fbbwN7OCNHbZN5rTPnPRo0hUXC3zu1
	 RRj3ZdfWcLq3C9O8UUJhgcdElxwsRWgJbp+XBd3c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12I0QHLe012052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Mar 2021 19:26:17 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 19:26:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 19:26:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12I0QGaq125249;
	Wed, 17 Mar 2021 19:26:16 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
Subject: [PATCH] ti-uboot-staging: Update to the latest commit
Date: Wed, 17 Mar 2021 19:26:16 -0500
Message-ID: <20210318002616.32134-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

ti-uboot-staging: Update to the latest commit

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 688eb131..c066eb8f 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r34"
+PR = "r35"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "8c49d316a4283299c9b2d193aac38a25ba8f8709"
+SRCREV = "654d73f8725db340ccb470d5d130df3fcf7ce482"
-- 
2.17.1

