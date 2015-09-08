Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7333EE00D02; Tue,  8 Sep 2015 14:57:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3927CE00B6D
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 14:57:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F283252A02; Tue,  8 Sep 2015 21:57:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908215739.F283252A02@arago-project.org>
Date: Tue,  8 Sep 2015 21:57:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libdrm: remove unused patch
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
X-List-Received-Date: Tue, 08 Sep 2015 21:57:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a7da9f465624cf5b4fbb152a5d7a0c132f564c7e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a7da9f465624cf5b4fbb152a5d7a0c132f564c7e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 31 22:21:32 2015 +0000

libdrm: remove unused patch

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/drm/libdrm_2.4.41.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
index dc1fbe1..86a660e 100644
--- a/recipes-graphics/drm/libdrm_2.4.41.bb
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
 SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
 
 SRC_URI += "file://installtests-ti.patch \
-            file://GNU_SOURCE_definition.patch \
            "
 
 PR = "${INC_PR}.2"


