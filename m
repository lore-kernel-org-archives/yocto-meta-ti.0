Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DC7DE00C70; Tue, 27 Nov 2018 14:09:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A164E008C6
	for <meta-ti@yoctoproject.org>; Tue, 27 Nov 2018 14:09:10 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wARM9AVU039975
	for <meta-ti@yoctoproject.org>; Tue, 27 Nov 2018 16:09:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543356550;
	bh=pVZ3Y7GPPhlijhGv90hxRzr603kWFIRvf5a63hGia9c=;
	h=From:To:CC:Subject:Date;
	b=fd+LFQ43Bk9jQZWVBfdFprrgzDAHhIgPeTsTFQMJvFzNLGAjPgxPpxT2GnWhcv7Yx
	mr/yl/vBlaZKQV8co469wuIpmDWD3q5nugKXHNh/J8XR6eY/2SoVbvt3yApWo0adAR
	CdSQmXkAa8w0ht4C/bKo8j7lWwb1JuLNabMnDJHw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wARM9Aoc013974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 27 Nov 2018 16:09:10 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 27 Nov 2018 16:09:09 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 27 Nov 2018 16:09:09 -0600
Received: from legion.dal.desgin.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wARM99DK021472;
	Tue, 27 Nov 2018 16:09:09 -0600
Received: from localhost (uda0226750.dhcp.ti.com [128.247.59.152] (may be
	forged))
	by legion.dal.desgin.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	wARM99U00871; Tue, 27 Nov 2018 16:09:09 -0600 (CST)
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 27 Nov 2018 16:08:57 -0600
Message-ID: <1543356537-25218-1-git-send-email-nsaulnier@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] pru-icss_git.bb: bug fixes for SDK 5.2
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
X-List-Received-Date: Tue, 27 Nov 2018 22:09:11 -0000
Content-Type: text/plain

PRU Software Support Package example PRU_ADC_onChip does not work out of the box
in SDK 5.1. This update fixes the PRU_ADC_onChip example.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 51519b31f079..94522f65f796 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "f43599464e8e879a127241b68fbeb0abca4cbd9f"
+SRCREV = "99b1bfd8ca8780fd2306c2c939f3fd477b2e5218"
 
-PV = "5.3.0"
-PR = "r2"
+PV = "5.4.0"
+PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.9.1


