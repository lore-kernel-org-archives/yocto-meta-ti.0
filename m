Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB4BBE00AF2; Mon, 12 Sep 2016 15:18:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 950ECE00A84
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 15:18:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D2BBA52996; Mon, 12 Sep 2016 22:18:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160912221826.D2BBA52996@arago-project.org>
Date: Mon, 12 Sep 2016 22:18:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jason Reeder : pru-icss: bump SRCREV, PV, and PR due to updates
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
X-List-Received-Date: Mon, 12 Sep 2016 22:18:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 1f555fc8321721e398cbe1b77439c643faa44467
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1f555fc8321721e398cbe1b77439c643faa44467

Author: Jason Reeder <jreeder@ti.com>
Date:   Sat Sep 10 00:07:15 2016 +0000

pru-icss: bump SRCREV, PV, and PR due to updates

Due to bug fixes and updates, the package version number
is being incremented to 5.0.1. The commit ID is also being
updated to reflect these changes.

Line ending corrections to the manifest file also caused
a new checksum value to be necessary. This has been updated
in this commit as well.

Signed-off-by: Jason Reeder <jreeder@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/pru-icss_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
 


