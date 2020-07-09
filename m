Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.908.1594316660667250005
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 10:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iXDftPE7;
 spf=none, err=permanent DNS error (domain: ubnuser-poweredge-r630, ip: 198.47.19.142, mailfrom: a0132233@ubnuser-poweredge-r630)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069HiJnX041583;
	Thu, 9 Jul 2020 12:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594316659;
	bh=kPmc/oFS6+9roQ23cXbkPcXL4mZSc7TQ6S3EBiK61Yo=;
	h=From:To:CC:Subject:Date;
	b=iXDftPE7/wRMyY0mzNvMCxQ4LzL5jkVIftpdvIBL+xlzlfJRP9SwaDeigS56PmdWz
	 m5g28VdZTwCkxKVlXFG0QChyjvFCavOtyBx9QUN3hmDMT9YIDlk0gAO0EDmPtw5URp
	 OY6v8hQW+VAiB3ui8BYAVDIxbkR23d11tzALvEZg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069HiJKO096917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2020 12:44:19 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 12:44:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 12:44:19 -0500
Received: from bangvideoapps02 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069HiDqd012124;
	Thu, 9 Jul 2020 12:44:13 -0500
Received: from a0132233 by bangvideoapps02 with local (Exim 4.90_1)
	(envelope-from <a0132233@ubnuser-poweredge-r630>)
	id 1jtaai-0002M0-T2; Thu, 09 Jul 2020 23:14:12 +0530
From: "Prasad Jondhale" <prasad.jondhale@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <meta-ti@lists.yoctoproject.org>, <eth_fw_auto@list.ti.com>,
        "Prasad
 Jondhale" <prasad.jondhale@ti.com>
Subject: [dunfell/master] cpsw9g-eth-fw: Update SRCREV to latest
Date: Thu, 9 Jul 2020 23:14:10 +0530
Message-ID: <20200709174410.8926-1-prasad.jondhale@ti.com>
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

