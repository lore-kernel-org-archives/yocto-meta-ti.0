Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 370CCE00BAF; Tue, 10 Apr 2018 08:41:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86EDFE009DC
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2018 08:41:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3AFfZLX023092
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2018 10:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523374895;
	bh=EaPZVcWtiLgqvp2JbQYPNlYdV+6p8Rj1FMg92SlqoGI=;
	h=From:To:CC:Subject:Date;
	b=TsxapQLdhjyJwd8VqjdOGVaHKgIMe6hnD39tYoA9gL+NP+xiNTv7WyxDTFSkE5PZo
	35YY9CrLV13uac1pYKe8MI9/xWD6xGJ2/R/uuLlEsZ2EUvD17c2A7IE0Hy4htkB0Yk
	q4iosR5lTAYPZmyUPgIvLd7RFREquVWbvV0lSLK8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3AFfZA6003816
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2018 10:41:35 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 10 Apr 2018 10:41:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 10 Apr 2018 10:41:35 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3AFfZi5008716;
	Tue, 10 Apr 2018 10:41:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Apr 2018 11:31:14 -0400
Message-ID: <1523374274-4010-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-cg-xml: skip file-rdeps check
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
X-List-Received-Date: Tue, 10 Apr 2018 15:41:37 -0000
Content-Type: text/plain

* pre-packaged binaries depend on libc.so.6

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-cg-xml_2.41.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
index d3c3ffe..5c0ff63 100644
--- a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
+++ b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
@@ -32,7 +32,7 @@ do_install() {
 
 FILES_${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
 
-INSANE_SKIP_${PN} = "arch ldflags"
+INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
-- 
2.7.4


