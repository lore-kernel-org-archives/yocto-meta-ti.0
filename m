Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4889E00E4B; Wed, 13 Apr 2016 13:53:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E06B3E00833
	for <meta-ti@yoctoproject.org>; Wed, 13 Apr 2016 13:53:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B2CBD529AD; Wed, 13 Apr 2016 20:53:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160413205302.B2CBD529AD@arago-project.org>
Date: Wed, 13 Apr 2016 20:53:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-softhsmv2: don't fail QA on real . so plugin in -dev pkg
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
X-List-Received-Date: Wed, 13 Apr 2016 20:53:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 12fbf1a37424f1cabd06dc993bf8921fd06f93d1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=12fbf1a37424f1cabd06dc993bf8921fd06f93d1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 14 02:25:58 2016 +0000

ti-softhsmv2: don't fail QA on real .so plugin in -dev pkg

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index 3143acd..a863c3a 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -39,6 +39,8 @@ FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
 FILES_${PN}-staticdev += "${libdir}/softhsm/*.a "
 FILES_${PN}-dev += "${libdir}/softhsm/*.la ${libdir}/softhsm/lib*.so"
 
+INSANE_SKIP_${PN}-dev = "dev-elf"
+
 do_install_append() {
 	install -d ${D}${mntdir}/securedbv0
 	install -d ${D}${mntdir}/securedbv1


