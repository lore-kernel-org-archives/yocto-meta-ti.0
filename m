Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 240EAE0179A
	for <meta-ti@yoctoproject.org>; Tue, 29 Oct 2013 10:45:17 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5134752A66; Tue, 29 Oct 2013 17:45:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131029174516.5134752A66@arago-project.org>
Date: Tue, 29 Oct 2013 17:45:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update PM firmware for AM335x to 05.00.00.00
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
X-List-Received-Date: Tue, 29 Oct 2013 17:45:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 9f888be5ef30de5acf6cd479a3c0cc945ad1cdc9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9f888be5ef30de5acf6cd479a3c0cc945ad1cdc9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Oct 29 12:18:57 2013 -0400

am33x-cm3: update PM firmware for AM335x to 05.00.00.00

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Dave Gerlach <d-gerlach@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>
Cc: Russ Dill <Russ.Dill@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 9b36a9e..3be46b6 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "04.06.00.11"
-PR = "r4"
+PV = "05.00.00.00"
+PR = "r0"
 
-# SRCREV corresponds to tag "AM335xPSP_04.06.00.11"
-SRCREV = "750362868d914702086187096ec2c67b68eac101"
-BRANCH ?= "master"
+# SRCREV corresponds to the tip of next3 branch
+SRCREV = "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
+BRANCH ?= "next3"
 
 INITSCRIPT_NAME = "am335x-pm-firmware-load"
 INITSCRIPT_PARAMS = "defaults 96"


