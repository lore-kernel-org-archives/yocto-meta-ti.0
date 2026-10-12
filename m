Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7CACA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 05:48:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7479.1791784126635228502
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 11 Oct 2026 22:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UoEzEsXh;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eITqDvRo;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69C55DeC1174565;
	Mon, 12 Oct 2026 00:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6g5qVdnzCAQX/
	HlNnw9b9EacaqwPqUZqAFeVm17xNpI=; b=UoEzEsXh0TZnqF17igcDfACYHzgFd
	Z/5i9qlkCLct9JDLjQygompdRlEsFXMN4iW87L9YB2k61OZg5dd33BwiBWoBqkmA
	bOAp+1SEIjM2DOnykk2bpcp2i6qiJnqF1wXCXM8h4tL918j0GhvsiB8VXn+YQTQV
	LDvIjDin/bRq2dfMCVPR9LPDPKNGXdHwk4fkWB2gqUfO6vJIitMxWZUdFu1k2ZIx
	RTYCPzwgNj42JbAk5W+Lqf7cBSvIsXffoFjvzqDa7q+uREm8aOBXWb2FwvvbBzQ9
	Mc3Z8zcThlByNPDE30b0jmKB2B54lnUVgMZjHwgmSLJ4hcODa0EPtgFow==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h86cn3nfn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 00:48:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqUpc0Y0wH3hpt5/asxHaiXb9QtugdiyY6RU3SCeQToerHiyq5nulHepq4Fx9gZX77jYY8KqQhLR93uvRGseLJW43WETg/qlsS4eLQ5uOEQqos3rx1BC7hX1ntiFlATLQwg1rUrHPtoxv7X6csHXAmRh5Pv9yLZE1qt+7xYi0FpSelOzyREWxc8uspZvztiH5Vl6iumt4+lbLN5E22dh2Z/oGiT3Tg3CqsSrxG+AgXehYdbUQTUTbXqT9I/bTC3oQZknABG51jN1qW4tjHNf7dJEglb0zeHUigjr7CWQex9+AFRetdrgtuGJ392nxk+Ad3fJfTzu6SJ5yE/wgZajkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g5qVdnzCAQX/HlNnw9b9EacaqwPqUZqAFeVm17xNpI=;
 b=QqLKPv5BVuq0FcrPU0q9WLAMefZXH3bACAk7nZq8FDDAdNXqEDoTB5c0kREnY1QwbRaocKF2g0qOyjnZVPE3HeEMCePLKaHKfO+rdBzaJIcJ3lliexAI3aAqhse57niF7EtAXBZ0qkO5LOIQdrpqDgaZE0Tfp9ahNiyX2oMqHFnqmJ7zGAYgMn8mRx7sseSMiD2P6iV7F1/mlrOVvTunmVt4KyUp9woPHzsIomNQHSYRYM5//NxiIiZW6QZ2Ui3zHh1JhRdyNE3s3vC/QJhv637LVwD05lpXJNPmslGx9njO8EWhDs8pszTQdAP12evH/g3aBAmFzedaZvoFaG/A0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g5qVdnzCAQX/HlNnw9b9EacaqwPqUZqAFeVm17xNpI=;
 b=eITqDvRo49D3AlqyZ3q1r7yFzk0cU9ZitpsCjahGAu+fTMXeSzd4cuB1ul84/nqsT8LARpQvoHJPN069zpXJACT+pavAnNjLKwKj2NKpUlBNYcsQDYsgwcXzMigM0KCW6kMnsY/eUND42+nksKSz1Afp3SJRQe6Pcmyykwam/srvBnGW1STky0/XySYO42/oolaVWh9Cx/eoikko/MDtXzNZroPcJiotPhOAlpvX/708seMgWxfWanP2c56SMKcHAa6D3nqlKUQW6SGnxya47eOm1nMelLOYOK5vXmwBbGeLEmpyNtxZQyHq5cbLm6qn4fQWpg98tRqgfkJTYMWGlw==
Received: from BLAPR03CA0059.namprd03.prod.outlook.com (2603:10b6:208:32d::34)
 by IA3PR10MB8370.namprd10.prod.outlook.com (2603:10b6:208:583::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.11; Mon, 12 Oct
 2026 05:48:42 +0000
Received: from BN3PEPF00022BC1.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::89) by BLAPR03CA0059.outlook.office365.com
 (2603:10b6:208:32d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 05:48:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BC1.mail.protection.outlook.com (10.167.248.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 05:48:41 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 00:47:57 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 00:47:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 12 Oct 2026 00:47:57 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69C5lvAk850717;
	Mon, 12 Oct 2026 00:47:57 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id DD94312B256; Mon, 12 Oct 2026 00:47:56 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.10
Date: Mon, 12 Oct 2026 00:47:56 -0500
Message-ID: <20261012054756.1561142-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC1:EE_|IA3PR10MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f554417-4dcb-40f6-7352-08df28247847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|260925021911599003|260925021311599003|260925022911599003|10067099003|261009223027099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Yw+JQV1cfynZbu+3YqBU/YaLsN2E3cLPigaBRGgmum7UoNTCa2f/3DWuoduhUpKx8h7aIXvytfckSA46ZxcDwCyfLQvPaBM5instCJMXHIIWyI3UdVpCbpyiLMAH2CFA/Wb7vhrSCwukZd7vo6MHYTzOVZVrlsi6uqiWjOBCSH1kPi+qjNN0iNofpbZdx6tT8oCqkv6SGIBUW1NrZIBxDYM6XDbYZ7qSNDaAprw6PEvbVFIJxBOYT244IiyMJDtdEwJuujj1m41qrdbbmXx79CFvCyOwOX5/6U1WG/OTT5YdFKXcyceiOm4oG2cTiR4aDv4EaI1kkGMQTdzYGkbz5PiITdGuXqag0hkS+jq209MT8kicTfAm2jUF4yPYIoA/5HR199iMMaQ4CHOD2c0+oayg5PPyXONRiECwr0C2lu7tIHfYj2w0HjhjRh3F3KHr514Z/iePIypSMznMgNJ6Uz9TydURG1zG7/7qFfOhRDWy5kmrggq9dliXwZIAmofImjxpc+qc80caajMsFhoSTSS1k6U4b+9OtKrF45RPyagZQ2SkRa7lFmXHlg7irjnJN0wCUZWc8C8rzw1tzm8KaOW/Pplliv2rKtTC8fVkqXWubkzZge4oXFuz0RyE/3uToyJLC2jldSX/Z5it5wouxS3Q8VMPErlV7pfLhQGh82UvyMaRy2PwCQ092SOn3gyj0QkEXliPVIuO0xgRb9vubA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(261009223027099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	moeMy7lS6FNKtT8acXteLBbxoFNC/yuJe7HEoCm9z/PVGlYXpE2S/idLvclxHtB42gND6ii8yUyOeIg042OGapHB6x3Kx9OAEIceEl1REh99QRV/1Hmhcft4BFBghEOaCVw8Fn00pL3VbQS/6yVKDiPmq35LV5H/0xsIAJiZWy6aiUMd1leGZI32PtYaiB0GFLn3pBw/Yp03o2sbuSIGHaXquG9ukJd7Fai+A1JJnMDMkiOsml1ueOo79nZT7HMnUTMcjA6EMlkNQcBkeL3WUoDwn9B/fVi9homY+NFOsORwohN2I6POMO0MgA2ws6KKfvggvVzld2SYWgQG4gKS+onO4oCZMv5C3/PVCNzDxRyNSPIWtjDcRicBphYcvC55nMwDPbgyKpk734Fu/MFTnsA1f8Wkf8D3QPa+PwZ8xlMgPmPSCJTRl+U9z76qZocb
X-Exchange-RoutingPolicyChecked: 
	1+Looc2J4j5pL00o2g0X6/1LoVQTBrXBGYUPY9BKFFj1X+9i5mkeDQd4oZc34I/d9eDTYNyGj81e7P781JuLUgXTsaJPpgJpMyqySerohgpFxwGscq2rL4KSWibKgNWX6mqAx1kXPfyacUmhfgPmzf6hhk9YXAT/V4RbortbXW5Y9Lkkmwk1OF+ZHNJ6xWOAS4lPsL2S1byBEFjfdGvzXonefJcME37j5TI2VBJ7zOlO9UmhUXa3mVIm4twT5nm90ykPMJVb8VQYCiJaLc/CmnqgK7Xw3kSwLYw3Yol6TRBP6uGD5MA2SVDDahsTZQbFA730Tgl1tKrgbpKoflOFHQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 05:48:41.0619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f554417-4dcb-40f6-7352-08df28247847
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8370
X-Proofpoint-ORIG-GUID: SeRiJ7luRPIfl8ZbuUoNWrgka25jWHAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMiBTYWx0ZWRfX+a3vvCPHrVIm
 +6+0chaa62QaicuuIxBvBbIN6bvPkRdLwKVcSIzOv8YBzWrQjux8QWp/KFutauoFyEHbY4itSXe
 uhY8++IaaheLxxewSHlUtLylYkR5rnFc5CVrxDEs38IZMYZS+hthql7hnmQhbrc3TPXoRt3z0YT
 kSpjAhJRh4p4IsArhDdKTz0n97FJtIadxM3Q7zwU7duqL/cFUN52weySz23XqvRaTEi7+Y+PEts
 U6OtW9rzlE9wWRXRPDgVl88LZYPbAcbznAf0PetqoG2L9YRI8KkcdDEKnSrTKrY4NJEtzdtabOZ
 9EA0DyO0FODirrlTkeAfFhugld4viLEY6sgg1LnZ2PMK1bBngxpeM1gcY+kF7WJz1iO48hRP4gp
 qtf9BFzMm2VELdYEunecAadsb9D+T/7KznGh8aF2tWv9sn4ZorjZ9V614pLwEFPhwiYM2AL1vg4
 duaRH+TMkdFjkMZcOaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMiBTYWx0ZWRfX9hDrzHwdxt7/
 DUxBsCpDWJBzInXNZxD4zrJvtOfgir3vIllThcUjdvUCG83RkWbv6bZoNPI09M+9zZVyiu8oBnX
 Che4I71RLXMVSl0Opfi0Mbr8GYKAsXY=
X-Authority-Analysis: v=2.4 cv=EcFd0/mC c=1 sm=1 tr=0 ts=6acc74bc cx=c_pps
 a=Eb813/LJkoRL1pr8t+D1ZA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=1VxDqnHFAAAA:8
 a=U0T6FScvYC5zaxGiDpMA:9 a=aZ5uHUMKh6B-zo3GvD48:22
X-Proofpoint-GUID: SeRiJ7luRPIfl8ZbuUoNWrgka25jWHAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120022
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Oct 2026 05:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20451

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV_uboot

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 9bec7c90..46908108 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2026.07"
+PV = "2026.10"
 
 UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
 
-SRCREV_uboot = "ece349ade2973e220f524ce59e59711cc919263f"
+SRCREV_uboot = "5508406582f6f7120dce0c4b3059819a41788db2"
-- 
2.43.5


