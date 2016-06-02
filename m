Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04A0AE00C18; Wed,  1 Jun 2016 20:56:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0B5DE00BCE
	for <meta-ti@yoctoproject.org>; Wed,  1 Jun 2016 20:56:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9DC0952A93; Thu,  2 Jun 2016 03:56:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160602035600.9DC0952A93@arago-project.org>
Date: Thu,  2 Jun 2016 03:56:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : cm3-pm-firmware: correct license to TI-TSPA
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
X-List-Received-Date: Thu, 02 Jun 2016 03:56:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 58bebcf6b3df2b03997c41ec8356c1ae8ac90bb8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=58bebcf6b3df2b03997c41ec8356c1ae8ac90bb8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jun  2 09:16:24 2016 +0000

cm3-pm-firmware: correct license to TI-TSPA

It was incorrectly identified as BSD-3-Clause

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb |    2 +-
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
index 2f55421..62aebb9 100644
--- a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.0"
diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 3b64be9..7d4626b 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.1"


