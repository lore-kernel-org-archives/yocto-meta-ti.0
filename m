Return-Path: <>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37339E00E3D; Thu,  5 Sep 2019 09:38:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3B4DE00E24
	for <meta-ti@yoctoproject.org>; Thu,  5 Sep 2019 09:38:58 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x85GcwDW124771
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567701538;
	bh=9CZcGkn5+Yi+4lMhlWC0E2DAVLSSYD94aSAuFwrhI0k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gZ7GPmCVwyeSoSePZxtlscsTgIxSKVR+7ipn6TucEH+k9j7kPdGIJQL0wPAntJ7O3
	ViR5g3UiiqQpTNJmwxZTkqpC+LkDd4ntgTT/erKM7GqC4pWGMd12I7nyq+jUyJ6muP
	COcch0oXbAx+aournmCGgP+0w3VTM8/X0yb9iJ6Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x85GcwVw012865
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2019 11:38:58 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 5 Sep 2019 11:38:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 5 Sep 2019 11:38:58 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85Gcw5G005375;
	Thu, 5 Sep 2019 11:38:58 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x85GcvZ15509; Thu, 5 Sep 2019 11:38:57 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>,
	Anand Balagopalakrishnan <anandb@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Thu, 5 Sep 2019 12:38:47 -0400
Message-ID: <20190905163847.18928-5-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905163847.18928-1-afd@ti.com>
References: <20190905163847.18928-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: [thud/master][PATCH 5/5] ti-sgx-ddk-um: Remove the removing of wayland-egl.pc
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

This file was shipped as part of the DDK, but was also supplied by
libwayland so it was deleted here. This file has been removed from
the DDK, so deleting the file manually here is no longer needed.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 53d2829e..7a6f013e 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -49,8 +49,6 @@ do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
     ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
 
-    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-
     chown -R root:root ${D}
 }
 
-- 
2.17.1


