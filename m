Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E95ECDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:30:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16943.1782333032274977249
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Qk7W/Ebc;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mjXd/Q+g;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsJAm1332361;
	Wed, 24 Jun 2026 15:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=jEG6vh7cOqM7g
	GBQTAjV8tkmkmGZdMvx4xnTzUimHs4=; b=Qk7W/EbcQa80zqkbAP77CBNPV8p0E
	M7QEj+BBJfjQc1nKpRijxVYQ0fxT990x6cpCDA3CbV0MR1gt/Z1TAZKD3/6fcEgO
	bZaGp5bbElSsw0qdqL1A31RNmCP14d+x2RboRWyP3c8BJ//L905X5VIetBLi+3m2
	gnI8sVHeFV3fT8Tf8sKDBqgV3u3UQVbtwNyIRlWs7pEl44dMLWatlRBPDo04gXAp
	CIdm/5Ouj9vnFo8FSvcdEczr3NVo7SxfMJA1eBBPURP+xz+Ct/juFGapkPTcf3x8
	EkdgjGB0JDlm4PI6r8xkaPGTD08H2OmALqW4HUfv4c7DvPSDoNNf2zzuA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0aspckfh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:30:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XST3VCvgHGIBvDIEOALl+5oumWRHZMh6dXJniXZZpEDTqjJ53V3sx2n9bNqb+2lze+inUrA8MOLfWyXoNx8RFCYpaU9lOR+zDWZY4I66c8ZsWA59Rex7eJ7zcGbaKuMAXP1ohM7cJOz9pAQ/hqqD+vTtR5mXHh6tJQV08W0dvPmDvOfjCTMVCAX1XPpFFdZzAgtnOunUBg/NfnwQnuEjVU5sFhrBmwHSShmH9gShqSFz6hMr474omIw0mO4Itb/YY6OhonkT52D8swdpV74VC21EvmUswcOb1dO4D8gP4VIyEGt7OwECBVwEsRlc6JZ0s4FgdxnbBwsU5dcefH7juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEG6vh7cOqM7gGBQTAjV8tkmkmGZdMvx4xnTzUimHs4=;
 b=BIdRk+sTBscLU4yo+uNycn/g5iB95czUXi4DpqjsUenDGyppdFWpI2IfGfVd6s59YU5Duo73Vs4oZ65s1WssNT6uor/7ahfvt+/Ep+QZpcSRux7X/fPEEId8YnGcC9ydTXAQoIrhpyoOznUxTjeLyn0zf1SkJQHupy5/rOTiH1nASbBTSw1QdW/XfYYKFPM31gn9xc+GD9uTMu3lHeEq0NDmnY7iBYde9GAXXNOQ014BjJ1Q598eJxJS004RQaS9eUpy3dYxHTve1S/7ziPY8cEtICfoNyMW/nY1CAwDO1+vQQV/mJq4y/gp1E+jTr9o/NGBgNbDTwB41075Mt+n3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEG6vh7cOqM7gGBQTAjV8tkmkmGZdMvx4xnTzUimHs4=;
 b=mjXd/Q+gVss96yxQrtoUKAdDRD4Vk1QuBmWqtsOPoKrkyPBM8C5hRR4CFm4waXGi8Ag+5vFO2Hs9nVmDh17uNz9VTt9A/1a2abkO0IBZcQb0PU6IUSP46a1xdicAVnGCDH1yAifQnehQzJ1FvIQUQyO1eX1uz96lqTlh/vqrtxg=
Received: from MN2PR20CA0062.namprd20.prod.outlook.com (2603:10b6:208:235::31)
 by DS5PR10MB997706.namprd10.prod.outlook.com (2603:10b6:8:341::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 20:30:29 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::82) by MN2PR20CA0062.outlook.office365.com
 (2603:10b6:208:235::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Wed,
 24 Jun 2026 20:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 20:30:28 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:30:28 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:30:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 15:30:28 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OKUS3M1192502;
	Wed, 24 Jun 2026 15:30:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v2] ti-linux-fw: Remove default SUMMARY line
Date: Wed, 24 Jun 2026 15:30:26 -0500
Message-ID: <20260624203026.1155961-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS5PR10MB997706:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e7ae62-9362-4a60-de5b-08ded22f6e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	NP2cew2Zh6/1Z/9NwAamk5lIY1AN80pY4S9kMGgWovQim7W3cl5B6xTv5LKERUcrehO6NKS9YfgeAC0YIMrCj/h0q01jrsGX1Jfw8Fur76tWozOP80QMw9XOw9/FtBEpKREY2H1euEE/Vmep3XpLSJjiIGpMs13Vqc71E1KHAEb9gmLu8xxWycxyqIqRIq3V9RHHY76K20zpD7vhddGx0BJFcOlICnhfLGO+jPCWWXH5JcGvecLzjxEO2No8ZyFCzf15maW2isbqJDDH8K3oQWjLBSZYHtoOnzoXTizPpuFeEdixMSntxK1wQ4OeBiTOt2Eyzo2ObUBnsXIivpK58b6hA0trnHAdB8QmmOxnuPYF2cSw3emUP5WN/MY7aPzsss4Fn59CO+7NgAJ2mvIo75kDeV9H6ziRMXHi/YtUarocG2vgex0DDDGUQdOx/i1hEYjpYbwhX4JUhlKNG8eIT5ZrYHK/03H4uoqrKhXcY7hjd5vIxcM/kNeWNX5wLCL8T9Y/IqZFZJjO1hrEX8ko6YMF9vXEQUiHWAs3F+FjqDF3RYPYEB8wefNhmM+8pjPhCUoevMVDo0Obwj77KtqbBsgOXPjcThEgQNEg4J4C0Vu51rzRtNhlE+Oov/BW3vEauAt86n8v/UB0drZWDu4l0kFsnrSETglT3tfNbVeOua/IYLr80y0ItsV1BYn/V83SzhegUT23Vha7VfBoUAjXIg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tCOFvwh+Y2VvXlzBOhNHN2GY+pFTL89/Jjnxc6A5b4WbvFvqnjJ0BdFqN4iI47l60cZpTa+s21+kS79nqzk/YmgN46MLGPPC/Rh1Klek95NNxBCXKlMwbOnWjuUikv2KpvkVwFAQeIs9BT3FmicSCWuqgQW2FnvpbR9v1r016ixYSDc1NsVe/3/hYvNDfy8ZrKgrDk1KLav7LWD7lFxyMlEGYSxtd7wu2n4Wul52YM9dRp5WMBhLnhW9qlSAK8N4vGPhIp03PicOHKp/IfLpsYrC8YFuugbvhyzBmtREV645NpLZ5E+VXkQ1SEzxQY0gQiUJmMyaToQqtJT6LVqfsC0f/HzgNuLa/8OvrxDI2oYjwAjSxS3i/q/p3khI0/lPLLFRE1J4ttNQUcRRGeOhWTD8P2CPWMsWbRNaQx23RXA8KY47Xyjmjpg9vhUKUtex
X-Exchange-RoutingPolicyChecked: 
	Saa5l3xu9I7+ULbRqc6kcl7egwNsCqu01GxLp0UTXXmxgq2Wsr1W8+BSzpPCLtxTTZOSEjfbHNe0IrVQ4TdHnFOKJoN3wdA2VKVf+hTrF8o/6QAqh4opRW47o50n605hPK6tk3dCK3qZFRL1bdp6djdZuNe/Iqkb9Tpi3AGX7uDJ+Xn4OuqhRo7i1z5PcOC5cnHetTLOt9D709GAm9Vmxfgpcdu5sEC4SfPsj4TOwrU7/uI836r7pjfiZg1pbG44hF2zwuDkLGYDl78mWOGGWpuwWwHfyxtJ0arqEh/Cm39CpCqwjGSO4uSqjb0at7qD61HaNkXaZx9tMheOtmxQrg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:30:28.9664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e7ae62-9362-4a60-de5b-08ded22f6e69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR10MB997706
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3MiBTYWx0ZWRfX/gVhfw2hk77n
 nbJFe5bqPpSY+2PdEIUcIdSTpD+22Ahi+AYuVTTB30DyXLZcnSbbBRMfGT+qGOc5S5SziVEmCpK
 obXaQE7JHNtQxeOUvFo+oVLxfCie4sdXKm4VWMltH5ZaNA+qaMEiWU3KJo+VLHJyohEbGFGxJM2
 lr+8rbMsdfOEQhpZTVQ0LpFX29mQ21YXRes+qTtXfv23cvnNfIkD/spjwiaSJxBYt5k8LSjryIw
 8JOU9RPgDALMIwl5MF5KlN0gj1s7eTCWTZk6+9OAHoRbR65vm5/F2146Jkr6Z2E/5AdyAgvdoZ8
 o84BZrNiOgtCqtVyL6SOkumuRXpSU1dIyao2vUfdTiLtAxNzLKbvqfr7l/cHhzVF+9JSJJEqZSf
 YdPK0sAn7OCAK/O8rQQNygYzBX7vI0SNNFqcBGGtdZ5piZdFAxTo4dUo1VRSZd6y8H+hYBT9uvJ
 auNm9eiEILPumzxTQrA==
X-Proofpoint-ORIG-GUID: 4HLoFmKe96xTjFr6uQ2fIecL5i3CQVtI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3MiBTYWx0ZWRfX/7L6ECmuybYD
 unKqd++FDyA+XLuO6yMonuiG0IKoIs//oWpYZB5b4sVBLzvQzzS2GBUmUe6VaNUwLMKmYDDC5/z
 UniSzVccTIDDedQzAHtEel1Wx1p+jiM=
X-Authority-Analysis: v=2.4 cv=RMCD2Yi+ c=1 sm=1 tr=0 ts=6a3c3e66 cx=c_pps
 a=H8Bh8Ha9hE1t7kEFpXBZew==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=lqCnotvG8z9wFmI3nh8A:9
X-Proofpoint-GUID: 4HLoFmKe96xTjFr6uQ2fIecL5i3CQVtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240172
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20081

All firmware that includes this helper should set their own SUMMARY line.
Currently all do (other than ti-adc-fw which we fix here), but they often
include this file after setting their own SUMMARY, so this common one
overwrites the correct one. Remove this default SUMMARY.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Update ti-adc-fw so it has a SUMMARY

 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb      | 2 +-
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
index ad025483..0b70d69d 100644
--- a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TI ADC PCM6240 config prebuild binary firmware"
+SUMMARY = "TI ADC PCM6240 config prebuild binary firmware"
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 126c46df..d343a6aa 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -1,5 +1,3 @@
-SUMMARY = "Common include for TI Linux firmware"
-
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-- 
2.39.2


