Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.5915.1580769796484994639
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 14:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TU4wP/LG;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53E1DE01612; Mon,  3 Feb 2020 14:43:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19F5CE016A4
	for <meta-ti@yoctoproject.org>; Mon,  3 Feb 2020 14:43:13 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 013MhCYF035224
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580769792;
	bh=4WYag8Lv+Vv7sedUxL2nw0uScqkq2I7YUVAuRHXtHCw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TU4wP/LGn5cmj9OFkQUcKS6V8HAwwMXaedVsi5zPllk8QsEnXRQcUZNT8tSIW3FNN
	 KtdmpDjPReWruReCDkWPF86cgwyjHjvKrqZ6aEWKO17vwVZ9XJMYxuSgXs9Y5TczCK
	 TrGG8ajbKuwlI/zj9XuqTbf09N3rXdYiMVxQIzvk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 013MhCC5122474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:12 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 3 Feb
 2020 16:43:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 3 Feb 2020 16:43:12 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 013MhB1G023888
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:12 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
Date: Mon, 3 Feb 2020 17:43:09 -0500
Message-ID: <20200203224309.19843-3-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

The license as such has not changed, but moved to a License file which
is not expected to change frequently
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 6a3d79c3..1f65149c 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -7,12 +7,12 @@ TI_PDK_COMP = "ti.drv.sciclient"
 PE = "1"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=c05dd6e04691b3339c447a7a21691705"
 
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
 
-- 
2.17.1

