Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18543.1792659168782588734
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 01:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=TLffCVRW;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=UZytQeUl;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6x9I83299001;
	Thu, 22 Oct 2026 03:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fK6Ub+zQONwKp3dGi/UYEq6cNUkcyY2wK9ZGGaBW3
	HQ=; b=TLffCVRWzgf6IHnyywPvcA4ui9OOl1EUA4WZJf3ZnUMsblBNR2AEX/UqJ
	sSosCD/ZYsxYJQnAa+9ah6ethD0jO+CU96M+sRksrm5H0eWxXhW5JxBiMa32n1Ua
	t8ke9ukAmf7t4EAnQwQhVKmrSLzXha53JoZLa652t0KUuThusAoX4jZTTwIg46SZ
	jTSi3LHPOOCyQfqBB+Ex5lefgQZm70JmFeUOJOzlCxUxlIe2P2jtuTLAfhtsgzFE
	95l9B0m4d9zkBxN0vvlk6uK1RGBR5zq2FXva5BxCYLJz7qFSbi7kv20X/MoyAMCY
	pOvls7bbjCbcvIz95JzFpsm2Qw8Jg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hf9ekj07n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 03:52:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvChiaPG+HyCc0F3DZ/GzxO1PzRqMbW+afs/SG17c06/HYcDr2JD185eWdkSo9Ukvn6wI3pvvQjnRwsqp66wUvVCrxIW1JyashwpmC4bF+h8qn4Y8WCOSK2BdTtuyv7pRYqFx0m1i1EX6zYxxS7j0mtGLBsMhCcWG9d5WRqDZOqaNqGH1iQONZz72EkPulqURzXwIweSXCPZmOqil8Tp8gT3KoUSEQ1p0e0uBU/boWqTcdmdXL4N+BlZMleiMxyUqKuaoUnptr70V8xGpGwU/DIa8jq63Wlwi7AzYqZ7aMWjsJfLfZ8Mg5jrf/vETZsK86bOvi8W9Kw1O/5CT/VOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK6Ub+zQONwKp3dGi/UYEq6cNUkcyY2wK9ZGGaBW3HQ=;
 b=E0gYPBWibC5NCbn/IgOp/c5f668ZpxE/DfnyjqYeiDJgMqXj/zPZzoksVjMrVxDVoyxYlIV/MnIq5QcFM8MOxL6uNrNLMWvn6lMH0JtUeQZQ6BOZYh5Bq54eK3uw+0Id5BgNoL2EH5U8m3YlOYfkq2EK8sQp9ETRfk/g1duY/geFn42tGEvENYSMnuBKKjSD1HBH26Fw00q7QN+EXXTi9zoKNYIXyxn14X7jiNqyNkO5kG6ld5NIgQMRvsIZjKdPyLMjRzrsM6UzNcKkcCb0cvhYtq2R9soExo/+0p0Lcjkeze7DWqnjHADDK2RHkX7Owk+xNP1yPooS9xUAulOFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK6Ub+zQONwKp3dGi/UYEq6cNUkcyY2wK9ZGGaBW3HQ=;
 b=UZytQeUlAEvvZdub8XGFae6afl9cwHnaJTroOLqOgBV08sMB2UDkiQ5aVitsLWVxck2VCX1uefMheeEhNIP8U670pDsyyb8ahouux1caDeRxr2Hy8FAejQIPXNk/c7u5lnVM8AsJX+BilOp5GNoYq0W0va2meIfWHWIiMfaCM8k=
Received: from CH0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:610:e6::16)
 by PH0PR10MB5682.namprd10.prod.outlook.com (2603:10b6:510:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:52:43 +0000
Received: from BL6PEPF0006C3DF.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::86) by CH0PR03CA0281.outlook.office365.com
 (2603:10b6:610:e6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 08:52:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0006C3DF.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 08:52:40 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:52:04 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:52:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 03:52:04 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69M8q00g122659;
	Thu, 22 Oct 2026 03:52:02 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, Rahul Sharma <r-sharma3@ti.com>
Subject: [master/wrynose][PATCH v2 2/2] am62lxx-evm: Add DSI config fragments for display support
Date: Thu, 22 Oct 2026 14:21:56 +0530
Message-ID: <20261022085156.1753733-2-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022085156.1753733-1-r-sharma3@ti.com>
References: <20261022085156.1753733-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DF:EE_|PH0PR10MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b88e76-129b-4a74-c83c-08df3019d4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|6133799003|18002099003|22082099003|261021121427099003|10067099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: RIYOGeLo+cTyHqH5gxpMQvn3NQprDS+ElVeLz33f6/X1OCZ8AKCcZHbJfOUWXIzO+6lsNCJsbo+EoieNOFMA8TbuoLKzsInJr1pVMSdOWBrk5t/QwnKGPqk0fCTCGbfrY0OfAT+XMWHGmlVD3hkKQEfcxwoTxAu8pEt0pXuVIMsNgwQ7jlfOTAKSqY5azteQFkkStIpfH2hR1RRO3b318OAGnnW+sb2DOA3gwgj+oLorE0frkYG0/H8utqkl9NBocAzTxAXjLy3kwj72NHjvSdHzGKlWPIPd/coI13RtLuHA4dXfQWX1OeeJZMW2PH8/5pVXk8TI4DUdltpViQ7FM8ScpZkmlj27LAyuRER84GxPpR/77UvQubr4KU/eSEOXSm0E8/qkLwb2akNwMToKBo9o/oLFmKT6PhSZpLiJU6iJfU1iO23hVjdyDj/k/+wB1rC8hbSFkwXaMZZtPAqqy0NxZ+bF2u43vOq0w5G6rqfAt5bab4ksJeVsk/qUviQfoEs+L7d5Pw9kdd9mS6pKRA8VGrgh9jJqz1UJRWEo4cvFpjvIeRv26mNH7nSojc4oCV5xz0dMjCiX9sPi4gH0r9XDmicfUZqxcOHP4CGOIlsJhkooxJujWv57Gb2MqI/PSOrg9xXK7FCNQxthkrlimn7G5jgUHfUYmS5UsGS2qPg9jU7xxeqb2pLprRrSEVEBG2LlhP0yuHWr4+ybLeGLVg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(6133799003)(18002099003)(22082099003)(261021121427099003)(10067099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: meWVT8PUPa3xA3jnvG4I4u2DYYsZBUzhzPw/fPFv0+u0hqGK3S2WXu3+GWkM+XKfak5ceg03KVs3m/zKuGlHLtvR++nrAkFLmbxnRid95NNgZF2RK/XteiVNNtjEfQCnkaQ5ppC8EyfHhz4ikEiY4/7/Rx0puMOnJ6LJ9W4Dwnzy5idRudIyFAfxqC5XRym7HqZu7Rmq9+AK1UsICx0G9zADDCYW5IsAaODh5Sj+5qStMj16yGDXxmrZ6rFZlsG6fvARS2ETm+a11iHI6/0ALPlq/h+Sd//e6NFR8bXyqHYNQF+8VnLn3/321ZGuvMP07ISrenwGcKyjCG/ZEGxGx+bYSV9+jsGGHiMGuQOLy6fkj25In3KFyhXEnYJp2jnZsnG/Ien8sfxYRRFV2CLl3BbSGI3YDqLTcHhpa60ewtljywz5xv1YbBuja75f2NRW
X-Exchange-RoutingPolicyChecked: LigI3dpffl6//RmlWE3h9zWmJx73GtnjkNi7D9+S7bvdf3hukcZtxJJihnxTsl9/DuCRgneEcQv9hxMwfFhQaPxKeJq3Ki1L3/Vi4Rr2i6QbEDtaAaBrQpYenRdm3b3TZt2fgseoYcakEJ7lUtvCCPhzW1E/M3+1Dp9BKDE2uSPCqoNYW2aMaOAzw63RdFOlVWWFWc8SJnbSI2lG+vpvexOkOKDgFeCBBpHiKIl+y9rWmMQzKVWaEMqhfns0Gr0y3jsfuk1fyfbznbRU7/b9WuiQvXTYEvlp2ztwhI+drfI0PyIebRklUGaiOIwsN3762vZMR/okMJIBSoarG5sbTQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:52:40.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b88e76-129b-4a74-c83c-08df3019d4ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0006C3DF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5682
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX/FMV6TV1PQfg
 624js/zB8XY6mnNtwFSpfupGhbXRLvCpI7eqq8iB6AuhNU1eJC4EWsh5i3ioeY+nzWmfVgmuAs2
 RRhhZFzlPq6XZoUah6P3+C/jjjgMlxk=
X-Proofpoint-GUID: GTYxWCXCRj50QYuA6IGVs0hIDY8FhYJ5
X-Proofpoint-ORIG-GUID: GTYxWCXCRj50QYuA6IGVs0hIDY8FhYJ5
X-Authority-Analysis: v=2.4 cv=Td8DJhQh c=1 sm=1 tr=0 ts=6ad9cedf cx=c_pps
 a=LQDsqUhXq6x2TIKBD9Oruw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=u5AcL_Ogppa1QhdG11UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXz4LQil0nrtkx
 ARVedApZ3VMNiTXbiG+Yi8IhH+k5MoJYjBrCLHSBOonzNR80+hoUybZJNsce5v/UsI+Zwmm6jjt
 s/qb0kdpq/TV4SiMRR9qOlTeZqEzVKSNfSidw6scGvI1OAqh3cABx3fhoP/+4K1nLgohQ+syhTT
 OF6t9muJjSEyA9CeXTMZQ863pgcRZDMZs8Bvx5m6IPYU0XWi8dsl2VTzBNuuS6QsGKuukB4mQwQ
 PQXhrKjYL1ojyt+cjO6SkdrnK442OGfW6PT+uSoNM0OfxMoDwt3fhZ+FBF1Co0BsWWkVqrytt9f
 5FdSv7e1jiWTlR99SknEKOxkXafeNU4gDDw76oLJcgVDH6fmPzvUtG6ZhtvInxLGSyz309HnMdJ
 YhT1nlFE/4L9rUQLCqMUCEtO5sWqHKQkw4BhV6NmJ3vJsyi02YXHoOTXIEuu6/yfPdIFWDOh9GH
 unbdiqKeIUlgr4tHYjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 08:52:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20482
Content-Type: text/plain; charset="utf-8"

Add U-Boot configuration fragments for DSI display support with
Raspberry Pi panel on AM62L EVM.

The fragments enable:
- am62x_a53_splashscreen.config: Splash screen on Cortex-A53
- k3_a53_dsi.config: DSI support for K3 Cortex-A53
- am62lx_evm_dsi_rpi_panel.config: DSI Raspberry Pi panel support

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 7a422617..133054c9 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -26,3 +26,6 @@ UBOOT_DTB_LOADADDRESS = "0x84f00000"
 UBOOT_DTBO_LOADADDRESS = "0x84f80000"
 
 TFA_BOARD = "am62lx-evm"
+
+# DSI config fragments for display support
+UBOOT_FRAGMENTS:bsp-ti-6_18 = "am62x_a53_splashscreen.config k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"
-- 
2.34.1

