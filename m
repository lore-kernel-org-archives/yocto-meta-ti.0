Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f176.google.com (mail-gg0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49804E01421
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 19:02:04 -0700 (PDT)
Received: by ggnk4 with SMTP id k4so3213805ggn.35
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 19:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=7pL3z7JO8ksQQ19bmp+NsQzj85iWl0k1CbKZonL1P60=;
	b=e2AxLgmHl4YD7NRvu8cs/cLEe3itQHyyMT9Jki3mv2OWTM2pWG8Ue3hFE/Yf2JyTTt
	sf+do0OjBlsvhgcoKVIotznY1pChNBFFGqb6Yd/D3yUewUkaw6QGsjPJhpeuy3Pxk66T
	3Z26ukYsOITEonIdquSyZ9eRfAADZWup5t+qJWVl9v6yaDazt9UE+paMnWBUvT7K+8Ae
	lzziFrz+1akMBDDMmDr8vhOFH1aISTYrv32aJ9PiP0uHRQmaz3N5/5NVoea2ftVomQ7d
	57fcy1ncq0U7TOTqmGGM6EnO+RT7xDFM60JtNKELxyQzCmenkQuFj3EdD78F0u2d55Mo
	47Ng==
Received: by 10.101.10.18 with SMTP id n18mr3194145ani.85.1337306523553;
	Thu, 17 May 2012 19:02:03 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c13sm13899003anm.13.2012.05.17.19.02.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 19:02:02 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Thu, 17 May 2012 23:01:51 -0300
Message-Id: <1337306511-1065-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] u-boot: fix fetch for 2011.12 specific patches
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
X-List-Received-Date: Fri, 18 May 2012 02:02:04 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-bsp/u-boot/u-boot_2011.12.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 39f77bd..45c64a6 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -30,9 +30,9 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            ${CACHEFIX} \
            file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
            file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
-           file://0011-ext2load-increase-read-speed.patch \
-           file://0012-ext4fs-ls-load-support.patch \
-           file://0013-beagleboard-switch-mmcroots-to-ext4.patch \
+           file://2011.12/0011-ext2load-increase-read-speed.patch \
+           file://2011.12/0012-ext4fs-ls-load-support.patch \
+           file://2011.12/0013-beagleboard-switch-mmcroots-to-ext4.patch \
            ${FWENV} \
           "
 
-- 
1.7.2.5


