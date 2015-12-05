Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEEC4E009BD; Fri,  4 Dec 2015 19:12:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB722E009C3
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:12:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0312352ABE; Sat,  5 Dec 2015 03:12:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205031210.0312352ABE@arago-project.org>
Date: Sat,  5 Dec 2015 03:12:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging-rt: update to the latest rev
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
X-List-Received-Date: Sat, 05 Dec 2015 03:12:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: e80e415dd7379ce2140fd18c84fc8e748e49c5ea
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e80e415dd7379ce2140fd18c84fc8e748e49c5ea

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec  5 04:15:17 2015 +0000

linux-ti-staging-rt: update to the latest rev

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
index 35c4910..2d20d4c 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
 
 BRANCH = "ti-rt-linux-4.1.y"
 
-SRCREV = "689b0790980be1cc3eb84e435c1bc87cd1e91458"
+SRCREV = "83a502a2d33fb047566f154be3f881809ab75514"


