Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2BE5E009A6; Tue, 28 Apr 2015 15:31:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F751E009AA
	for <meta-ti@yoctoproject.org>; Tue, 28 Apr 2015 15:31:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5F96852A96; Tue, 28 Apr 2015 22:31:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150428223148.5F96852A96@arago-project.org>
Date: Tue, 28 Apr 2015 22:31:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : hplib: Update to new version 1.1.0.5
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
X-List-Received-Date: Tue, 28 Apr 2015 22:31:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: dc1a5ab13edbf8261fb1f1ae1b45f79e599f86b1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dc1a5ab13edbf8261fb1f1ae1b45f79e599f86b1

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Apr 28 20:14:28 2015 +0000

hplib: Update to new version 1.1.0.5

- Fixes issues with parallel builds

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hplib/hplib.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index 99254d1..de5b2b7 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -5,6 +5,6 @@ DEVICELIST = "k2h k2k k2l k2e"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/hplib.git;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.04"
-SRCREV = "89d847bb8155f5727867d82f96978f89ea0a7d13"
-PV = "01.01.00.04"
+# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.05"
+SRCREV = "97c2ce177c78c0f7a861c8dc9ac10657d85eae36"
+PV = "01.01.00.05"


