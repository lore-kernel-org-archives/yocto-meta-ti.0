Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A0B9E009C3; Mon, 19 Oct 2015 14:11:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EFBFE0059B
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 05BA152AB3; Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211147.05BA152AB3@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : traceframework: Update to new version 1.1.1.7
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: d9ca44c4fcb620aac82e05b4bf6aded03575d1ff
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d9ca44c4fcb620aac82e05b4bf6aded03575d1ff

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:36:15 2015 +0000

traceframework: Update to new version 1.1.1.7

-Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index e164428..50989af 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/instrumentation/traceframework/COPY
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/traceframework.git;destsuffix=git/ti/instrumentation/traceframework;protocol=git;branch=${BRANCH}"
 
-# Below commit ID corresponds to DEV.TFWK-01.01.01.06B
-SRCREV = "6d29bc0d1ab6bb0658876552197dcdc757a25082"
-PV = "01.01.01.06"
-PR = "r1"
+# Below commit ID corresponds to DEV.TFWK-01.01.01.07
+SRCREV = "8d9c0e3a5bcb43aad98a794c31f42b652c6b3b53"
+PV = "01.01.01.07"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 DEPENDS = "cuia"


