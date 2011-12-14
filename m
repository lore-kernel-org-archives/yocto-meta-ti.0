Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8570FE00305
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:10 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by ghbz10 with SMTP id z10so294863ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=PxGHIwz8b48k75xoeJ9kedg/1G1zufJGHJZZSByDB6s=;
	b=S64ZG9QCziMOTUFe+KYkUfkF+3abDIpDBGw3vsPVlKIXRc8Ifho69gsC4tgWB5CzY+
	lfwxHDN1Juo8VN1b4NvTab0FWUMbwKw/It7uj3Zz22tuywBYnOyhy7NA0QOnvhnykwsW
	KbHey9L1i2OdWWBLb8hYrA680w7ZsAqKoi/WU=
Received: by 10.236.185.231 with SMTP id u67mr7762658yhm.75.1323824889410;
	Tue, 13 Dec 2011 17:08:09 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q5sm1276275yhm.7.2011.12.13.17.08.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:08:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Dec 2011 01:07:53 +0000
Message-Id: <cover.1323824833.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/4] Remove PRIORITY setting for optional as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:08:10 -0000

The following changes since commit 487e6c18670f406e14be94c5998d08d73a0bc73f:

  beaglebone-getting-started: fix LICENSE, update to latest git (2011-12-09 14:39:27 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-ti master
  https://github.com/OSSystems/meta-ti/tree/master

Otavio Salvador (4):
  am-sysinfo_svn.bb: drop 'PRIORITY = "optional"' as it is the default
  u-boot.inc: drop 'PRIORITY = "optional"' as it is the default
  x-load.inc: drop 'PRIORITY = "optional"' as it is the default
  matrix-tui.inc: drop 'PRIORITY = "optional"' as it is the default

 recipes-bsp/ti/am-sysinfo_svn.bb |    1 -
 recipes-bsp/u-boot/u-boot.inc    |    1 -
 recipes-bsp/x-load/x-load.inc    |    1 -
 recipes-ti/matrix/matrix-tui.inc |    1 -
 4 files changed, 0 insertions(+), 4 deletions(-)

-- 
1.7.2.5


