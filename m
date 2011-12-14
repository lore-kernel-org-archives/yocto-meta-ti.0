Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 775A7E0139D
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:14 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-yw0-f48.google.com with SMTP id p56so1068324yhp.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=vbZzfSlpEoIoyCYemok5o+TtuakakL1fHWIokD3AK5s=;
	b=nf0hmV2S1aukupPW1bBlxKJshJEhKMozbjj+N1V3P4VKlZgYB1wHZkcUjz2n/4ckmn
	UDsQEUxf54cNgKKatrk86ERDyhM+uudv8TSB/JU0iickUeFKk7xwLOyOaV29ZHM2ZYNW
	D8K9QTbgYAt4j9Ap3Xwf5jbxZhBcmkBBK+x5s=
Received: by 10.236.124.6 with SMTP id w6mr7828747yhh.94.1323824894246;
	Tue, 13 Dec 2011 17:08:14 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q5sm1276275yhm.7.2011.12.13.17.08.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:08:13 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Dec 2011 01:07:55 +0000
Message-Id: <998d37f464be573ba09ddcc10d34c3cc3a119a1a.1323824833.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
Subject: [PATCH 2/4] u-boot.inc: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:08:14 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-bsp/u-boot/u-boot.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot.inc b/recipes-bsp/u-boot/u-boot.inc
index 1621d6b..9669ade 100644
--- a/recipes-bsp/u-boot/u-boot.inc
+++ b/recipes-bsp/u-boot/u-boot.inc
@@ -1,7 +1,6 @@
 DESCRIPTION = "U-Boot - the Universal Boot Loader"
 HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
 SECTION = "bootloaders"
-PRIORITY = "optional"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
 
-- 
1.7.2.5


