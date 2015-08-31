Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DCD6E00D7B; Mon, 31 Aug 2015 09:21:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 634ECE00D3F
	for <meta-ti@yoctoproject.org>; Mon, 31 Aug 2015 09:21:50 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTY00ADXG3XS2J0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 31 Aug 2015 11:21:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=uRRa74qj2VoA:10 a=sozttTNsAAAA:8
	a=jz_4X8Q-Qy1xd-QYncoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 87F8F161BC7;	Mon,
	31 Aug 2015 12:21:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 31 Aug 2015 12:21:32 -0400
Message-id: <1441038092-22505-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] libdrm: remove unused patch
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
X-List-Received-Date: Mon, 31 Aug 2015 16:21:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/drm/libdrm_2.4.41.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
index 0150632..0d0a5c2 100644
--- a/recipes-graphics/drm/libdrm_2.4.41.bb
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
 SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
 
 SRC_URI += "file://installtests-ti.patch \
-            file://GNU_SOURCE_definition.patch \
            "
 
 PR = "${INC_PR}.1"
-- 
2.2.0


