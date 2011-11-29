Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA96DE00309
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:41:43 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yenl9 with SMTP id l9so8234957yen.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=k4gcYRdIbJp2OCBXiVc9yRWzKsdqFcSkrZUDvO2PqkM=;
	b=JwwfCf0aCYp4vs0h411WM19eM9+h1a8q1KZIUtI8dAxiRb7H5rfmaRAPjXucpTi328
	AqtunXVCKa7PrxiYxGNtUED9ryUPLNANRmXVladwuBzpW7Ulh5BGQL/DFGP3xA/5sUel
	GlJWQg5TfCXvcJ5yGkvc7qhsSz5RvPz150u9c=
Received: by 10.236.78.3 with SMTP id f3mr69605043yhe.120.1322570502326;
	Tue, 29 Nov 2011 04:41:42 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 33sm2938343ano.1.2011.11.29.04.41.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:41:41 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Tue, 29 Nov 2011 12:41:28 +0000
Message-Id: <cover.1322570446.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v2 0/3] Rewrite sdcard_image.bbclass
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
X-List-Received-Date: Tue, 29 Nov 2011 12:41:44 -0000

The following changes since commit 08b559c4da61c8514808c2dad3b65217a8e73041:

  linux 3.0: update to 3.0.12 (2011-11-29 09:05:54 +0100)

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


