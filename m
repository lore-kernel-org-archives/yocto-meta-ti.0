Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14615E00E3D; Mon,  5 Mar 2018 05:30:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F23F6E00E27
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2018 05:30:04 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w25DU459020914
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 07:30:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520256604;
	bh=EoClwQdAvKNejICvpbNQawcqvKb5GFCSL7zxxpxElpc=;
	h=From:To:CC:Subject:Date;
	b=HsgrHnpR0NqPrFt3U6e1vY57BmVfNPW+SYIgK6oJj67XwdwC3kB1k+lyoO7mx8WQV
	W367z8L6DyFRAYJuGzYmH13fP9I9xHrrKCEaDl4ioImVy0Svhlmo4NxC7KeMnRBpmk
	4WzmOpNK77hH/pbinI2fnV8xptHfY2L/xu9Vr6Bo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25DU2AI006957
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 07:30:04 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 07:30:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 07:30:02 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25DU1H0020140;
	Mon, 5 Mar 2018 07:30:02 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Mar 2018 18:59:59 +0530
Message-ID: <1520256599-11474-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [FOR-KROGOTH PATCH v2 1/1] ti-sgx-ddk-um: wlpvr_ws: Map DBM buffers and populate meminfo
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
X-List-Received-Date: Mon, 05 Mar 2018 13:30:06 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 3a9a2b2..ff28a63 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a0318
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BRANCH = "ti-img-sgx/${PV}"
+BRANCH = "ti-img-sgx/${PV}_k4.4"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "d184140aa5c17e13e1bf21151f1a7bc068bdf8bf"
+SRCREV = "2736a396f9c801fc0818d830f8a3215aeb8b6534"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r23"
+PR = "r24"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"
-- 
1.9.1


