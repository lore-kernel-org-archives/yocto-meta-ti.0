Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED773CDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:04:00 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23164.1782227031696806094
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 08:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Xua+t/mq;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=rWGqwBup;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBbOYL1665151;
	Tue, 23 Jun 2026 10:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=nKwfAfqCTC26c
	UBmtwuuV8xSKNvMyTCV7JwEFzkE+3g=; b=Xua+t/mqPl3bUxeDy97DGa0YL7EeP
	cKBIdH7DnxgKhmzGe95DJFuTFbyt6gEJ5L9LMeSMbvG0K6u6SdcUxSscHO5gAqlp
	P/DspmvgpWJVdad3arBWy4PDQ9QrDt5q+PRAQ4ieVL/xnIxUkZOJPV60DL/ym6sv
	HLfvQOrl8LHaVJmlv10q2BSOhQmmEPI8CyUlwVy1qDF6yjI1nNG5A8/XvM9uvvVW
	YU1ixIy980d7IB29aXYOi1sbK0RJt9++5i2GY68/DIaDg7jmMeonNIU4igrOlSOe
	7YftlebIH8mwCUXCpTXDLsW4HsLjNZvkRVzvMsc7O0IP+ZntmKlnCoDmg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eys141buu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 10:03:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOMIRjBCfCt+RX+hW9U2b6vs1Yo2ezH0lGMtZZlEA9QPsyrLbdu6M8c6QQWz8IzScYD0iwhCSRao3pI9o8RhA7VSJ+yKN2d8QhgPJwpqZmUTFq9boSQ5N7CYBHHPVutqMYPqFzVtsqv5sqpWwi8xTV8YPUOqdIJQ5KB8yTYnbbyPX3qh64UUZlBbidVoL5jXkkRbIfYKQT/i9jggwLqDYOQOrdGvRZV34w4f/826zFg3EFQteUo7Q5643FRO87zFfzIv7teiidfoqhsItqEsdJgmM04PmNxQvYi222kBaPBrvYSa6R4DguoOqMRp0hLBugVg6ak5XRC+8ICP4IqcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKwfAfqCTC26cUBmtwuuV8xSKNvMyTCV7JwEFzkE+3g=;
 b=b3+a/Ei/37/EA+Mb8fyO/86hUmc78QLvvGDEf+THHie5/Q6NRinwRS0mT6ZFxfmmLJb5jZrCPvcyU5QffEc/asz5NkamSok24QgKVev4Z4Go4tv/yU59SOzjnwDRX7aiqbxoiieV4wqBfBYCX4R1AjT9PeZ/WaI5JtakJ1WQxSqkLXQriRbKcjPoYAs7eY3gm/rNt/0nWVAEjqgRAFPrAi41qvsHI0CO+v68uQ/NpWn/s8cWD4eyorSuXtjRyzrK/MeqoArdVavJ3qN4ZGzqxE28nC+gs4fCrrMApTOu8xZC6hhYl+bLWPu8FC65I1sKP2tcKW4AGrC4CIMalwN83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKwfAfqCTC26cUBmtwuuV8xSKNvMyTCV7JwEFzkE+3g=;
 b=rWGqwBup/sj+wnY/BHeQJEQ6l41Swj/0Su09qr31pBGmmI9OcJP53aPdnFOclBOkkR2CV/7KtuYkgkXSF0UgI7eyk8400Rxa8uhIq54fp7N9aAFNBkCVRj0m80JfUiLadRki4RwMRIhaTFfwIZOKj9ZSO46fhoWVR8g+jCzELhM=
Received: from SJ0PR05CA0179.namprd05.prod.outlook.com (2603:10b6:a03:339::34)
 by SA6PR10MB8136.namprd10.prod.outlook.com (2603:10b6:806:438::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 15:03:47 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::74) by SJ0PR05CA0179.outlook.office365.com
 (2603:10b6:a03:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Tue,
 23 Jun 2026 15:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 15:03:45 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:03:18 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:03:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 10:03:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NF3HQG2517274;
	Tue, 23 Jun 2026 10:03:17 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATH v3 0/2] mesa-pvr v24 -> v25
Date: Tue, 23 Jun 2026 10:03:15 -0500
Message-ID: <20260623150317.1127756-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|SA6PR10MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d030c9f-2458-4e87-be58-08ded1389f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Sxf++6kzq2/Ba3cjuqrB6e+E04e6cafZlnO4oXeSmMWuRYWYNGX0zFTX3M1h0eXiHNv8LoziXbiwsj4V2lCMQFrP1u/nn896cJraksoBVdFTQw1vgsZIBTrEWlkTske16IBBikQVcFMKklJb+4HzI473h0WAZE6VUC+7Ihx6wQtXD3b3/yEWyDN5ZWE3kogPgPR/8G4qvM5GuRWUpqwCL4DwAEgUuEBlM7u+ufGOj68Ea9kcCNnl3dadr8HVmhGeS/6u01JyC2U8xGCYSm6Bw4RdjiRmKoTSuQI4zsNaQKH8sWQ8qYxPWMrEF1rCkF0wwmWjtfI3Ha4FC7C04/4cWibJgT6LAxJobQnVZR234hVIr/J+zKdsW85wirDiZlY4oJPG4r2LHTZQCFWYnB5Y5hMgRzRxJgXOlKrsfV7PW9cwPefyDnIx6kePi76TwabLPu812fdP+x7LYoGINm28nvLfIE87Pbt9M/IHVw4i3Z0DQO878UNltYLpIxedWVq+bDrkvFZUrioLP4h1TAd565UIOEoBHqJ+388Qw4B6qQoA4AmN9zELExAUrcTHmcvFV/dTPrrF5/PT+x42TpsCHE/gU9tjGys+wAzg4RgHI7Mi2yaVB22hp6FfI937NMmze6PAI07Ovgt2KLWka5ldVHB7pID6LJvoQ/htCm4oUKf87ajYp+oWPD4HtPyEA2q3Otwx8QIKi2zXJjKZd/IFTA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5uoW21Mk/szLriQgrApHmNbf6cCvGlEMhTrQfNYg+ltaFREL+p9YXIO1Ayqp+itItQG0532L7KV2ov6m0Xd58fKNtjIuC/onPB3JXZ8JHad3k2fFlLQOJrIRL283+8AZsbbMKa1lHgHVxfv7SM1tj2So0HHGPLVCh1sJtK+B3V2qcaDwBrsGgoobYsJyjfBbFYiCeJNbVmgcnb9BUf85d+4NtkG8XpvIufWly1hAg5n19KJsC8ZDTMom5yCadjPDAsb3Y6ARfTZPgF9j049s1SQitiCqw8In2/Wb7vD40uisZrR2QRhmXb7mfNnVxfAMXOFilG446YNFxY9NUQfZwnJP4+F8wS8Mk/qe/bh1OuhBVjeM5WwrxnCRqJsW9z8wzh3bjZ0AH/RIxvr8wDSvLmM1noeTl+t+0y47Vlwtq9J4BeH2D71mKzqSGJh5CqxT
X-Exchange-RoutingPolicyChecked: 
	saT5Y7wlWiF5pkGYVFs6Xbt5zv6l92owB8cx1l/RSGy62AyxmmxNEioctugY+pZZK1ZpHEZbr0u/LAMtvBEATVGkrf/NleS4T2zMbaYpcqlmxSGQSRofFipJdMOkMtlzU65zmlG8Bl6GrrBy9WNaM13eOSTfzOWhv4Ho8vqta64vVYo23Kj4PZZgnCGlRDxwKfJB21Y17kJyCMY3EFgf58d5b6d0mWzZGAlc8LovhsoTCRdHgsS3gCHbLM7WWmuCFg1TV0cuHEXfoLOHV3RVopLyVpdSKCs9iq1ogtgWYzJdDQ58SfZssYbRc3dDrcdUnT4PnC31V0IG4fnhax0Jew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:03:45.2839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d030c9f-2458-4e87-be58-08ded1389f4c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8136
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfX33PQJSTX3wEN
 VR/tNF21hmtEdpGIhIwhUH+OjsD9iUYdzNAyFEGLS3pL2lVnCKiLtsYQiUaL427VRF0jYdEVwii
 +IkdnG+dNnAGOb/PEfFuTDX1ex8vcv4=
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a3aa055 cx=c_pps
 a=uRUxjcjQKWf8PwUSRA6o1w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=GBnKP2x8CQFZ6kVD68kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfX01cprfPJRbGx
 kMz+18JbVi+6aE8aTfz/FdT3Mj257XMm1v8ytLqHxlezHXVjrXmtP/K1bXpYTMxw5cpBhh3PZn7
 /bsbjgTOyKi/KFBOQkSvz4NPfAJRylKin+ntfs8NGUW0tXqOjuqldWPDnCY7oM5oa/sfsj7j8Cr
 qMWuRHHIiSqYpwAvj3pSBvYCIeZC06C+Lx8Dq4ycnlJlxAeuOIsw18CFhAIVbsFivSw/8VPdMnm
 j3/a+xdSegF3B71LJMIRfw7klONkP0Lw4U9Iu5N4BbT6A9RnkzcijjckQsC5FMK/gyB8xwOcFsp
 EKTlU13r/FeB+BXGViSTGy8T8yhfBm6D1Pm8l55jRcj8S2n7IDwz5GoPklz58gRw5Fh2dz404bG
 oeagN/XvwSboKo+vfIb2sGaYSdSVEruYS4CEJFCGgzd9wT1wWZIHrvls8Zk3GCGulWMgl0dFlf9
 djyfNZYzSKxolX9h4mg==
X-Proofpoint-GUID: q3v0B1CUan5QtuaHwVpHQmWbffy-i8SQ
X-Proofpoint-ORIG-GUID: q3v0B1CUan5QtuaHwVpHQmWbffy-i8SQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230124
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 15:04:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20054

From: Antonios Christidis <a-christidis@ti.com>

Dear all,

This series migrates mesa-pvr from v24.0.1 to v25.2.8. mesa-pvr is a fork
of Mesa that adds Gallium frontend support for PVR GPUs.    
    
The recipe builds and packages for both Rogue and SGX GPU architectures.
Only Rogue supports hardware acceleration - SGX will fall back to software
rendering. For SGX hardware acceleration, the scarthgap branch SDK should
be used instead, as it is the most recent legacy device SDK release.

Kind Regards,
Antonios

--- 
v3: 
- Split into a 2 patch series. 1 patches copies mesa.inc from oe-core the 
  other modifies and adds functionality on top of mesa.inc.  
v2: 
- Rebase on wrynose-next
- Add support for master branch in subject prefix tag

Antonios Christidis (2):
  mesa-pvr: Add versioned mesa.inc copies from oe-core
  mesa-pvr: Migrate mesa from v24.0.1 -> v25.2.8

 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   2 +-
 ...e-lp_bld_misc.cpp-to-support-llvm-19.patch |  38 --
 .../0001-drisw-fix-build-without-dri3.patch   |  57 ---
 .../0001-gallium-Fix-build-with-llvm-17.patch |  40 --
 ...ll-StringMapIterator-from-llvm-scope.patch |  31 --
 ...livm-Fix-armhf-build-against-LLVM-22.patch |  29 --
 ...k-for-all-linux-host_os-combinations.patch |  43 --
 ...on-t-try-zink-if-not-enabled-in-mesa.patch |  41 --
 ...sdetects-64bit-atomics-on-mips-clang.patch |   7 +-
 .../recipes-graphics/mesa/mesa-pvr-25.inc     | 346 ++++++++++++++++
 .../recipes-graphics/mesa/mesa-pvr.inc        | 374 ------------------
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |  44 ---
 .../recipes-graphics/mesa/mesa-pvr_25.2.8.bb  |  60 +++
 13 files changed, 410 insertions(+), 702 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallium-Fix-build-with-llvm-17.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-24.0.1 => mesa-pvr-25.2.8}/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch (90%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb

-- 
2.34.1


