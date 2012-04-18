Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D27CE0140F
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:20:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9436352AA3; Wed, 18 Apr 2012 17:20:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418172030.9436352AA3@arago-project.org>
Date: Wed, 18 Apr 2012 17:20:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: include latest MUSB fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 17:20:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: da08d625f22063c4a49a16229a94b0b2492c90de
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=da08d625f22063c4a49a16229a94b0b2492c90de

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 17 14:47:45 2012 +0200

linux-ti33x-psp 3.2: include latest MUSB fixes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    2 +-
 recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh  |    3 +--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 605a324..0912875 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -2322,7 +2322,7 @@ CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_SMSCUFX=m
 CONFIG_FB_UDL=m
 CONFIG_FB_DA8XX=y
-CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=4
+CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=5
 # CONFIG_FB_VIRTUAL is not set
 # CONFIG_FB_METRONOME is not set
 # CONFIG_FB_BROADSHEET is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
index 5215d44..695eb41 100755
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
@@ -7,8 +7,7 @@ set -e
 # don't use builtin 'echo' from /bin/sh
 export ECHO="$(which echo)"
 
-#git tag -f beaglebone-v3.2 09e9651bcf2ee8d86685f2a8075bc6557b1d3b91
-git tag -f beaglebone-v3.2 88dcc46017b970660ff113c1bb4e7d832c5a3693
+git tag -f beaglebone-v3.2 e8004dad869568692ca2a45c04e8464ce48cc4d7
 
 TAG="beaglebone-v3.2"
 EXTRATAG=""
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 082c73c..1dad0fb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "88dcc46017b970660ff113c1bb4e7d832c5a3693"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+SRCREV = "e8004dad869568692ca2a45c04e8464ce48cc4d7"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


