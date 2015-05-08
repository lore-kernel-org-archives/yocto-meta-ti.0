Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE66BE009BB; Fri,  8 May 2015 06:12:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81C0FE00945
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 06:12:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48DCbbr011825
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 08:12:38 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48DCbF3001042
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 08:12:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 08:12:36 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t48DCaTN002384;	Fri, 8 May 2015 08:12:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 8 May 2015 09:12:32 -0400
Message-ID: <1431090752-3296-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-xdctools: Add version 3.30.06.67
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
X-List-Received-Date: Fri, 08 May 2015 13:12:42 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/devtools/ti-xdctools_3.30.06.67.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.30.06.67.bb

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
-- 
1.7.9.5


