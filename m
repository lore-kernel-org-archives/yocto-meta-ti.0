Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3A49E01398
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:12 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yhpp56 with SMTP id p56so1068324yhp.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=IAAcwNz6bzIkdg0iPe9qeYJn8Gmu2xz8xItAIkgB59U=;
	b=Op1v9/YjiznP3pKfM034+zzzfpy6aSG+WclF/C3b+I30c4JDt3+1+rMQAoKCwEIrSN
	hX4sYJqzy9T918cuLeWB2LEbGl0Pgb22WcCOgi0n8+x083+sWCkSwu8NyY/RndSM8twl
	JRG/owdiSaIOVqKInFehdMDLiJ74ZnipMG0mY=
Received: by 10.236.124.39 with SMTP id w27mr7761288yhh.125.1323824892171;
	Tue, 13 Dec 2011 17:08:12 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q5sm1276275yhm.7.2011.12.13.17.08.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:08:11 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Dec 2011 01:07:54 +0000
Message-Id: <b314943d9522d76504c7ea08ec70926964f7982e.1323824833.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
Subject: [PATCH 1/4] am-sysinfo_svn.bb: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:08:13 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-bsp/ti/am-sysinfo_svn.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
index 34830c9..d4f8740 100644
--- a/recipes-bsp/ti/am-sysinfo_svn.bb
+++ b/recipes-bsp/ti/am-sysinfo_svn.bb
@@ -4,7 +4,6 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e714ab729cfe8177298af8a5a25d"
 
 SECTION = "system"
-PRIORITY = "optional"
 
 SRCREV = "5"
 PV = "1.0"
-- 
1.7.2.5


