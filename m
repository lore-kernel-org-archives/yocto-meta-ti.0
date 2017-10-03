Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5688E00D33; Tue,  3 Oct 2017 04:15:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E35DFE00D3A
	for <meta-ti@yoctoproject.org>; Tue,  3 Oct 2017 04:15:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93BExUG003193
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 06:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507029299;
	bh=dgd5Gcpo0Wr3qfnxrhwZDQY97Cgh/z/dAVz5GTLgGxE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=h0gMBKqnsYsfag7IhW+dfKuVtHwF8Jd6D+yPycqe1tZiMUyA7JpaL/zXqecMRoN6d
	DbrJu99GWyHeZtkJMLIg4NlGx6cUBmrnCLVhLRs8n7dInFS8ilFk2MxHfFmjJFOGmK
	HS0nNPJlpMmpyIvWcgyfauqgT5ySDZX6IT9J9bDc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93BEs3u007648
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 06:14:54 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 06:14:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 06:14:54 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93BElB1014743;
	Tue, 3 Oct 2017 06:14:53 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Oct 2017 07:14:44 -0400
Message-ID: <1507029285-5066-3-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507029285-5066-1-git-send-email-sam.nelson@ti.com>
References: <1507029285-5066-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 3/4] ti-xdctools: Update to new version 3.50.03.33
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
X-List-Received-Date: Tue, 03 Oct 2017 11:15:11 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../{ti-xdctools_3.32.01.22.bb => ti-xdctools_3.50.03.33.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-xdctools_3.32.01.22.bb => ti-xdctools_3.50.03.33.bb} (51%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
similarity index 51%
rename from recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
rename to recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
index 5f379c1..73ab3bd 100644
--- a/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
@@ -1,9 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_32_01_22"
+PV = "3_50_03_33"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
 
-SRC_URI[xdczip.md5sum] = "ddae5b765ca62783c1e804c75c463c38"
-SRC_URI[xdczip.sha256sum] = "b1c6620ef0b8eac45ef6a587f93b3238bdcf3b02dfd7e4b40d872a45c02c5cdc"
+SRC_URI[xdczip.md5sum] = "21310b647275a7c7dd5b37dcb96c0b1b"
+SRC_URI[xdczip.sha256sum] = "afe8616773e63b01e79e8cfacaf4d2c8d3b92c798c7f8cf5d1c7b5fe2060bbe4"
-- 
1.9.1


