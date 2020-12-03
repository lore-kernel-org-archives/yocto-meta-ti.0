Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.5050.1607034144447483293
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 14:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x7Baw664;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-robey@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B3MMNvN004242
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Dec 2020 16:22:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607034143;
	bh=h+JHXq71my8nPtnisqMha0lUW/e5L8iHC/VjtBKVkII=;
	h=From:To:CC:Subject:Date;
	b=x7Baw664Ca/4yonNpY5tksEvWkdfl9/8UAS+4dIfu8dnGtdlubKqsL3t+ZwHU8iVv
	 yiWvk1GQL3NLMOK5yl0Pbs2huYD3+gQnwzcb7bJ58w8x9C0ZgcV2VCUSEVu2oIghoo
	 bDnzUQf5PVG9CFHuFzm1a8HhwDYwnVWeFagpuZTM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B3MMNQS031480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Dec 2020 16:22:23 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 16:22:23 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 16:22:23 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B3MMN56120546;
	Thu, 3 Dec 2020 16:22:23 -0600
Received: from localhost ([10.250.41.121])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0B3MMN1a093742;
	Thu, 3 Dec 2020 16:22:23 -0600
From: "Caleb Robey" <c-robey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>, Lucas Weaver <l-weaver@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>, a0232989 <a0232989@ti.com>,
        Caleb Robey
	<c-robey@ti.com>
Subject: [PATCH] [meta-ti][dunfell/master][PATCH] setup-scripts - removing confusion for users when script succeeds
Date: Thu, 3 Dec 2020 16:22:11 -0600
Message-ID: <20201203222211.26326-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: a0232989 <a0232989@ti.com>

Script does not include all correct versions in success message

Signed-off-by: Caleb Robey <c-robey@ti.com>
---
 setup-host-check.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-host-check.sh b/setup-host-check.sh
index 45b4c71..a9db056 100644
--- a/setup-host-check.sh
+++ b/setup-host-check.sh
@@ -43,6 +43,6 @@ if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$ho
     echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
     exit 1
 fi
-echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
+echo "Ubuntu 12.04 LTS, Ubuntu 14.04, LTS Ubuntu 16.04 LTS, or Ubuntu 18.04 LTS is being used, continuing.."
 echo "--------------------------------------------------------------------------------"
 echo
-- 
2.17.1

