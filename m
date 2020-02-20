Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.542.1582225717364772976
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=K/vc1M45;
 spf=permerror, err=parse error for token &{10 18 app.sgizmo.com}: SPF record not found (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF880E016B5; Thu, 20 Feb 2020 11:08:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80582E016B5
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 11:08:34 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8XS1079725
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582225713;
	bh=ahmpA1OSfWE8LjuJNS5UxCqrugItKH45ARPemde3T/g=;
	h=From:To:CC:Subject:Date;
	b=K/vc1M45Tn960VJXT6rC+0PtZ4qczUoRqmOTbeMd+i5r48Z3oUc/0uAhR77XjA0ac
	 Hj1A9+CafnaFeakSZGcSxaCc3WkVbuwP8lwGOBpmTxCrFbcWhjjUK4lgQN8UrHc4H+
	 sPOBP7UwoAvaYvXVu4UFDxm8enffaChUhcXbfUdE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJ8XOQ073796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2020 13:08:33 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 13:08:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 13:08:33 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJ8Xpq074493;
	Thu, 20 Feb 2020 13:08:33 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH 1/4] sgx-um, rogue-umlibs, gc320-libs: RRECOMMENDS on corresponding drivers
Date: Thu, 20 Feb 2020 18:47:19 +0000
Message-ID: <20200220184722.25828-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb           | 2 ++
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 +++-
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb       | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index e8c2f011..d6ecd229 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -12,6 +12,8 @@ BRANCH = "ti-${PV}"
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
 SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
 
+RRECOMMENDS_${PN} = "ti-gc320-driver"
+
 # There's only hardfp version available
 python __anonymous() {
     tunes = d.getVar("TUNE_FEATURES")
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index 9cb863a5..67290756 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -27,7 +27,7 @@ PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 DEPENDS += "libdrm wayland expat"
 RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN} += "python-core"
-RDEPENDS_${PN} += "ti-img-rogue-driver wayland expat"
+RDEPENDS_${PN} += "wayland expat"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
 RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
@@ -41,6 +41,8 @@ RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
 RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
 RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
 
+RRECOMMENDS_${PN} += "ti-img-rogue-driver"
+
 S = "${WORKDIR}/git"
 
 do_install () {
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index ecf3ffcc..8b0b3058 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -43,6 +43,8 @@ RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
 # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
 RPROVIDES_${PN} += "libGLESv2.so.1"
 
+RRECOMMENDS_${PN} += "ti-sgx-ddk-km"
+
 S = "${WORKDIR}/git"
 
 do_install () {
-- 
2.17.1

