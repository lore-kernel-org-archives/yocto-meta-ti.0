Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3474.1795140148526812962
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 18:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mrZ6nLje;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=cNLnEkuA;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AK0wCtX2715461;
	Thu, 19 Nov 2026 20:02:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0l+N99VCgLB4eJfeAirAyU0Y2WVrq5AYDnYTo/gAL
	34=; b=mrZ6nLjetqgd8CqkxPBHCviHQ5DmDSmp3n6BdZxui94PO6aYQeYLiN8kU
	vQc3nCd7xAu43qvJ8qrJHv2Pz9NgPiLGM7m20o0B/TYlRM0HvzgW53XfeA1RPmol
	Ttp2VwS/oTlYGKZU9rxgArRIJI6ztQ9lx99arbbcM2RVACU61XqaSkPWYJwh8rcr
	vR6rfKXeB2gad5EnVoXVXP7+Ay2UhIjQQBNoIYSdPli/GmalrAJDD2zJtRdlC9L3
	jixQw3qEyORUXFC2l2Ruu0FIHkkVzwtpb/ZNBIga/Muy2D9334tbgobFsNiC5kyQ
	JlpSLcYa2YYGOhdpfwVHgSc5TI6KA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010062.outbound.protection.outlook.com [52.101.193.62])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j2c4r8atq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 20:02:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjaZkwdPQ9Vr7BSCQf1d7AMtPRdz0mURChqXC/+3O7vl0G0zIiEAF+tfNxNpBcazrpzRwj+i+7oVobLbxxyDlS7EB449aMg8HISYZGbkf4YI8MqVr95D8zuofaeGsBNpZDPKlRpMhxaRRMRfelOQ5M2m2I3RNXTSBWtvCYC5N8qk7NV7BHfoNSAEuomIFpc2BQaZ0TqMYkENcXDZ6H5epaQkKgqSxfDPELcJx+BtWGCy0BGmdv7G49+1RbsveAQa2UVwRUU07LLVkuUvsCNXxCUMAoghgoZIkpmn1pYiS9LXeOMcVriOjOUoV9/ZfLB4N2W0wamAxpvjBn45W3Ib1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l+N99VCgLB4eJfeAirAyU0Y2WVrq5AYDnYTo/gAL34=;
 b=gkOOB5mTaHtNS2WFIkfUMNXhHeQNl8ldNLskaUZCjTtGcYgZsdwMX47JcFRkqt+ZDHYz+dczWeYHeuQDOJx/y+dbl73IT1G4krrQphxW2YCic8FuKHO5PS+zeQ9NZ4LPV3fTY62JDD+EmDRjxUMBe9ARgUh8EBbyGwt1FllPW0EV2X7G31KbuFxsE7vzkkBQcZ12f9fLM6r3kj+7+l3zVqPAS3yqzG0FYeiYyA0KuR1KtQHg1BpvlcK26g4gp/1BAkBshHkd/Ei5fbL9P38ruBKBZoJ2QhAO7qqY2VrwI3odcrzLUnVpmGYF9XbH5VmnvOvGj0hoz6PUUs4jHhMtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l+N99VCgLB4eJfeAirAyU0Y2WVrq5AYDnYTo/gAL34=;
 b=cNLnEkuApbxvgsUl/B/Vd4XxYvxcgc0tL7guGNqvRhr3qOD+luEuwIew3oVyXjKifkLqIGBIa1yRAcqM54kVGbVIHFdxzD/RF1DM+rJatlGOM7Zel4CQNxOcyC7/ofvMSavmC00D/iie2/WpwktzQjr5psuw62M8/MW/idTd/aypPcGLxskxTYLVDmxt1V+BS6LszPwMOQ/1Oe263DE+iaC8hINzI03LZ0rW7pULQkQZz5fAmn6cCu9146863+deb1ppXgodfPiKU8kSC2FXEwqsAzUGWcowx6W3v46MSuj4EmnUtclfTVJ6rHSPwdFfucGwBxcwv//82jttV5mqYA==
Received: from BN0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:408:ec::35)
 by CY8PR10MB6875.namprd10.prod.outlook.com (2603:10b6:930:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 02:02:23 +0000
Received: from BN2PEPF0000A802.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::9a) by BN0PR04CA0120.outlook.office365.com
 (2603:10b6:408:ec::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 02:02:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000A802.mail.protection.outlook.com (10.167.245.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 02:02:21 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 20:01:32 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 20:01:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 19 Nov 2026 20:01:32 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AK21Waq1130996;
	Thu, 19 Nov 2026 20:01:32 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A67A59A9C2; Thu, 19 Nov 2026 20:01:31 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] kernel-selftest: Remove patches that do not apply
Date: Thu, 19 Nov 2026 20:01:31 -0600
Message-ID: <20261120020131.1359385-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261120013929.1628410-1-reatmon@ti.com>
References: <20261120013929.1628410-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A802:EE_|CY8PR10MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 82174b7f-4b04-4bf2-ae75-08df46aa5062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261026121527099003|18002099003|22082099003|261022105027099003|56012099006|261028144727099003|10067099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: QjjaOZDJNT0k9f0aVzeqHM3IYXyOuByfkH3axGzLeD1F+pulQY+clfIOAo/7vbn2WDd4tOhZEBaTfOVoJ0laq44aWALg/POICApPKI2Ux1aPJOcxwd7b1Wj6z8LOV9kbVPy9b3RgOyYYgutapVp2Dn3ilpsLnwgk1RgybeGRNmMvdVoyPY78izFOc9voCVc8qPU3WfZswtjGaz3bDIpbcZJafxoeyAjHnLgPo40cZwyiFWod7J9hHxzdB1PFecy5KJVrs5ckPqRdZySezajyobuvEYTv8DIgyT44V0/VpfiV/m/+cZCMHWqETEcKNB/7N0/227oq7bCq4ATRjgAOI/f1r+DEjnJPygw4EYCTs+PF3CFgYb4IHto3bWltQA4B6SP7x91ET44iPwn6GuimMSfOZE/J1J4EKM8YmMrwfptNYY5odoq1qTlxeVCmKzJc4p78PvBldWIAsvlde07RHCrv3Lz9p/1MiGqZSYqRFUbYgauLEwrDblgA0OVJgjzf4g4XXgdbgJNRnUG1EMGmO722P2Ra4sqs+fZubUjkuntcFHPtP67eQJNgxUElVeqQzQLLSa5o4qxP1xAgNjtEibFb9SFWjbQCFAc1nBmectU9zszlwu+yd3bj1kAPPgNQBy0G1MFDYMuDfZRQVJ2ph+qQPgbfBsZD9FwXok/MTRBt+4Q/F5tpdpOXODfB4hL9H8wqof3aNb11waXFETjH5g==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261026121527099003)(18002099003)(22082099003)(261022105027099003)(56012099006)(261028144727099003)(10067099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5XtluMV2SwdxX7nmxAAGwbw+dxlnfXdEcvNxUUtvMqZ/sXwErC6EIAT/dnIZlOzL2iIIVwzHSZ4d2KxygcWgjt+cmH2Tw8BXbZZRkGNhodw+VTc/B8Xd8i5UrfZ2vUHr5bPqXye0S9N4Ajr5ny0ZSu3GJovhGlS0Imp7i/hzdhST814ESH2m3zY7pFsP0c/Sy4/dC4ALbCCDapPA8IxLuuybYn97NdGBYOoo+zPbpv4OCazUqWMMOcKthW7uamfhQKBnhoOvnOh0RJ+mxO45tr8aO/SeiNVcsSeWkryu4FjvMAtt5NEWjtNCabYpFM0DDNDJkodldpSww0TeKESYvul+L/Y83X6TtX8ZZEPBULI0dXnFXAj2EkYFR4OFPzI/06pf4GGwIR6R2ANHsKRKt8qYV4zTi6MNXt9JCfcKsEAI1sYpczOZOXj6L/F+SSb6
X-Exchange-RoutingPolicyChecked: t1/4adIPSEAz1Ae03GUvYsGQL7nOllbhIAHPTpcGCOv0lyh1ZPH7hjyeVOAhDqE6LA1JaoLJND6v1KLB+AgJM57xghT5V9HwDSH6n2B2vRqTdNjTh9wYfchoE7OXChsSfM6Ffwpp2P3/4PpSRZR9owsx+Nl1n1B7gtOylZjOD9UmK64kEDxYyOjuJVqW9JJnzQZHI1bUJXMqdral1N3OlRhdno5TSekRZf4NQMkWWAUQZlN7sBNluQh2SsNxXmVMy9fnlCVE8J9NeliiDjf7mC1CPDpDIu2KCcPrEXDrixLUFuEigEGs7TgXskrxkauGB+ZdXUw2P/rZerZ2W1AANg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 02:02:21.5779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82174b7f-4b04-4bf2-ae75-08df46aa5062
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6875
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNyBTYWx0ZWRfX5RoZDSAt46ro
 gS2J5KgwIdlQpz7hzUZm48GC5yfXDc2tozGvfLuH7ydCc8AeRKvIHGlebx8ngdy78r07D9qXhZ3
 fp3kGKHRRAv8TX1dKN2fdDv45gK1+0wXhb6CR4dud8nUIm5aBrzuhZC4i0SenXjE6txnHU77GeB
 ziMPlKrnDsPHrz5mcMdckXB6/iMebYu6hLGzuZ8quAoyQME1IULdNqZ3eo/K8S2WU0BlavNEUvl
 Ihk/ZPRyVTnhosC7Pd4MFkQdY2CLT9mivFKRarxOe+Z7amVRiaxY5iIkg9tP1lWuUDU3E4S8YYA
 JwEpkuuUc6jUP2g0jK2Nt1fhqdEQ2GEd+Ixz8pzj3vb6E9apJojfwAUa1zZWH1FUg+qMaBb//mv
 ZmgC47h6hsWR5GMxuqoIyC0lLJ65W5k/7EJUG7sYVKPGJnEL34m5W52MRK2jZV00uGHfUya0jr0
 3CiC4lGlm1/WOIVz5+Q==
X-Authority-Analysis: v=2.4 cv=Yvya1IYX c=1 sm=1 tr=0 ts=6affaa33 cx=c_pps
 a=wFYUR1nkr81kUUYKqjx/LQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=ZBKjplEbafaWnAixbvIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNyBTYWx0ZWRfX++HD5bOpqK1x
 swNS6lYlvbe6UcKwfMNvRolnoJshm7ZiDvh+QRbBhvpO+7bNw3lh25mRmDCMA+WPPaYJOc6ZEAK
 R3lRstb5IrAeiMQwihr9BNiTYbeX2NY=
X-Proofpoint-ORIG-GUID: 7WvJTXeoGmyhtP8Pm3xuFTnnG7f9lEUu
X-Proofpoint-GUID: 7WvJTXeoGmyhtP8Pm3xuFTnnG7f9lEUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200007
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 02:02:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20564
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261120013929.1628410-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] kernel-selftest: Remove patches that do not apply
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 19 Nov 2026 19:39:29 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 64b58a5a122a69253528b5ea9698ca756034fbb8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 0965779c6ba73772a0781b081e02d4e6e02f97c9

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed



