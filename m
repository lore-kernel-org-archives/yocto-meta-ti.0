Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B96BE00A9A; Mon,  9 Nov 2015 11:34:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A46ABE008A2
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 11:34:07 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 074BF52AA7; Mon,  9 Nov 2015 19:34:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151109193407.074BF52AA7@arago-project.org>
Date: Mon,  9 Nov 2015 19:34:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to the latest
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
X-List-Received-Date: Mon, 09 Nov 2015 19:34:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 62c61b925f73837c18f706fd5dd321d258bfde7b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=62c61b925f73837c18f706fd5dd321d258bfde7b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov  9 04:43:51 2015 +0000

linux-ti-staging: update to the latest

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 11e7acc..6e64b8b 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -54,11 +54,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "8a6bfa3c90407b6588ec58724b0f6c3eefbca8fc"
+SRCREV = "b9280daf1340ca5a21271d560df522215e7f2d73"
 PV = "4.1.12+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


