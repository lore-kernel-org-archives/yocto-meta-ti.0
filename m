Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB132E00524; Mon, 23 Jun 2014 15:04:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE820E003D2
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:04:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8D8C252A5D; Mon, 23 Jun 2014 22:04:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623220449.8D8C252A5D@arago-project.org>
Date: Mon, 23 Jun 2014 22:04:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Scott Ellis : gstreamer-ti: Break packages into dev and staticdev
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
X-List-Received-Date: Mon, 23 Jun 2014 22:04:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: e10d7fe4e9ec13178574d0b565b2cd2f67ad884f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e10d7fe4e9ec13178574d0b565b2cd2f67ad884f

Author: Scott Ellis <scott@jumpnowtek.com>
Date:   Sat Jun 14 04:34:05 2014 +0000

gstreamer-ti: Break packages into dev and staticdev

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/gstreamer-ti/gstreamer-ti.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index cb03266..2c503f5 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -141,7 +141,8 @@ RRECOMMENDS_${PN}_append_omapl137  += "ti-codecs-omapl137-server ti-cmem-module
 RRECOMMENDS_${PN}_append_omapl138  += "ti-codecs-omapl138-server ti-cmem-module ti-dsplink-module"
 
 FILES_${PN}     += "${libdir}/gstreamer-0.10/*.so ${sysconfdir} ${installdir} ${base_libdir}/systemd"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-0.10/*.la"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 
 pkg_postinst_${PN} () {


