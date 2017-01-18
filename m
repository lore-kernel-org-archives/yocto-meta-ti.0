Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2258E009DF; Wed, 18 Jan 2017 15:55:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56D1AE009DA
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2017 15:55:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 751F052A46; Wed, 18 Jan 2017 23:55:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170118235500.751F052A46@arago-project.org>
Date: Wed, 18 Jan 2017 23:55:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README, layer.conf: update for morty and list dependencies
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
X-List-Received-Date: Wed, 18 Jan 2017 23:55:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: f3df43255cb6ddca1e7692f3d0171066f7d7d926
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f3df43255cb6ddca1e7692f3d0171066f7d7d926

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jan 17 01:51:34 2017 +0000

README, layer.conf: update for morty and list dependencies

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README          |    2 +-
 conf/layer.conf |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/README b/README
index 39dde59..1fa3771 100644
--- a/README
+++ b/README
@@ -8,7 +8,7 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: morty
 
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
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


