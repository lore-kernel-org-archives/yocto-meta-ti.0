Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63D87E01472
	for <meta-ti@yoctoproject.org>; Tue, 22 Jan 2013 14:41:06 -0800 (PST)
Received: by mail-ie0-f175.google.com with SMTP id qd14so12673294ieb.34
	for <meta-ti@yoctoproject.org>; Tue, 22 Jan 2013 14:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=VzvXPddnL0YwhS0EB5r9mIMyIdcL4GeACDdJ11eiBR8=;
	b=jgFt9KXja4E6N8qJuKzXZVRMgee0mqJRbCpKFT+3NqtnmC1zNj7/wFRcukI4stU6O2
	dojrGoYsWiSXti/WvAOP+RskCWJhRoHdA4iUIsSUA6gSyFJpXyfRbT0YysjXfuPL8Dzp
	4n7UjsDEv1MYWezSW8skDxR/qh1pMAgyQnHTLNNmsueqbtLvGC6YeAcuUNcNBNRzMjss
	bDO2U3f2rEs/LKzY18AjD9ZMN4SJSWAtHlm8rSDRPa4XLDXgQsvwC8L2UEgafJvjNIHg
	I5ECGseNhduCJFeOCS7oPN9ygmeK0D+Hkxaqxj4xFGdBzYXblmP51SQHsSJ4zRTPAb70
	a0ZQ==
X-Received: by 10.50.184.199 with SMTP id ew7mr13348390igc.84.1358894466001;
	Tue, 22 Jan 2013 14:41:06 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id kf2sm13012195igc.0.2013.01.22.14.41.04
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 14:41:05 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 22 Jan 2013 17:40:55 -0500
Message-Id: <1358894455-10487-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] beagleboard.conf: add additional sound modules
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
X-List-Received-Date: Tue, 22 Jan 2013 22:41:06 -0000

From: Cliff Brake <cbrake@bec-systems.com>

require for audio to function

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 conf/machine/beagleboard.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index b3604a5..8f84c6c 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -48,4 +48,5 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
 
 # For a modularized kernel we want to drag in networking, sound, rtc etc."
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl"
+MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl \
+  kernel-module-snd-soc-omap kernel-module-snd-soc-omap-mcbsp kernel-module-snd-soc-omap3beagle"
-- 
1.8.1.1


