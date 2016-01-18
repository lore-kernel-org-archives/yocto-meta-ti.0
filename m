Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 607BBE008BB; Mon, 18 Jan 2016 09:44:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EAD8E00803
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 09:44:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BD56152993; Mon, 18 Jan 2016 17:44:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160118174442.BD56152993@arago-project.org>
Date: Mon, 18 Jan 2016 17:44:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omap5-sgx-ddk-um-linux: bump SRCREV for AM57x/ DRA7xx to the latest DDK UM
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
X-List-Received-Date: Mon, 18 Jan 2016 17:44:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7d70637ea1448aeafc8de0679ab3d630456a7d45
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7d70637ea1448aeafc8de0679ab3d630456a7d45

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Fri Dec 11 15:19:18 2015 +0000

omap5-sgx-ddk-um-linux: bump SRCREV for AM57x/DRA7xx to the latest DDK UM

* Resolve SGX HWrecovery when Wayland OpenGLES clients are killed
* Enable screenshots in Weston
* Resolve SGX HWrecovery with glmark2 benchmark
* Resolve rendering issues with half float textures

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 8b032e3..dfd22d0 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -10,7 +10,7 @@ BRANCH_ti33x = "am3/k4.1"
 BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
+SRCREV_omap-a15 = "b6801bf89e00d69893c2957455bbeb3195c0ed52"
 SRCREV_ti33x    = "84ae5444c7cbc3f4c65a226b9fea62d4a513f3e0"
 SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
 


