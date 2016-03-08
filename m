Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49C34E00973; Tue,  8 Mar 2016 15:44:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9ED6BE00A7D
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 15:44:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 485AA52AD4; Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308234430.485AA52AD4@arago-project.org>
Date: Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : dspdce-fw: replace mkdir/cp with install
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
X-List-Received-Date: Tue, 08 Mar 2016 23:44:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ded818502ed122d495992b14c3c7ab383865869f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ded818502ed122d495992b14c3c7ab383865869f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Mar  9 04:37:41 2016 +0000

dspdce-fw: replace mkdir/cp with install

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dspdce-fw/dspdce-fw_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 6c6bb2a..3979ce9 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -48,8 +48,8 @@ do_compile() {
 TARGET = "dra7-dsp1-fw.xe66"
 
 do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}.${BPN}
+    install -d ${D}${base_libdir}/firmware
+    install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}.${BPN}
 }
 
 ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66"


