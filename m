Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68C4DE00C6A; Tue,  9 Jul 2019 07:56:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D101CE00BF7
	for <meta-ti@yoctoproject.org>; Tue,  9 Jul 2019 07:56:16 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69EuGjg088453
	for <meta-ti@yoctoproject.org>; Tue, 9 Jul 2019 09:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562684176;
	bh=CKatx+2UU7V2VvQt1ibNXlnLZ7S8GUdoQXbsoIxmZhk=;
	h=From:To:CC:Subject:Date;
	b=RwGagS5PCZQ8lEU6Ka0ytPJImbBJjXJWqOmZmotGG5TLzrysKmyToJZsAUZqZB3jd
	F0FHGBXRjvvbwhQoUzwQPMCVDtk5jB00uvOOROFA0g6XHUn6fD0eEfTMmZ+JhFR1lk
	LS57tLyhSVc+cGOqOKcLLjQfIKdVW3W6Wdm0Ax/s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69EuGxF097786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 9 Jul 2019 09:56:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 9 Jul 2019 09:56:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 9 Jul 2019 09:56:15 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69EuDTv065254; 
	Tue, 9 Jul 2019 09:56:14 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>
Date: Tue, 9 Jul 2019 20:26:10 +0530
Message-ID: <1562684170-22934-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: karthik.ramanan@ti.com
Subject: [thud PATCH v1] jailhouse: Update with inmate DT bugfixes
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
X-List-Received-Date: Tue, 09 Jul 2019 14:56:17 -0000
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 18b984f..753664e 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 PV = "0.10+git${SRCPV}"
-SRCREV = "5c6aa2b78c6485e9455d9d1441df3d695e1a8b4e"
+SRCREV = "6ac9dceadc466c35fc6735eb828f1b70b55aafec"
 BRANCH = "ti-jailhouse-0.10"
 
 SRC_URI = " \
-- 
1.9.1


