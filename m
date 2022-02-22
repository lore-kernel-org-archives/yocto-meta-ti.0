Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8942.1645503242845999926
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4DCB940C5D
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mlaX0IykTAL for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 40F7940C30
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 131B317476D
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 02/17] meta-ti: add MIT license file for the metadata and basic README
Date: Tue, 22 Feb 2022 04:13:46 +0000
Message-Id: <20220222041401.2840172-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 COPYING.MIT | 17 +++++++++++++++++
 README      |  4 ++++
 2 files changed, 21 insertions(+)
 create mode 100644 COPYING.MIT
 create mode 100644 README

diff --git a/COPYING.MIT b/COPYING.MIT
new file mode 100644
index 00000000..fb950dc6
--- /dev/null
+++ b/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a =
copy=20
+of this software and associated documentation files (the "Software"), to=
 deal=20
+in the Software without restriction, including without limitation the ri=
ghts=20
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sel=
l=20
+copies of the Software, and to permit persons to whom the Software is=20
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included =
in=20
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR=20
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,=
=20
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE=20
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER=20
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING =
FROM,=20
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS I=
N=20
+THE SOFTWARE.
diff --git a/README b/README
new file mode 100644
index 00000000..204966ac
--- /dev/null
+++ b/README
@@ -0,0 +1,4 @@
+Collection of layers for the OE-core universe
+
+Please see the respective READMEs in the layer subdirectories
+
--=20
2.25.1

