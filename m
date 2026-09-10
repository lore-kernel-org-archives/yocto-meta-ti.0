Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140BBC79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 01:55:19 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4292.1789005315265988865
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 18:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HaD7BzUX;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jwyGTHKH;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1jboC2099843;
	Wed, 9 Sep 2026 20:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LmK+1IxSECOUhbgufKmr1hf61YXK7Xj30wIn98q/n
	kI=; b=HaD7BzUXltaLqHXYYurOfC8gae8eIwn/ndkQQRglCWajzsww2zaOEmE0S
	up2zKsMIPHIDQIeQLitP9NUg9wMvjxVhLoYDqNQJq4AjqXxLGUPrB1JEu7AesWoD
	OUbRJKIfFmPoVNuzUPwPaILAMw6vyxvmdCtAAuUB4UUKu+uKIYTgr23CNz298b7I
	eZ8wuVJsC9xHTaIaG36LtyDro12+6zYJ/9jG6JmGnY/QbMRx8xqp1kbNwMwzeMiy
	jsQW9rVP1T1Mdzou22XurQTZIHNsHZAMRn3bJie3L02qjScMFb12dU5Mnkgvc5PE
	6B+gy27xdUOZQrhSFrbnPdtqZD5kw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg2jfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 20:55:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4HkJpuK/otIUQwVqtkrQcjedOphn5MgiQTuEhKFcDQIFNxnvcBKfh3xuIJCBn3wwJIVzOyozY0OGQFPQYT9Bz2z1CHbxL0p6XcLDWemjgBYdP+tfYXDbFN0FbiYYXov/1gitQ9zZ/xB9+nyKLuJe9aUq5VNqWptIituJsxNvvpvGxBST+eSTM2MZfLge6fd4LMyYG/BKCnZLf8a+9/KgiJfjhbLKZhV/2uUKNb5YDHfblbuALE8XQgq23NwPCuXwWUPn8Z+wQ5vz6oh1cd8RsFX3zc9liakC+EW4IXn/ntdbWs70tXkXgzSHClrN2OSBQFieuJ1jpS271PzooKKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmK+1IxSECOUhbgufKmr1hf61YXK7Xj30wIn98q/nkI=;
 b=Ncc5QjPvguBfbcXjCtihE/Vz3dlE3kDyb40Mugt41xvBFVrMdsit16G2/VGvVDOS1Ce1Yoovq3+xNT0NITlv0Rijt5VFMMBcNWaXPTz+jrETKyMPRR1RFm6/AMBg00dH2zqGGjzGXreCVw1cehBpo/hnJX9eAm3HfLLdbTXtUzumQVtR2xCKnxgjnIcaUOjQSsXqo6dDkCn2JsYlCoHENUoPKUQVBmx66fb8YsFsae/k0KH5nAc4TRM8MWyL5OXm4jpXT/CrB4K9e/YHItVyPr/ps4cR4GxGB+7P4exkxLPRuYh88NJyGFRDsCEsjw3TG6UTKllDY6/SX/nZqDg2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmK+1IxSECOUhbgufKmr1hf61YXK7Xj30wIn98q/nkI=;
 b=jwyGTHKHMJLUm+TnYiRLjB3rzY9WOeC5ttxwplg5CLE8uTQdih15eZ/340A5tssg7Ql9DTg+o9WKZZlS2C1Hbo6VT8ZmxmeLPrfCQEqXMZGcQZscOLWAKWdidvzkzwFx/cCWRre1yLzrAa66iRzx+8sk3HsCWvue7l7eDxPsEwg=
Received: from SA0PR12CA0027.namprd12.prod.outlook.com (2603:10b6:806:6f::32)
 by SJ2PR10MB6989.namprd10.prod.outlook.com (2603:10b6:a03:4cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Thu, 10 Sep
 2026 01:55:07 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::10) by SA0PR12CA0027.outlook.office365.com
 (2603:10b6:806:6f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 01:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 01:55:06 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 20:54:54 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A1ssb92381555;
	Wed, 9 Sep 2026 20:54:54 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4U06-0000000CJb9-1kkU;
	Wed, 09 Sep 2026 20:54:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 3/5] mesa-pvr: Remove makedepend dependency
Date: Wed, 9 Sep 2026 20:54:50 -0500
Message-ID: <20260910015454.2933250-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910015454.2933250-1-reatmon@ti.com>
References: <20260910015454.2933250-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|SJ2PR10MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: e165ace0-8891-4dc7-81ee-08df0ede89aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tpa8O6aHSSmVke3LTUB+NwES9kYlPWfJX7xveANkqkpx5ln+GP+jkLnr1dXYDywclyvozVkWKnXczCa6KuIvgkomutZHXZ8VRYyAhCymqO6H0KlO6aFoYD3PIENpDqUE+jUvTJTrCZjWQaxE5abpvhI1S1A+4huyqqFJ+YBinxWbTEnTMw4LpuCfdMRNMXwRY40/GdR15NBVkPbM7+YJCsRy6Vb4u2uwAKhyZI9o8wgcftI3BwtN5F3O+CPpfqaDw7dsEWUtvaNO0E31TfuvUq3H+ya9B6natNg3kE0xLqPVaD48OKE9Qms9PDc7Xb64ozdOX+tiE53hvXrNhbURr4IyiSrl3wcVVNENkPcQunpiPRl8lWv5f/Swmx6Q7PSHqlLQ4sL17SHvNKYzSgVAct9K6E9zu6mSVl0LU1EnP7DyOp6NVC8/CKiWrVsiZDfRTiwo8qM6nZ32uEyhqAcdQrDodJ40oErWx3NqxOruRzBzMr9lJhkf9l22S+YDpJWoEGW5Vd+w9Xlk0/9SSEwRFG5/7MfUOXOeABMRaqTQ23sHvBQ6wgrpncaDZVOMs4ro4Y+M1fgxSbqEZnRAAo8vpa01RL6p9hkfaZHEgoJnkeZ6TVLEQz7cdBgQDuW2GX8D5+QdRgEXx8oGkup2IVZoZ+BUzg97iFdrv+fklUyONcvGhrQm8ojzGqV8qzTsmDlZ+oYMmMW+WN9tsQuTyTWPtg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GigJmkVfn458oUhYL+77/0YPE3he/pCVUi0RMlMvyB9dS3N6I7ceZ6myZeL8dRm9/QhPuQ7ZZsb4hLBNcsdzPo2vFOmTNqTF7j54lbVahaKNWB0XaFy0z8KpvO1dp6S9dYD09C0pHj+5IOX4R/S2NG/fJ/kYGNHQx4HHGkMBK85N+Xrbq7gzqUDRoCJGd1awxJeVOvARXAIDDdUiMAKa/jpUQd9yCVDdjyJwTYmSGmnF4AuYuIxRls9ls5RWPsSWdSB0dD2Hn/+NHCr9yMNO2oJ3c5kSBT2EUcbhmPT3qfRYwKxzz5kT6qji4y9wGY56P2irWnN6FAKRpK/DJMPAffZAYHjnnbm87CD9MDBD/Pmp30fJRY5c5blvSm4g5rd2lFbKj6eRGWngXvbwofaTuXnprqdrAnacJs0kGEQe3kbjstbi7qntJs+prAlSdaft
X-Exchange-RoutingPolicyChecked: 
	sgXwApLmjA4vFhZpp5v6FInkpKXIL50erYFGePHDc9MWrHt29I8Cbe6vyt+9rfLXs3mp1juYHS7rortsDOib9CtFz9ROIC8YWU7tIW7wIsY9UK6XGN3hTkpqLPaxUOH4i8xj2sxXHHcjALXEl58L/U4ON8DSkGz/ufMnQELkX5zdx/ABtH1NXOsc6rmZPiGz2/qvXUm6VI+pEtHFmQXXkTMzcDoIbKj7AJQ/rmmMRKoSQR8f9loUytHclQwb9dzTPZc2Nbe3lipukpvATBhexgFavzIMFdrKhHshJgWRM30XSCye5ZNTCjnYCG4aCkznRZvneXN/jTLggMb/aGJ+fw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:55:06.4338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e165ace0-8891-4dc7-81ee-08df0ede89aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6989
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa20e01 cx=c_pps
 a=S4kVa+swf+0AvQ92Y/0yGw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=m8ToADvmAAAA:8 a=sozttTNsAAAA:8
 a=haCKF7tZICal-DEMtOIA:9 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: FA9tM0i-9vguGSSBPL1d4wxhykEIy9qg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX6c1cWncDK9a6
 aQaAC6cm9QoiwDEM1rXbOhZoTBjGeCgCZpSdCrSQ3m6YIeH0jZflzVxzcyAWsCiF8k3kX61/RbW
 yOSoELI2acYR24rPBwo7nPw6cGsQesw=
X-Proofpoint-GUID: FA9tM0i-9vguGSSBPL1d4wxhykEIy9qg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX2GKGTVByR7yb
 hmjYrcetfLlB+Vo0+rRh8yzYbodnDxHW1mkd8ASgXvIIeUcwmjdqpvC+h/BjWir8FDeEvjB5XxE
 jLeNZ2wy6Hp8cttEsGqUvE5gLmf8nTrNRPODYwD9wiLbcnOqHHpxjO3P+a/o3/6WFvSyTIsD9Bt
 CfVQxx1FMLyLXRkssKA281D7eY2nXDFVmGITtIp80N9UJIjkDc94qP02nVF/xfJM3cUx3IGrSSs
 52yY7Wg4Z/3Jqr6FRlHpqWvuCgOWAG7RMDk38+pJme2IT34vrtQc3DeFnhkOTf/RxvULcl2tRHy
 DFgS8UFHQu0VaxdRry6Ep9O2tIDWpqz+Lg8wLdWViQ7e9ciKyUXuUkct9CZX2Hg2we74sLdt4jW
 yKkgXbsIrYebSL5JSNhGYEOfF/u2VgdwAV1kCkwsTsSIn0QA7fkX8vF9JKMXrUlfBA8tTamZoNQ
 7v5qVjE8QAc5AQwe2Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100018
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 01:55:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20357

Commit 7e696b1fa0 ("makedepend: remove recipe") removed the recipe from
oe-core. Makedepend was removed from mesa already in version 9.1.

Follow oe-core and remove the makedepend dependency from mesa-pvr.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2; No change.

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


