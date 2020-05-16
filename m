Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4223.1589633203635370528
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 16 May 2020 05:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g2e9x//k;
 spf=none, err=permanent DNS error (domain: bangvideoapps02, ip: 198.47.23.249, mailfrom: a0132233@bangvideoapps02)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04GCkg9L015974;
	Sat, 16 May 2020 07:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589633202;
	bh=DP2sI1P54JDaItiEVr9sPuaGvlckIOCepUQuAb3awMI=;
	h=From:To:CC:Subject:Date;
	b=g2e9x//kibiMEf4zp5/bO3xohF6Y2ffiSA5Z0O21aHhBPYXdd7sMrkZ4VxqdQ8UMX
	 VDmlPzHkQtz+x+VgD5vRTDEYS7XQkVKPX4ONwzpctbuJE+JUC7juV2pxYR8KHOGVvY
	 F8jzKxPwJPKHpkmFO2utqZ5TrCiTv09uS9aaJeEs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04GCkggA088093;
	Sat, 16 May 2020 07:46:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 16
 May 2020 07:46:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 16 May 2020 07:46:42 -0500
Received: from bangvideoapps02 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04GCkfrN037197;
	Sat, 16 May 2020 07:46:42 -0500
Received: from a0132233 by bangvideoapps02 with local (Exim 4.82)
	(envelope-from <a0132233@bangvideoapps02>)
	id 1jZwDA-0003MG-UY; Sat, 16 May 2020 18:16:40 +0530
From: prasad.jondhale@ti.com
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        <prasad.jondhale@ti.com>
Subject: [[meta-ti][zeus/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Date: Sat, 16 May 2020 18:15:38 +0530
Message-ID: <20200516124538.7850-1-prasad.jondhale@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Prasad Jondhale <prasad.jondhale@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 => 100755 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
old mode 100644
new mode 100755
index 05b2edca..37ba52d0
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -11,7 +11,7 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "2f55ffedf0787f9c4c935473967fb88737d22778"
+SRCREV = "afe62ada2e91e2665f597ca16eb3888b752016de"
 
 SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
2.26.2

