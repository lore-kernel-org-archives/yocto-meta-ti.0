Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1855EE00D85; Fri, 28 Jun 2019 03:48:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AF31E0098A
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 03:48:04 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SAm3W3121254
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 05:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561718883;
	bh=iLezRWJUqOdD8R7CHrHYMU8xBwbxqUv5DA4EzQTwjLE=;
	h=From:To:CC:Subject:Date;
	b=OL0A9GrVnsH6wMuhMi0cyO7y2wkffUI58Cr/dDfrR42RMXq4LhWM3spzwcTrSG+QW
	ieQKttWtAqOE1YT1QhGl9hD7Rj62YhkDrNHUdot9zphrC7pPkL/PYyESqQmJeo52zz
	1F9Hl4Wqa3RHL9z46203B9PnFfKMjmQclCOSnxRE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SAm3IB105157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 05:48:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 05:48:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 05:48:03 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SAm16L082168; 
	Fri, 28 Jun 2019 05:48:02 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Jun 2019 16:18:00 +0530
Message-ID: <1561718880-125419-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 1/1] ti-img-rogue-umlibs: add window system as an install option
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
X-List-Received-Date: Fri, 28 Jun 2019 10:48:05 -0000
Content-Type: text/plain

We will start supporting Wayland window system. It is good to have nulldrmws as
a debug option. GPU driver recipe already support window system option.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
index c7700fb..94f078e 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
@@ -6,15 +6,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "linuxws/thud/k4.19/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
-SRCREV = "97fc1ca42b03f400de38b78e21aaf6b5d94b1c5d"
+SRCREV = "3da5ebfde8a41cd38ab935f3e350d5d195fe7309"
 
 PVR_SOC ?= "j721e_linux"
 PVR_BUILD ?= "release"
+PVR_WS = "nulldrmws"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
@@ -43,7 +44,7 @@ RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
 S = "${WORKDIR}/git"
 
 do_install () {
-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${PVR_SOC} BUILD=${PVR_BUILD}
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${PVR_SOC} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
     chown -R root:root ${D}
 }
 
-- 
1.9.1


