Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AC8C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:44:58 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26002.1788169496598169531
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 02:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lwSIWzAm;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=vb9zlQsR;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67V801573459014;
	Mon, 31 Aug 2026 04:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=LH8WHq6noRBrF
	3Kgo4lekIIVCAG7zME0vCMhoYJoZOg=; b=lwSIWzAmRK3VUt2lW42tIK9qeEjrF
	7UuQ/y9+JeEzgVN5sDvnZD6GtApyxLSg/ifdmulz2NsoEChONCTAsbwlwTLJr/bN
	hCf0+MJRR82GuVCfB192PwwXtkRRD7V16UdXLZ7V4HGA7Dd3F35UScuxgmb0pOfJ
	dUF/+wtIha29HQ3lP6ewAg3q/LNeT31PUKey50vsTxPwSQjfBxx0+u7WzALIvFqY
	8JhUfNX4ZxlVqTmRuXbxY4HmXa2/UiX9xWOtyTw+6GKpBFqYDC/VjdShY3YGCZCA
	4LlM3H2yD/qGRACnef679ssOD/T3cvYYJGyuT3VNzTKlo7j93/CbK0cAw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010011.outbound.protection.outlook.com [40.93.198.11])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gchcnckhq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 04:44:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWbhHmnIi8LDOaRhTJXL2FN+yokkkhD+R09DaQCvXCrL6+jpKIl5CFHMgL7oqkE4oE7b+P6eVVgvk0aXFs0MQE1nCg+ysTYrJfwjnyqNOHXkd8p0qyPEFm4V5HzFdO6OzntPAHb3LUvtZXAkdkJ62UV08YFTy3kFezTgxISE/fQwzgdQ0Lv3MFuf1D64O+LO2mo9vu2vIXvk24qXODDby0VZpaiunQR9oGBQuJ4LJZoQZ4dxoLoldggoirDjdEXXuBmKnRNsr983m3H9qNESnv3fU7ko7xaezTTfVoLdGoNAgt7y/FDZjFF6NUKDu/V7KMXYha3V/V0zBGHr96LxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH8WHq6noRBrF3Kgo4lekIIVCAG7zME0vCMhoYJoZOg=;
 b=EF+D3xxf8HuEUwl54cmmrc6QGi1thzBjqk7EArdSYlpfqI04SbVWlDS9SFh1dWBofjd3Y+C9RaSplcE3mUlHnBhwlfrAoSMZia8WxAGFNSKmRxRESpVsmXoMXednRLAQV9BsQAFiHwwhmDLeSufXG4LAz+TphhIXOKQI6dvzMyFtJuIYowaKLDasOxf17Leghe3Xw1U22gh+hBEw1Z/3vJeaVNdwlCHZ5xtLAeiKuTnwWqE92b/eaVG0XL+VfF7QyCFhmRHqzVtbMN1BkrAq4vFFzNeC/XjmMkN7Eq6qqp3n4stascXX7kov+z8B9v6zmgrRcqmH93CjCpX9/rr0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH8WHq6noRBrF3Kgo4lekIIVCAG7zME0vCMhoYJoZOg=;
 b=vb9zlQsRDqE9BWeJCyTHS96xQ9017s8zSsC3f6+Uk+2+hsFudQsyCjH2QpEOZ6MYrCu9q0MH0b6tLDBI1hez231yWLo2W44Zx3ozGfaU6AlktaJAtpmW7efOmsEDeo77cJdfF2N5zAufYnhPBMxEmeiL64G5iVZuYTFse4gMZyI=
Received: from DS7P220CA0094.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::14) by
 SA6PR10MB8136.namprd10.prod.outlook.com (2603:10b6:806:438::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Mon, 31 Aug 2026 09:44:50 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:8:25a:cafe::3c) by DS7P220CA0094.outlook.office365.com
 (2603:10b6:8:25a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 09:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 09:44:48 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 04:44:47 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 04:44:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 04:44:47 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67V9ij77528773;
	Mon, 31 Aug 2026 04:44:46 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <afd@ti.com>,
        <v-singh1@ti.com>, <p-deshmukh@ti.com>, <j-sahu@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v2] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
Date: Mon, 31 Aug 2026 15:14:38 +0530
Message-ID: <20260831094438.2986368-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|SA6PR10MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c2d448-8074-4d03-e9e3-08df07447f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|56012099006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	F2XafYps+n1u4YFnN8O4BHenqDSD36j4NFtyAX0inStt9B1u/VNGC6fmChHIxHkvj6THMin6so8Ixe602GgzKrIMtS2QPh/DVJEFzOgqxtJahd+3LB/CwFssqiWB/U49wIfX30R1mZXffUbXvklst7S+fhMUMiCARd/zWkL2ZJfISmQ14nVIKwX+UmzM/4IlUpiU0YpVd9J5ii8LugWAXRiVUY4ZQ4A3OVJgXvidb1ReDaYsxXNFxlgPT2c7kzxTn2UGCHOMjdBbQyxLmVWsyaX0Brf1KL9LMHBMAqBmasvbJHqZsxsIPSMuCjf5DRp/eRCkzJZNbLRQeJYYCnkT3qqHWT+7cEQB9s8kAPNue7ewoCfBrnOa/H9JdZS/U6JNm7IIkSladDfK2IrMggcuZqIGanMX9apQ63sMa+JSabt0rf3FWmcxP6Vd9iTrYzrzG9U1sjtmf+i537F8WwoM5rf77E6UdL1S0EnFP0BDQUXUFWh8SwaW9QziZRCDBJi6KydWeFBMPlDMLOLnfSMh36/OZ28I7vqeJLzJ+JhFm7u25ABVEASk9nclauCuRecp4oVq2PV598lX+X2cz1PIwiRJZPPfkktzkYXnBW8UNKNNtHgBkmj6uKn1sPx/LR4QX7tWe8eV49vn/THIJuBEV40RgLrUs2UERosUuL38suU=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sxdeLijZfG3y/4+9EsIwgeIAU9EXsB+rsJ03RWmFlGPZ8RRldT4t9YJF5LjBmtMHxRKWBI47ZARiPyKfUwY8h+bZdcfZiOvML8q3bAEJIydhwVucv0aLLljoN/uzfT5mFMHveFAzc4doTQI2TbImuuhhjOyxYT4id8z1NykBN4x77QOTYGkUuuqkXsVJwZFLhJd55afKsOCoVsvNpFg4DP/a1yb2eE7iTqCP4//IfIEqctHSKxcTXrtwsSeoK7Epp42ISo56tCQiYCI3iZKbY8h9buSTqstVRvsZyJvpZJh0DaQmB8TXBs5olCCPpfs3jPcVkoqRzkLYkEL52MopcOT4pmL+hQR1fxNBxWegf0P53SEIjhQm+KF6FrK7wZrAslSIt+oG+j3fE9EZ+Ug8Xw12BJvWnR67nMaD1+jjWDk80ON/yy9zDdEL5/FX6yXI
X-Exchange-RoutingPolicyChecked: 
	DyeYppF9/JGzojOSxOHSE22Tc3Iqbce0CVYTAgQRTM/WzWih+M0lgDy9y2UuQ+ZIZH4FO0Z28lWHJyYpgqnJIIslxW/o5o35MVkoo2YO3Fzt89scuekPh8VMMyU3UNwDm8vNWC7MZ7qvCyPvjjHjZQJu8zqzcGolcAPbe6a7RhyME5DUWC4xq59qRlu0Etj35mait/Kmbt0w8dsiie0vvIPwtHtUVDM+2s869CyikAlSvqHOrAs0w6n7EXU397mQDG7PKbKVwPrhNibHUWAwE6WMHsLpfT00fYzhGHA6wEM0Yn80c7J8OUhqNW3+zcKiZtezrjtfrw9kfQaSB6AsNg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:44:48.3422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c2d448-8074-4d03-e9e3-08df07447f47
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NCBTYWx0ZWRfXwDdrbu9A6jFw
 s1zkEdFxp5bNfyC+3TxGmLTymSY3brHcKzd3LIL0dreAw/0NBw6kllGsXEZIC1XItF7QSRYttfR
 GUHURksmMejo5OF2C/V9+B49RlcMDmN/YUw4jcMblQF9udoUGfa97MCuKPTxqnBahUkZTjSCfmD
 81znd8LdGqaNVrFsCqRXAsccpdNKHPBP4thYy9uIDjaZw5pU5oVEJyjCl1dJlnCEnr58me5lgT6
 twJPFUHae+cCGWiGDmHn5cyCeyqwukoqOg33ancA/x4LrL3X3BJCtN9lz5FfAUQcOZj8YIVL+2j
 TCGzWb5oC8nYnXMtcY5iuKN8O80aDCo+zqUtBk498GqjunQ5ELapQ6mT9UAJauZAV9HB8xT3iZS
 mpofSCq7gmFiL0FKnPbsy6CigOuIbB1WvwTvUpqhG2N+Z137/rjVG0NYsmHMANKb2u8jud/oyQM
 x9Zyl2KwqUhygV6SqZA==
X-Proofpoint-GUID: sA-mnMUOEP9OnT98neLDPh_qZk9MJhhx
X-Authority-Analysis: v=2.4 cv=OpB/DS/t c=1 sm=1 tr=0 ts=6a954d14 cx=c_pps
 a=EUTAWq9+kh0QDJjqgNTvsw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=GjcEPfTXUfHWH2LR4BAA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NCBTYWx0ZWRfXxE3HZ3ZiKiYs
 4qJ2XpiAz/8X7eMjgFSGjxtlYnFrAdyA1WEmvWepB1O9izgfWa2lPqWyZGKruUSA9DRIop9w2pw
 iN0zdbqkL+sXtDJLCwylYeAXCexz7AQ=
X-Proofpoint-ORIG-GUID: sA-mnMUOEP9OnT98neLDPh_qZk9MJhhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310084
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 31 Aug 2026 09:44:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20315

Set dsp_edgeai_c7x_1_release_strip.out as the default C7x firmware for
AM62d to support EdgeAI and DSP based audio pipeline.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
This patch requires the corresponding firmware patch in
ti-linux-firmware to be merged first.

Change log:
v1->v2:
	- Updated name of firmware.

v1-https://lists.yoctoproject.org/g/meta-ti/topic/master_wrynose_patch/120772787

 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 20c6b531..aad5ea06 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -47,6 +47,7 @@ C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
 C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
 C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
 C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
+C7X_1_FW:am62dxx = "dsp_edgeai_c7x_1_release_strip.out"
 C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
 C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
 C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
@@ -101,7 +102,6 @@ do_install:prepend:am62axx() {
 do_install:prepend:am62dxx() {
         ( cd ${S}/${IPC_FW_DIR}; \
                 ln -sf ipc_rpmsg_echo.mcu-r5f0_0.release.strip.out ${MCU_2_0_FW}; \
-                ln -sf ipc_rpmsg_echo.c75ss0-0.release.strip.out ${C7X_1_FW}; \
         )
 }
 
-- 
2.34.1


