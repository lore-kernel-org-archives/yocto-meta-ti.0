Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.21032.1594141711983254164
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 10:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xHu/zbtM;
 spf=none, err=permanent DNS error (domain: ubnuser-poweredge-r630, ip: 198.47.19.141, mailfrom: a0132233@ubnuser-poweredge-r630)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067H8VRA109019;
	Tue, 7 Jul 2020 12:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594141711;
	bh=kPmc/oFS6+9roQ23cXbkPcXL4mZSc7TQ6S3EBiK61Yo=;
	h=From:To:CC:Subject:Date;
	b=xHu/zbtMLsXr82LWRXuwDg5SJ3tjRU1+ixHr5zs6P2kyeyAdvc6F06EsLkQx0bxl4
	 O9hq7y4KVnCSIhzEB6LCHCqxX6xudj+S/5eFFRf0yfhQFXRoNbfgpy7JDY6/v2cs5i
	 GnXzxJIix4/1ivn412HdFvK4FwCSzP7GQBQLhHkY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067H8Vjm082474;
	Tue, 7 Jul 2020 12:08:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 12:08:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 12:08:31 -0500
Received: from bangvideoapps02 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067H8UGR020720;
	Tue, 7 Jul 2020 12:08:30 -0500
Received: from a0132233 by bangvideoapps02 with local (Exim 4.90_1)
	(envelope-from <a0132233@ubnuser-poweredge-r630>)
	id 1jsr53-00023R-IR; Tue, 07 Jul 2020 22:38:29 +0530
From: "Prasad Jondhale" <prasad.jondhale@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        <eth_fw_auto@list.ti.com>, Prasad Jondhale <prasad.jondhale@ti.com>
Subject: [[meta-ti][Dunfell][PATCH] cpsw9g-eth-fw: Update to latest] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Date: Tue, 7 Jul 2020 22:38:22 +0530
Message-ID: <20200707170822.5975-1-prasad.jondhale@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Prasad Jondhale <prasad.jondhale@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 37ba52d0..8cb62b2a 100755
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -11,7 +11,7 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "afe62ada2e91e2665f597ca16eb3888b752016de"
+SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
 
 SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
2.17.1

