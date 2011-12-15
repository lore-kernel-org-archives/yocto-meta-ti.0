Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 747CEE006DD
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:05:18 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yenm10 with SMTP id m10so1818138yen.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=134evLwoNVIZdC50oHxgwAHM/2krEHd4oJ1xxek01nQ=;
	b=venWiAe0ELFC3J6i0PD1RMq3lPzbYSCmC+/3ji1CwbN4dHqdJiQikdBQk4BPZ2PGlQ
	w8TOITng9ViyA2UVqKn4oMgM0KvCr/5VBOIqxYfgw4xGSyDE8pnOymeQ+FuWTr9ZNuLh
	OtBtfA+cPb6Mlvr2vhrP8pnJ4jNCFWI/M8G1c=
Received: by 10.236.189.97 with SMTP id b61mr5206528yhn.116.1323961515578;
	Thu, 15 Dec 2011 07:05:15 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i4sm9326685yhk.21.2011.12.15.07.05.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 07:05:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Thu, 15 Dec 2011 15:05:01 +0000
Message-Id: <cover.1323961434.git.otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 15 Dec 2011 15:05:18 -0000

The required fix for dosfstools to work has been merged on OE-Core and
this allows this changes to be tested and merged now.

The following changes since commit 018824ece4a04245b4277d5c8afcccfd6ca75df0:

  matrix-tui.inc: drop 'PRIORITY = "optional"' as it is the default (2011-12-14 01:05:59 +0000)

are available in the git repository at:
  git://github.com/OSSystems/meta-ti master
  https://github.com/OSSystems/meta-ti/tree/master

Otavio Salvador (3):
  sdcard_image: rewrote to avoid using loopback and mount/unmount
  ti-hw-bringup-image: adapt to newer sdcard_image class
  cloud9-image: adapt to newer sdcard_image class

 classes/sdcard_image.bbclass               |  180 ++++++++++------------------
 recipes-misc/images/cloud9-image.bb        |    6 +-
 recipes-misc/images/ti-hw-bringup-image.bb |    3 +
 3 files changed, 69 insertions(+), 120 deletions(-)

-- 
1.7.2.5


