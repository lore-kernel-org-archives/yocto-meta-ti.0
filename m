Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F6B0E00CE5; Tue, 19 Mar 2019 08:51:07 -0700 (PDT)
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
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F110DE0049A
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2019 08:51:06 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2JFp6nK059848
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2019 10:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553010666;
	bh=ULywrerHxE5Jp9R81Xsa3KadT0aoLaaUqR/QTxecs/E=;
	h=From:To:CC:Subject:Date;
	b=A6B14UhxOaAg7zvEFgAq4W/S1LKY6qenvr1KtSjqoBWzplBQVwRx7KS4IV+GepmEo
	rbi5Uv1Cjx6dtlZqOC9TwEHkPbG0zes6bt3AbHh7HpvTCwjFTBG+8d5w7VPMhIq7FS
	BIsaY0rVat4CbTbhaXN+h1homNYL5SI0+YZscb2I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2JFp6O3094915
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2019 10:51:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 19 Mar 2019 10:51:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Tue, 19 Mar 2019 10:51:06 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2JFp5qx008938;
	Tue, 19 Mar 2019 10:51:05 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Mar 2019 11:38:55 -0400
Message-ID: <1553009935-17819-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/thud/master][PATCH v2] gcc-arm-none-eabi: suppress more QA warnings and errors
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
X-List-Received-Date: Tue, 19 Mar 2019 15:51:07 -0000
Content-Type: text/plain

As this is a pre-built package:
* Skip the build-deps and file-rdeps checks.
* Disable package debug split.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: rebase patch

 recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
index b9e3639..f474c87 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb
@@ -23,6 +23,7 @@ do_install() {
 
 FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
 
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev build-deps file-rdeps"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


