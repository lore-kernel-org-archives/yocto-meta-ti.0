Return-Path: <d-senicic1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FC0BE00D33; Wed, 19 Jun 2019 15:50:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	*  1.6 DATE_IN_PAST_03_06 Date: is 3 to 6 hours before Received: date
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADBFDE00D00
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 15:50:50 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JMoogJ004025
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 17:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560984650;
	bh=BHU6YC2HVLsyh0SEECeMouS0NnGWQPYeBVuTM7swSH8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lWifhBP9dHcp40oqXizcTExNz22i9pkOFDCsYYtq7FMgosIOYC/wvInkndnOuWtDg
	1VGM6JHcpIS8fq1vB2oFCes7QfE1MGUCN9KIEVj/iDq7bTyoHr2vX2zfOKpOwq6ovH
	xAunADYfAaR81XXHyNORu3Xu9udRxsQvyS/DdzhU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JMooK3032698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 17:50:50 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 17:50:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 17:50:49 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JMomQg011031;
	Wed, 19 Jun 2019 17:50:49 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 19 Jun 2019 13:41:02 -0400
Message-ID: <20190619174102.16280-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619174102.16280-1-x0157990@ti.com>
References: <20190619174102.16280-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH 2/2] pm-lld-rtos: Enable building opencl-monitor for dra76xx
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
X-List-Received-Date: Wed, 19 Jun 2019 22:50:51 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 33ed5ffe..a8b870f0 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -63,4 +63,8 @@ do_compile_append() {
     tar -cf pm_lld.tar --exclude='*.tar' ./*
 }
 
+
+# Workaround: dra7xx build requires am57xx pm libraries for opencl-monitor
+TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
+
 INSANE_SKIP_${PN} = "arch staticdev"
-- 
2.17.1


