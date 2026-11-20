Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3012.1795202836186589535
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 11:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=AXnjQPrj;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=cWNLB7nS;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKF6qFM4006180;
	Fri, 20 Nov 2026 13:27:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=mUvRTq/MjY6e8
	Hx7Migzl1faSgPlT3hxMpE7gAptuNI=; b=AXnjQPrj12DFhSwbemo2o/bDQzW6f
	qbZtQcH8w/ddhuaIzdN7uwcrMh6TFHQKOvMEBjseLucEoMnBXbZd3KD9TLzKsqRN
	wtWrvNBV6qq8PwhWmeq+nx8nuP2tI+ebc5fuBReQG06jXwbEDZXoaEWPSq4k7J7y
	FcMr76WZRncEnw7uZI+w/lSYlXGf9OGPAFeuAAT4bnVsZs7OQQtlZR278hY3cutf
	/SpN4Kxx1za3txWqgc3icAi0MxH8zqztP8z570CZQFv2EkMdPI5Bhto7p+aoqnJv
	cyF+If5WUqLjKoj5NtWVGUhvFqOaM3Gnc5XdKsynizeop7m+Mkw3PMdFQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j2rjjhfwc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 13:27:14 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKM6aIsli0+mAYHpeSVV39ny310vHu17utazntq0U1MZ/57BmHEcwa3ER+gKV8Zn0NY2SY1+MkfSB/unKAh4iNe3Wz1NjnIhI/uy62MkjNmwVSUjFJM0RQVJwb8E0tEoNr+mTzlJ/Cql1ya0hEozF8RLb7UiLmmxuu/0LRKBlMEM16Lz3jajSQmoXBPU3mUiKARm+UEtz8Wui530GGBaPTelAWdxiuHfY5LG2jenH0ljTcz9sztisbyOz6Gn/r4lj61G2jD8TyPaA8gWPhChis+j1FWYuKdXAzrptYvbr+Heo/+uewhGIZdzh/xngvguIyKhSum2Cj1HAyDeHs6Hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUvRTq/MjY6e8Hx7Migzl1faSgPlT3hxMpE7gAptuNI=;
 b=f9V2+H+pV32G9Ta02GdMQ86qh+P9xj06x9EfAlG+56CGIzJ44XBE/7OJcOtrAwCX9PYKjjPc98+N/njWn+SBLCmcHlq87/h/1osIv58yny6VSUKDw1Xr//w8YwAo8LAuU6c4LcZ9Z8v8qRp4LPI2ohudQSDR8WYovf3eLSperfBSN7IqcWdTITKtRdNdf7TQo53sOHtlMLFjYYFGqaVHrV1GpcXbW/9FTUR17Iw3CNWn9wzKZ0+M6kUK58zMD3YeWAUu37qgyLwnJtrRdfxHZRWEJZDTGOSksFLShjBL/OGdBjjorPX66Ngg1oxETGpodKh06ciLbmrGIyRIVCdfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUvRTq/MjY6e8Hx7Migzl1faSgPlT3hxMpE7gAptuNI=;
 b=cWNLB7nS3MFOljHrzshD+19ClRJILUZEE9pKbAILY6f9gZpZEr75t9thLJHr16q8mh3mQU9so/1gvyKBMEGAQ52M9pE0vsTpg4msLh1RBVQUP7DCDnii+KQsrlZcAZR+UcWsEeErj8ozY+Jcq2HNx5w7P+vhougufeyC+Q6BCvCxjDAJ88SpK9wl9ikdhdZydlqoVoZlEAS1KLtsQMSqxufE1WnPo233hjsHqLQdaeOw9AiKYGhjpqZyix/fcpKMxzPfUveK6fTg4WyMxOtzq7wdaMutYmygbBQJnLQaLrTSypvyLa4xiXLcJN02YypvwNcAmtAcH3QgZEACAlTELg==
Received: from BN0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:408:e7::17)
 by IA1PR10MB6831.namprd10.prod.outlook.com (2603:10b6:208:425::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 19:27:10 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::95) by BN0PR03CA0042.outlook.office365.com
 (2603:10b6:408:e7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 19:27:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 19:27:08 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 13:26:42 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 13:26:42 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 13:26:42 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKJQfgK2883176;
	Fri, 20 Nov 2026 13:26:41 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 5A1882A67; Fri, 20 Nov 2026 13:26:41 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202611200727
Date: Fri, 20 Nov 2026 13:26:41 -0600
Message-ID: <20261120192641.3262038-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|IA1PR10MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 059f238b-75db-49b3-08e8-08df473c44b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|261009223027099003|6133799003|18002099003|261009221227099003|3023799007|261026140227099003|260925021311599003|260925022911599003|260925021911599003|261028144727099003|261102123227099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: XrSZV+4on0EYEe7iqECkWKJp6cQWVXB09ILCbQgdkD09Imxjbd1yWwTKicl39sAeX8AmncZXzrA7oyMdYY06Ul3j7a3WOIGsfGu57s8jCg55esLvKQ/YQNvTbl9e6jJeHBCHlkIGX3keSxOAq281p4Y/eef/7UMXQNcWvYbLTSxR79BBPxwQwzKEU91HX2Wy3p8hbP2b98sJR9FFORWyCJ5I5LlAqxV8ZMOKMgrptZeheITfll43I5YW7wT9r43qcM6CqbrxmCWxeL3IhAYe3fgbzc30j0AaWH/6zsPWUbxrtiMXLF9CnlHphCVluLwKJEFKfzhoJxI+RHwMrCqymXJ7ieN5H7ryVSgdhdzijaZot0mJ4hV59Wn7VyCUElkhVoUOHxc3BwuzXOUB6pUr+1aKbNsQKYo+6J2GU8ixzqP3+13PuvePa0jDTw/GW88L7okdviU0ZN1rJrp68K9BhT4Zdj1RIMghsnuitbKVCEbkLtU+snxxVgnVV+nc21G0xdw0PLsgY9O9LjerilTOj28JwRHLJO/Av2z8u4Mzrok1QxTjI4gqQZ3j7JA/gvyAfTk7BXv3NWSOFGemmPhS5VjF3fxMARJU7B8cY5/3wWNZLF5EcvNT0rlQEPYDNGUtSsI8JbJNImlKSo7pA6ja1uanVD7Fta4mb7br1jn3NsFzfSXBWSWHCI23c73cdkTOiWYn41CbhA8+TaxvOkv2NA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(261009223027099003)(6133799003)(18002099003)(261009221227099003)(3023799007)(261026140227099003)(260925021311599003)(260925022911599003)(260925021911599003)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GO7joJD1+DD5Czn8+E5ZVNgusHW2DhqTbWwIzRzAGIkDVEC2FbmFm39OBwXKQKUMnoUlvv7sEV2wol24jtypoCVHKNuXZsstBq6hB7zrNcHMJc8ii0uWovMoCzWHl3fPq7CTasvr2GrlTa5YZWmIeAfeHztQWoU/13Y4YwW27vm5QhOOAasXeIEsRZoHtx3DdI0pLe0DQFEjgAFw9wWOgFu/mi9aeaDQ/kGhkkHj3b0eB132/VP+obXqE867VFYnYPY69hH7kLo04gAP/Cxz1iBAtxOcvcWYYDwxc+9i/3yH+BrOh2MZD1F/ArvZ4JMdWbdicuT8kzSF1T4r3EPHDix80JOAq4MeMfHiP9HXdA9j8RTru5iM8Jlhpn0nBDfGdXrQfr4FWMahsWBbQJeEYpaUSCQFkOUIrlfruxpA4PuyfpdR8HHh8qOwUqW3+FeS
X-Exchange-RoutingPolicyChecked: 3kfsVVPwWjZyubb3AiP1UCfvXKkBhS4QHY8GHgamMVo9Z0KeiMpHCx3ic4/5R9PfPazbVdxchCpaUJuca/+LTU5FfdJYoFFeqtR6YjjkNIK3/3Jjf+NLA0jsaCeO5j1O+TaD2AmytAG42dNZnUIov00I42GP7ev3pzh+My5geLaPAvTzjTY+9VnD/1EXD2wydrltG3OyZpwjcFhNB6N+KkoGDCImFz5cQoARswdpTcwvIX/s3HrFOwlb4rqsR7S1/GoRb6ZBnRdz2OOge2LCEb4/XjSz3X89Ke1kJ6In+JOYM5ASgW2ZUMD5jH6PV+rSj4WHx2a6cwxWvbi2HTVSDA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:27:08.5041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 059f238b-75db-49b3-08e8-08df473c44b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6831
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX6Pwazs6wD38+
 YvdAi3hqci+42C1CeRHDzf9PbD8nstWZ8+CEVUX8hAXYzF9tbwsb9TVBm1GUku4vRuiJiv8CSmL
 fOSC3GyZCHoj3EJ1TnKSD67lmyAg/K+fOGmVlHLajIBa0wc9tNcnJ+LyZ2y2rxLGnhxMJKEASxR
 A1PbWHOlzpWIEmdkOqkk/nlNRthL7yqAU39BqqCvOhRFHKBt40P6O1uRwS4MFbwEgN39s1/3vfi
 pfLhDEtQ+XBzLdpaXD10m0H3kdqnKNdKII8GwRfNM8feDvvTjZZfV0iHs2zVPe+6BSY9eLenAJF
 esu4WaVOv114rDaqh77AzYxdqP4o1PuUU8WKBxnnWRbj5SdHYsCRkVEhU0wgpFCp63McI1jv3Fc
 AbS/WSdB+ZveCcwNe4DgpBwmFTGXGbM6RFB70ZGLsxDftayp14AKcoPwtbz4UgxBJ6F+BrZ3j7l
 WQR+uMys+HkEnOwL5UA==
X-Authority-Analysis: v=2.4 cv=GI2dgeNK c=1 sm=1 tr=0 ts=6b009f12 cx=c_pps
 a=x0D8RYL8GqfJKF6oaN0fjw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=EQq8FFkIX16rlHgwlwEA:9
X-Proofpoint-GUID: GtHTcYVY6--FZjnka3bkwQT98WQvcodA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXyo4nQZTxSIRw
 AhTSV5cZp13WIr/03l/uSRWKkplfnb1TzPbcr+AXUZPzVZIHrhlj6CGWqXYVDF4t/qK75OWQxXA
 HnFAo/7GCsKuPoPW+nUXcGDr5trRRs4=
X-Proofpoint-ORIG-GUID: GtHTcYVY6--FZjnka3bkwQT98WQvcodA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 19:27:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20565
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: SRCREV_ARM32
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=3bb6367dd98310c1651974402f23ad03fb408ab4..17e4757f59260e07e3af17387a5dc0fca3ca05df
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=e548aa37d51312e4dd4f383eb99820e6e0e64d22..2fc9dea3ac3b6d8a29fe899f1e30edb361908866
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=fe51a7637cfb7c37e90778949da9338daac552f7..63ef7e2f5df9b37eb96b346335c01a11d90f7b7d
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=eabafcdfc283007d86b1dba7f22c5e13b02a98a3..464588b87d136040042ab7b4d5d8a1bae8b354f0

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7f56e515..0096b99f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "3bb6367dd98310c1651974402f23ad03fb408ab4"
+SRCREV_uboot = "17e4757f59260e07e3af17387a5dc0fca3ca05df"
 
 # u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
 # removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index a2613d9c..5c34f40f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "e548aa37d51312e4dd4f383eb99820e6e0e64d22"
+SRCREV_ARM32 = "2fc9dea3ac3b6d8a29fe899f1e30edb361908866"
 PV_ARM32 = "6.18.63+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 2331234d..00593460 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,7 +25,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "fe51a7637cfb7c37e90778949da9338daac552f7"
+SRCREV ?= "63ef7e2f5df9b37eb96b346335c01a11d90f7b7d"
 PV = "6.18.63+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 14737586..136651af 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "eabafcdfc283007d86b1dba7f22c5e13b02a98a3"
+SRCREV = "464588b87d136040042ab7b4d5d8a1bae8b354f0"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5

