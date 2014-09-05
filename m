Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27362E0076C; Fri,  5 Sep 2014 05:35:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.230 listed in list.dnswl.org]
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E983E00744
	for <meta-ti@yoctoproject.org>; Fri,  5 Sep 2014 05:35:28 -0700 (PDT)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id nQbR1o00X1mTNtu01QbTvv; Fri, 05 Sep 2014 05:35:27 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: meta-ti@yoctoproject.org
Date: Fri,  5 Sep 2014 07:34:43 -0500
Message-Id: <1409920483-18151-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409920483-18151-1-git-send-email-pab@pabigot.com>
References: <1409920483-18151-1-git-send-email-pab@pabigot.com>
Subject: [PATCH] linux-ti-staging_3.14: make kernel origin configurable
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
X-List-Received-Date: Fri, 05 Sep 2014 12:35:33 -0000

Using variables for KERNEL_GIT_URI and KERNEL_GIT_PROTOCOL allows layer
bbappends to specify local repositories to test of pending changes that
are not available in the official TI kernel, without requiring
duplication of config fragments specified in SRC_URI in the base recipe.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 recipes-kernel/linux/linux-ti-staging_3.14.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.8.5.5


