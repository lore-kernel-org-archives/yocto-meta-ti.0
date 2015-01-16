Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4A83E00948; Thu, 15 Jan 2015 18:57:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60FC7E0093B
	for <meta-ti@yoctoproject.org>; Thu, 15 Jan 2015 18:57:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5684F52981; Fri, 16 Jan 2015 02:57:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150116025740.5684F52981@arago-project.org>
Date: Fri, 16 Jan 2015 02:57:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cuia: Add recipe for TI unified Instrumentation Architecture in C module
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
X-List-Received-Date: Fri, 16 Jan 2015 02:57:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6a7aa3b035b401717343f10abe7abdc3312529d8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6a7aa3b035b401717343f10abe7abdc3312529d8

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Jan 16 00:48:31 2015 +0000

cuia: Add recipe for TI unified Instrumentation Architecture in C module

- Provides instrumentation libraries in C for TI SoCs

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cuia/cuia_1.0.0.13.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
new file mode 100644
index 0000000..42154d2
--- /dev/null
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -0,0 +1,23 @@
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


