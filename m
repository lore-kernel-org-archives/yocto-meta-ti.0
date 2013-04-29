Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6C50E01509
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 07:27:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TERlm6004127
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 09:27:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TERl4X008221
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 09:27:47 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 29 Apr 2013 09:27:46 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3TERfWT022166;
	Mon, 29 Apr 2013 09:27:45 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Apr 2013 09:27:38 -0500
Message-ID: <1367245658-15077-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367245658-15077-1-git-send-email-fcooper@ti.com>
References: <1367245658-15077-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-am335x-psp: Correct recipe name typo
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
X-List-Received-Date: Mon, 29 Apr 2013 14:27:48 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...x-am335x-psp-3.2.bb => linux-am335x-psp_3.2.bb} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-kernel/linux/{linux-am335x-psp-3.2.bb => linux-am335x-psp_3.2.bb} (100%)

diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-psp-3.2.bb
rename to recipes-kernel/linux/linux-am335x-psp_3.2.bb
-- 
1.7.0.4


