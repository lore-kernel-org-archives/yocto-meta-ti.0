Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 914E8E0070C
	for <meta-ti@yoctoproject.org>; Fri,  4 May 2012 01:32:13 -0700 (PDT)
Received: by werc12 with SMTP id c12so2200306wer.35
	for <meta-ti@yoctoproject.org>; Fri, 04 May 2012 01:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=8K0mIY4iWmZTtMw93sbWWwwGq3mrPQ/jVPictz1ZiZE=;
	b=PbOrwy7jEAiCA6ajDDJ9TZ1orDnpHue6P0RJK5uzrlYvdd/c5yG8bCooGszAsaz1lY
	VhHMI7+njgtKNNXRO1zfmJ/7YrlfaO5HUVcPhJWhqU+XauwI24l4JwTyURCRW/GpeF1R
	jctI4FwTknYoQJIQZDUL3kXgWfGAZI4G0QJFs2AuVL+uOWvisGVCfyHcbzpeprMEJPGp
	vugpKKCgFNkWG6miEWz9IdxAYxMUfo9crFSKCQCJe9097VMALM8pW1eX6kGZhSRXSRjU
	jEhydA7fGf6Zed0wLAzi1Det2twBdVynSXz3j6PAbCrsLM3g8wXOXSxICFatmL0U8XF7
	I42w==
Received: by 10.216.200.215 with SMTP id z65mr3265284wen.35.1336120332072;
	Fri, 04 May 2012 01:32:12 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm12738773wib.8.2012.05.04.01.32.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 01:32:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Fri,  4 May 2012 10:32:05 +0200
Message-Id: <1336120327-27181-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnCSzsTywMFNF0gfltqZySWUF8+AavPJ7AxTw00JLEltzNxtHQOY5Yi2K6CCG4A0Q9xEKa5
Cc: denys@ti.com
Subject: [PATCH 1/3] sdcard_image bbclass: make ext4 the default
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
X-List-Received-Date: Fri, 04 May 2012 08:32:14 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 classes/sdcard_image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
index 519bd9a..f9b8d46 100644
--- a/classes/sdcard_image.bbclass
+++ b/classes/sdcard_image.bbclass
@@ -19,7 +19,7 @@ LOOPDEV_FS ?= "/dev/loop3"
 SDIMG_SIZE ?= "444" 
 
 # FS type for rootfs
-ROOTFSTYPE ?= "ext3"
+ROOTFSTYPE ?= "ext4"
 
 BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
 BOOTPARTNAME ?= "${MACHINE}"
-- 
1.7.10


