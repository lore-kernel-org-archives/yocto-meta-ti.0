Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5902DE010A7; Thu, 25 Aug 2016 11:13:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E86EE00DE6
	for <meta-ti@yoctoproject.org>; Thu, 25 Aug 2016 11:13:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A75F152A13; Thu, 25 Aug 2016 18:13:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160825181342.A75F152A13@arago-project.org>
Date: Thu, 25 Aug 2016 18:13:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README: add note about list subscription
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
X-List-Received-Date: Thu, 25 Aug 2016 18:13:46 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f09eabd840fb5e8607e748311f65f5b0675a41c7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f09eabd840fb5e8607e748311f65f5b0675a41c7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Aug 25 23:09:05 2016 +0000

README: add note about list subscription

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/README b/README
index 61ed5a3..39dde59 100644
--- a/README
+++ b/README
@@ -19,5 +19,7 @@ Please follow the recommended setup procedures of your OE distribution.
 
 
 Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
+Please note - meta-ti mailing list requires subscription for posting:
+https://lists.yoctoproject.org/listinfo/meta-ti
 
 Maintainers: Denys Dmytriyenko <denys@ti.com>


