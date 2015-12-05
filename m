Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFBFCE00956; Fri,  4 Dec 2015 19:12:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69057E009EA
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:12:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2DFF852AC1; Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205031210.2DFF852AC1@arago-project.org>
Date: Sat,  5 Dec 2015 03:12:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : multiprocmgr: Update to new version 3.0.0.1_eng
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
X-List-Received-Date: Sat, 05 Dec 2015 03:12:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: e19d18cc494d3c9dfb96fc0a5eb34c8f140e73ac
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e19d18cc494d3c9dfb96fc0a5eb34c8f140e73ac

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Dec  5 07:58:26 2015 +0000

multiprocmgr: Update to new version 3.0.0.1_eng

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/multiprocmgr/multiprocmgr.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 94fa707..f875396 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -5,9 +5,9 @@ SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 
 BRANCH = "linux41"
-# The following commits correspond to DEV.MPM-3.00.00.00_ENG
-SRCREV = "158e7d419662b482a089fb66ecdfced1104654ae"
-PV = "3.0.0.0"
+# The following commits correspond to DEV.MPM-3.00.00.01_ENG
+SRCREV = "c1c245814b835509b99d144b52e00316665ac477"
+PV = "3.0.0.1"
 
 SRC_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git;protocol=git;branch=${BRANCH}"
 


