Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2282C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:59:08 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3440.1789001940136822719
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=R5JCAJZ3;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=stwrYCpw;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689MA2XP3700104;
	Wed, 9 Sep 2026 19:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0XsV9lLlZAyqKCFK//OH450l+uGEo03WKN4d5axBL
	E4=; b=R5JCAJZ3CpVH9gZMqfdl1w+pbhgUyg41nHXTiDQzJeA6Ca1Z7KJRefRB+
	WxytlLNLMpN/MWl60u9CUCejziKgr0CgJsPNKEa2djcqk/4Z9zs7td9lSKD1n43f
	RCEJrHWHJ3v9Efui2MrypCMzxzSGG00DcOYegodF05/J4bE038JHGAhABXWF/40U
	TlywPebvt/toXUmddcqQsClbqpIdY5F5LASngL+Y+ELh6ik7ssaC7D+NX9PVGAxK
	kl+7O/w+N2lc6V3u4dki+6/ifMI7EEtxHe00JwvvU6NMdVz6jO3+OCOPY9RhXmhn
	o1b6AQQWHPW0QcSfBgCCbvKh4s7TA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg9xqx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:58:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoOqo6gLZO04av5gINyE1Qr7gngZJajWgcgJYj1AHr5FznW8u0PhwGGaeARS+ZifO2dmF83/dhz7LIrlktCuVg2/8dn2ry8BQjl7BnSjG/Q6ZD4QrOU3cK79L6Z7wpzMwFuXYlUaNmH2AV9W6Ts8x86gsBKjs3231Kppjex2f/PiMYmNSH9vhdV3GbxuGmtgziT9AqUdWd2ffi4k672SWhTwJDNKMpBHsKNIndmUQm1Ghqs3orrSumOIxE+IAhg/Gjcs/iBPWKCQjVUjfH+BJPE2zuh74sGatXSenOi5tVIaLiYUThZ6b53M3SoVzk2L5X8B72+AM1ceWXYPvTBfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XsV9lLlZAyqKCFK//OH450l+uGEo03WKN4d5axBLE4=;
 b=JPTN39d4134Eu3K5PjFD9ezh/y1bLk9w2mIrzn/4brxhBnsfrtyLOoiM5gtkpSThBk0XoZgAkR3I8Os+Y6MHfynv4PcgVpSuNmOInSOO+nkwMVT4Mkc+9bDUTXCv/7hC0SVideSvxDGgErIuutQ7VYwvpqlymL8uhEqrDO+h2r+h/p+clR48EePdnzlEo6k9rYY4HYagstMYPyupERY5qs1L7PEurvZOY5KyVq6viOrzFO7USqESmNVPHAUP3yiTFCIOjpDwb0HCD0iR4TXZoZVapR2J7gmZHRF8hD7bLpaKXrS3/umllqMJel+L+9pO39Mfn+T/2L6FXli5ROCk7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XsV9lLlZAyqKCFK//OH450l+uGEo03WKN4d5axBLE4=;
 b=stwrYCpwt2CrpxHGDiLzj7qKL1zE8uTe51CKmItGmxeXNkprwxnkc/pAU2+w/SA0YQ+uMSxEPbkQkoMnfcawPKO0qIupkrwdR7QsPK6MfIHN+DtJ/+IhHHwsXWScH7U3m6gDSB7E44k9WiDXAW+SuOCzJjFKg3VX4drUIsS4nuY=
Received: from SJ0PR03CA0183.namprd03.prod.outlook.com (2603:10b6:a03:2ef::8)
 by SJ5PPF07759F8B1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::787) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 00:58:55 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::41) by SJ0PR03CA0183.outlook.office365.com
 (2603:10b6:a03:2ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Thu, 10
 Sep 2026 00:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:58:54 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wMp31321626;
	Wed, 9 Sep 2026 19:58:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7O-0000000GEwP-0XZ2;
	Wed, 09 Sep 2026 19:58:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 3/5] mesa-pvr: Remove makedepend dependency
Date: Wed, 9 Sep 2026 19:58:18 -0500
Message-ID: <20260910005822.3867633-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910005822.3867633-1-reatmon@ti.com>
References: <20260910005822.3867633-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ5PPF07759F8B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 7811466c-d207-4073-5a08-08df0ed6afbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PGDTEl3T4FgYczHkENAvCvE31A6jdyIKgWxKV5EQqy4JvG5gkOhaHKEeH6hguWiwb0s0JjC9G8d9JkZ2Yh2c9CunlQoC6k8GOivZBINlj//pbkA8SCp3Ssgl4jgfSME/SU8B/BQIxVfLgZiJb2bAy65qhwlnidYC/xEH+lFSKHM729M/guv9ZqRwg7xm4FpMsBMJXH4CljbKWDjvPQIebshANngonAQ6wg844VZdsggjvaxGUE5nSROlDED5T/exdNjJ48VyiacDyadIT+/F5eMfmBrC2pSMZFfIE4PUrUWgsHTBAgOZrWD5JV3QZ1E+JcsTz3ZW3cU96AQQSdrbM94lfccwJcWKPw0VbbWYjDxxub8robrFWABByI1FJ+B6Km5GIinvGEggxzHB0QrUWUBVRskAYQX+ERcp0fGO3X9KDL3pYVcWMIoX3XV89oaoQfTpjd+rzED2+2DAzogxb0gtox34OH7LqMHbi0yydQF0z7J8UryPLvGP99oYLWNbiY4DZsMtYqC3eiW7okxhUrpf5HMfLKZqLfzJi4IGZsixOpnxPkcX6uwg1hnFbS0PGBEOC1L0FJQ8PPT11m6yDpzh9aJDQj5Yg8V4TxZkEXzoA9tKHK3I9tNQS0mbRNW/pJIqINFSLl7wd+y+4c2/XbwNBiVOuESj18L6Alu2efM1mQMzcMhRuDDWyOkXmN67oqdjvworJXjf/iDjpBi6dQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jUODPaT/Hyxnm+ocyyE5372u5rNdXrLIGFe5AaFZn7rUe9cBTxHPKa9Es92ONoqYDcnbD7cwQMgtbYsvxgJSEQwJb1oIVfeb0MY19/HLmVyz+tmNkrw8h/m8P0wYWz2OGn56oYVQFdSScoYYVgjm++MJ2rSUZDT/gfS9DFxkv/qc+be8WDaHUUJ51ZPmRqwDbUgS4ZLjTF30OEEB/Q1RK+wsLyK/BvSHP37aETUuSoU/OhWqnYChR3F7nSfqUslOmyHcDkUjOPiNmRrUsVX6qUD8bu2c19rDHVapSmL7WWDTvzc1zxQ4zmTjE05oM0TsiYi2jVoWALl1fopqFM7BKDvtDgyRxqjSEGwbAZa55YTdFfBrf56CqtULIFEFSBk8b/GIlVc6qtKI99RYJ1FFe/SilBVnn26ij4OGoRbuHI/A2t/NJ6oifxm3IgNBFfBN
X-Exchange-RoutingPolicyChecked: 
	cNOCHqkcFGtXneStwrH27xTo70EHidXAAeaaflGnOrTsd+IwEfqnyJJH8amHnaUg21zpHav8fJGiH40iPnvy18BHdj0232VRYxy8Gca7dMCO14MeaDbfrstetQr4rS9NnOMa1gXcrMdgnTi1sMezpT3ReySHYZg47HkOmwOdIX7qbGstV8WB5LQQHIe6jobXji04wE9ESrGnSTG0+nVvO3j0zXhQ53+676AvOavo6NX4r6bnYDpxev+Ek14DFCLMaNBKpB+liOLcmK8Q1G+fwAGJK32ybVJqxbUATx5mPSzJmkXxw1SXniqc5JYHobuQvawsTsgiIY+YYhW59vjM4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:58:54.2621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7811466c-d207-4073-5a08-08df0ed6afbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF07759F8B1
X-Proofpoint-ORIG-GUID: lYzoAlwjI-Ut-4_yH7fv_0rutUp9JeNv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOCBTYWx0ZWRfX4zqsOnHZo9PZ
 nF2e9iLE/Vnupt5kk67cdZM+UAiX9qviP0b8SJ7ASUdNt7oTc/S0Izn2Pg4Z01k8hE9uldiZ5lT
 EPtinKw56MpZf5LVuxyx5KUPvUaAU1I=
X-Proofpoint-GUID: lYzoAlwjI-Ut-4_yH7fv_0rutUp9JeNv
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa200d2 cx=c_pps
 a=QnLLxHS9Rj8Jz4O0ufpOyQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=m8ToADvmAAAA:8 a=sozttTNsAAAA:8 a=haCKF7tZICal-DEMtOIA:9
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOCBTYWx0ZWRfX/Q1ptHJr5jeX
 gBOBzUhUhM/x/eXGH1CrIMJb2YzrwWvHZ2k0FkjAJLOMsIJXUlSmwMLAYrQ4AXOrFFhO4NqWWpg
 P/XlKv8DYQbpFHgoUckkDu6bB/eNrM8uc/Zh40g7q8UmQRFqSarkO/Zxhqzy/HKKW9PNtJLMU17
 N0EaZAM5p83bQ4LdbL2U61PYY4sMNsbLsChi4yCelWwEDcHsMN6jY2xgS0D20gFRMdbliv4f6zt
 2/AKR2RaHtFEC7p0V2fYHN2XGNnevHD0vOKYkGxHfmXuh5wf5x2yBx1Mj9/wvCiccBY0LZ1Er2u
 74MRRGhRH515ZPG4jLMOe5D6ak7e3boQGL0xAIHsDbNccYSye5XE9JZ0ceMTJVoXPP78X9XV0nw
 /ENTQeu3/tfv85AP6kQ7kSoLoS4D8hmXnWY87ofIjk5XV24TkqKSvPQjwl4S2GzbBHt7J9VIAWu
 KtJY5wb27dOIDQE8t2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:59:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20352

Commit 7e696b1fa0 ("makedepend: remove recipe") removed the recipe from
oe-core. Makedepend was removed from mesa already in version 9.1.

Follow oe-core and remove the makedepend dependency from mesa-pvr.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
index 2c4299c7..a9c6b8b2 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
@@ -40,7 +40,7 @@ do_install:append() {
   fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS = "expat flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
index fbb865ad..3be87b38 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -32,7 +32,7 @@ do_install:append() {
   fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+DEPENDS = "expat flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
-- 
2.43.0


