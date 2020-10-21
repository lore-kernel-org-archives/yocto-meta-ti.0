Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.13878.1603295347688173716
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 08:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GRpuHqt1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LFn6pB128766
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2020 10:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603295346;
	bh=lnYYLYndKl/+f/LFd7HYt2CrlkCYz4xx5ChYhKNM4r0=;
	h=From:To:CC:Subject:Date;
	b=GRpuHqt1alzBasX7VJDP2DHv7F/mCURq8yI7fT4pFnpQopOiLGurEG2PGugpa+hMj
	 7HjXyT7lCqZs2CZWhmXiQPMKDzx/8t8yazzWjNOEtmMb9AtcNddIE9YuFyOBqmtpid
	 N6qdhZyLrpMoqK/Pz18/qYpu2VylGvIx9drnifOM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LFn6KH103784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2020 10:49:06 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 10:49:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 10:49:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LFn6oF076800;
	Wed, 21 Oct 2020 10:49:06 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] distroless/poky-master: Update openembedded branch to master from dunfell
Date: Wed, 21 Oct 2020 10:49:00 -0500
Message-ID: <20201021154900.24080-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 configs/poky-master-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index 1298a050d48f..be724b100a3c 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
 poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-python:meta-oe
+meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-python:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
2.28.0.585.ge1cfff676549

