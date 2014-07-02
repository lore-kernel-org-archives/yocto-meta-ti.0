Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 082CFE00799; Wed,  2 Jul 2014 13:03:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A4DDE00708
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6258D52A80; Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200326.6258D52A80@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ash Charles : Conditionally set ${TOOLCHAIN_PATH} used by some recipes
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 4e17ed6921720f6ee999eee65169691766d4eab6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4e17ed6921720f6ee999eee65169691766d4eab6

Author: Ash Charles <ashcharles@gmail.com>
Date:   Sat Jun 28 01:03:01 2014 +0000

Conditionally set ${TOOLCHAIN_PATH} used by some recipes

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/includes/ti-paths.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 511b5ae..4e6227e 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -1,5 +1,6 @@
 installdir = "${datadir}/ti"
 
+export TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
 # This is where do_install will put it
 export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
 export BIOS_INSTALL_DIR_RECIPE       = "${installdir}/ti-dspbios-tree"


