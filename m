Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D94F5E00A97; Mon, 10 Aug 2015 10:16:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 941A4E00A7B
	for <meta-ti@yoctoproject.org>; Mon, 10 Aug 2015 10:16:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5DCB252A98; Mon, 10 Aug 2015 17:16:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150810171632.5DCB252A98@arago-project.org>
Date: Mon, 10 Aug 2015 17:16:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap5-sgx-ddk-um-linux: Makefile doesn' t have clean target
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
X-List-Received-Date: Mon, 10 Aug 2015 17:16:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: d8b3f0f3a7ed6fed7457620c01ed678715e46ff9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d8b3f0f3a7ed6fed7457620c01ed678715e46ff9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 10 20:52:06 2015 +0000

omap5-sgx-ddk-um-linux: Makefile doesn't have clean target

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 2f3f6aa..83dfb1d 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -26,3 +26,5 @@ FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
 INHIBIT_PACKAGE_STRIP = "1"
 
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+
+CLEANBROKEN = "1"


