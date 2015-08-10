Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C119E00A92; Mon, 10 Aug 2015 12:05:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5765E00A7D
	for <meta-ti@yoctoproject.org>; Mon, 10 Aug 2015 12:05:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E794452A7D; Mon, 10 Aug 2015 19:05:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150810190500.E794452A7D@arago-project.org>
Date: Mon, 10 Aug 2015 19:05:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : cuia: don't call clean from do_compile, do_configure takes care of that
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
X-List-Received-Date: Mon, 10 Aug 2015 19:05:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d49ed0e9ff8b3d378751d9473414be742f38d83b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d49ed0e9ff8b3d378751d9473414be742f38d83b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug 11 00:54:11 2015 +0000

cuia: don't call clean from do_compile, do_configure takes care of that

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cuia/cuia_1.0.0.13.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
index 42154d2..a9024d2 100644
--- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -13,7 +13,6 @@ S = "${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra}"
 
 do_compile () {
 	cd ${S}
-	oe_runmake clean
 	oe_runmake all
 }
 


