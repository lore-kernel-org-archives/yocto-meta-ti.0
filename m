Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1EE4E0030B
	for <meta-ti@yoctoproject.org>; Mon, 12 Mar 2012 02:28:08 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so3048928wib.11
	for <meta-ti@yoctoproject.org>; Mon, 12 Mar 2012 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=JZehGz1ADezsvsS3dNXEMNzddDHrkMbAP1SWXW6A3Mw=;
	b=jaYJ9JAM98kfk+V7+7KDBfrgBEuT1idkxSNV1zXgULWG6KRTddxgcT6e+9lR/UGfYX
	Ib0txRRQP9XiDrAwsnEHIfgB75SqWUIvk4SHDC59bi4C0hrkJH3BMesPhqjOUD8dBGED
	/jKCGjiW3UMO2y5TfTlH0hybLrljxNXhCY1Uw0tn1c/POLLnW/Y5bharyB1LFebTzuHL
	jPph/pE8GRA5uwASnIuEg87eUkSyxH9Fq0hJxg9jBLAIwwcoyO1Ro85LpSpAtsfUg3Gk
	+aXam83f5vUMy9nSG4fAahiRy/M3rXwR0If7dcOJ8ijsme7k2HARFw8r1a5AnUi2+arv
	8ehw==
Received: by 10.216.134.136 with SMTP id s8mr6898095wei.6.1331544487747;
	Mon, 12 Mar 2012 02:28:07 -0700 (PDT)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id t20sm55777218wiv.0.2012.03.12.02.28.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Mar 2012 02:28:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Mon, 12 Mar 2012 10:28:05 +0100
Message-Id: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] ti-eula-unpack: throw error message in case 32bit-glibc is missing
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Mar 2012 09:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

TI installation tool requires 32bit glibc [1]

[1] https://lists.yoctoproject.org/pipermail/meta-ti/2012-January/000357.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-ti/includes/ti-eula-unpack.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index 7c6e7b7..310d19f 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -19,6 +19,14 @@ python ti_bin_do_unpack() {
 
     import os
 
+    # InstallJammer requires 32bit version of glibc
+    lib32path = '/lib'
+    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
+       lib32path = '/lib32'
+    if not os.path.exists('%s/libc.so.6' % lib32path):
+	raise bb.build.FuncFailed, \
+        "\nTI installer requires 32bit glibc libraries for proper operation e.g on Fedora run 'yum install glibc.i686'"
+
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
 
-- 
1.7.6.5


