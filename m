Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 778F6E004A0; Wed, 18 Jan 2017 18:08:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57221E0033D
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2017 18:08:34 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 62FB7529CD; Thu, 19 Jan 2017 02:08:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170119020833.62FB7529CD@arago-project.org>
Date: Thu, 19 Jan 2017 02:08:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: list dependencies
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
X-List-Received-Date: Thu, 19 Jan 2017 02:08:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0482ce0092852b4b5ae07ed2d4558c92ce18bedb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0482ce0092852b4b5ae07ed2d4558c92ce18bedb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jan 19 06:52:43 2017 +0000

layer.conf: list dependencies

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4ad5022..a07e62f 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -10,6 +10,8 @@ BBFILE_PRIORITY_meta-ti = "6"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
+LAYERDEPENDS_meta-ti = "core"
+
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ti-sgx-ddk-km \
     ti-sgx-ddk-um \


