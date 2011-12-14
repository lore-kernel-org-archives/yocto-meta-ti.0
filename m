Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CD72E013A1
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:18 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-gy0-f176.google.com with SMTP id z10so294863ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2011 17:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ojQ8QuBJ+dNUpdlMEI+k1xMt3y7yINdGjYsYWuUJYc8=;
	b=brrZz0X5hfVST3HNerIsWCwgp3LHwXfNEgK33wlIgYtJg4J0DrRplUE0+taV5pkPpD
	M9zyjbIPcGr7vh9yTt04octvrIw53Edje4e16WhqCdYiWKP0DJ+/Um1NNxUlnaO517vZ
	lIti8wwRduImGusZkoYy00N+H5N4FaGNvGmUM=
Received: by 10.236.155.36 with SMTP id i24mr7881053yhk.43.1323824898864;
	Tue, 13 Dec 2011 17:08:18 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q5sm1276275yhm.7.2011.12.13.17.08.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:08:18 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Dec 2011 01:07:57 +0000
Message-Id: <018824ece4a04245b4277d5c8afcccfd6ca75df0.1323824833.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824833.git.otavio@ossystems.com.br>
References: <cover.1323824833.git.otavio@ossystems.com.br>
Subject: [PATCH 4/4] matrix-tui.inc: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:08:19 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-ti/matrix/matrix-tui.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/matrix/matrix-tui.inc b/recipes-ti/matrix/matrix-tui.inc
index ef89f1f..3be1295 100644
--- a/recipes-ti/matrix/matrix-tui.inc
+++ b/recipes-ti/matrix/matrix-tui.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "Matrix TUI"
 HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_tui/"
 LICENSE = "BSD"
 SECTION = "multimedia"
-PRIORITY = "optional"
 DEPENDS = "libxml2 zlib ncurses"
 
 INC_PR = "r7"
-- 
1.7.2.5


