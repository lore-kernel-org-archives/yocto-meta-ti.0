Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.4390.1589633989900544644
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 16 May 2020 05:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=y86WFuxx;
 spf=none, err=permanent DNS error (domain: bangvideoapps02, ip: 198.47.19.142, mailfrom: a0132233@bangvideoapps02)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04GCxmeZ088504;
	Sat, 16 May 2020 07:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589633988;
	bh=DP2sI1P54JDaItiEVr9sPuaGvlckIOCepUQuAb3awMI=;
	h=From:To:CC:Subject:Date;
	b=y86WFuxx2vEpm0pRUgyr3BB1ojUrpUS/+oCIjdU9wM8J9VdOhsUwNseiNsGjY/9x5
	 gQPYJPHefM8guz+RC3qvxiYiV6T6Fg2oi8kQMKNsyiC6wwjujO+V4x/Z4SYyy+b24Q
	 tFIc5P2Lhxwsccb/jJ3uyO59z3tuGZe4X4ZZGeAQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04GCxmfA060144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 16 May 2020 07:59:48 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 16
 May 2020 07:59:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 16 May 2020 07:59:48 -0500
Received: from bangvideoapps02 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04GCxll0038957;
	Sat, 16 May 2020 07:59:48 -0500
Received: from a0132233 by bangvideoapps02 with local (Exim 4.82)
	(envelope-from <a0132233@bangvideoapps02>)
	id 1jZwPr-000H2U-54; Sat, 16 May 2020 18:29:47 +0530
From: "Prasad Jondhale" <prasad.jondhale@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        <prasad.jondhale@ti.com>
Subject: [[meta-ti][Dunfell/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Date: Sat, 16 May 2020 18:29:41 +0530
Message-ID: <20200516125941.64672-1-prasad.jondhale@ti.com>
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

