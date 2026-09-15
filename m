Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6A9C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:34:13 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5113.1789500848515159504
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 12:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lPxsdDms;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jWc49WV2;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FJN7mr1179355;
	Tue, 15 Sep 2026 14:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kqa8NwenvhQvHS3YLlu3fwYWz9dYBXF0VicI02UnR
	Zs=; b=lPxsdDmsuX1f8Bmp1GY5P1/ZgbDB8fFGnNkQZGZ+kz6k5oDfUtoK93oOl
	xIVS04GTmBavNfOMpTOHFYpDXCMmTy+rMzsnsWxedDQoN0fAmcnqdGeNGmivlc8k
	2R+nv7xRoYUmMwsp6pE6iypU9t8mJ8Lp1d+wB7layCAcPi9G4mUKGp5jxv1fX6xW
	MBJ3h4EClG1FqN3mKyOd2adCSaYptSTv3LeB2PNVzuscpkuPmfZ2KDSF7fcCM/SE
	IBIYVByIOnhrfnoAWtYwoX9jq+2+HfESnoq7Pn9fr+J8MgeWxI7zay2HqS+JKgjo
	/0N1bk2fyQ76nDYHS2cowTcsVIdHg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqc4p8344-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:34:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWOu2ofzocS2hlWCdpjmaEJQiTEdeAbLZnhXb7qAv5lr6lMOKnN6s7ImjMAfnO0OML3UWDCUvLpCYlK2XEKL//YW/bLAcmvGJojV9LxuajJRx/8sXbuJcMU7Nim6jPDIFDVtLUVKCePwS3HhXsqe2B7TgNqhrqfBZgF5T5I/pt4yTN6Y5OBAiz7jjWIVVPFRMAupdQ+9nhlUUMHBT5WHPSxq3sXcVAhsxTuH2jvxGhHJBO7RvqSQQc2CDH4V9ysH8BFwstI8GkyCzTAmHpGpg8g6rLpqTSywwcL6wBpWqgIz2+sjQzusgPDicxM8EU4IPrM/GKr/9NzMKt4UiYH3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqa8NwenvhQvHS3YLlu3fwYWz9dYBXF0VicI02UnRZs=;
 b=BMgqrt63vj+RYixl9yu5LbM7lHkhMtCF2visAMzofyTls+9LyZ5g0il9xKQxQWcFdPI7CjjXpa4fSzkrpWyXGcrRP3HAhghCGOltaBX7zpwbY1/iOEp2yA/ESae4xD76jwNX5YJhw8OwpevQmAUK3zdBZikBv9OXLJWQFUPNT44uMMrwTiIPcJbPeDDsA9MczLwuwhyfdbPJC645gfNdgGuNbdflKtEcSG9DougK4IJg6fA9/q3VhISHS2oCo87QjAS3xV+KrDFjByDMwYw5m7+G3ZpWeAAommXtXAulBTJWaZ3iiwDG+bv9JJM0pwqdT4CDssmy8/QHmgtpi4xk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqa8NwenvhQvHS3YLlu3fwYWz9dYBXF0VicI02UnRZs=;
 b=jWc49WV2Xr6ACk1D70ijZtw5k2zfKrrhftrK2q8uzBQSgl6ITyLsxtGJUXiPIPpg1HyAopGI9iskWzhcmvK4DessUHsk7104u/3Nogk7iFC3ByTw2sKRJw4/BF8K/8W5H5c/yvn5iv7loWQ0E9NI1wQGAedfjFaCXovzYg0V6Xw=
Received: from BN9PR03CA0323.namprd03.prod.outlook.com (2603:10b6:408:112::28)
 by CH3PR10MB7531.namprd10.prod.outlook.com (2603:10b6:610:139::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:33:56 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::13) by BN9PR03CA0323.outlook.office365.com
 (2603:10b6:408:112::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 19:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 19:33:55 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:33:11 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:33:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 14:33:11 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FJXBA2583621;
	Tue, 15 Sep 2026 14:33:11 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x6Ytz-00000009wQd-0xEo;
	Tue, 15 Sep 2026 14:33:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 3/3] u-boot-*: Change openssl fix to build option
Date: Tue, 15 Sep 2026 14:33:11 -0500
Message-ID: <20260915193311.2369532-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915193311.2369532-1-reatmon@ti.com>
References: <20260915193311.2369532-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CH3PR10MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 35925f5e-988f-4dac-9a4f-08df136047f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|22082099003|3023799007|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	s6sQEx9rPbmJxFQvgdCv9HM9qLU1A0V7u5XzfB4RrdX03eeQnIQUhwhD4IYU9qzHcxadZCWcFCLFp8ZUAtgjkyF4l4ZtNAySGdKR5OAEnFf23kdP4QRSIkIqlbs4/aWlv92dxkpGFJRktq/2b1X0pH2FftpUGGjA06CTs8zMTsAuwZCXZ24MgNlHwLhMP6mU7g9E83sKXSb+oiRg7UgseT0XGYD8ZzLNsmVMD8+VPH6JwJcSKhvsUWQPCx9OKZkXWJaxo/m8rVH7xgDgsA3CM5MMCN1bnZ1YiBiXySB6mKWZaX09mzx7+gDTaAILJTyj8eunFlUWhMeLZegds4k4mCtPaPnf+/EeINXr0bi5DtwQ3jWJNEdBMvPdbjlMZ12wVLs/UG1n5bbwSjWN1yOPdhm3UKVtM6yesi84rgoB694j+Ccv8XdDzWCVTw2raV25OH9Nkvz9mnuYCkz1oBbABgr3kX88LLiEuonu3pUXLs675yTGMzKhcebVG7tys+CFQG5KfpaxHvqCPVyjVcljnVZITsH8ixe6F0TDuXoRLl1qEF+K1UtlxQG2Jaaj7bptUQHRkh48Krw7Im4utX6RBi8955I54umDXAIZk4N97HRLzOeCYTTIDlihDYrstIZAQPSpugHKVZ8FCo0l+gHd2w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(3023799007)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zWQ940YeoJ3EmUU5yV1Lf98mtBn1ixbGn2e2T6ZiBr6XLZODrWwqtmQ+windQ30ih2lvzR/pnGfg+eKiXJiIXB7VsyQd2NWDDECvzWu0EXVRFNUma13ZYWrJFI0TkmEYAWu8aI3/ZeO7jdcnEf8DU2cN46KB6YKvPJWTkczh95cnBzYVLoyx5pDvMZGH/KY8M9B5RmiclfeQinpvCjJ7rpkuJvEpitxCTXxoOFNHMeOrchWp80ooJp76oHiJWv7NRqojtUjwDFJjF7QHZURfseUcxGpi5PeVrNlG0yiudagnyiJiWz4HJliGuFUKV6UDEwGA+lf1h5C4g8o0DWRUNM0zxVEl4rO/5Nq85PeIlEmIHiyGPo5EfHPT/2hpI18G3QiGEMbzZVIfVzsUeFDl5wE6XUctHlKiN89hyXvRd5rRa4Nt7VtQjRaw+H0MjUnX
X-Exchange-RoutingPolicyChecked: 
	uq7T21rbyPzahBgitSqvmw04GAEmT0uTRwAaH/Fl834yLU6Vw1LW0G8ml21CCZPIckLpv/jSxR3uE4WKiDlqRLAfS1L/ilYyaZW6QvmH9eJ50r9cHokd1MUtDw6CDqRaIPedY6rXb4QZhDzvA3PyCGqEb7qK2VC+ZhJgTVlrA/G2e2Gm5UpXR6wHNdH0/W2vN0jGwrW1n+b+ER5xZYewROQk1TS+pU7qI48WnG08IkkKtKlIcOdwYzxb4gFpHK7PKiqNKRJWf432ihsxfQ88i0cQPR0CxuxuNkP4rFqyphmHwE9x79mdxPnThJk+9i9dKa1/p5R7JtbYXhm4MmdmwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:33:55.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35925f5e-988f-4dac-9a4f-08df136047f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7531
X-Authority-Analysis: v=2.4 cv=HP9WhYtv c=1 sm=1 tr=0 ts=6aa99dae cx=c_pps
 a=JgVaYur/QNM9XUS2zzqRTA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=7CQSdrXTAAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=xVlQdPV1REGw4ApZ5fQA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: IUWCWTzZ-fZYu0zOUnVMP0_uequEOfxv
X-Proofpoint-ORIG-GUID: IUWCWTzZ-fZYu0zOUnVMP0_uequEOfxv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfX8QQEK0+y4rkH
 B+XPqZKe0BLGDipOqnhXaDPqg0yW0j93wCx6s6ruiG1uctlKkfftr8WEPIHtcOsl+XzhW+51Ow1
 MpxLyd14vduw0K6FmTKtBIylD3Qclhw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfX/jYQCX5J1eUv
 KZqt4me+GFW+BbG5wcId2QixV0AyWL3Iw5OibjUVzeaSQjWNA6AibIAqdZQ7h/csgIgUrLs7zYG
 Mjbm+y+kz7MG0yaf0NXUTkwdG+PUKUJwux1YeR59qEAsR30zqUTGACWKYeBe5gS08rjQaAj9Zw6
 rNpFwLXeps/c0q2trKTVLa9q740a7kRE3r417jkmxhNxrwG4+ZfV39eDKckcYez9Qc9f8MZRvsD
 j8HUgMT/JExJOwDKxRnAbi9ZBRwRCeOJhGLNUjqUj+V82gXt1qsTfBkSCmhs+Gn1cPPSLuVYXtI
 X5YIxLYTC+hLWmaqOwe7ifyOV+JEWojLdmvoA2dZIBpn2OD+xd0MbTmL6J+JCRGRFC9BTbin4i9
 MP+kzJPgtbvNUTISBM7T6t0n1jEnxxksH9t5io0192d9vu31PKP9DaVa2VnsW5SesTSja9b07+C
 7kRfJG5MmuVPM6E3hFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150285
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 19:34:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20382

Rather than carrying multiple patches for the same fix for all of the
u-boot versions, we should copy the meta-arm solution [1] of just adding
a build option to turn on the engine stubs.

[1] https://patchwork.yoctoproject.org/project/arm/patch/20260909180341.3858400-1-ross.burton@arm.com/

Suggested-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No change

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


