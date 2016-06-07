Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61964E00C80; Tue,  7 Jun 2016 15:47:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D949AE00C49
	for <meta-ti@yoctoproject.org>; Tue,  7 Jun 2016 15:47:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0AC19529BF; Tue,  7 Jun 2016 22:47:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160607224738.0AC19529BF@arago-project.org>
Date: Tue,  7 Jun 2016 22:47:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README: update branch
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
X-List-Received-Date: Tue, 07 Jun 2016 22:47:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: b9c4f9f4670369ecf0094454d13f1268fd317e8a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b9c4f9f4670369ecf0094454d13f1268fd317e8a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun  7 18:47:20 2016 -0400

README: update branch

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/README b/README
index 61ed5a3..f5329cd 100644
--- a/README
+++ b/README
@@ -8,7 +8,7 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: krogoth
 
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto


