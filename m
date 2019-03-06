Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF9CBE00CAF; Wed,  6 Mar 2019 14:06:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49F04E00BCC
	for <meta-ti@yoctoproject.org>; Wed,  6 Mar 2019 14:06:04 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x26M63wj039971
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 16:06:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551909963;
	bh=zxwJptMxISHyum3ZVpxBOLQ5tMsWsjzbHzLbNrnwdcM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oNtDLQaYCLEKH7PBKbrLTcFaA01QfLo6i3i3HmGMvEamuaHf3N/6RFov/dQF3eqIs
	OWWNTo0SHQgoq7LSmelmDe/SoUH9b6q1hTQ7oVPWkNp8i09X5LeNCmYlAg5YnMP6YP
	2sta+lbjwDwnNG/en5MjJGzagNMAl0oGYrf6ZVb0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x26M63Q3081032
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 16:06:03 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 16:06:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 16:06:03 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x26M62Wq014538
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 16:06:03 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 6 Mar 2019 17:05:59 -0500
Message-ID: <1551909959-58701-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551909959-58701-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1551909959-58701-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] ti-xdctools: Update to version 3.51.01.18
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
X-List-Received-Date: Wed, 06 Mar 2019 22:06:04 -0000
Content-Type: text/plain

The license checksum update is due to the version number update. The
licenses have not changed.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../{ti-xdctools_3.50.08.24.bb => ti-xdctools_3.51.01.18.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/devtools/{ti-xdctools_3.50.08.24.bb => ti-xdctools_3.51.01.18.bb} (35%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.50.08.24.bb b/recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
similarity index 35%
rename from recipes-ti/devtools/ti-xdctools_3.50.08.24.bb
rename to recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
index 1e776e7..35258b4 100644
--- a/recipes-ti/devtools/ti-xdctools_3.50.08.24.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
@@ -1,9 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_50_08_24"
+PV = "3_51_01_18"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=7d8508a640d8e76fe372141df01c351f"
 
-SRC_URI[xdczip.md5sum] = "19e73ea981354e6fa7144978bc16e215"
-SRC_URI[xdczip.sha256sum] = "335fd4050abba8e3c1c38d382d39a889441ef0d9bee57dba5892923acd586488"
+SRC_URI[xdczip.md5sum] = "54b80b603471623c1dbb0cfeb75b0fe2"
+SRC_URI[xdczip.sha256sum] = "9bbbf433f0970bcb0cbf938615afe4d54420ecc56bc6e872f1a004338a8f19d5"
-- 
1.9.1


