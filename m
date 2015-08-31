Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1ABD2E00AC1; Mon, 31 Aug 2015 09:37:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 693F2E0071C
	for <meta-ti@yoctoproject.org>; Mon, 31 Aug 2015 09:37:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1CEC65297D; Mon, 31 Aug 2015 16:37:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150831163736.1CEC65297D@arago-project.org>
Date: Mon, 31 Aug 2015 16:37:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: add omapdrm-pvr and omap5-sgx-ddk-um-linux to ABI safe list
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
X-List-Received-Date: Mon, 31 Aug 2015 16:37:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 1a9fd1a2225dc62a6565a545975965ad20e952fb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1a9fd1a2225dc62a6565a545975965ad20e952fb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 31 22:31:39 2015 +0000

layer.conf: add omapdrm-pvr and omap5-sgx-ddk-um-linux to ABI safe list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index ac0c854..51da372 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -11,6 +11,8 @@ BBFILE_PRIORITY_meta-ti = "6"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
+    omapdrm-pvr \
+    omap5-sgx-ddk-um-linux \
     ti-ipc \
     cmem-mod \
     hplib-mod \


