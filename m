Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 599E4E00CB5; Fri, 28 Aug 2015 17:04:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10F8CE00CA6
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 17:04:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2204752A67; Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150829000430.2204752A67@arago-project.org>
Date: Sat, 29 Aug 2015 00:04:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : libdrm: add ti33x and ti43x to COMPATIBLE_MACHINE
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
X-List-Received-Date: Sat, 29 Aug 2015 00:04:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 62fe901541cd5ec269bcb962499fde040146e414
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=62fe901541cd5ec269bcb962499fde040146e414

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Fri Aug 28 09:16:09 2015 +0000

libdrm: add ti33x and ti43x to COMPATIBLE_MACHINE

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/drm/libdrm_2.4.41.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
index 0150632..dc1fbe1 100644
--- a/recipes-graphics/drm/libdrm_2.4.41.bb
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -2,7 +2,7 @@ require recipes-graphics/drm/libdrm.inc
 
 FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -15,6 +15,6 @@ SRC_URI += "file://installtests-ti.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/git"


