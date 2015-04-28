Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C33B5E009AA; Tue, 28 Apr 2015 15:31:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25E39E009A6
	for <meta-ti@yoctoproject.org>; Tue, 28 Apr 2015 15:31:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 44F8152A7E; Tue, 28 Apr 2015 22:31:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150428223147.44F8152A7E@arago-project.org>
Date: Tue, 28 Apr 2015 22:31:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : traceframework: Update commit id for version 1.1.1.6
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
X-List-Received-Date: Tue, 28 Apr 2015 22:31:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ce70c4cf3846469a0df101f6e6a8e44ae7496baa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ce70c4cf3846469a0df101f6e6a8e44ae7496baa

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Apr 29 04:23:11 2015 +0000

traceframework: Update commit id for version 1.1.1.6

- Fixes issue with parallel build

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 3211dea..e164428 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -5,9 +5,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/instrumentation/traceframework/COPY
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/traceframework.git;destsuffix=git/ti/instrumentation/traceframework;protocol=git;branch=${BRANCH}"
 
-# Below commit ID corresponds to DEV.TFWK-01.01.01.06A
-SRCREV = "bd87f53f4d12dc802bcc5609afb7994643e40cb9"
+# Below commit ID corresponds to DEV.TFWK-01.01.01.06B
+SRCREV = "6d29bc0d1ab6bb0658876552197dcdc757a25082"
 PV = "01.01.01.06"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 DEPENDS = "cuia"


