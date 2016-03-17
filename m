Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25818E00C3D; Thu, 17 Mar 2016 13:57:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6291E00C2D
	for <meta-ti@yoctoproject.org>; Thu, 17 Mar 2016 13:57:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BC4D652A85; Thu, 17 Mar 2016 20:57:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160317205731.BC4D652A85@arago-project.org>
Date: Thu, 17 Mar 2016 20:57:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update commit id for 2.0.0.1
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
X-List-Received-Date: Thu, 17 Mar 2016 20:57:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cdac10783670519ac098d5cae7bceca37a2a0891
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cdac10783670519ac098d5cae7bceca37a2a0891

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Mar 17 20:05:12 2016 +0000

mpm-transport: Update commit id for 2.0.0.1

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index beb744c..473de20 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -16,10 +16,10 @@ SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch
 
 BRANCH = "master"
 # This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.01
-SRCREV = "7220df9263a57629a564afb3f99f6f7fb33e40d6"
+SRCREV = "489b669540c5545125ab5d9f3f2cdb5ec5fc09dd"
 
 PV = "2.0.0.1"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"


