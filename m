Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 913B9E00BBC; Thu, 24 Aug 2017 23:33:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE60EE00B3D
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 23:33:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7P6XQYT032143
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 01:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503642806;
	bh=z3SYM4w7BMRbwcO4RlNuPNlv/xNlF/MO1tq+3QqWRTg=;
	h=From:To:Subject:Date;
	b=u0JILoVjV8Ilp5XSlvyHRY+gN8o0YUWhM4jc06ob0MKFvZfhN7vIWfG9iHHbw2PtT
	dt+Grhx7BqyHKOnISuKsLhmasay7w3jUEVHEaax4M4PPOAbKN+DonPNOxCiugtaCAg
	QF8A/OrY/qgfs1mkl4jYWWukQL8A7E+Q91R760jk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7P6XQBF013352
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 01:33:26 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 01:33:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 01:33:26 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7P6XQCU013061
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 01:33:26 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 25 Aug 2017 01:33:26 -0500
Message-ID: <1503642806-6574-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-cgt-pru: updated version to 2.1.5
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
X-List-Received-Date: Fri, 25 Aug 2017 06:33:28 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/devtools/{ti-cgt-pru_2.1.4.bb => ti-cgt-pru_2.1.5.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-pru_2.1.4.bb => ti-cgt-pru_2.1.5.bb} (82%)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.4.bb b/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
similarity index 82%
rename from recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
rename to recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
index 5667ea2..5586d0f 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
@@ -18,11 +18,11 @@ BINFILE_NAME_class-target = "cgt-pru-arm"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt-pru-x86.md5sum] = "496b32b9804cf5b5b293dd938f7c5339"
-SRC_URI[cgt-pru-x86.sha256sum] = "c80dbf35e7401f4c122ff25cc2f6b5db496607782fb4583cee8663a2763f4472"
+SRC_URI[cgt-pru-x86.md5sum] = "06ac11b90a55ee787ac20fcca9a27013"
+SRC_URI[cgt-pru-x86.sha256sum] = "0f5b965ae1fda818ce5a81f1adbdae0a65047c6ae6cff1869e08e678122f8dff"
 
-SRC_URI[cgt-pru-arm.md5sum] = "b13bf0cdf484102cdfcb92a81b8092a2"
-SRC_URI[cgt-pru-arm.sha256sum] = "c125bbe4e805b830e5d746ade929dc1f202f25a6863d5005ed97cc5a82e26754"
+SRC_URI[cgt-pru-arm.md5sum] = "bedda3b31d8918d5d1d3c6d886821d0a"
+SRC_URI[cgt-pru-arm.sha256sum] = "f2711478f9160a73660a2b2f316ad446bc481141bb9889f1001441beccce3584"
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
-- 
1.9.1


