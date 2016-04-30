Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A3E2E00D33; Fri, 29 Apr 2016 18:33:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63F88E00CED
	for <meta-ti@yoctoproject.org>; Fri, 29 Apr 2016 18:33:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A586C52004; Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160430013317.A586C52004@arago-project.org>
Date: Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-cgt-pru: suppress already stripped warning
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
X-List-Received-Date: Sat, 30 Apr 2016 01:33:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3b6b0b7d2f5349d8b1d447cd798b66e8e4ee3f9f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3b6b0b7d2f5349d8b1d447cd798b66e8e4ee3f9f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr 30 05:53:43 2016 +0000

ti-cgt-pru: suppress already stripped warning

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-cgt-pru_2.1.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
index 3cffd24..049682f 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
@@ -40,6 +40,6 @@ FILES_${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
                    ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
 "
 
-INSANE_SKIP_${PN} += "arch staticdev"
+INSANE_SKIP_${PN} += "arch staticdev already-stripped"
 
 BBCLASSEXTEND = "native nativesdk"


