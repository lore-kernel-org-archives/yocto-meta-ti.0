Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DCC9E00A9C; Fri,  1 Apr 2016 20:41:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1D60E00BB9
	for <meta-ti@yoctoproject.org>; Fri,  1 Apr 2016 20:41:42 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 383BA52981; Sat,  2 Apr 2016 03:41:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160402034141.383BA52981@arago-project.org>
Date: Sat,  2 Apr 2016 03:41:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : HACK: ti-xdctools, ti-xdais: disable stripping for now
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
X-List-Received-Date: Sat, 02 Apr 2016 03:41:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 58b9860b511b8d9537c11f374decd32593aacdd6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=58b9860b511b8d9537c11f374decd32593aacdd6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr  2 09:40:21 2016 +0000

HACK: ti-xdctools, ti-xdais: disable stripping for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb |    2 ++
 recipes-ti/xdais/ti-xdais_7.24.00.04.bb       |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
index 19bbe5d..6db742a 100644
--- a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
@@ -1,3 +1,5 @@
+INHIBIT_PACKAGE_STRIP = "1"
+
 require recipes-ti/devtools/ti-xdctools-core.inc
 
 PV = "3_32_00_06"
diff --git a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
index 8148f73..6c81960 100644
--- a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
+++ b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
@@ -1,3 +1,5 @@
+INHIBIT_PACKAGE_STRIP = "1"
+
 require ti-xdais.inc
 
 PV = "7_24_00_04"


