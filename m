Return-Path: <tmannan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 115DFE00D86; Wed, 17 Jul 2019 11:17:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88B6BE00D55
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 11:17:12 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HIHBjl105564
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563387431;
	bh=oZ5NiHRE2xn11/Eui30cLXuR6a0WzjYveP5qJ7CxJqk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YmS/3+oGYw9WdzfIyae1ppJkwaDXAxsOrMLEzre0dqUNN7kHomJJaX21Kbo/TpgQb
	9E58DgWkweZSVKJGWQDMPqEwNgPGR21SBaR0LPDjWyYgUY3VulOFmHIPlYCSXlMkWu
	F4QfOkYJALPcrsuFBnoJKkFpa7s1ZBUhP5YN2oew=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HIHBs8102905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:17:11 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 17 Jul 2019 13:17:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 17 Jul 2019 13:17:11 -0500
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HIH6UY039043
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:17:11 -0500
From: Tinku Mannan <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 17 Jul 2019 14:16:59 -0400
Message-ID: <1563387419-30920-2-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563387419-30920-1-git-send-email-tmannan@ti.com>
References: <1563387419-30920-1-git-send-email-tmannan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] trace-rtos: Adding trace utilities for PDK drivers
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
X-List-Received-Date: Wed, 17 Jul 2019 18:17:13 -0000
Content-Type: text/plain

Signed-off-by: Tinku Mannan <tmannan@ti.com>
---
 recipes-bsp/utils-rtos/trace-rtos_git.bb | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 recipes-bsp/utils-rtos/trace-rtos_git.bb

diff --git a/recipes-bsp/utils-rtos/trace-rtos_git.bb b/recipes-bsp/utils-rtos/trace-rtos_git.bb
new file mode 100644
index 0000000..aba64b5
--- /dev/null
+++ b/recipes-bsp/utils-rtos/trace-rtos_git.bb
@@ -0,0 +1,37 @@
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
+
-- 
2.7.4


