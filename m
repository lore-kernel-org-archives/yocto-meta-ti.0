Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D854DC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:28:23 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5207.1789500499919992373
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 12:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jD/58mhq;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=StLcKTaV;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68FItueR2525248;
	Tue, 15 Sep 2026 14:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=q1neIHmQ1mUFXV4B+ac2u1eVqPG68janiXOZHgwSN
	ug=; b=jD/58mhqqa2XXLAy0M3sXLjrJyKedrk931wHHGV/nxWGoscoJcs/fZoKB
	xUvE5UyIzgaFxnUP7JwqUEuUfMeCFiTb5dUvZHlONSEkPUhuxITjNNiA0QdCaUjH
	lqyuGZ24+mMJp+Y5+6CjdGoV/pTMeJoV4PGouemgxWaDGrmxAhRwFMVaatdi328C
	Q2ZtSI/VPk+9NHmnBHCII4bZcLfn+Yk6hvWrQY3MX3kuqEvKuutMd1HXPDOx9kuV
	U7+UTJUseIcX+4akQIydsVl3NrPcSjo7K4nePPHD5SxGX7R5Yj1iquAXL7+aCSjM
	ixxqGkE6AivGJAmEWwgRLZmpDPfow==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gpvpa6dbx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:28:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tr0y0kXrmmJaD+Ul77b162Jbe7RYZY5nIX/ox+XG23/0CGY3fFPh4nCKaOXKflOPRIkYIavi33vZP+vZzFQ/E73WSxYFSouvk3GXs06sAEDZUtaw2rr2FrIFyUZnsWCqGU9/TuUNTo9RGqUd277tP0febMYgSm323WK8EL86FDNcSVEvVgqXj6gmQ2ErbzqMmgiE1Eo7zw7/XZUsQJF++MfqVWgQms+wnZEiJfgQ0tPter/wgZC40rb0oP3Y/lrJLSVVX7qOVqMlFm9RiMw+dX6sPb82WENAYu9AdGLAJKWfhn4cQmHs93A528W9IIK8REIGcEpeyE7xCr16Le0zeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1neIHmQ1mUFXV4B+ac2u1eVqPG68janiXOZHgwSNug=;
 b=GNioaZ6B/yxtXJy98UK3gHsrqEz+Qhi7E1DwcXx4a8SqBrQmwn788au/oW5oCxCTWfCwXBgmgKN8HIUcsxsS/yVa15PTSEkfFglyyCqZi2wLC5CtlIAKEfF0QFXquWHK5Dy/glneMwy1Xu/rS3bGnGPpJSygRxgv2pNk2fJFuwdsnlGFl7VRgBgbHSRXXLZLOKDKxDjo2vCRR5EpzfPnl3WivNrFJMN9OoO9jAQNQwUdDwPIXNxFDEaBysg+6LcVTP9J2ZuhAzl5XWczRJaBO7nUpLBkFnxywvTH9sRzZt8W12FU35PxaVrZ5B0bkcJx/W55+WlAVDE75SNt7tgTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1neIHmQ1mUFXV4B+ac2u1eVqPG68janiXOZHgwSNug=;
 b=StLcKTaVEdMzFAhcsNiSbK41URYspJ55yuFpWOwNpAdrbe/zui+6k+shtDrIGx3KBOE8dvVM/JHUajC7bVM/GyTQKtbExd05McI24wEGBNsgbYFZyQIU2E3j3dkLLfM3/9XGWGK3LOO6u1m0ro3Tmdxvz+RRJpYZh4sO+6o1Fyc=
Received: from CH2PR02CA0023.namprd02.prod.outlook.com (2603:10b6:610:4e::33)
 by CH2PR10MB4248.namprd10.prod.outlook.com (2603:10b6:610:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:28:04 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::3) by CH2PR02CA0023.outlook.office365.com
 (2603:10b6:610:4e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 19:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 19:28:04 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:27:39 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:27:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 14:27:39 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FJRdkH3809065;
	Tue, 15 Sep 2026 14:27:39 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x6Yod-00000009wLT-0irA;
	Tue, 15 Sep 2026 14:27:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 3/3] u-boot-*: Change openssl fix to build option
Date: Tue, 15 Sep 2026 14:27:39 -0500
Message-ID: <20260915192739.2369213-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915192739.2369213-1-reatmon@ti.com>
References: <20260915192739.2369213-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|CH2PR10MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cdf2f0-8173-414e-4718-08df135f76de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|22082099003|13003099007|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	MKUdg2chf52ogtHXnpYp8uN2QMHPGd+6Ab13tkadaI3KdcXkgnqntIT6ie1Rkc12C0/z25jvsZBRVIPvygbE0mnK3JRR+p68d3xL8b14a5vgunU8GFk9BkeT195VxJZBgTjE1Lfm3L9omH6JyKKU14N8ghQ1M47VhWpIZNqtcZNB8qCSmM4Z+0Uuv2Mo/yNzpygyE6o1q47lm8oAHmm3bwEGPLsL7yNAXWKNB3UdkQ8OPqHwX7p4kuKua2VqYboCu0izu5lQulwEkInGe1Z+yCWwq8Q3QZzsepAbgFxAU74uuliiPUFC3GkpCx/XFE3jfRjL5PML7lB9SzrzbMzsqgubtCgxqRxbveqRhGXndjzAamMJofeGcfI7Ue6zJFnYGpMxm5b4qMa+oZBs4dMjSsoGjbbq0WriSf5qZyZdMMttzVnCblfZeMxvk6V+3rM5Pa5Ugq6aToPemFocMZHkljOOmPbaSf0T5Lk96Pbl1nQuuTF9Z96n0velHHnSbueCFChALIncrW6p3aNlAL+2OyqqbZ5aZSgxsh+7kcDglO+LhiXyeBpkQfSNWKsbNi+vZW1WpJvoF33RqKD6La3UvWIt4FOBIY8cYFvyB82nUbhybVGP//yPJO2B83Cc5gzUcOI0/umIsmOdUmTLQmqb2Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(13003099007)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	S3eBtPRt+BkwsSrHFHA+Utbn1IbqphuR9ODBlD74neAERgQpi77147eFImXWXrQIoXnnWJ/n6W+f16REvb+jb/kMIflcpKz0PwkTDXucywm+i7zaSE17WzZ5/bC3l2au1NSFQAFY0DzemunC7aVvZjUFzhMUzI0ZzTLXX6MOvwJLzpNvY7ncyJivZ9/lxv5Tc5OUvviZSTJuiBtBD61Nkh6E9f2BtoIbz8m84zn4X+x5o4JCJQSKUxbhBF+fiJ6yM7rPiFn9BCOCons0lAutXTjBuRdbb3Yk65LEBE6v7Zzla8rysoX5dKBa/5PtDoMVYuw2ynPd5Gu1ICrGyIaWOlTxlNXGew9zKs837p1PKyVuVQOiewpa1lgH/a5Ffy3NzOTFpl3c0tHJXGZ4V26eqe4O34Bzkvi91sjCJpKE0vQPoq2nZCrGYkA0BIIyxkjw
X-Exchange-RoutingPolicyChecked: 
	2Rb/FvLbWQ8zfGI89v1XIstSiREIRQwukAN5/jgJGA0uxLtds1vsN60/h93WDGBlpJ6jdVyGxXO/jUk0j5ALMC5dB5QT3e3QJwfDm0qo8nCaCtv91uZjIurDSKBhuk5hHQLjiIV9Gxz341cwYDzQZQvjt9K6buu/HonBXaeVUgTR69bpYS8b2r0Ad+VNUTcg1hCtwQv/kGLGS2Dt4X6hoAciijvhEHELSkkolPJpYgQN3rXW2UD9UlaTgjCpB4+/kKscQmVhP35Cu/MH4dt7Rcd8fW2CbJ3w0HEDKxj3gxUw1lUA2+mxWbE6A/jQ+cUg0tca4vSev6ibFPS8UMEgNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:28:04.6067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cdf2f0-8173-414e-4718-08df135f76de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4248
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4NCBTYWx0ZWRfX2dJLaTCW70vV
 TqCPICcvYF0MuwSPE46IyafpKtEYM6lrQ7MVZRje4qa7dkVhY+Hdop4tHXBxykjATliAdFcxrwX
 s+NqcnWMGrvyyrefHK0/X1Wt4pwLfHAdcS7gqdIFvex8DMai7sZpfvRAKhOx0IueYOghPlsSSrO
 ofkTR3k8W/dPMneXl5/jH2N6IriYykHAvIpg27/NrSARZXR7t8dEFJwT2/V9xOaTTDXvqJc34Jl
 68DnvXmLQaQDxJxIEd18WMc6iGw2O4Y9gMx6NAF8l7/87LeI1DSbsCUnk7q1Nl4p/HEZaQLMsfD
 gjVHZN7lg/mhu8Vm800vIoZ47CbXHoGAST2BkeBAE7ozIdFDo5CePdZSmLTKFJAKavnaVSTrgmJ
 9rLex1AbMKd3SnxDr9i3ASYJ54ZRCpyV09NFtQdIzDG8Qi+Z/8rbaXEwYSCKXVygUyZ53VNTFgy
 N+WJCFJxlPGLN822R5A==
X-Proofpoint-ORIG-GUID: GL6jSLts2MZ0w-qPXXAsrlyUBLb9ZPEu
X-Authority-Analysis: v=2.4 cv=U7cHnuru c=1 sm=1 tr=0 ts=6aa99c51 cx=c_pps
 a=BlIXLFXQXelmgi4pYy3AOQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=7CQSdrXTAAAA:8 a=k-42gJp3AAAA:8
 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=xVlQdPV1REGw4ApZ5fQA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: GL6jSLts2MZ0w-qPXXAsrlyUBLb9ZPEu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4NCBTYWx0ZWRfX/lZNa9AGnOTa
 VrxQt+0XiY5ylTniYYjClCD8pPRa57+Z16ImBsmrQieNhTq4mWX2RHekFpV7Opuog2E5bsOeiB4
 dLG848OUDKmXJH/8aEpgz0enYon6zw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150284
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 19:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20378

Rather than carrying multiple patches for the same fix for all of the
u-boot versions, we should copy the meta-arm solution [1] of just adding
a build option to turn on the engine stubs.

[1] https://patchwork.yoctoproject.org/project/arm/patch/20260909180341.3858400-1-ross.burton@arm.com/

Suggested-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb     | 5 +++++
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb     | 5 +++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 5 +++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 5 +++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
index 23a5a3af..58108945 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
@@ -13,3 +13,8 @@ UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
 BRANCH = "v2024.10-Beagle"
 SRCREV = "bf0e9d0b7274d2b561bd24c858affec2038250f9"
+
+# u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
+# removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
+# the stub engine API in OpenSSL until this recipe is removed.
+BUILD_CFLAGS += "-DOPENSSL_ENGINE_STUBS"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
index a6284193..5070eef4 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
@@ -20,3 +20,8 @@ SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
 SRC_URI:append:beaglebone = " file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"
 
 SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
+
+# u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
+# removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
+# the stub engine API in OpenSSL until this recipe is removed.
+BUILD_CFLAGS += "-DOPENSSL_ENGINE_STUBS"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index d3a78d8b..8d641bbe 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -7,3 +7,8 @@ BRANCH = "ti-u-boot-2024.04"
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 
 SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
+
+# u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
+# removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
+# the stub engine API in OpenSSL until this recipe is removed.
+BUILD_CFLAGS += "-DOPENSSL_ENGINE_STUBS"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index f7475c2b..2b28383b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -7,3 +7,8 @@ BRANCH = "ti-u-boot-2025.01"
 SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
+
+# u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
+# removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
+# the stub engine API in OpenSSL until this recipe is removed.
+BUILD_CFLAGS += "-DOPENSSL_ENGINE_STUBS"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7637cfaf..f5bddad8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -5,3 +5,8 @@ PR = "r0"
 BRANCH = "ti-u-boot-2026.01"
 
 SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
+
+# u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
+# removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
+# the stub engine API in OpenSSL until this recipe is removed.
+BUILD_CFLAGS += "-DOPENSSL_ENGINE_STUBS"
-- 
2.43.0


