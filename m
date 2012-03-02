Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DA8DE003E1
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2012 12:51:39 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q22Kpb1V023718
	for <meta-ti@yoctoproject.org>; Fri, 2 Mar 2012 14:51:38 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q22KpaYk006507
	for <meta-ti@yoctoproject.org>; Sat, 3 Mar 2012 02:21:37 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 3 Mar 2012 02:21:36 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q22KpX34002218;
	Sat, 3 Mar 2012 02:21:35 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 2 Mar 2012 14:51:32 -0600
Message-ID: <1330721492-16982-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] linux-ti33x-psp: place configs in MACHINE directory
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
X-List-Received-Date: Fri, 02 Mar 2012 20:51:39 -0000
Content-Type: text/plain

* create a configs directory in the MACHINE directory for both
  am335x-evm and beaglebone.  This resolves an issue with the
  unpack step until a root cause for not finding the shared
  configs diretory can be found.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../{ => am335x-evm}/configs/empty                 |    0
 .../beaglebone}/configs/empty                      |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{ => am335x-evm}/configs/empty (100%)
 copy recipes-kernel/linux/{files => linux-ti33x-psp-3.2/beaglebone}/configs/empty (100%)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty b/recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/configs/empty
similarity index 100%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/configs/empty
diff --git a/recipes-kernel/linux/files/configs/empty b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
similarity index 100%
copy from recipes-kernel/linux/files/configs/empty
copy to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
-- 
1.7.0.4


