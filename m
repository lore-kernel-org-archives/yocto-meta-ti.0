Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA739C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 23:54:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.62188.1674690853034423358
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 15:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SSmmjGVk;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: bb@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PNs86I117616;
	Wed, 25 Jan 2023 17:54:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674690848;
	bh=t2oea+ZNZJVQKHG4kdBzmRJg3LJJYMqkXzHR/q9r5GQ=;
	h=From:To:CC:Subject:Date;
	b=SSmmjGVkvtkkbvavZqUckcEh8OPKRHxwk+v2cqQR7DYUKCPlShzgf6ulFU+H5u6sj
	 oFbJPM6CGIbgYWmBw6GFGU3l8h2JSr4H0MBO+Eb+ia8ar3kww0+fSwVTquSDYNdq7a
	 mWlrCfp7epQEJwgfF1Hlf4/SSm7xnJ4Lyuzb4Qhg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PNs8SR011466
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 17:54:08 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 17:54:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 17:54:08 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PNs8Yp095408;
	Wed, 25 Jan 2023 17:54:08 -0600
From: Bryan Brattlof <bb@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
Subject: [dunfell PATCH] k3conf update SRCREV to add am62ax support
Date: Wed, 25 Jan 2023 17:54:05 -0600
Message-ID: <20230125235405.7558-1-bb@ti.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=bb@ti.com; h=from:subject; bh=xNTzODpfRAUiBhABgKvxCxbiYWSnSO7tsBtXrL5MC7w=; b=owNCWmg5MUFZJlNZnjb3iQAAZv/////fq7d17h6f9s/T/58j7mWn80+tO0rTbb/97vn0t/ewARsW DtQD1AAGmmgANBoyMjQyAABo0ADJo0GE0GEYhoAaAZAB6hoeoY1DPUeqHI0aaGjQ0DQANABoBkNAGQ 3qmTQaNANPSHqGnqB6m1BoGh6JoNDIyPUGQ2poAaBDI9EDQGmmTQGmgDTTQ00aGgxNNHqMgAyNDQxN DE00AMmTJowRoaHqAMQGmEGAATXGKBE2+ehEbAuTXjCgNGJBYlxzuSTDhcU5g+tUI7Q2qZc4hhgFzU FOPZvYf+dFVEFNHznnA5YOZ9eq+8q/LhmwBby0eSEKMzmHdsRB3QrAMB49XatxyB23tGuLBqPWmjfx 9dvESIK0RBypG5QsHliXXJG0jPDdISkcjBcNAlheOIUZoirRVjLEor+Rpu1Mx1eCBairGVSNLbrFfO bZpfHgXQrX3VcquEjCWZmjM9DwkD35uk1MoglJduH1/IVxZA8Ivt2dCZi51k6/Hb9l1gP8NmG+oxfa b2oHyfT2Cm7h57sT5ct6ORzfnFP+gQSu/4eul3ToX7Ywh9y9kWipnwJJ0CCcuCRH5kCDtWyARSRDT4 C7jTH5bUbCz4z94hC3aTBrLgvBQAJzAcYpyOxgvGrtpYjbgRFLOOFaJ/mWCDF/xdyRThQkJ4294kA=
X-Developer-Key: i=bb@ti.com; a=openpgp; fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 23:54:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15659

update the SHA of k3conf to pickup am62ax support

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
index 10e2631e05c7f..c6d3773eed26f 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
+SRCREV = "982f5c2f02f732b5829861218812904cd776773d"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 

base-commit: 6918dfd0f477873b0630a34606bf5dddd6d87173
-- 
2.39.0


