Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 613FBE00C09; Thu,  1 Nov 2018 14:04:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D492E00A10
	for <meta-ti@yoctoproject.org>; Thu,  1 Nov 2018 14:04:28 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA1L4SHE104620
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:04:28 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA1L4SjJ046675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:04:28 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 1 Nov 2018 16:04:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 1 Nov 2018 16:04:28 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA1L4RIj017075
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:04:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Nov 2018 17:04:25 -0400
Message-ID: <1541106265-26549-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1541106265-26549-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1541106265-26549-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-xdc-tools: Update to 3.50.08.24
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
X-List-Received-Date: Thu, 01 Nov 2018 21:04:29 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-xdctools_3.50.07.20.bb => ti-xdctools_3.50.08.24.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-xdctools_3.50.07.20.bb => ti-xdctools_3.50.08.24.bb} (51%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb b/recipes-ti/devtools/ti-xdctools_3.50.08.24.bb
similarity index 51%
rename from recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
rename to recipes-ti/devtools/ti-xdctools_3.50.08.24.bb
index d45f373..1e776e7 100644
--- a/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.50.08.24.bb
@@ -1,9 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_50_07_20"
+PV = "3_50_08_24"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
 
-SRC_URI[xdczip.md5sum] = "52e4b5ddf2e004c6acff52104840724e"
-SRC_URI[xdczip.sha256sum] = "bef631c110ca9243790de06cd51839170d7979b92e01396e4265009776ff7a07"
+SRC_URI[xdczip.md5sum] = "19e73ea981354e6fa7144978bc16e215"
+SRC_URI[xdczip.sha256sum] = "335fd4050abba8e3c1c38d382d39a889441ef0d9bee57dba5892923acd586488"
-- 
1.9.1


