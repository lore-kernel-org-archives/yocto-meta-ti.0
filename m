Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1935E009E6; Fri, 22 May 2015 11:18:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2657E009E6
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 11:18:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 026A252A7D; Fri, 22 May 2015 18:18:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522181847.026A252A7D@arago-project.org>
Date: Fri, 22 May 2015 18:18:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-xdais: Add version 7.24.00.04
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
X-List-Received-Date: Fri, 22 May 2015 18:18:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 3d09af48ef924b2089128ec47d778d6da42b5d8b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3d09af48ef924b2089128ec47d778d6da42b5d8b

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri May  8 20:09:54 2015 +0000

ti-xdais: Add version 7.24.00.04

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/xdais/ti-xdais_7.24.00.04.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

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


