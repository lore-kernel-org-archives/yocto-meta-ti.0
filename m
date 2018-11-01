Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C972DE00C46; Thu,  1 Nov 2018 14:03:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA301E00C15
	for <meta-ti@yoctoproject.org>; Thu,  1 Nov 2018 14:03:32 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA1L3WsI102635
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:03:32 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA1L3WLH045914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:03:32 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 1 Nov 2018 16:03:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 1 Nov 2018 16:03:32 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA1L3TTV009109
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:03:32 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Nov 2018 17:03:28 -0400
Message-ID: <1541106208-26108-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1541106208-26108-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1541106208-26108-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-cgt-arm-native: Update to 16.9.9
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
X-List-Received-Date: Thu, 01 Nov 2018 21:03:35 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-cgt-arm-native_16.9.2.bb => ti-cgt-arm-native_16.9.9.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.2.bb => ti-cgt-arm-native_16.9.9.bb} (47%)

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb b/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
similarity index 47%
rename from recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
rename to recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
index 8ff29ca..b804a1c 100644
--- a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
+++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
@@ -2,5 +2,5 @@ include ti-cgt-arm.inc
 
 LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
 
-BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
-BINFILE_SHA256 = "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
+BINFILE_MD5 = "ccae16e9c6fc3749e7da49d3a2b6fb44"
+BINFILE_SHA256 = "13b66686cc012af6f2e7f021099b5bc735a461d8eb254a2b0edef0fd8b26e81e"
-- 
1.9.1


