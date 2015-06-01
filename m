Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B132DE00A4B; Mon,  1 Jun 2015 07:23:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E74DE00992
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:23:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4E97852A08; Mon,  1 Jun 2015 14:23:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601142311.4E97852A08@arago-project.org>
Date: Mon,  1 Jun 2015 14:23:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : llvm-common: Extend to nativesdk class.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:23:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 02ca76d89456fc0073f1b3384c06494ac51d1498
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=02ca76d89456fc0073f1b3384c06494ac51d1498

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 16:52:16 2015 +0000

llvm-common: Extend to nativesdk class.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-core/llvm/llvm-common.bbappend |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/recipes-core/llvm/llvm-common.bbappend b/recipes-core/llvm/llvm-common.bbappend
new file mode 100644
index 0000000..ffe4dcb
--- /dev/null
+++ b/recipes-core/llvm/llvm-common.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-ti0"
+
+SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
+
+BBCLASSEXTEND += "nativesdk"


