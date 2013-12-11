Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39509E007D7
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 15:49:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 30FCA5299B; Wed, 11 Dec 2013 23:49:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131211234946.30FCA5299B@arago-project.org>
Date: Wed, 11 Dec 2013 23:49:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update to v05.00.00.01 version
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
X-List-Received-Date: Wed, 11 Dec 2013 23:49:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 1738b8b57267a16c277f798f3ac5d4d8af859828
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1738b8b57267a16c277f798f3ac5d4d8af859828

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Dec 11 13:28:23 2013 -0500

am33x-cm3: update to v05.00.00.01 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index cfde2cf..260db16 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "05.00.00.00"
-PR = "r1"
+PV = "05.00.00.01"
+PR = "r0"
 
-# SRCREV corresponds to tag v05.00.00.00
-SRCREV = "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
+# SRCREV corresponds to tag v05.00.00.01
+SRCREV = "40cb75b9dd9ba15c6de1c15cbb7cce8f1a6588b8"
 BRANCH ?= "master"
 
 INITSCRIPT_NAME = "am335x-pm-firmware-load"


