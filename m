Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF672E00A5B; Tue, 11 Aug 2015 20:33:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01DDDE00947
	for <meta-ti@yoctoproject.org>; Tue, 11 Aug 2015 20:33:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A719552A67; Wed, 12 Aug 2015 03:33:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150812033327.A719552A67@arago-project.org>
Date: Wed, 12 Aug 2015 03:33:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : cuia: revert to clean in do_compile, disable automatic in do_configure
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
X-List-Received-Date: Wed, 12 Aug 2015 03:33:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f8feacf2d2a2e8948a5aeac109f3f2e8deaf7255
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f8feacf2d2a2e8948a5aeac109f3f2e8deaf7255

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Aug 12 06:13:22 2015 +0000

cuia: revert to clean in do_compile, disable automatic in do_configure

Need to unconditionally clean the sources before building the first time,
due to wrong binaries present. But calling clean twice also causes failure.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cuia/cuia_1.0.0.13.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
index a9024d2..e048f6a 100644
--- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -11,8 +11,11 @@ SRC_URI[cuia.sha256sum] = "f16d138a9146fdc7d52cba77bd30596da65835f6ffe4092baf2b3
 
 S = "${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra}"
 
+CLEANBROKEN = "1"
+
 do_compile () {
 	cd ${S}
+	oe_runmake clean
 	oe_runmake all
 }
 


