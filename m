Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26070E77196
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:07 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.139695.1734645244797064519
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DK9kAy9e;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3UP064253
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645243;
	bh=k6aaK9R7bwC21EXQhpldgvf2GVPil63DqCiB6lB6nRI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DK9kAy9e2EO5Q0szkvLv9sUpl3gEFFrRJOkUIFh2zVImS79695+NcJ695UMYEAveM
	 sAEL/+tj9qTcyibLV/RWO8bKX6s0q/MqG0uNtwKSt0Y7uAE1+38BVshF/AN1rWZ0T2
	 bjmO4iIJ83n+mmz1H2tKr1AzcePAZtrgRTf7zqQ4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3SB130282
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:02 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs2jR017384;
	Thu, 19 Dec 2024 15:54:02 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT4-0007U8-MM; Thu, 19 Dec 2024 15:54:02 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 02/13] meta-beagle: create a separate layer for Beagle platforms
Date: Thu, 19 Dec 2024 15:53:51 -0600
Message-ID: <20241219215402.28324-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18152

From: Denys Dmytriyenko <denys@konsulko.com>

The new meta-beagle will host all supported Beagle platforms that
use TI SoCs and hence need to depend on meta-ti-bsp. The default
BSP for the platforms in this layer will use BeagleBoard.org
official trees for the Linux kernel and U-boot.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 {meta-ti-extras => meta-beagle}/COPYING.MIT | 24 ++++++++++-----------
 {meta-ti-extras => meta-beagle}/README      | 10 ++++-----
 meta-beagle/conf/layer.conf                 | 15 +++++++++++++
 3 files changed, 32 insertions(+), 17 deletions(-)
 copy {meta-ti-extras => meta-beagle}/COPYING.MIT (86%)
 copy {meta-ti-extras => meta-beagle}/README (82%)
 create mode 100644 meta-beagle/conf/layer.conf

diff --git a/meta-ti-extras/COPYING.MIT b/meta-beagle/COPYING.MIT
similarity index 86%
copy from meta-ti-extras/COPYING.MIT
copy to meta-beagle/COPYING.MIT
index fb950dc6..89de3547 100644
--- a/meta-ti-extras/COPYING.MIT
+++ b/meta-beagle/COPYING.MIT
@@ -1,17 +1,17 @@
-Permission is hereby granted, free of charge, to any person obtaining a copy 
-of this software and associated documentation files (the "Software"), to deal 
-in the Software without restriction, including without limitation the rights 
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-copies of the Software, and to permit persons to whom the Software is 
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
-The above copyright notice and this permission notice shall be included in 
+The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
diff --git a/meta-ti-extras/README b/meta-beagle/README
similarity index 82%
copy from meta-ti-extras/README
copy to meta-beagle/README
index c6c058e0..a17e6433 100644
--- a/meta-ti-extras/README
+++ b/meta-beagle/README
@@ -1,4 +1,4 @@
-OpenEmbedded/Yocto layer that extends and supplements Texas Instruments BSP layer.
+OpenEmbedded/Yocto layer that extends meta-ti-bsp with BeagleBoard.org platforms.
 
 It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with the
 source repository at git://git.yoctoproject.org/meta-ti
@@ -8,14 +8,14 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: scarthgap
+branch: master
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: scarthgap
+branch: master
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: scarthgap
+branch: master
 revision: HEAD
 layers: meta-ti-bsp
 
@@ -27,5 +27,5 @@ Please note - meta-ti mailing list requires subscription for posting:
 https://lists.yoctoproject.org/g/meta-ti
 
 Maintainers:
-Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
+Ryan Eatmon <reatmon@ti.com>
diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
new file mode 100644
index 00000000..0dac4946
--- /dev/null
+++ b/meta-beagle/conf/layer.conf
@@ -0,0 +1,15 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-beagle"
+BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-beagle = "6"
+
+LAYERSERIES_COMPAT_meta-beagle = "scarthgap"
+
+LAYERDEPENDS_meta-beagle = " \
+    meta-ti-bsp \
+"
-- 
2.17.1


