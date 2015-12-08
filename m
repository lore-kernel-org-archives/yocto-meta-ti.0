Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 335C8E00AF4; Mon,  7 Dec 2015 20:16:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8192AE00AAF
	for <meta-ti@yoctoproject.org>; Mon,  7 Dec 2015 20:16:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C2E8F52A0D; Tue,  8 Dec 2015 04:16:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151208041603.C2E8F52A0D@arago-project.org>
Date: Tue,  8 Dec 2015 04:16:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: add ti-rpc-rtos to ABI safe list
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
X-List-Received-Date: Tue, 08 Dec 2015 04:16:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: b1f907ef92f0c68413c88f45303bf3c70f0b2b45
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b1f907ef92f0c68413c88f45303bf3c70f0b2b45

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Dec  8 10:07:35 2015 +0000

layer.conf: add ti-rpc-rtos to ABI safe list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 51da372..1172503 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,6 +14,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     omapdrm-pvr \
     omap5-sgx-ddk-um-linux \
     ti-ipc \
+    ti-ipc-rtos \
     cmem-mod \
     hplib-mod \
     gdbserverproxy-module-drv \


