Return-Path: <>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D085E00E42; Thu,  5 Sep 2019 09:38:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8729E00E18
	for <meta-ti@yoctoproject.org>; Thu,  5 Sep 2019 09:38:57 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x85Gcv5J037903
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567701537;
	bh=7KO0cJ7rB5bsV4SDzee+7ZEv0/O0lGueN+1YHWwhLQE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FyUC96d+cYf8iXIGJ84gsfsRwaHlCMYnK2T+sqUjG+X9Li5O1pDXDplQSQSj+L8u3
	MBZBxpynVjnhwVYd9+ZxlRwIFTUMigueSxJ3Sqwm7H/PmgyD6x7Oqsc1glxm9S6Jcu
	GOSRGbt+QOAPbqWtlXj3YwfnR9JrQpqBHzadP+cw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x85GcvMT023921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:57 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 5 Sep 2019 11:38:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 5 Sep 2019 11:38:56 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85GcuWM071631;
	Thu, 5 Sep 2019 11:38:56 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x85GctZ15497; Thu, 5 Sep 2019 11:38:55 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>,
	Anand Balagopalakrishnan <anandb@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Thu, 5 Sep 2019 12:38:46 -0400
Message-ID: <20190905163847.18928-4-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905163847.18928-1-afd@ti.com>
References: <20190905163847.18928-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: [thud/master][PATCH 4/5] ti-sgx-ddk-um: Drop omap5-sgx-ddk-um-linux package
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
X-List-Received-Date: Thu, 05 Sep 2019 16:38:59 -0000
Content-Type: text/plain

No one in-tree depends on this anymore. This used to be the name of the
package so this was kept here for several years for backwards
compatibility. Remove this from PROVIDES.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 0695ca0a..53d2829e 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -23,22 +23,22 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm omap5-sgx-ddk-um-linux"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 
 DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
 RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
 
-RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
-RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
-RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
+RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
 
-RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
-RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
+RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
 
-RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
-RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
-RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
+RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
 
 # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
 RPROVIDES_${PN} += "libGLESv2.so.1"
-- 
2.17.1


