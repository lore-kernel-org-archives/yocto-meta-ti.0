Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 188E8E00D11; Mon,  4 Mar 2019 17:45:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A42DCE00D14
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 17:45:37 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x251jb4F075397
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:45:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551750337;
	bh=HH8klBNjB1nW3CuLkjicUOffsi/3T2kNwfXBaHSv/Fw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fNM0FU1lAVdyOlm4KwI7JM62/ADF2QZO0zJuUbCWbcYviUSuYYMeSJb4bOC+PfTSj
	EVACXs5oRQO5YZABofc57U106AVi51DzZ5r2J61uzsGxS+N9/luj6jWetTu25Can8U
	KLiD71rliUqYDSAontfyWrPjY5Hb24HDgHXRi2q8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x251jbrn103361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:45:37 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 19:45:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 19:45:36 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x251jam7003616
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:45:36 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 4 Mar 2019 20:45:35 -0500
Message-ID: <1551750335-10331-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551750335-10331-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1551750335-10331-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-cgt-arm: Update to version 18.1.5 LTS
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
X-List-Received-Date: Tue, 05 Mar 2019 01:45:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-cgt-arm-native_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb} (9%)

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb b/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
similarity index 9%
rename from recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
rename to recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
index f642a5b..0ed1939 100644
--- a/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
+++ b/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
@@ -1,6 +1,6 @@
 include ti-cgt-arm.inc
 
-LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=1c0dc8c15d8c4768e399b9ce7651c25e"
+LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3faed35326711d6596f0377279323df1"
 
-BINFILE_MD5 = "ccae16e9c6fc3749e7da49d3a2b6fb44"
-BINFILE_SHA256 = "13b66686cc012af6f2e7f021099b5bc735a461d8eb254a2b0edef0fd8b26e81e"
+BINFILE_MD5 = "d0559bccc323002a9256dd68e1d223ab"
+BINFILE_SHA256 = "8462eb7ce837274582721ed75c73928865d7678aca23b30fde962cdd36c21414"
-- 
1.9.1


