Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E26BE007B6; Wed, 27 May 2015 05:16:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C9A7E0098D
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 05:15:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4RCFuwZ020436
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 07:15:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4RCFurt006138
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 07:15:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 07:15:56 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4RCFpk9008813;	Wed, 27 May 2015 07:15:56 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 08:15:47 -0400
Message-ID: <1432728947-4837-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1432728947-4837-1-git-send-email-j-stiffler@ti.com>
References: <1432728947-4837-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ti-framework-components: Add version 3.40.00.02.
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
X-List-Received-Date: Wed, 27 May 2015 12:16:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-framework-components_3.40.00.02.bb          |    9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb

diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb b/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
new file mode 100644
index 0000000..2dd8548
--- /dev/null
+++ b/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
@@ -0,0 +1,9 @@
+require ti-framework-components.inc
+
+PV = "3_40_00_02"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=e3ce0b3e17175b7200f346d0c6dbbcc6"
+
+SRC_URI[fctarball.md5sum] = "f66cb201582e1f407b92501d64738047"
+SRC_URI[fctarball.sha256sum] = "91b0e571b8760e51e4683b44ce13ff3d2f6deb39b204e09894c30514f10c60db"
-- 
1.7.9.5


