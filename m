Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CC0CE0090F; Fri,  9 Jan 2015 11:50:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8774E0080C
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 11:50:44 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7C2F852A2B; Fri,  9 Jan 2015 19:50:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150109195043.7C2F852A2B@arago-project.org>
Date: Fri,  9 Jan 2015 19:50:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : setup-defconfig: fix bashism
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
X-List-Received-Date: Fri, 09 Jan 2015 19:50:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b9031f04a38451cd14f7acc42db2a802723acd17
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b9031f04a38451cd14f7acc42db2a802723acd17

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jan 10 01:13:19 2015 +0000

setup-defconfig: fix bashism

Reported by Francesco Del Degan

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/setup-defconfig.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 7468929..2c169cd 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -37,7 +37,7 @@ do_configure() {
                 exit 1
             else
                 # Sanitize config fragment files to be relative to sources
-                configfrags+=" ${S}/$f"
+                configfrags="$configfrags ${S}/$f"
             fi
         done
     fi


