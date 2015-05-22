Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD02EE00A03; Fri, 22 May 2015 11:18:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3956E009E7
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 11:18:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3BB5652A7E; Fri, 22 May 2015 18:18:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522181847.3BB5652A7E@arago-project.org>
Date: Fri, 22 May 2015 18:18:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-xdctools: Add version 3.30.06.67
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
X-List-Received-Date: Fri, 22 May 2015 18:18:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0e7d11f9c1f7d71e71e7020e311618712a59f425
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0e7d11f9c1f7d71e71e7020e311618712a59f425

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri May  8 19:12:32 2015 +0000

ti-xdctools: Add version 3.30.06.67

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-xdctools_3.30.06.67.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/devtools/ti-xdctools_3.30.06.67.bb b/recipes-ti/devtools/ti-xdctools_3.30.06.67.bb
new file mode 100644
index 0000000..6de8181
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.30.06.67.bb
@@ -0,0 +1,16 @@
+require ti-xdctools.inc
+
+PV = "3_30_06_67"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=117e3c5f48df3e785edee50f5f34a738"
+
+SRC_URI[xdcbin.md5sum] = "b500f53e00c4422c7124e1825eee6352"
+SRC_URI[xdcbin.sha256sum] = "e5ca1f55c09b64bc9414adb55b2fcca301178194abed80f1d75d94cae442fd08"
+
+S = "${WORKDIR}/xdctools_${PV}"
+
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+TI_BIN_UNPK_CMDS = ""
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"


