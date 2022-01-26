Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21293.1643238558430842817
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DC65240C8E;
	Wed, 26 Jan 2022 23:09:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQ7uqBiwlbmd; Wed, 26 Jan 2022 23:09:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CAE6540CBF;
	Wed, 26 Jan 2022 23:09:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9257E17472B;
	Wed, 26 Jan 2022 18:09:16 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 3/7] meta-ti-extras: add sub-layer with extra components that don't belong to BSP
Date: Wed, 26 Jan 2022 18:09:06 -0500
Message-Id: <1643238550-20765-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238550-20765-1-git-send-email-denis@denix.org>
References: <1643238550-20765-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Add MIT license file for the metadata.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/COPYING.MIT     | 17 +++++++++++++++++
 meta-ti-extras/conf/layer.conf | 16 ++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-ti-extras/COPYING.MIT
 create mode 100644 meta-ti-extras/conf/layer.conf

diff --git a/meta-ti-extras/COPYING.MIT b/meta-ti-extras/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-ti-extras/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
new file mode 100644
index 0000000..9d809bf
--- /dev/null
+++ b/meta-ti-extras/conf/layer.conf
@@ -0,0 +1,16 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+METATIBASE := '${@os.path.normpath("${LAYERDIR}/")}'
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-ti-extras"
+BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-ti-extras = "6"
+
+LAYERSERIES_COMPAT_meta-ti-extras = "honister"
+
+LAYERDEPENDS_meta-ti-extras = " \
+    meta-ti-bsp \
+"
-- 
2.7.4

