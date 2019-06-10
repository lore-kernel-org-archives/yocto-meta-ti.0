Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CF9CE00D6C; Mon, 10 Jun 2019 16:22:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06154E00D54
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 16:22:26 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANMQ9E068668
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 18:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560208946;
	bh=/KDFuiW1mnKPIFfdeA56hu/xoD8ZNg9zXKIizHfRVDM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RZBqBy3SEbEwET0vfrHBMJERntTaRfH9btSciwm2o4FoSeTVd/Ql8qjyQ6fzljxEE
	6wRJle6qsf9nqdMJVUakPtpVDRaM6CKzF8z4FehI7DQls11Jp+d7vdcwEYb8F+XyqS
	+5phqowhnWnr+dNxt14W8iFxQcR1GQdfINcA1lwU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANMQiB111393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 18:22:26 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:22:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:22:26 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANMPBt015621;
	Mon, 10 Jun 2019 18:22:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 10 Jun 2019 23:10:04 +0000
Message-ID: <20190610231006.29913-3-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610231006.29913-1-denys@ti.com>
References: <20190610231006.29913-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/4] arm-trusted-firmware: update to the latest with support for J7
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
X-List-Received-Date: Mon, 10 Jun 2019 23:22:28 -0000
Content-Type: text/plain

License checksum changed due to minor formatting.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
index 25f82f12..fc24e53f 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
@@ -7,7 +7,7 @@ Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
 HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://license.rst;md5=c709b197e22b81ede21109dbffd5f363"
+LIC_FILES_CHKSUM = "file://license.rst;md5=90153916317c204fade8b8df15739cde"
 
 inherit deploy
 
@@ -22,7 +22,7 @@ PV_append = "+git${SRCPV}"
 BRANCH = "ti-atf"
 SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
 
-SRCREV ?= "ee0d515f0577d96ca32278e7cccb6fd768d1b83d"
+SRCREV ?= "b81d5871adaa7a35dc33f7450b9dd19183ef9590"
 
 # Make ATF "aware" of OPTEE, no build dependency
 PACKAGECONFIG[optee] = "SPD=opteed"
-- 
2.17.1


