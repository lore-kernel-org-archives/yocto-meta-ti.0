Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.286.1617209500667507140
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HAaTQoeI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYuu091139;
	Wed, 31 Mar 2021 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209494;
	bh=HjhXhKxCLKCJVoCA6BF1BTsYlWD+X28Z9pp1Kpi5T00=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HAaTQoeIbXq+hUFrwtWM2kHwIcOxlj7ha+exvM4UTmTzxwxPKX5BRKSo15G/uYfBo
	 /QFWbtcKN1vNEkRlslTp2pbszJRSy5UWdFHM6DpCGhDvgkW21rFx7kUwuta1m6U7eU
	 yrMmPeq9SGNBov3rABZzrY9uUoRrUso19r8VmujU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpYl0091687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYWo003241;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 3/7] conf/machine: j7: Document boot images as legacy mode
Date: Wed, 31 Mar 2021 11:51:29 -0500
Message-ID: <20210331165133.3746-4-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331165133.3746-1-nm@ti.com>
References: <20210331165133.3746-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We use the default IMAGE_BOOT_FILES configuration which matches up with
legacy boot configuration. Document the same to allow folks to
understand by just looking at the SoC include file.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 conf/machine/include/j7.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
index c187f299f470..d3eda1a828aa 100644
--- a/conf/machine/include/j7.inc
+++ b/conf/machine/include/j7.inc
@@ -4,6 +4,8 @@ SOC_FAMILY_append = ":j7"
 OPTEEMACHINE = "k3-j721e"
 OPTEEOUTPUTMACHINE = "k3"
 
+# Use default IMAGE_BOOT_FILES_LEGACY files
+
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "j721e j7200"
 TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
-- 
2.31.0

