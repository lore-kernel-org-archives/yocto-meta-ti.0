Return-Path: <pabigot@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFB31E0132F
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 11:01:41 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yenm6 with SMTP id m6so2127726yen.35
	for <meta-ti@yoctoproject.org>; Wed, 09 Nov 2011 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Pzu4j+MDAhvu98W/hmfKg2jq65TGwlmLgSSu6kxHtcs=;
	b=qkjthAiDfp0m1FZVXx6eBPv6DdFz4B+JO6Qv8qicLBQNDfJBfU2qPYmt3pOAxr5gHl
	5N5PiNPHWEm202BuzT8iDhDkWi1Jlv7cD/HTZT2aQI82r8kQn7QgnpBuRmbiq5Cjnmw8
	LqqPw5XFoxQ/toBRhyCixzaxo3YzxSmoP9Ut0=
Received: by 10.50.6.202 with SMTP id d10mr4562442iga.31.1320864802815;
	Wed, 09 Nov 2011 10:53:22 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id a6sm4406943igc.3.2011.11.09.10.53.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 10:53:21 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Wed,  9 Nov 2011 12:52:54 -0600
Message-Id: <1320864774-11603-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
X-Mailman-Approved-At: Wed, 09 Nov 2011 11:05:00 -0800
Subject: sdcard_image: add dependency on native ext2 utilities
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
X-List-Received-Date: Wed, 09 Nov 2011 19:01:42 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 classes/sdcard_image.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index f7251f5..531b419 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -3,6 +3,9 @@ inherit image
 # Add the fstypes we need
 IMAGE_FSTYPES_append = " tar.bz2 sdimg"
 
+# Ensure required utilities are present
+IMAGE_DEPENDS_sdimg = "genext2fs-native e2fsprogs-native"
+
 # Change this to match your host distro
 LOSETUP ?= "/sbin/losetup"
 
-- 
1.7.6.4


