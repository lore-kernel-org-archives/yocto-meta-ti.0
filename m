Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2841.1588779323918966609
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 08:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=i6FdTwcK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nikhil.nd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046FZMji102911;
	Wed, 6 May 2020 10:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588779322;
	bh=FQWRs7BWARBbCVmyuG2pej1OFExlavDi2j0FcJ9rE5Y=;
	h=From:To:CC:Subject:Date;
	b=i6FdTwcKbyiBgpg8FJ+HSlo15FN6ePN5IE/u39v6ZDXHmKFtB3gludsXptPoFFEEO
	 SzFiHR9SMqe9rG615mU12JxCVwWtIDkT+8M+NDwdmkZot/vZr8tkhSqGLjvFmqjgMd
	 BdufFIMJ4JwmwD1sEsGnUdJx6nOPa8p1hhNaQP8w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 046FZM4x086449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 May 2020 10:35:22 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 10:35:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 10:35:21 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046FZJHx055565;
	Wed, 6 May 2020 10:35:20 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Date: Wed, 6 May 2020 21:05:13 +0530
Message-ID: <20200506153513.4216-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index cbd71f2d..05b2edca 100644
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -11,7 +11,7 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "4da71504488450f34d65459c1de949da1f984471"
+SRCREV = "2f55ffedf0787f9c4c935473967fb88737d22778"
 
 SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
2.17.1

