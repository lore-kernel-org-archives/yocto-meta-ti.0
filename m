Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79EBAE00E36; Mon,  5 Mar 2018 10:49:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCBB8E00DCA
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2018 10:49:07 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w25In7NI012067
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 12:49:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520275747;
	bh=G8FygURiT8Fw5tw24TKh3j2o0e6jH9Tm++CyigGj+pA=;
	h=From:To:CC:Subject:Date;
	b=mw1luBnTLNQ1uX5wwr6LcsfZli9ISWYb9VkKNDMHirU/pFLTKQ8l4bJwyMWWCmw3t
	0/FyWf4Fw0mWXjcSXwypwD7/7dG8gPci2D0agzqg5vqO+RbUn9ePq3MR6ALqu/+Hsm
	ozfOf37jEr9guLDV/U7n7jLPk324KrOM2sAM1gpo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25In7sU008745
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 12:49:07 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 12:49:07 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 12:49:07 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25In6AP002124;
	Mon, 5 Mar 2018 12:49:07 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Mar 2018 13:49:05 -0500
Message-ID: <1520275745-9051-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] cmem: Update to new version 4.15.00.01
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
X-List-Received-Date: Mon, 05 Mar 2018 18:49:10 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 436368e..695432a 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
 
-BRANCH = "lu-next"
-# This corresponds to version 4.15.00.00_eng
-SRCREV = "86462821d99cf0e5c4ad33158e08feeb01b26484"
+BRANCH = "master"
+# This corresponds to version 4.15.00.01
+SRCREV = "000038a65af9428b559de5e00e4a7588892ad7b0"
 
-PV = "4.15.00.00+git${SRCPV}"
+PV = "4.15.00.01+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


