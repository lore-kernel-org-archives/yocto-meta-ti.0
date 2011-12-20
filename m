Return-Path: <kergoth@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8879E006B5
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 10:16:40 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by iapp10 with SMTP id p10so14355726iap.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=S882py6+Qp/gFlWkT9wNwTtdXPOS6H0FqfW4CrrKWVk=;
	b=GwHJnv+t1PM/XbVG38xvjJCWMADje73nJwkryPjYlAXDKCxepB/9UzCmgIh0hgKP9K
	+eVV8DhHtjOctok1BREbSo5X8PRUC/CXNz4kY8hiGbVwEN4iQD7nZOlfJt7/NT/eGChL
	2oxNkI+TkLOalLF6raLLxeqmPUibhXdnCVGy8=
Received: by 10.42.137.197 with SMTP id z5mr2900775ict.5.1324405000290;
	Tue, 20 Dec 2011 10:16:40 -0800 (PST)
Received: from [192.168.1.112] (ip24-251-167-38.ph.ph.cox.net. [24.251.167.38])
	by mx.google.com with ESMTPS id x18sm7470425ibi.2.2011.12.20.10.16.33
	(version=SSLv3 cipher=OTHER); Tue, 20 Dec 2011 10:16:35 -0800 (PST)
Message-ID: <4EF0D0FC.2050201@gmail.com>
Date: Tue, 20 Dec 2011 11:16:28 -0700
From: Christopher Larson <kergoth@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: [PATCH] linux.inc: don't choke on missing defconfig in lzop dep
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
X-List-Received-Date: Tue, 20 Dec 2011 18:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

When a recipe is being parsed which will be skipped due to an incompatible
machine, no local defconfig will exist for the current machine. It seems 
that
the fetch localpath code doesn't error in that case, so we need to check for
an IOError on the attempted open. Without this, we can hit parse errors.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
  recipes-kernel/linux/linux.inc |   15 ++++++++++-----
  1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index e8a754f..6996283 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -269,9 +269,14 @@ python () {
      try:
          defconfig = bb.fetch2.localpath('file://defconfig', d)
      except bb.fetch2.FetchError:
-        pass
-    else:
-        if 'CONFIG_KERNEL_LZO=y\n' in open(defconfig).readlines():
-            depends = d.getVar('DEPENDS', False)
-            d.setVar('DEPENDS', depends + ' lzop-native')
+        return
+
+    try:
+        configfile = open(defconfig)
+    except IOError:
+        return
+
+    if 'CONFIG_KERNEL_LZO=y\n' in configfile.readlines():
+        depends = d.getVar('DEPENDS', False)
+        d.setVar('DEPENDS', depends + ' lzop-native')
  }
-- 
1.7.8


