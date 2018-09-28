Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70F39E00A0A; Fri, 28 Sep 2018 10:28:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0771E009D9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 10:28:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SHSrD6072212
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538155733;
	bh=zJgPT+CPFbU+lZ15wRjgCIf5rxJJZCHmT1iwYD+wvis=;
	h=From:To:CC:Subject:Date;
	b=ugEXm3kZWz2eFyBRx4P8kKhC1dPQ4i7q65rwYRg9KtuZherKxgcGHeDR/F51TTEul
	8UsgzCE/jg3MeozDNRsPCusapH4b5sMr+WbY8CuYS3tWoTSCCGkp4DAUoAxnQQm5D6
	sGYDT2g8zY2dg4/In+Xj3OkH/epuCqdoiXo213Jg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SHSreU019833
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:28:53 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 12:28:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 12:28:53 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SHSqHn004943;
	Fri, 28 Sep 2018 12:28:52 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 13:25:48 -0400
Message-ID: <1538155548-33412-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] dsplib/mathlib: remove .metadata folder from packages
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
X-List-Received-Date: Fri, 28 Sep 2018 17:28:54 -0000
Content-Type: text/plain

dsplib/mathlib: remove .metadata folder from dsplib and mathlib packages

Remove .metadata folder from dsplib and mathlib packages.
This folder prevents CCS from finding and installing dsplib and mathlib.

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/dsplib/dsplib.inc   | 2 --
 recipes-ti/mathlib/mathlib.inc | 2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index 7180c4a..f369679 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -49,7 +49,6 @@ do_install() {
 
 	find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
 	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTALL_DIR_RECIPE}
-	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata ${D}${DSPLIB_INSTALL_DIR_RECIPE}
 	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
 }
 
@@ -62,7 +61,6 @@ do_deploy() {
 	# and place the zip file in ${DEPLOYDIR}
 	mkdir ./${DSPLIB_PACKAGE_NAME}
 	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME}
-	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata ./${DSPLIB_PACKAGE_NAME}
 	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACKAGE_NAME}
 	rm -r ./${DSPLIB_PACKAGE_NAME}
 }
diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
index 3e981e4..6aea085 100644
--- a/recipes-ti/mathlib/mathlib.inc
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -48,7 +48,6 @@ do_install() {
 
 	find -name "${MATHLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${MATHLIB_INSTALL_DIR_RECIPE} \;
 	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/* ${D}${MATHLIB_INSTALL_DIR_RECIPE}
-	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/.metadata ${D}${MATHLIB_INSTALL_DIR_RECIPE}
 	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
 }
 
@@ -61,7 +60,6 @@ do_deploy() {
 	# and place the zip file in ${DEPLOYDIR}
 	mkdir ./${MATHLIB_PACKAGE_NAME}
 	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/* ./${MATHLIB_PACKAGE_NAME}
-	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/.metadata ./${MATHLIB_PACKAGE_NAME}
 	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip ./${MATHLIB_PACKAGE_NAME}
 	rm -r ./${MATHLIB_PACKAGE_NAME}
 }
-- 
1.9.1


