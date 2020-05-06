Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3201.1588795473946073779
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 13:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Lk1KBDQ5;
 spf=none, err=permanent DNS error (domain: ula0866189, ip: 198.47.23.249, mailfrom: a0866189local@ula0866189)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046K4XRD008706
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 15:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588795473;
	bh=99GxfkjJfV0Nt/2R5D43BEyfeoqQ2zAXtonVy6p50T4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Lk1KBDQ5lkLc94uxVu5gCr07GtLnlvAcl6SLctI8LbvZWdxrKvduYpEnmxhc2i6m2
	 PimgxlocxcBkxfAVALo72bEihZwweM/0YZ9h2KpYTHvXoSE5sxU1TsWt3ReVO/qiDT
	 tWh00HuQ2RsUbMIoukaPsSpJCtfnzqNFZDwwd3qs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046K4XK9108249
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 May 2020 15:04:33 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 15:04:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 15:04:32 -0500
Received: from ula0866189 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046K4W3i115765;
	Wed, 6 May 2020 15:04:32 -0500
Received: from a0866189local by ula0866189 with local (Exim 4.90_1)
	(envelope-from <a0866189local@ula0866189>)
	id 1jWQHQ-0005rL-KL; Wed, 06 May 2020 15:04:32 -0500
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-anna@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][master][PATCH 3/3] common-csl-ip: bump SRCREV to align with PDK
Date: Wed, 6 May 2020 15:04:15 -0500
Message-ID: <20200506200415.22380-3-angelabaker@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506200415.22380-1-angelabaker@ti.com>
References: <20200506200415.22380-1-angelabaker@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 16c45e7a..a8921ae9 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -14,7 +14,7 @@ CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
 # Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.17B"
-CSL_SRCREV = "a5a9200fe11575a4eff965d87cb968c5f3377e9f"
+CSL_SRCREV = "027d26031709ad6a0e9f84625d11a3419e486467"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
2.17.1

