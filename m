Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E102E009F3; Fri,  8 May 2015 07:10:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C430DE00A04
	for <meta-ti@yoctoproject.org>; Fri,  8 May 2015 07:10:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48EA2mk031653
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 09:10:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48EA2hI019800
	for <meta-ti@yoctoproject.org>; Fri, 8 May 2015 09:10:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 09:10:02 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t48E9xUd016498;	Fri, 8 May 2015 09:10:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 8 May 2015 10:09:54 -0400
Message-ID: <1431094194-11852-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431094194-11852-1-git-send-email-j-stiffler@ti.com>
References: <1431094194-11852-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-xdais: Add version 7.24.00.04
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
X-List-Received-Date: Fri, 08 May 2015 14:10:08 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/xdais/ti-xdais_7.24.00.04.bb |   10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-ti/xdais/ti-xdais_7.24.00.04.bb

diff --git a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
new file mode 100644
index 0000000..0f27514
--- /dev/null
+++ b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
@@ -0,0 +1,10 @@
+require ti-xdais.inc
+
+PV = "7_24_00_04"
+
+LIC_FILES_CHKSUM = "file://xdais_7_24_00_04_Manifest.html;md5=fd16442230745f0877cfe1c622669fd6"
+
+SRC_URI[xdaistarball.md5sum] = "f7514085b531f2ae49b37b30194e4989"
+SRC_URI[xdaistarball.sha256sum] = "79fd30377ab4c497292aeefb0565f81703d9020d1242b02ca9968c561e0de9a1"
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
-- 
1.7.9.5


