Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C4E0E00E0A; Wed, 11 Sep 2019 09:15:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.180 listed in list.dnswl.org]
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56CB9E00E07
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 09:15:37 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id y22so13994536pfr.3
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zmSVg7HCWL9FdbaKTCgiLs3IhAQtM5mpT1ZnqxADmFw=;
	b=JZf8ei173ZeRUir0JQvKvZGBv/3jsSfO+gaKLAKKQgOjcUczTlwmUnhtHHCGPxPT24
	LhY36MfAxjnNIpuDFwuXMayPtgiZu8FxXNTAxO5wkpxTeF7f0XjtlqX+Rb3lAGqmqe/8
	5ngndtrkSvSFDpWuIlR+Ck9YaEqqmYWp0+ASt12EkgyOi+UEGQbWk5xcxQnSfeJquBI1
	ClmrFsDrtSNbx8AGHB5yGxYW351LQyzc2jI+ZcWBZ4IAJnIABArdkd0n5me0VJpCVAnK
	tgYKEBXOdPcADUclomIAr7D5TDDigR/CsaHmn1owpRmv0PyntbMkkK1LYg0NuYJpE9Wa
	xvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zmSVg7HCWL9FdbaKTCgiLs3IhAQtM5mpT1ZnqxADmFw=;
	b=mZUsDGBI7/Jlbuv5Rmod3NeGnex68a+PYXhEkPbnlvuO7rd/Kar5Jn16YEYgfQ0QaZ
	1I/ocNcoo2ureoin8d9wF9VUMS2Q6dY34AccuHkDNnqttEksEsJITL7+GFKP8rDFd+E5
	P1l0YlmA8RC/7MUusU7qS81UiX1DF5lW6c2z+IYcATc14pAFmYC1bb6BF6ST2Nc/Azgp
	bgfRPNuZcwbmwAcjMW6qt/6mAVF3w6sYSMLY/CNL0RUE7kTOZw0zfz23PfarYiUVtNa+
	sgzgoVS0vJJDUNrkOJkpUXweksfBLbYOSlaM9SaMRYbzyQ1eERpm5bqOY1ll1SbWU/B9
	/qCQ==
X-Gm-Message-State: APjAAAU5KC9qj3LiGBgLwS1E5DmCc8ZlRu6QpPulxVsTROWE1WPSi9kG
	DLZyNibWVr1BjDRgjU/IiMCPUB82vq8=
X-Google-Smtp-Source: APXvYqzjHXBJ4gNGeepliNINT2AqUK2wmzKMDjcWgdr48epcW0eAIhjWey6iiBsrnCsWJLDrQT9ECw==
X-Received: by 2002:a63:e70f:: with SMTP id b15mr33607301pgi.152.1568218535997;
	Wed, 11 Sep 2019 09:15:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k22sm4819091pfa.87.2019.09.11.09.15.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 09:15:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Sep 2019 09:15:24 -0700
Message-Id: <20190911161524.2780057-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] ti-unpack: Simplify the logic to detect 32bit glibc on build host
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
X-List-Received-Date: Wed, 11 Sep 2019 16:15:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/includes/ti-unpack.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index 81fcf6a6..828f3d5a 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -20,10 +20,7 @@ python ti_bin_do_unpack() {
     import os
 
     # InstallJammer requires 32bit version of glibc
-    lib32path = '/lib'
-    if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path.islink('/lib') or os.path.exists('/lib32')):
-        lib32path = '/lib32'
-    if not os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('%s/i386-linux-gnu/libc.so.6' % lib32path):
+    if not os.path.exists('/lib/ld-linux.so.2'):
         bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
 
     localdata = bb.data.createCopy(d)
-- 
2.23.0


