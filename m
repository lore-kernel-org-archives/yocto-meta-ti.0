Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AB3C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 14:24:21 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.84434.1675779860913799067
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 06:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=onQfVYtv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317EOHq5068939;
	Tue, 7 Feb 2023 08:24:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675779857;
	bh=lVsJuNHqfO1jMnrXiPdOqdI4kUsUXQnDZUg0AbmRFHw=;
	h=From:To:Subject:Date;
	b=onQfVYtv1Fz1iarm4fISe8XVMv2K7cHoUXueuhBnS8WSs213ExiVTEdxvU+g7w5A1
	 5vYtnU/hAlBlL4EkyxC2aWq8J+vSZfMRmIdnbQoR+x96KsGgi+1hj0Lw1VWA8R86O7
	 VF3GWXnE9a0sd7BoQVUSE3XVCce51nK8N2lyVmAQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317EOH37038615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 08:24:17 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 08:24:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 08:24:17 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317EOHuZ074654;
	Tue, 7 Feb 2023 08:24:17 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pPOtN-0003kD-5B; Tue, 07 Feb 2023 08:24:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-bb.org: work around for too few arguments to function init_disassemble_info() error
Date: Tue, 7 Feb 2023 08:24:17 -0600
Message-ID: <20230207142417.14353-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 14:24:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15732

binutils 2.39 changed the signature of init_disassemble_info(),
which now causes perf and bpftool to fail to compile.

Relevant binutils commit: [1]

There is a proper fix in development upstream[2].
This is a work-around for older kernels.

Inspired by a patch by Anton Antonov to fix this issue on meta-arm
kernels. [3]

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.156015-1-andres@anarazel.de/
[3] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 2e0f2448..35fb40cd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -25,7 +25,8 @@ SRCREV:k3 = "11ebcc09f32669fac8254dff56d500f86c4c2caf"
 PV:k3 = "5.10.153+git${SRCPV}"
 BRANCH:k3 = "5.10-arm64"
 
-SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
+           file://init_disassemble_info-signature-changes-causes-compile-failures.patch"
 
 DEFCONFIG_NAME = "bb.org_defconfig"
 KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
-- 
2.17.1


