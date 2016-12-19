Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17E44E00D69; Mon, 19 Dec 2016 15:15:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F972E00CCD
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 68DBE52AC8; Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231547.68DBE52AC8@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ti-xdctools: Upstream version 3.32.01.22
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
X-List-Received-Date: Mon, 19 Dec 2016 23:15:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 06340aca216a43cad0ef175cccb0c0ab9e5c4bfa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=06340aca216a43cad0ef175cccb0c0ab9e5c4bfa

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:34 2016 +0000

ti-xdctools: Upstream version 3.32.01.22

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ols_3.32.00.06.bb => ti-xdctools_3.32.01.22.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
similarity index 51%
rename from recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
rename to recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
index 19bbe5d..5f379c1 100644
--- a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
@@ -1,9 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_32_00_06"
+PV = "3_32_01_22"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
 
-SRC_URI[xdczip.md5sum] = "93127f4c2f35d94b6c8e5a52b79c38ae"
-SRC_URI[xdczip.sha256sum] = "d6f38a7f846ae4b1478554d75fc5f72cf677a1e2f348e214a725d1e849bd39c7"
+SRC_URI[xdczip.md5sum] = "ddae5b765ca62783c1e804c75c463c38"
+SRC_URI[xdczip.sha256sum] = "b1c6620ef0b8eac45ef6a587f93b3238bdcf3b02dfd7e4b40d872a45c02c5cdc"


