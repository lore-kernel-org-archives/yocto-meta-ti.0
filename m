Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5E98E006B5
	for <meta-ti@yoctoproject.org>; Thu, 22 Dec 2011 05:00:47 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yenm10 with SMTP id m10so6062536yen.35
	for <meta-ti@yoctoproject.org>; Thu, 22 Dec 2011 05:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=Yd3f/sxMf/9IVI4sNAo9lCIzvds1ec3DJOziSeHSjoc=;
	b=NpO+xVtF56Bo791pbWrZ3ongYJaGh/Lnp2KkGgT8eHc+OfSn4OQ7SmROIrep14IGuc
	lguRGnPde8ri/VXcsCl2Y1JNVNSDMy+6hpbxBucMSkFQkCzAbE2s2HjrIn77J8xFa7ey
	z1lGFSikZBil0R9Q98ePWeZpXpdoXPiLGxFeM=
Received: by 10.236.155.194 with SMTP id j42mr14764589yhk.34.1324558846825;
	Thu, 22 Dec 2011 05:00:46 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i22sm14543132yhm.10.2011.12.22.05.00.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:00:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Thu, 22 Dec 2011 13:00:32 +0000
Message-Id: <cover.1324558731.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v3 0/3] Rewrite sdcard_image.bbclass
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
X-List-Received-Date: Thu, 22 Dec 2011 13:00:48 -0000

This version of patches uses mtools to copy the files onto the fat
partition avoiding the problems from dosfstools in previous versions.

The following changes since commit c00b5df3b85b3badbd268e376c0a19fab19cc4f3:

  linux-ti335x-psp 3.1: disable whiteheat firmware to unbreak build with make 3.85 (2011-12-21 15:33:36 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-ti master
  https://github.com/OSSystems/meta-ti/tree/master

Otavio Salvador (3):
  sdcard_image: rewrote to avoid using loopback and mount/unmount
  ti-hw-bringup-image: adapt to newer sdcard_image class
  cloud9-image: adapt to newer sdcard_image class

 classes/sdcard_image.bbclass               |  181 ++++++++++------------------
 recipes-misc/images/cloud9-image.bb        |    6 +-
 recipes-misc/images/ti-hw-bringup-image.bb |    3 +
 3 files changed, 70 insertions(+), 120 deletions(-)

-- 
1.7.2.5


