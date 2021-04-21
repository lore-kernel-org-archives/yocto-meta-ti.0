Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.3009.1619038408692996389
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rqZ4ZdPj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrR9X042598;
	Wed, 21 Apr 2021 15:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038407;
	bh=Ab+r28inZlaoM55p9pTlfZ6OtpMP/gDOle4Wo5qaeDM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rqZ4ZdPjTSHKy2kNNBlhjapHb90da0ieGc21DlyxZs3yg7X1V0EJEGvH3bzDIMQfP
	 hsmv3j4I+NimIs2o/EL9G2lnNQnk5k5XYVRjfZ2y3LLcSiDkQ2RIrbhKj+qG5UxI3x
	 jRW76O+Dk/AVY3G233pyVzswMctx/7qHm8BChFPs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKrR1i112091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:53:27 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:53:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:53:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrRaQ012346;
	Wed, 21 Apr 2021 15:53:27 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Suman Anna <s-anna@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Nishanth Menon
	<nm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/4] gdbc6x: bump SRCREV for kernel 5.10 build fix
Date: Wed, 21 Apr 2021 15:53:24 -0500
Message-ID: <20210421205326.22047-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421205326.22047-1-praneeth@ti.com>
References: <20210421205326.22047-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

bump SRCREV to latest to pick build fix for 5.10 kernel.
this update picks
commit dd0c82fb5763 ("Merge pull request #1 in DBG/gdbc6x from for-5.10 to master")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-devtools/gdbc6x/gdbc6x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
index f0d702a0..eeb18fb1 100644
--- a/recipes-devtools/gdbc6x/gdbc6x.inc
+++ b/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -1,8 +1,8 @@
 # This corresponds to version 1.1.0
-SRCREV = "d1d32c32fa9e40b48fabf5893487ccbd5790499c"
+SRCREV = "dd0c82fb5763a6b32dc6d68e561efb66ab8283d7"
 
 PV = "1.1.0"
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
 
-- 
2.17.1

