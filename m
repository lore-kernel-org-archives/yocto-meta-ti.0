Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.7867.1616730072995082020
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 20:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=US/3axzK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12Q3fBMc009075;
	Thu, 25 Mar 2021 22:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616730071;
	bh=s3Cv2t3si6eVUHwtejdxLU4j8thrMP11NPsq2y5+PK0=;
	h=From:To:CC:Subject:Date;
	b=US/3axzKRxpzEfHeAOAStw4cXhDt7RS/rynkqGgIF8KdgvfZ+X3yyIQSVTVHcbFwv
	 Y/jnf+v3yhWoM//NrRQ9WcdvmJcwEuHYq+zzl1Bzj5OCChtvXswFJB2uUt2iHlFQcS
	 mX5SI8k2V9/swTUT8NwaFPw9EB7S69jRM+TmnWIk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12Q3fB35026773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Mar 2021 22:41:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 25
 Mar 2021 22:41:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 25 Mar 2021 22:41:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12Q3fArm072879;
	Thu, 25 Mar 2021 22:41:11 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Lucas Weaver <l-weaver@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>
Subject: [dunfell/master PATCH] conf/machine: fix OPTEEMACHINE name for J721e
Date: Thu, 25 Mar 2021 22:41:10 -0500
Message-ID: <20210326034110.15713-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

OPTEEMACHINE name as defined in the optee_os project [1] for
j721e is k3-j721e.

This patch fixes the name to correct target.

[1]: https://github.com/OP-TEE/optee_os/commit/87613cf9520db2e65bc8367d3e13c4217c13bdad

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/j7.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
index 7d326f4a..c187f299 100644
--- a/conf/machine/include/j7.inc
+++ b/conf/machine/include/j7.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY_append = ":j7"
 
-OPTEEMACHINE = "k3-j7"
+OPTEEMACHINE = "k3-j721e"
 OPTEEOUTPUTMACHINE = "k3"
 
 # Set the list of device targets for ti-pdk class recipes
-- 
2.17.1

