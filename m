Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDE89E0139E
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:16 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-gy0-f176.google.com with SMTP id z10so294863ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=bCVvAEv23msKe3WDbKvjl6ANUr0FHY/0GfyjlPjQQ48=;
	b=cIUSyXGMrfu7Atj1yD4lt67Iwi2DDrfvOP6pXw4IM5LQ7HUj8BQFbBGOEDR+dZHO0C
	zQtCPwa7yr3cYP70USaQOHy3iEcjn8zBKqcO8E2mGzXDXiOR1u61rxFdhWARhT3Nl0IV
	uuR1yaCsptgOGVl144QdK/9/2GSZZBpt1id0E=
Received: by 10.236.200.131 with SMTP id z3mr8075564yhn.129.1323824896729;
	Tue, 13 Dec 2011 17:08:16 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q5sm1276275yhm.7.2011.12.13.17.08.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:08:15 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Dec 2011 01:07:56 +0000
Message-Id: <877f2c278f83f4c47c7302cc30733498258e16a0.1323824833.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
Subject: [PATCH 3/4] x-load.inc: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:08:17 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-bsp/x-load/x-load.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/x-load/x-load.inc b/recipes-bsp/x-load/x-load.inc
index 30d3101..c8ab3e9 100644
--- a/recipes-bsp/x-load/x-load.inc
+++ b/recipes-bsp/x-load/x-load.inc
@@ -1,6 +1,5 @@
 DESCRIPTION = "x-load bootloader loader"
 SECTION = "bootloaders"
-PRIORITY = "optional"
 LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://common/cmd_load.c;beginline=4;endline=22;md5=14420d7cc8dfb427d17ad407ddf8dc89"
-- 
1.7.2.5


