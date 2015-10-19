Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91A3BE00BA4; Mon, 19 Oct 2015 14:12:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8FA0E007DA
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 52D7D52ACB; Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211148.52D7D52ACB@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : netapi: Update commit id of final version of 1.1.0.6
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
X-List-Received-Date: Mon, 19 Oct 2015 21:12:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d027ee6beb53a96fb7755eb3b6325f8f18c2ce7e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d027ee6beb53a96fb7755eb3b6325f8f18c2ce7e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:44:18 2015 +0000

netapi: Update commit id of final version of 1.1.0.6

- Increment PR to update

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index 0ba4eeb..f7e5393 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -5,8 +5,9 @@ BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
 
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
-SRCREV = "42eefef1b4bdc659fc8fc42e8f2bc74a4b155265"
+SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
 PV = "01.01.00.06"
+PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 


