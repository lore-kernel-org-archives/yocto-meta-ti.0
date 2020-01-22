Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.371.1579731641114316484
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2020 14:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v7YsDED0;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3F52E015E7; Wed, 22 Jan 2020 14:20:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B4B6E01588
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 14:20:40 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKeDw034260
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579731640;
	bh=9jR9dBO2aqVy+pMafHH0zB/v22cH5qHd9CRGTMs+wmY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=v7YsDED0OzNrISvh39mJwnypg8GGuraqjE6PhFvqNQAj4pGbqxKhPfCLCESRbQaH5
	 WZ4B+FT1eOeRanxycSEmSDJgzogpEfa9Ki7N3PhZa/5Q0CFJf7SoPStHQmFXsyl0eW
	 pknDPiXWY4BNz2uHEHJFlaEzNrsoK836Y77E2M0s=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MMKevs051208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:40 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 16:20:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 16:20:39 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKY50061593
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:39 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 3/3] pm-lld-rtos:common-csl-ip-rtos: Adding am57xx boards for dra7xx build
Date: Wed, 22 Jan 2020 17:20:31 -0500
Message-ID: <20200122222031.13896-4-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122222031.13896-1-m-radhakrishnan2@ti.com>
References: <20200122222031.13896-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index c8d74cde..5db670e3 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -66,5 +66,6 @@ do_compile_append() {
 
 # Workaround: dra7xx build requires am57xx pm libraries for opencl-monitor
 TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
+TI_PDK_LIMIT_BOARDS_append_dra7xx = " evmAM571x evmAM572x idkAM574x"
 
 INSANE_SKIP_${PN} = "arch staticdev"
-- 
2.17.1

