Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E48DCE0085D; Mon,  8 Sep 2014 07:49:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27C27E00814
	for <meta-ti@yoctoproject.org>; Mon,  8 Sep 2014 07:49:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5EDDA52A51; Mon,  8 Sep 2014 14:49:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140908144924.5EDDA52A51@arago-project.org>
Date: Mon,  8 Sep 2014 14:49:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : linux-ti-staging_3.14: make kernel origin configurable
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
X-List-Received-Date: Mon, 08 Sep 2014 14:49:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 169647d3dcb756b9d5399310383915a6193ebfd2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=169647d3dcb756b9d5399310383915a6193ebfd2

Author: Peter A. Bigot <pab@pabigot.com>
Date:   Fri Sep  5 18:34:43 2014 +0000

linux-ti-staging_3.14: make kernel origin configurable

Using variables for KERNEL_GIT_URI and KERNEL_GIT_PROTOCOL allows layer
bbappends to specify local repositories to test of pending changes that
are not available in the official TI kernel, without requiring
duplication of config fragments specified in SRC_URI in the base recipe.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 45dccef..cb6086a 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -59,7 +59,9 @@ KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFI
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
 
-SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
            file://defconfig \
            file://non-smp.cfg \
           "


