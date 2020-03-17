Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.2915.1584442436912367512
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 03:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B3SATlAg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nikhil.nd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02HAru9M116842
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2020 05:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584442436;
	bh=BfQICXaev5gvc/JKSfMQ+lvR89SNM5uL8F1xhNsVmmE=;
	h=From:To:CC:Subject:Date;
	b=B3SATlAgOJMDzi2ie3WTEwcxT3cW0sJ/7kTaQdPHxQuS7HkjxAT8QvWBjyDNm2Sup
	 wE9lrlNqB7udXUkfoJ7ehgSAHq6LqHLIAhDDeRj32aOw4Nq6ncMz0sCsrnGrVAx8SX
	 hO6rA2RqgaqDvgyNlhA3mEBg9byry9VL/egEo0fc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HAruMW098049
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2020 05:53:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 05:53:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 05:53:55 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HArrH0086784;
	Tue, 17 Mar 2020 05:53:54 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus PATCH v1] recipes-kernel: jailhouse: Update SRCREV to latest
Date: Tue, 17 Mar 2020 16:23:41 +0530
Message-ID: <20200317105341.22557-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 1273c57d..14f34e9b 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 PV = "0.12+git${SRCPV}"
-SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
+SRCREV = "2c6516ce3d0e0c4e9372e4439562dd660877cb79"
 BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
-- 
2.17.1

