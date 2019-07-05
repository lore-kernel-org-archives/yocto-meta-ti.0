Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81A29E0098A; Fri,  5 Jul 2019 01:57:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF599E00B1A
	for <meta-ti@yoctoproject.org>; Fri,  5 Jul 2019 01:57:19 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x658vJeU053476
	for <meta-ti@yoctoproject.org>; Fri, 5 Jul 2019 03:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562317039;
	bh=5wqZS7HuNgjx439r0x74qE9gII2OEHAI27PPKI/KksE=;
	h=From:To:CC:Subject:Date;
	b=DaZLneVHvTGbmm8q/2CrT815MzGRcCXjU99kh3+fUpChLRb2EO1Gr89aWfQOUB/3I
	wUL0sQVxhyn6Q1U39pOJPDSYmF9Cl2jE0PTCjmta6+AhJvWFWBCpUl1+kDJzr0I1mu
	ymGMwJ97uVLuk4/1OXUbIQmsoWqYiawg+GdJ29ow=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x658vJ6A031571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 5 Jul 2019 03:57:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 5 Jul 2019 03:57:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 5 Jul 2019 03:57:19 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x658vHTg060911; 
	Fri, 5 Jul 2019 03:57:17 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>
Date: Fri, 5 Jul 2019 14:27:15 +0530
Message-ID: <1562317035-13652-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: karthik.ramanan@ti.com
Subject: [thud PATCH v1] packagegroup-arago-tisdk-addons: add jailhouse for j7-evm
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2019 08:57:28 -0000
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index be3ada6..21aa724 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -76,7 +76,7 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
-UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw"
+UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
1.9.1


