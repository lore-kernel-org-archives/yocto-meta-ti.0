Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DED4E007D3; Tue, 15 Dec 2015 08:59:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 258FBE00ABE
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:59:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8CA3F52A2A; Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151215165952.8CA3F52A2A@arago-project.org>
Date: Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new version 3.0.0.2
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
X-List-Received-Date: Tue, 15 Dec 2015 16:59:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 3929e5fafb8e3572d0f2c0cd2ca01938f0afcf97
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3929e5fafb8e3572d0f2c0cd2ca01938f0afcf97

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Dec 15 20:11:46 2015 +0000

multiprocmgr: Update to new version 3.0.0.2

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index f875396..ebe2eee 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
 SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "linux41"
-# The following commits correspond to DEV.MPM-3.00.00.01_ENG
-SRCREV = "c1c245814b835509b99d144b52e00316665ac477"
-PV = "3.0.0.1"
+BRANCH = "master"
+# The following commits correspond to DEV.MPM-3.00.00.02
+SRCREV = "319c6cfe15054df08eb70cbedc99a88dd5a06cda"
+PV = "3.0.0.2"
 
 SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
 


