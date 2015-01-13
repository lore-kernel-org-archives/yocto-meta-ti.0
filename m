Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76912E004F2; Tue, 13 Jan 2015 10:39:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15E95E002F9
	for <meta-ti@yoctoproject.org>; Tue, 13 Jan 2015 10:39:41 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0DIdeeE029328
	for <meta-ti@yoctoproject.org>; Tue, 13 Jan 2015 12:39:40 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0DIddYG010443
	for <meta-ti@yoctoproject.org>; Tue, 13 Jan 2015 12:39:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 13 Jan 2015 12:39:39 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0DIddpP015282;	Tue, 13 Jan 2015 12:39:39 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Jan 2015 13:39:37 -0500
Message-ID: <1421174378-2479-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] cuia: Add recipe for TI unified Instrumentation Architecture in C module
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
X-List-Received-Date: Tue, 13 Jan 2015 18:39:43 -0000
Content-Type: text/plain

- Provides instrumentation libraries in C for TI SoCs

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cuia/cuia_1.0.0.13.bb |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-bsp/cuia/cuia_1.0.0.13.bb

diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
new file mode 100644
index 0000000..343d176
--- /dev/null
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "TI Unified Instrumentation Architecture in C (cUIA)"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://cuia_${CUIA_PV}_manifest.html;md5=0eea94e3bb94de4ddee77653eba1c7c5"
+
+CUIA_PV = "1_00_00_13"
+CUIA_PVExtra = ""
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/UIA/SCMCSDK/cuia_${CUIA_PV}${CUIA_PVExtra}.tar.gz;name=cuia"
+SRC_URI[cuia.md5sum] = "ef53989ac70c191841cd656cdc8770be"
+SRC_URI[cuia.sha256sum] = "f16d138a9146fdc7d52cba77bd30596da65835f6ffe4092baf2b33d1c1a4fb0d"
+
+S = "${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra}"
+SRCREV = "${AUTOREV}"
+
+do_compile () {
+	cd ${S}
+	oe_runmake clean
+	oe_runmake all
+}
+
+do_install() {
+	cd ${S}
+	oe_runmake DESTDIR=${D} libdir=${libdir} includedir=${includedir} install
+}
-- 
1.7.9.5


