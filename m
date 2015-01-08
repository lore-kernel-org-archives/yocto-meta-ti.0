Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57EC2E00964; Thu,  8 Jan 2015 09:23:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE042E00947
	for <meta-ti@yoctoproject.org>; Thu,  8 Jan 2015 09:22:49 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 08B89529E6; Thu,  8 Jan 2015 17:22:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150108172247.08B89529E6@arago-project.org>
Date: Thu,  8 Jan 2015 17:22:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 1.0.6.0
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
X-List-Received-Date: Thu, 08 Jan 2015 17:23:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a44e87ab512244f2801db2c938ae0334958751c5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a44e87ab512244f2801db2c938ae0334958751c5

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Dec 23 09:07:03 2014 +0000

mpm-transport: Update to new version 1.0.6.0

- Commit id and version updated to DEV.MPM-TRANSPORT-01.00.06.00

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index fe67195..cb0f6c4 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -8,10 +8,10 @@ DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld"
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.04.00E
-SRCREV = "56640c6296f9f4816140364b7620b1d1a483ac40"
-PV = "1.0.4.0"
-PR = "r0"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.06.00
+SRCREV = "af2d2ad8721b769012662c539a86b94f7d44dbda"
+PV = "1.0.6.0"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 


