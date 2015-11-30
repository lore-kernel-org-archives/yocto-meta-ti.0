Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E137E00A81; Mon, 30 Nov 2015 13:46:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1295E007D5
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 13:46:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 850DD52A72; Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151130214620.850DD52A72@arago-project.org>
Date: Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new version 3.0.0.0
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
X-List-Received-Date: Mon, 30 Nov 2015 21:46:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 74a8f307643805b75131a331b8b07a34b2936758
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=74a8f307643805b75131a331b8b07a34b2936758

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Nov 26 04:07:23 2015 +0000

multiprocmgr: Update to new version 3.0.0.0

- Update to work with kernel version 4.1 and also other uio driver
changes.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index d9360b5..94fa707 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
 SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "master"
-# The following commits correspond to DEV.MPM-2.00.01.10D
-SRCREV = "4cb6009d6a3c94cea41ae6155a974e9ca44d982f"
-PV = "2.0.1.10"
+BRANCH = "linux41"
+# The following commits correspond to DEV.MPM-3.00.00.00_ENG
+SRCREV = "158e7d419662b482a089fb66ecdfced1104654ae"
+PV = "3.0.0.0"
 
 SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
 


