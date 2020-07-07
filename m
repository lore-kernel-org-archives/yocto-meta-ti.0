Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21205.1594142246570623758
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 10:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=W0h/xoj7;
 spf=none, err=permanent DNS error (domain: ubnuser-poweredge-r630, ip: 198.47.23.249, mailfrom: a0132233@ubnuser-poweredge-r630)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067HHPwv068582;
	Tue, 7 Jul 2020 12:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594142245;
	bh=kPmc/oFS6+9roQ23cXbkPcXL4mZSc7TQ6S3EBiK61Yo=;
	h=From:To:CC:Subject:Date;
	b=W0h/xoj794BafyUV13suLNFbpaX9NpdU4BsG+1XBW8+yGgkNqSODKaZzCTBdoPM/C
	 Tq6JV1aC13lFZW/1kTFdvN/CAd+rY+0krkpTeA2suUni995yzvCOjQwp93irSUqMwi
	 jmvb+G5D4KcDg6c4D9b+uuTLsLqy5dyp4i3/39RE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067HHP2O095255;
	Tue, 7 Jul 2020 12:17:25 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 12:17:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 12:17:25 -0500
Received: from bangvideoapps02 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067HHOGH046754;
	Tue, 7 Jul 2020 12:17:25 -0500
Received: from a0132233 by bangvideoapps02 with local (Exim 4.90_1)
	(envelope-from <a0132233@ubnuser-poweredge-r630>)
	id 1jsrDf-0003os-TH; Tue, 07 Jul 2020 22:47:23 +0530
From: "Prasad Jondhale" <prasad.jondhale@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        <eth_fw_auto@list.ti.com>, Prasad Jondhale <prasad.jondhale@ti.com>
Subject: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Date: Tue, 7 Jul 2020 22:47:21 +0530
Message-ID: <20200707171721.10205-1-prasad.jondhale@ti.com>
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

