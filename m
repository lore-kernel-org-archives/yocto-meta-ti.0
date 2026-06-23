Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B624CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:04:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23166.1782227034050878305
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 08:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=IatEfzv+;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=UHn6jT1a;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NCkEwg1748492;
	Tue, 23 Jun 2026 10:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AJFlViKIvuDEI3PwZrYklhX4CZjAHV99IATqAsly/
	Ok=; b=IatEfzv+WCnyj1eU77FMVhkg8Kg9ysErPvq7zljYa9O0mDm34fSANsAnU
	Ym8pjr84kcMFqlw3dhIoiCf1T9WbnpduFY7lV7qwD7Fx0gu8LP5Ea3JUVHPGGK6/
	OfMrlKgbZQsw7wI8UPPFV7mSYkOR0AYZqFbeg+f/fXCCeqdQs0cHy541yIUzWsCu
	aXG/KPNW/zr+RdwXniuJtBvrQG/HoSlzXb+Jhv/yH2Ryaaq3z3hs4olw4BwtASMw
	QVINNXrAEUslh+Fg4vHO8kx0dTVDeEnObCxAm1IYmTJyMmFFBDVKdqv2+uUNETUQ
	NDS/OVxX5Nh3oP+UujDvjpZ306dLQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eyten0x1m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 10:03:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/w8xrVg28gCpDk+L6oiVRSWvvmz4eJOSvRTY5oglq+VkiOTF0D0mpWTAFT8GoSXBFE3yiS/RWd1HybNndJwR3gJp2ANyqayfrq0QlFpzH+3jHCSZhGYA5wwDsVtRpqClCm5maiEbP0e80XQCUCKUdY8zgTu6yQSoL2uF4QH+gh7IOBcF7K/tQuFO5CIqk0YGyaa0WuhCaHI0uFk8Fang3Mj+cb/uuXU8okStxZV+LUoWkJ67WYxlO8CyZFhk/gLBTUyK5j+2KsRiua6mgqgjiRF2cE3MmncjJyR6c0nJEEnEMh5sAyylNBurjvGYqdhcKkhcyiMoZt1nkJyz9jvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJFlViKIvuDEI3PwZrYklhX4CZjAHV99IATqAsly/Ok=;
 b=qqGfSNx2DJymHqGQGEbTLTIoDYNCsYkZxXdY29j1lVOO02DM7myA5jbW9+JzZL6SFfDdByaz3bTVt446AFT/6huPEo/Cl89b7QsNGhmEdI2TXd4LlZfZDxzBgP5Hu5J98Fb+srTzyZz0Qe7n1HUzGygrQpNRpyTYhw/7S3nur9D48iS3yWWseV73Zzb/Xh9dB7coRy8RCMfUKyNYNCDDilYcxJ9sP11C7d1LGL7uzxGHMPoJLvE9mugfRLhZkrUckRLVcwkXbefItdoUsbjDAIfpUp9rte2nQScCEbXKKvJvMwJ89k0/I5N/3EHl23890cDHex8z/ksYGqOssytbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJFlViKIvuDEI3PwZrYklhX4CZjAHV99IATqAsly/Ok=;
 b=UHn6jT1aPbdAiCilhoy8zcvpCCqtYi8lexuVhyDoTYy5QYF7YZo1IREpo2iUhQ+zjnyzfBqdHbIIf6DyYb1GKj4XNq1sKJ/efiKvavz2qDiAcXk4WB1G+/iLYBoyf39tHGt7J94wSO3KVJByM0ZHF/lDb3kWWX+vOMhnJnTDAv8=
Received: from SJ0PR05CA0170.namprd05.prod.outlook.com (2603:10b6:a03:339::25)
 by SJ0PR10MB5765.namprd10.prod.outlook.com (2603:10b6:a03:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 15:03:49 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::a3) by SJ0PR05CA0170.outlook.office365.com
 (2603:10b6:a03:339::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 15:03:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 15:03:47 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:03:18 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:03:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 10:03:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NF3HQI2517274;
	Tue, 23 Jun 2026 10:03:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v3 2/2] mesa-pvr: Migrate mesa from v24.0.1 -> v25.2.8
Date: Tue, 23 Jun 2026 10:03:17 -0500
Message-ID: <20260623150317.1127756-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623150317.1127756-1-a-christidis@ti.com>
References: <20260623150317.1127756-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|SJ0PR10MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c72c74-fce9-4bd9-fd17-08ded138a0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|22082099003|18002099003|13003099007|12006099003|56012099006|20052099010|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	W/CJpDDY1QnImzH6ui+bXd1Pfbj/66XpDIHgXwLCUwOoXQCOzurDaeUhJ5gJ0Gamb5/1M9MVoeK3JqcwtypOwAFjl/3KsySZM5jjwA0XOGTuTt5UKPKLWP4x9uBR3LhszTKZb6HVPhOw4Vhv+GBOR2UuSBGW2bucvkGvU0OUXs7Hd+f+rPzg/fW6fIdOmcY5Zv7mtVSklOdkEu7WdWqoj8RZ0Ld8jHvOt6/BjC/9l4aAj8tqRGt93nUIONQrQ0+0Avu+cT1yigTqOTRjFu32JDJN859nuE7AvMUTZ9WsIM6sIc/irtf98YxzXwhASkDi+NKj5+Kttj6o7gcTuZdNi9+/aMEyfG0hcbRE2yxHsSSjWn+qDOrzDhSO7fLDOuxVqXvsAOw4VG7N/SLzjkyxsEGpAToNilOK8P2GWj10qdjFf51dt3tMSIdK49zzaCn0kY77xs1oo8Sfg82BYmVL9jICtxPwbpUBZXYzAn9ySzPKE6oEiUgaeiGbelcxL9QGdOI62VLEZjXbQ2MutyALMmFe1ykAAsyHqUeIlk0iq6ksJgKsFqJVC448jyBcVWWwsOxjhAviXSp9j4PyL5/YCngE+/WjDo475fKeyq9NHbmRN2Rt9nkLzC+n45y5O39A2c2FDRfK/M7s7IbAn22BzA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(22082099003)(18002099003)(13003099007)(12006099003)(56012099006)(20052099010)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zkDI2jKAK1rX5C9+aA69QfgLLL0XnGi3Yi3FWqkMfd4vxQWKkqfZp2xTrA/qHteUuz/fkOUyT1cPa5unrUVo6iQJgdmtNeoxv8x+7LS4B6HJyMJ8eoXX/WDvBU32apEm5pqsQ3Yim7QtvRLVx2n7T0LasXxlxPE6Z3IX+P8wQfFlcMEd7NqDnfkO7AK605++upVGJ5A7QI69LEDzHpdHTwiS0bnTTWNERQc+pILcQuK7+Vj1tGA9nCc0aqWjGijjHKdfj4m+srk991j1toO+9GgxpaPhiCPEvlerwG6vmbvv36MJl9eWwWgkpWRrAKvyT+W355syoevL3pPnVCMOPo3f8aBMxxDIzLJTnyAxqTd5eJj7bjUz9zjdywFFS+6ZBlsOo75DVS/GSwCTXC3VBpw7xog4i3yAE0aYf7fm3LLAUPrlcbmPQv3Xxagzsv0u
X-Exchange-RoutingPolicyChecked: 
	gm4hdAixiYWBI6Grzeu1u2rZGQVOgz/Qjn6qmWIbvtXLF/S/rtyll2vloNxDMKsO9K6/AHQkUslM+0gi1u0AYzBFSo4j3YMSXqmquE/y24wF5juF+VOd1at1Jy805WFdUwtomN6W1XvqIum6AeTKS6dje1VtAslf2C+h4hzmu2X8md0KhaX8xhmbmDlFKvcJJOaEH0wLipC0gBCl3eSUi387N3FJ0cAEoppAAbnN7HBzwh1LFoonKIz3sI7DQ6G4RpTiwrNInrNUfYETKseDue+e+2FlmBdvqgDa36lgjmzC6DsjVznkcH2usufeg2uTOlxFfH0Huav/4oRPzyPSig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:03:47.8288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c72c74-fce9-4bd9-fd17-08ded138a0cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5765
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a3aa058 cx=c_pps
 a=I1DPz4bLegk/AyvijR/I8w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=alK4_DS-AAAA:8 a=aR16PxjQAAAA:8
 a=NEAV23lmAAAA:8 a=M99SayfXcsXEJ8mZz5YA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=5tn4MO8azEBWFjlAA-rn:22 a=rOCknGvZllDBBwZ8Yz5I:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-GUID: 1vxcl4Dx1Ys7iPWNx3jnz4qmr9dX8hEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfX/NrvsxHExB2M
 bH8VdkisnJnvYK/Ef+eVU2ZZa5RbrG6QYE9cdQxPkpQuKyhT8X6N7H0gAxoBDQBhTC4rMMBCjY8
 uceGHEHs63SIPM7uuP5/GNrqO6Tnn3Rhbs23EKF6cZXNd9SH0BopDOusolXM8/F91PhOjsyM0M/
 +KL8yTJeh3q6Ghs2sZtF1g/nc8BXEq76iO5sKFE0BAoVR/2R10HiCLBMLBQ4Pf2//C/YDcqsFgf
 TcKmxl2Hq/o3WYEhyh88qhrJTXYeyvwOVT7EejBEtHhIKtWO2QaMysl0D7zpfRw3zWLNb0KTc7X
 pxhPbYqX1H+67VY7ouEYTQQeMco+zYQabCtJoiMgU33gbVzboUgzK6I8JeKccVzZBsQB6HYqgcr
 0ZglLCL/8DObi3B3AtFuIG0ND3LFMdmLYjw7ELQc4Z2gsjk6xTQ3B8mgF/ZI/f8bMM2My5BQd1Y
 hhgW4HSiB0IP+ZpZWjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfX8BowHjwqSnQ9
 8cDK74zJS8QTJ3i8UhTPdDngI11CD5ALwN87RtkvmdWqMfmMxtwkuHwV+jqyfmdG1jSrk5ATfgs
 7+/Hkj003y+zmxX14lOf/6JDBv3XAIs=
X-Proofpoint-ORIG-GUID: 1vxcl4Dx1Ys7iPWNx3jnz4qmr9dX8hEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230124
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 15:04:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20056

From: Antonios Christidis <a-christidis@ti.com>

Migrate mesa from v24.0.1 -> v25.2.8. Edit the ti-bsp logic to
build/package mesa-pvr v25 for both Rogue and SGX cores.

Remove some duplicate variables from mesa-pvr-25.inc inorder to work with
the main bitbake recipe mesa-pvr_25.2.8.bb.

Remove mesa-pvr v24 related recipes.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- Changed SRCREV on mesa-pvr_25.2.8.bb to account for LLVM issues when
  building SGX devices. More info at TI's Mesa Github fork.
- ti-bsp.inc now points 25% for all machines, the logic spliting Rogue
  and SGX cores removed.
- Added INSANE_SKIP 32bit-time

 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   2 +-
 ...e-lp_bld_misc.cpp-to-support-llvm-19.patch |  38 --
 .../0001-drisw-fix-build-without-dri3.patch   |  57 ---
 .../0001-gallium-Fix-build-with-llvm-17.patch |  40 --
 ...ll-StringMapIterator-from-llvm-scope.patch |  31 --
 ...livm-Fix-armhf-build-against-LLVM-22.patch |  29 --
 ...k-for-all-linux-host_os-combinations.patch |  43 --
 ...on-t-try-zink-if-not-enabled-in-mesa.patch |  41 --
 .../recipes-graphics/mesa/mesa-pvr-24.inc     | 374 ------------------
 ...sdetects-64bit-atomics-on-mips-clang.patch |   7 +-
 .../recipes-graphics/mesa/mesa-pvr-25.inc     |   9 -
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |  44 ---
 .../recipes-graphics/mesa/mesa-pvr_25.2.8.bb  |  60 +++
 13 files changed, 64 insertions(+), 711 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallium-Fix-build-with-llvm-17.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-24.0.1 => mesa-pvr-25.2.8}/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch (90%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index a48c4f07..bf90d1da 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -44,7 +44,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
 
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "24%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "25%"
 
 # ==========
 # ti-6_12
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
deleted file mode 100644
index 9e5bb342..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From fa9cd89a85b904615ebc11da609445b5b751e68d Mon Sep 17 00:00:00 2001
-From: Satadru Pramanik <satadru@umich.edu>
-Date: Sat, 5 Oct 2024 13:35:52 +0000
-Subject: [PATCH] Update lp_bld_misc.cpp to support llvm-19+.
-
-Fixes #11896.
-cc: mesa-stable
-
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31533>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
-Signed-off-by: Randolph Sapp <rs@ti.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index 7975fcf1ac9..5b615d627ff 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -329,8 +329,14 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
-     * which allows us to enable/disable code generation based
-     * on the results of cpuid on these architectures.
-     */
--   llvm::StringMap<bool> features;
--   llvm::sys::getHostCPUFeatures(features);
-+   #if LLVM_VERSION_MAJOR >= 19
-+      /* llvm-19+ returns StringMap from getHostCPUFeatures.
-+      */
-+      auto features = llvm::sys::getHostCPUFeatures();
-+   #else
-+      llvm::StringMap<bool> features;
-+      llvm::sys::getHostCPUFeatures(features);
-+   #endif
-
-    for (llvm::StringMapIterator<bool> f = features.begin();
-         f != features.end();
---
-2.47.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
deleted file mode 100644
index 9d662b34..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
-
-commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
-can be build without dri3.
-
-  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
-  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
-  collect2: error: ld returned 1 exit status
-
-Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
-dri3_check_multibuffer().
-
-Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include <dlfcn.h>
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include <X11/extensions/shmproto.h>
- #include <assert.h>
- #include <vulkan/vulkan_core.h>
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-        goto handle_error;
-    }
-
-+#ifdef HAVE_DRI3
-    if (pdpyp->zink) {
-       bool err;
-       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
-          goto handle_error;
-       }
-    }
-+#endif
-
-    glx_config_destroy_list(psc->base.configs);
-    psc->base.configs = configs;
---
-2.44.0
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallium-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallium-Fix-build-with-llvm-17.patch
deleted file mode 100644
index 738ff267..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallium-Fix-build-with-llvm-17.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6d07f6aa7f92f40d78a2db645f16f0f3e7d3c2e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 23 Jun 2023 01:20:38 -0700
-Subject: [PATCH] gallium: Fix build with llvm 17
-
-These headers are not available for C files in llvm 17+
-and they seem to be not needed to compile after all with llvm 17
-so add conditions to exclude them for llvm >= 17
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-index cd2108f..b1a4d03 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -46,15 +46,19 @@
- #if GALLIVM_USE_NEW_PASS == 1
- #include <llvm-c/Transforms/PassBuilder.h>
- #elif GALLIVM_HAVE_CORO == 1
-+#if LLVM_VERSION_MAJOR < 17
- #include <llvm-c/Transforms/Scalar.h>
--#if LLVM_VERSION_MAJOR >= 7
-+#endif
-+#if LLVM_VERSION_MAJOR >= 7 && LLVM_VERSION_MAJOR < 17
- #include <llvm-c/Transforms/Utils.h>
- #endif
- #if LLVM_VERSION_MAJOR <= 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
- #include <llvm-c/Transforms/IPO.h>
- #endif
-+#if LLVM_VERSION_MAJOR < 17
- #include <llvm-c/Transforms/Coroutines.h>
- #endif
-+#endif
-
- unsigned gallivm_perf = 0;
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
deleted file mode 100644
index 1751df6f..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d17338d403980e1932a42f5d11c2a1fb7b25127b Mon Sep 17 00:00:00 2001
-From: MastaG <mastag@gmail.com>
-Date: Wed, 3 Jul 2024 21:00:42 +0200
-Subject: [PATCH] gallivm: Call StringMapIterator from llvm:: scope
-
-Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/11392
-Fixes: b035d9cab5a4 ("gallivm: use getHostCPUFeatures on x86/llvm-4.0+.")
-Reviewed-by: David Heidelberg <david@ixit.cz>
-Signed-off-by: David Heidelberg <david@ixit.cz>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30009>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/d17338d403980e1932a42f5d11c2a1fb7b25127b]
-Signed-off-by: Randolph Sapp <rs@ti.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index 95a8a6c6a08..f3c10652ed6 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -332,7 +332,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
-    llvm::StringMap<bool> features;
-    llvm::sys::getHostCPUFeatures(features);
-
--   for (StringMapIterator<bool> f = features.begin();
-+   for (llvm::StringMapIterator<bool> f = features.begin();
-         f != features.end();
-         ++f) {
-       MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
---
-2.47.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
deleted file mode 100644
index 935d76d1..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 973dc32026c164d0c13f7f5bef36c8d1c2375973 Mon Sep 17 00:00:00 2001
-From: Alessandro Astone <ales.astone@gmail.com>
-Date: Sun, 1 Mar 2026 18:14:09 +0100
-Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
-
-StringMapIterator<bool> became StringMapIterBase<bool, false /* IsConst */>;
-Use `auto` to handle either case.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40161]
-Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index d3ad342..c95d86e 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
-       llvm::sys::getHostCPUFeatures(features);
-    #endif
-
--   for (llvm::StringMapIterator<bool> f = features.begin();
-+   for (auto f = features.begin();
-         f != features.end();
-         ++f) {
-       MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
---
-2.53.0
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
deleted file mode 100644
index 964e0a44..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f2fe76d506f356de055b8eca83a7c9d0744a40af Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair@alistair23.me>
-Date: Thu, 14 Nov 2019 13:04:49 -0800
-Subject: [PATCH] meson.build: check for all linux host_os combinations
-
-Make sure that we are also looking for our host_os combinations like
-linux-musl etc. when assuming support for DRM/KMS.
-
-Also delete a duplicate line.
-
-Upstream-Status: Pending
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Alistair Francis <alistair@alistair23.me>
-
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 35cc5f1..9a49c0d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -128,7 +128,7 @@
- # Only build shared_glapi if at least one OpenGL API is enabled
- with_shared_glapi = with_shared_glapi and with_any_opengl
-
--system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machine.system())
-+system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machine.system()) or host_machine.system().startswith('linux')
-
- gallium_drivers = get_option('gallium-drivers')
- if gallium_drivers.contains('auto')
-@@ -998,7 +998,7 @@
- endif
-
- # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android', 'managarm'].contains(host_machine.system())
-+if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android', 'managarm'].contains(host_machine.system()) or host_machine.system().startswith('linux')
-   pre_args += '-D_GNU_SOURCE'
- elif host_machine.system() == 'sunos'
-   pre_args += '-D__EXTENSIONS__'
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index 1203c446..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
-
-Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-added an automatic zink fallback even when the zink gallium is not
-enabled at build time.
-
-It leads to unexpected error log while loading drisw driver and
-zink is not installed on the rootfs:
-
-  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
-
-Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/glxext.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
---- a/src/glx/glxext.c
-+++ b/src/glx/glxext.c
-@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
- #endif /* HAVE_DRI3 */
-       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
-          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
-          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
---
-2.44.0
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
deleted file mode 100644
index 5ce93d27..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
+++ /dev/null
@@ -1,374 +0,0 @@
-# Copy of mesa.inc from OE-core before commit f9eb0468e45e ("mesa: upgrade 24.0.7 -> 25.0.2")
-
-SUMMARY = "A free implementation of the OpenGL API"
-DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
-a system for rendering interactive 3D graphics.  \
-A variety of device drivers allows Mesa to be used in many different environments \
-ranging from software emulation to complete hardware acceleration for modern GPUs. \
-Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
-environment."
-
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
-
-PE = "2"
-
-SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
-           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-drisw-fix-build-without-dri3.patch \
-           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
-           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
-           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
-           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
-"
-
-SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
-PV = "24.0.7"
-
-UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
-
-#because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-do_install:append() {
-  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
-  # So, check if EGL/eglplatform.h exists before running sed.
-  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
-      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-  fi
-}
-
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
-DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
-EXTRANATIVEPATH += "chrpath-native"
-PROVIDES = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
-    virtual/mesa \
-    "
-
-inherit meson pkgconfig python3native gettext features_check
-
-BBCLASSEXTEND = "native nativesdk"
-
-ANY_OF_DISTRO_FEATURES = "opengl vulkan"
-
-PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
-
-# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
-# by default the upstream mesa sources build a debug release
-# here we assume the user will want a release build by default
-MESA_BUILD_TYPE ?= "release"
-def check_buildtype(d):
-    _buildtype = d.getVar('MESA_BUILD_TYPE')
-    if _buildtype not in ['release', 'debug']:
-        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
-    if _buildtype == 'debug':
-        return 'debugoptimized'
-    return 'plain'
-MESON_BUILDTYPE = "${@check_buildtype(d)}"
-
-EXTRA_OEMESON = " \
-    -Dshared-glapi=enabled \
-    -Dglx-read-only-text=true \
-    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
-"
-
-EXTRA_OEMESON:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
-EXTRA_OEMESON:append:class-native = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled', '', d)}"
-
-def strip_comma(s):
-    return s.strip(',')
-
-PACKAGECONFIG = " \
-	gallium \
-	video-codecs \
-	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
-"
-
-PACKAGECONFIG:append:class-native = " gallium-llvm r600"
-
-# "gbm" requires "opengl"
-PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
-
-X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
-# "x11" requires "opengl"
-PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
-PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
-
-PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
-
-# Vulkan drivers need dri3 enabled
-# amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
-VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86 = ",intel,amd"
-VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
-# i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 = ",intel,amd"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
-PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
-
-# mesa development and testing tools support, per driver
-TOOLS = ""
-TOOLS_DEPS = ""
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
-
-# dependencies for tools.
-TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
-
-# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
-# treatment in addition to the usual 'freedreno tools'.
-PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
-
-PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
-
-PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
-
-# "gles" requires "opengl"
-PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
-
-# "egl" requires "opengl"
-PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
-
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
-
-PACKAGECONFIG[broadcom] = ""
-PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
-PACKAGECONFIG[freedreno] = ""
-PACKAGECONFIG[kmsro] = ""
-PACKAGECONFIG[vc4] = ""
-PACKAGECONFIG[v3d] = ""
-PACKAGECONFIG[zink] = ""
-
-GALLIUMDRIVERS = "swrast"
-# gallium swrast was found to crash Xorg on startup in x32 qemu
-GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
-# i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
-
-# radeonsi requires LLVM
-GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
-GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
-GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
-# i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS_LLVM:append:i686 = ",svga"
-
-PACKAGECONFIG[r600] = ""
-PACKAGECONFIG[virgl] = ""
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
-
-PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
-PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
-PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
-PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
-
-PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
-
-PACKAGECONFIG[lima] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
-
-PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
-
-PACKAGECONFIG[tegra] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
-
-PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
-
-PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
-
-PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
-
-PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
-
-PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
-
-VIDEO_CODECS ?= "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'all', 'all_free', d)}"
-PACKAGECONFIG[video-codecs] = "-Dvideo-codecs=${VIDEO_CODECS}, -Dvideo-codecs=''"
-
-# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
-FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
-
-CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
-CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
-
-# Remove the mesa dependency on mesa-dev, as mesa is empty
-DEV_PKG_DEPENDENCY = ""
-
-# Provide virtual names to allow selecting preferred rproviders
-RPROVIDES:mesa-vulkan-drivers += "virtual-vulkan-icd"
-RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
-
-# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
-# Add a dependency so the GLES3 dev package is associated with its implementation.
-RPROVIDES:libgles2-mesa += "libgles3-mesa"
-RPROVIDES:libgles2-mesa-dev += "libgles3-mesa-dev"
-
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
-
-PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-             libosmesa libosmesa-dev \
-             libgl-mesa libgl-mesa-dev \
-             libglx-mesa libglx-mesa-dev \
-             libglapi libglapi-dev \
-             libgbm libgbm-dev \
-             libgles1-mesa libgles1-mesa-dev \
-             libgles2-mesa libgles2-mesa-dev \
-             libopencl-mesa libopencl-mesa-dev \
-             libxatracker libxatracker-dev \
-             mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers mesa-tools \
-            "
-
-do_install:append () {
-    # Drivers never need libtool .la files
-    rm -f ${D}${libdir}/dri/*.la
-    rm -f ${D}${libdir}/egl/*.la
-    rm -f ${D}${libdir}/gallium-pipe/*.la
-    rm -f ${D}${libdir}/gbm/*.la
-
-    # libwayland-egl has been moved to wayland 1.15+
-    rm -f ${D}${libdir}/libwayland-egl*
-    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-}
-
-do_install:append:class-native () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', d)}; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
-    fi
-}
-
-# For the packages that make up the OpenGL interfaces, inject variables so that
-# they don't get Debian-renamed (which would remove the -mesa suffix), and
-# RPROVIDEs/RCONFLICTs on the generic libgl name.
-python __anonymous() {
-    pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
-    suffix = ""
-    if "-native" in d.getVar("PN"):
-        suffix = "-native"
-    for p in (("egl", "libegl", "libegl1"),
-              ("opengl", "libgl", "libgl1"),
-              ("glvnd", "libglx",),
-              ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2", "libgles3"),
-              ("opencl", "libopencl",)):
-        if not p[0] in pkgconfig:
-            continue
-        mlprefix = d.getVar("MLPREFIX")
-        fullp = mlprefix + p[1] + "-mesa" + suffix
-        mlprefix = d.getVar("MLPREFIX")
-        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
-
-        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
-
-        # For -dev, the first element is both the Debian and original name
-        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
-        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
-}
-
-python mesa_populate_packages() {
-    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
-    for pkg in pkgs:
-        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
-        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
-        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
-
-    import re
-    dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
-    if os.path.isdir(dri_drivers_root):
-        dri_pkgs = sorted(os.listdir(dri_drivers_root))
-        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
-        for p in dri_pkgs:
-            m = re.match(r'^(.*)_dri\.so$', p)
-            if m:
-                pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
-                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
-                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
-                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
-
-    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
-    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
-}
-
-PACKAGESPLITFUNCS =+ "mesa_populate_packages"
-
-PACKAGES_DYNAMIC += "^mesa-driver-.*"
-PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
-
-FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
-FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
-FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
-FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
-FILES:libgbm = "${libdir}/libgbm.so.*"
-FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
-FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
-FILES:libgl-mesa = "${libdir}/libGL.so.*"
-FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
-FILES:libglapi = "${libdir}/libglapi.so.*"
-FILES:libosmesa = "${libdir}/libOSMesa.so.*"
-FILES:libxatracker = "${libdir}/libxatracker.so.*"
-
-FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
-FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
-FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
-FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
-FILES:libglapi-dev = "${libdir}/libglapi.*"
-FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
-FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
-FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
-FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
-                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-                          ${libdir}/pkgconfig/xatracker.pc"
-# catch all to get all the tools and data
-FILES:${PN}-tools = "${bindir} ${datadir}"
-ALLOW_EMPTY:${PN}-tools = "1"
-
-# Fix upgrade path from mesa to mesa-megadriver
-RREPLACES:mesa-megadriver = "mesa"
-RCONFLICTS:mesa-megadriver = "mesa"
-RPROVIDES:mesa-megadriver = "mesa"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
similarity index 90%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 35bd0ea1..baa98a0d 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,11 +1,10 @@
-From 3ef37c63f03ad6f2af407de350486fdd25e9132a Mon Sep 17 00:00:00 2001
+From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/util/u_atomic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -17,9 +16,9 @@ index 5a5eab4..e499516 100644
 @@ -21,7 +21,7 @@
   * IN THE SOFTWARE.
   */
-
+ 
 -#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
 +#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
-
+ 
  #include <stdint.h>
  #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
index af674c83..0bcf66f1 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -14,19 +14,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11"
 
 PE = "2"
-
-SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
-           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-"
-
-SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
 PV = "25.2.8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-S = "${UNPACKDIR}/mesa-${PV}"
-
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
deleted file mode 100644
index 2c20a538..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-# PowerVR Graphics require several patches that have not made their way
-# upstream yet. This allows us to build the shims we need without completely
-# clobbering mesa.
-
-require recipes-graphics/mesa/mesa-pvr-24.inc
-
-SUMMARY += " (with PowerVR for TI parts)"
-
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
-
-BRANCH = "powervr/${PV}"
-
-SRC_URI = " \
-    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
-    file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-    file://0001-gallium-Fix-build-with-llvm-17.patch \
-    file://0001-drisw-fix-build-without-dri3.patch \
-    file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
-    file://0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch \
-    file://0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch \
-    file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
-"
-
-SRCREV = "7c82c1eebc67f5a62a347a84d42fe795cf7f523b"
-PV = "24.0.1"
-PR = "r1"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
-
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
-
-do_install:append () {
-    # remove pvr custom pkgconfig
-    rm -rf ${D}${datadir}/pkgconfig
-}
-
-FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
-FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
-
-RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
new file mode 100644
index 00000000..44becc66
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
@@ -0,0 +1,60 @@
+# PowerVR Graphics require several patches that have not made their way
+# upstream yet. This allows us to build the shims we need without completely
+# clobbering mesa.
+
+require recipes-graphics/mesa/mesa-pvr-25.inc
+
+SUMMARY += " (with PowerVR for TI parts)"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11"
+
+BRANCH = "powervr/${PV}"
+
+SRC_URI = "git://github.com/TexasInstruments/mesa.git;protocol=https;branch=${BRANCH} \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch"
+
+SRCREV = "0cb5bad52580f156b02125f4c7121ca7198e1489"
+PV = "25.2.8"
+PR = "r1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
+
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+
+PACKAGECONFIG = " \
+        gallium \
+        video-codecs \
+        ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', 'opencl libclc gallium-llvm', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
+        xmlconfig \
+"
+
+GLPROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVIDES'), d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
+    virtual/mesa \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
+FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
+
+RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
+
+INSANE_SKIP = "32bit-time"
-- 
2.34.1


