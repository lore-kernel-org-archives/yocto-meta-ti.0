Return-Path: <tmannan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8081FE00D38; Mon, 22 Jul 2019 11:02:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D7CBE00D2C
	for <meta-ti@yoctoproject.org>; Mon, 22 Jul 2019 11:02:46 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6MI2kdU028936
	for <meta-ti@yoctoproject.org>; Mon, 22 Jul 2019 13:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563818566;
	bh=pvRd8xLTdBbyKb1qnZaLY0ELGJlopbPaxRi4l+uQ9ic=;
	h=From:To:Subject:Date;
	b=M/+0U/DNCsPO60XHQYbSZon4ZnP+yc5ncWTtmEuyqy4dV+8XCb52moAk1VYGTbqxI
	zT9VVaNVgyNTgHGD3kRGTuQ9fRV5qgt5r+xO449/+zdNnMn7+hbaEbcXeT8z9RwL32
	pvohPwDQRu3pO9hAlVtBasIiLknhHUBQOJZnq8TI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6MI2kse083899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 22 Jul 2019 13:02:46 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 22 Jul 2019 13:02:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 22 Jul 2019 13:02:46 -0500
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6MI2kMi042139
	for <meta-ti@yoctoproject.org>; Mon, 22 Jul 2019 13:02:46 -0500
From: Tinku Mannan <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 22 Jul 2019 14:02:42 -0400
Message-ID: <1563818562-32548-1-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2] trace-rtos: Adding trace utilities for PDK drivers
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
X-List-Received-Date: Mon, 22 Jul 2019 18:02:47 -0000
Content-Type: text/plain

Signed-off-by: Tinku Mannan <tmannan@ti.com>
---
 v2 - Fixed the extra newline

 recipes-bsp/utils-rtos/trace-rtos_git.bb | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 recipes-bsp/utils-rtos/trace-rtos_git.bb

diff --git a/recipes-bsp/utils-rtos/trace-rtos_git.bb b/recipes-bsp/utils-rtos/trace-rtos_git.bb
new file mode 100644
index 0000000..48b3bf2
--- /dev/null
+++ b/recipes-bsp/utils-rtos/trace-rtos_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "TI RTOS Trace utility"
+
+DESCRIPTION = "This utility allows for tracing support in PDK drivers"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://tracever.h;beginline=19;endline=47;md5=983f531ecfc9fc8c4bc3af9333ab6696"
+
+COMPATIBLE_MACHINE = "k3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TRACE_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
+TRACE_GIT_PROTOCOL = "git"
+TRACE_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.UTILS.01.00.00.09"
+TRACE_SRCREV = "84802d7a787a53f33a24254069c90208c5d87d1e"
+
+BRANCH = "${TRACE_GIT_BRANCH}"
+SRC_URI = "${TRACE_GIT_URI};protocol=${TRACE_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${TRACE_SRCREV}"
+PV = "01.00.00.09"
+PR = "r0"
+
+S = "${WORKDIR}/git/trace"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_TRACE_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "Trace Utility"
-- 
2.7.4


