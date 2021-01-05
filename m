Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1340.1609872456056020653
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 10:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nqlD3/K9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 105IlZU4007982
	for <meta-ti@lists.yoctoproject.org>; Tue, 5 Jan 2021 12:47:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609872455;
	bh=5+RCcZoAwFITD/ylcJ+WLQYKzAziqGydDf97WnywYeI=;
	h=From:To:CC:Subject:Date;
	b=nqlD3/K9U7AidUuaPCudhPVGg/BUqwJ4uJoFZwYtawjxCvL8dka/heCtU+0EnKHQs
	 qq6ouqUHv/mYtOyO/jGR+QYvMm8pe8JwjpAqSZZqgMUV3atMy19sUMl6vGDY5ISerE
	 ETifuMc8kYFfrJhHosIs4kWsPWZDe85CaqH3c1v4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 105IlZBx084395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 5 Jan 2021 12:47:35 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 5 Jan
 2021 12:47:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 5 Jan 2021 12:47:34 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 105IlW4e074561;
	Tue, 5 Jan 2021 12:47:33 -0600
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH] k3conf: Update to latest commit
Date: Wed, 6 Jan 2021 00:17:32 +0530
Message-ID: <20210105184732.20201-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update k3conf to latest sha, bumping up version to 0.2

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 recipes-devtools/k3conf/k3conf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
index 5becbf97..0f2705b8 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -3,12 +3,12 @@ SUMMARY = "Diagnostic tool for TI K3 processors"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://common/k3conf.c;beginline=1;endline=34;md5=7154c0ffcd418064ffa528e34e70ca9d"
 
-PV = "0.1+git${SRCPV}"
+PV = "0.2+git${SRCPV}"
 
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "7ee4c46379bb71dfa0677089841cb87eba9fbfea"
+SRCREV = "79f007cd462384ce22e750e9002b714878f56892"
 
 SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
 
-- 
2.30.0

