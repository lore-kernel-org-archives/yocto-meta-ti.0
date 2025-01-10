Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C1BE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 19:55:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.397.1736538935326640201
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 11:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EELE2O6s;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AJtXwk3077153
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 13:55:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736538933;
	bh=3UXZUFDXr6a8+vvO0OgVqKgpHJIq0rvGHVXfZD2YVoo=;
	h=From:To:Subject:Date;
	b=EELE2O6sBnao3TQzmMl3lR4edJEUhYBZgerHSBKotHdhD60nYA2F2ZyanNdIKjq7B
	 vKYCOkdUi4mfQb12bpWPTBk8luIn3NC7xM824saHp+0k9KpNvn/P91R2FXE7f5dIZw
	 JbcnrXnwYIS/pEQDmIb2vR+XxTFKVjC5M1dXkMv8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AJtXae122726
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 13:55:33 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 13:55:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 13:55:33 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AJtXXC091808;
	Fri, 10 Jan 2025 13:55:33 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tWL6S-0008Vs-OQ; Fri, 10 Jan 2025 13:55:32 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] libdce: Fix compile errors
Date: Fri, 10 Jan 2025 13:55:32 -0600
Message-ID: <20250110195532.32672-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 19:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18180

Update SRCREV to pick up patch that fixes some compile errors:

../git/memplugin_linux.c: In function 'memplugin_alloc':
../git/memplugin_linux.c:69:9: error: implicit declaration of function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
   69 |         dsp_dce_buf_lock(1, &(h->dma_buf_fd));
      |         ^~~~~~~~~~~~~~~~
../git/memplugin_linux.c:71:9: error: implicit declaration of function 'dce_buf_lock' [-Wimplicit-function-declaration]
   71 |         dce_buf_lock(1, &(h->dma_buf_fd));
      |         ^~~~~~~~~~~~
../git/memplugin_linux.c: In function 'memplugin_free':
../git/memplugin_linux.c:91:17: error: implicit declaration of function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
   91 |                 dsp_dce_buf_unlock(1, &(h->dma_buf_fd));
      |                 ^~~~~~~~~~~~~~~~~~
../git/memplugin_linux.c:93:17: error: implicit declaration of function 'dce_buf_unlock' [-Wimplicit-function-declaration]
   93 |                 dce_buf_unlock(1, &(h->dma_buf_fd));
      |                 ^~~~~~~~~~~~~~
../git/memplugin_linux.c:95:13: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   95 |             close(h->dma_buf_fd);
      |             ^~~~~
      |             pclose

and

../git/libdce_linux.c: In function 'dce_deinit':
../git/libdce_linux.c:90:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   90 |         close(OmapDrm_FD);
      |         ^~~~~
      |         pclose

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: The patch was added to the repo, so we can just point to the new
    SRCREV.

 meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index f46d9c77..a31fe20d 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -8,7 +8,7 @@ DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
 
-SRCREV = "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
+SRCREV = "182aea18596eb2b3a82cffc536a6404f5000fb30"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
2.17.1


