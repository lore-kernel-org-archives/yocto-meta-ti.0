Return-Path: <jreeder@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43A65E00932; Fri,  9 Sep 2016 11:07:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0D08E008E3
	for <meta-ti@yoctoproject.org>; Fri,  9 Sep 2016 11:07:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u89I7aPV013598
	for <meta-ti@yoctoproject.org>; Fri, 9 Sep 2016 13:07:37 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89I7Z6Q004645
	for <meta-ti@yoctoproject.org>; Fri, 9 Sep 2016 13:07:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Sep 2016 13:07:35 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u89I7Z40005894;	Fri, 9 Sep 2016 13:07:35 -0500
Received: from localhost (uda0273976.am.dhcp.ti.com [10.219.21.82])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	u89I7Z306984; Fri, 9 Sep 2016 13:07:35 -0500 (CDT)
From: Jason Reeder <jreeder@ti.com>
To: meta-ti <meta-ti@yoctoproject.org>
Date: Fri, 9 Sep 2016 13:07:15 -0500
Message-ID: <1473444435-19761-1-git-send-email-jreeder@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pru-icss: bump SRCREV, PV, and PR due to updates
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
X-List-Received-Date: Fri, 09 Sep 2016 18:07:40 -0000
Content-Type: text/plain

Due to bug fixes and updates, the package version number
is being incremented to 5.0.1. The commit ID is also being
updated to reflect these changes.

Line ending corrections to the manifest file also caused
a new checksum value to be necessary. This has been updated
in this commit as well.

Signed-off-by: Jason Reeder <jreeder@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index a56eba0..144e338 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -2,16 +2,16 @@ DESCRIPTION = "Programmable Real-time Unit Software Package"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
 LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
 
-LIC_FILES_CHKSUM = "file://PRU-Package-v5.0-Manifest.html;md5=eec933459cb42544706e35289de38e03"
+LIC_FILES_CHKSUM = "file://PRU-Package-v5.0-Manifest.html;md5=a86a37c8b6396ad0ad6ae752f1aa8fcc"
 
 inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "913cf232ebe655603d3385de2b9cde4af7af5308"
+SRCREV = "5e08c1f7c1f1d642b508e8b9cea246d9d8ef54c8"
 
-PV = "5.0.0"
-PR = "r0"
+PV = "5.0.1"
+PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.9.1


