Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3095.1619038408979073454
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FL3zbQ++;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrSO1079765;
	Wed, 21 Apr 2021 15:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038408;
	bh=hi7EWd+u7CpxDy6RVTp6MgAmKaxqoIYqvkHub1N1K1U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FL3zbQ++tl5sTsN6I/0uUatD35GFxXyVtwWTmI2R7pE4dq6sjWhU2uacZa9e2BD6e
	 ZFu2B6LAcbHg0f6/oh+s0CnGHNnixCet+u0I3C33xAS7J8xzHFj4cQRaRakMFuHltS
	 5JmydMaSs54nv/NW5S7pv+EERnNcMi914/qy1ZR0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKrSln112094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:53:28 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:53:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:53:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrRe2051790;
	Wed, 21 Apr 2021 15:53:27 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Suman Anna <s-anna@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Nishanth Menon
	<nm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 3/4] dsptop: bump SRCREV for kernel 5.10 build fix
Date: Wed, 21 Apr 2021 15:53:25 -0500
Message-ID: <20210421205326.22047-4-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421205326.22047-1-praneeth@ti.com>
References: <20210421205326.22047-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

bump SRCREV to latest to pick build fix for 5.10 kernel.
this update picks
commit 816485e68430 ("Merge pull request #1 in DBG/dsptop from for-5.10 to master")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/dsptop/dsptop.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
index 6bc38373..31f775e2 100644
--- a/recipes-bsp/dsptop/dsptop.inc
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -1,7 +1,7 @@
 # This corresponds to version 1.4.0
-SRCREV = "25e823b04e62af224dce97b90359b7569ce3fbb5"
+SRCREV = "816485e68430bbec643eac9498bfa5303eb2c2e1"
 PV = "1.4.0"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1

