Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E22C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 20:53:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7895.1790369598375402767
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2026 13:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JQStw32z;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=P8vQGr4c;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68PJggOu3099198;
	Fri, 25 Sep 2026 15:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=XtzyXrsemktqp
	telEhN9dSUllpXta9fn41Oupb60QUo=; b=JQStw32zHPd385VLUlHuMwBio2Lgc
	l6KEyvWjYwmqjbxllOPtQ1e/qtakgwZzv9MjyS+OCSEVQliHPGABWPtyIRJqbP50
	vbf5hazum95FtJLOyOth9s09EdyXBM6Db1NiXypgj+xZ3Lr0FA8b8Hnot/Xbcbmv
	d4EfCWFnaK2a9kCP/rXXRImBEA0zBjrm0UFZO65eVEBuIi5lJRwCgELtC6udytX4
	F8AHY0349QnzeNv055k2n5Zsz1cLMisZxqENn2E9AKqoPZaGkDZJ9kTpDrqBU78X
	lhCw0+Y661Ohfo5aS3hk0QRA9S2n0kmGqxgOnr1CRcML7arKvpkk1Rybw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gwybrgbgu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 15:53:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8im9LOnGJMBxgTpyBW3DWAvQ8f2WUg4PnF9B2hcVyHMGh+Ikd7ea5eop1X41ITQ0c+hZKkZTBb7BHQUCofFeAlaYW5YEbYO7J5yckeIiejbxQLazQxQNY8uLAXfMdbjjST+/L0M1TQomDWyFs5BkyGYTQi8fncxnUDRRG5rkeQ5dZwJodI5p29okYdzgNc2o8UyZlwoKzNQbAg4CP5TY6cXUqSmUxQ6WCAgKvO4AJNp7BJtpmaiqvDVjJwCHlU/LYiGRMURcLIrts+TWc7pSOZ5y0pQ32h8EmaOeejkXmfhZN40mv2SoFbgWyo3HGlZ2Pyr49GuVyCRRmUzyX5h8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtzyXrsemktqptelEhN9dSUllpXta9fn41Oupb60QUo=;
 b=x/C9M/R7EiWneB/RMMnbe0oXBV9kNUgj4wfyB36z70aLeoTADPd4qzT4bghAHCwGiZ+Y/wqkWZ5ATxjOUas5w0twfcYLUxT8j+ocKcC5kUFZn37ep5y1Dng8s+ptDdzqifKPwrYIfVpAMPy7j7ZANB6nk+xEKjtdo5MsfGMi3GXNUv9cd7ea0Ww4k14o8Y3J1fmU4BK/D/ZvsNinyyMyUxj28kImaA/97eS2TsrwsjKqKBNAOZEzUOXQhf2uUrUooRxYWOJYI6W9Ir96VUuMfySkMjxgvMpVeWmvs/9QnXBN6xh/R8S3+eCK4fP4iGe9kvY1qFZUwmRba3jgceFBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzyXrsemktqptelEhN9dSUllpXta9fn41Oupb60QUo=;
 b=P8vQGr4cGrrgcR4x+W3p3fhU6aVLS91bWHdJh4xryapMNrL/LwAoyIEtKn+MvQ2kAu0E85Cf90T30fcpcGQiBELLaRmTVVg3iU+6UeW8gbXq2v6E9yPL1nztgWV3A6iTSHRXpZ/ni1zhsar+zYCi1H3d6dy+qQzMXt6EiB8Pp+PQqJLyYhdC70qNNx/MC0Z6wKjRSsV6YPROHLe/QqpogOPhas9jgT03MolpkSTixjvude+JzUbwub+vBIddkfZDoscXvFVEfYEDW4yyVIKfuFC2HPhArahd1WuzpRqoZdy1kFNQ3OVNIrkqjt9z49t6Ij0LFg4PC9323bJcv/cUWA==
Received: from CH0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:610:cd::32)
 by DS7PR10MB5053.namprd10.prod.outlook.com (2603:10b6:5:3a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Fri, 25 Sep
 2026 20:53:10 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::6c) by CH0PR03CA0117.outlook.office365.com
 (2603:10b6:610:cd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 20:53:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 20:53:08 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 15:52:20 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 15:52:20 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 15:52:20 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PKqK8T1207609;
	Fri, 25 Sep 2026 15:52:20 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 7BC2E2A61; Fri, 25 Sep 2026 15:52:19 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609251030
Date: Fri, 25 Sep 2026 15:52:19 -0500
Message-ID: <20260925205219.1830878-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DS7PR10MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: d56b3c0e-dcd7-4ab5-7132-08df1b47013a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|6133799003|18002099003|260925022911599003|260925021311599003|3023799007|56012099006|10067099003|260925021911599003;
X-Microsoft-Antispam-Message-Info: 
	E/TXD0ELzNjSPVAWsioVYOR1VNEoQ6L6LiQaomUxXOfp87JhcPIfkxVU7MN2yDoNKlsTV0QlWgrvxFQwtmrBQxJhWtXu4BBHazrN4QhX4xjL0FEc+aP08xMxtFekf745sKOxrgyitwV692GgSd2ctc35GK6XNlSg4IbaJLFqh3ifZ+QiJVGYoCFq5ZYnCmw0VrLU2cm7vkJBrIepLO3xADcmjAINDtVpythkx1OvHoUTsCqteisnJ60iA13t3ZM//SRwV25nzbDhO/2k4KM1r7h7cBlbmMTPjm++QYG3UygclWTCZXSMWpfNdVFKsRNSUm7YrOWc/Sya6s/c7T79dfEh5nDoqBhNA9wKOLDG/+JPzWjMgUTeyppy/TFe/5ppLFKOZoHyGQIov++TjUNuFmCfivp2Q9v9GF50zqyuG9pm58MAPKY923EnJ5fyN3y0fmiLXQw/tPkjiWsGXN+v/m2zPMR7D8ZB4tEbzbRRMLLcoq3qu9Ce0SMqaUCt+CkyBaTfd6GnppBhtVX1G+Hv4ArNCXig3LXzn2e/FRdItKqRLJfVCe6+RZLM0e9YTjTL70iM9kzoyvlMbS9sMeu/6aDyyqijGT0XpaUFmo18T2XZEE6wx83LDa1Se74xN1D18aUsYfW09jSYEgSAJzDpMw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(6133799003)(18002099003)(260925022911599003)(260925021311599003)(3023799007)(56012099006)(10067099003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	by6txXJFMAHXg8cH0NaCWNtFjlQQboqq47kCjecxa7q7MeaSGabJmjjJe0PlIpVkLsgwmpb4mrFWejW75jnaCYzu0RLuYGbnigQZ7/8JOgGG6z/MLc4Jedy3UICBkGdYwLPdHSD8IDdZjCHWr4mMKmbE6Ttn+jw+eMPVRavB+x0duIuJyM1YXdUMY78VieZN0F03UTc5304ahFRiqZ4IHQPE/i/3Cq0l00r0jGJ6zMbMhW1f35criQK2YJIC8lIHSaC7oyTDY+Wq/qae7PYtZ/g0GN0nD41BApsgXrnikmGlqajxoPi4YQoFEHwqTZRaOxANab3fwJU/qYKhKsgXEw8Oa1WH0tny6Nu5xTRPM7tk/4gN37218KUlHk7HR6Ic8yp1gltAcg8B29StZRpcO2rpqZ+9o/f3tlAAmasflhau1lbHk52hXSYXhCmkKzss
X-Exchange-RoutingPolicyChecked: 
	GKnOATqu1meRFO705N+oJA6uwXVaf+ZBFYsvZNHLjLB5xw74fCNeOv5kXPq1DmvSDe8V+z4E0YHGBjA2IJxR2yCGEQ/WOLV3tSXeHvBRTcrG7bRlAGEVXxG0gaE53w3Um+s4Uwlkrc1pGkrIGNaNQYwGs+nxyznHzAD4nm0hUMm1wOBR0L8b08qsoAotUAEpvnz7Go4HVWbiLQOik/Ae/J9eOcS9oBWPNI/FQyU/7pJzqSfJ751ukWFX9sKMQSMxKeoQNtYqq4Pm9Ke/R1VW1oYAIp45+AROmEOiu/fTmzEzYMupHE4at2nCwgQxakBd2d2J3DC6En3KEsOU1fOvxg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 20:53:08.6229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d56b3c0e-dcd7-4ab5-7132-08df1b47013a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5053
X-Authority-Analysis: v=2.4 cv=PMKaavqC c=1 sm=1 tr=0 ts=6ab6df3c cx=c_pps
 a=AKd2An130fSphkJyqL6rzg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8
 a=SOVkFHe4FkkQmQ4F5I4A:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: 61-KU7t1vaUhasP2O-KHw-FHm4J2Q771
X-Proofpoint-GUID: 61-KU7t1vaUhasP2O-KHw-FHm4J2Q771
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX7JuAxLm4afhj
 GoRk2yMpEa7EHAhjcTNLzZZoQKg+VfTcsSwus8LlqTFkFdpBp8f8v7Oy/Myef/PNRo+GKVhkDmC
 jii3kUN2P9cNrnLZfd8x2VK7bJJ4zp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX2i5TJtuk82GK
 2W+yUoayuDHS4zbP8kWtPDdYaF8PZe5EHHILbZkoCjcfnDRGD4f3SsZergXUf5GWXv0EESihYvk
 4B0XOwO7aJip31jPWXNLZCPxBLdjRW25A15wNYSNw1fisCcTWcs8N1twdNmX8dh88XcFqu1lfHU
 ZVsemFoh8+kLUt/f73z3kAkzjsKissWWtC92vUJEwOC3MCrmSe5D+GPKRS2K57CnyOyP28WSHPn
 hG1nDXjS3oaWGH81E9t9wicOLDlfHJ7Ijf207qr7pdmNGlo2hokfs9CADVpCCl6/elYwnlOnUaS
 2Q69MgK0hLcUztB7+4WLE5lFpqlbjHhCpFRhFxFwaslnpLDE7Ix9Yl85b2Y8xM9nYwgHfcgWNL6
 I4vlSiRAF0Y7uPX/qn5sN9LWMnLwYy0UjyNia1Zb2+EjBKEx4HJ5MzkqeT0KUxGqh/TurHciKQJ
 fNRFGyO5joCet30oi+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250083
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 20:53:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20420

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.18: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=9dffeff8264765a462d6f96b50ba12e4ad7fba70..e853cc767f4b5431ea10f8f986b455e14a60b282
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=4ca322ca563a21cccad8c9ba65e386b9fd34dd16..70800b68682ddc7a9e7e6695712a94fc9f62ed37
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200..3eefe4b257b6fd2ef649c25bfc37551df2154165
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=2a55868676119435c408642191d1b5523910f288..5ac4102f15847164e94c94ccd38a77a39246eeab
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=65cf808e0410dd16ff0bb1f03a1bb7e67cbd6c32..d1be33790a0c6d9241b08a8bcf0b702729ac2b79
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=2cb14eda73fdb89b09e5cb92ce9d691a6a36c250..fff856a50d43288671eaa733f9f59aa25f2fed77
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=38638d15d7e5797387d43b56708a16b3af52f2e4..fe064c0799d988e6dc4684ffd8792950640f57b1

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb             | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb  | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index cfb8ac0d..372c61ca 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,14 +15,14 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.01.02"
+TI_SYSFW_VERSION = "12.01.03"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 IPUMM_FW_VERSION = "3.00.15.00"
 
-TI_LINUX_FW_SRCREV ?= "9dffeff8264765a462d6f96b50ba12e4ad7fba70"
+TI_LINUX_FW_SRCREV ?= "e853cc767f4b5431ea10f8f986b455e14a60b282"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 9692bdab..7df28aaa 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "77b17a538f6506868c92b08fe69b5a4c02abeb90"
+SRCREV_tfa:am62lxx = "eef816185ba3b8c36187961ecca7667f4333c50c"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 2b28383b..5f97e14b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
+SRCREV_uboot = "70800b68682ddc7a9e7e6695712a94fc9f62ed37"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index f5bddad8..4b922638 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
+SRCREV_uboot = "3eefe4b257b6fd2ef649c25bfc37551df2154165"
 
 # u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
 # removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index ed4ab0ee..91a52e2c 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "2a55868676119435c408642191d1b5523910f288"
+SRCREV = "5ac4102f15847164e94c94ccd38a77a39246eeab"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index 96b3b2b6..53873476 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "65cf808e0410dd16ff0bb1f03a1bb7e67cbd6c32"
-PV_ARM32 = "6.18.47+git"
+SRCREV_ARM32 = "d1be33790a0c6d9241b08a8bcf0b702729ac2b79"
+PV_ARM32 = "6.18.51+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index da8ece3f..c1b6f226 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,8 +25,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "2cb14eda73fdb89b09e5cb92ce9d691a6a36c250"
-PV = "6.18.47+git"
+SRCREV ?= "fff856a50d43288671eaa733f9f59aa25f2fed77"
+PV = "6.18.51+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 044244f5..5e4726a6 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "38638d15d7e5797387d43b56708a16b3af52f2e4"
+SRCREV = "fe064c0799d988e6dc4684ffd8792950640f57b1"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


