Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86666C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:28:34 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1769.1787905705404625092
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 01:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=IoIK3blt;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ovfLUFcn;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S65RrZ569482;
	Fri, 28 Aug 2026 03:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+SEZchR9dKxgpCUuQb1F2gmLk7G4vUyz+66AwOrks
	vI=; b=IoIK3bltgpr6xdxa57jc70QHHe/KPyo84VgatuM78FXGbPWnDpv+II2fH
	EQgpbv4FCU57JZhhvQVPr8CVwFpSFNTlg0NiDhM4NIxZit02fY8fRBAvyg9xrdyt
	Hl8VizVTb6Ja/BdbOVF4ilXd2FMo79sUpMyBmBhWWCC3ZNZKpzTwihWqihgAjBUc
	BqepLhYtkuX7qNaVSMctpviOHWLws9hz3ky4Jscf9XuC8J9RAuOVMKK4GllRbUOZ
	D+/9CNnTXgxMFGZ1E8ELm267V1zLkrTqvPp4iIDjRY015d5qft6D0ADMe7Cd4HLl
	SjRWFkQ1VjJGqMtg3OcLIjicWMzjA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24r1fey-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 03:28:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohA8Y7X+1vv979v/CYvpRKQxSGbSk6wsR0+IQdqBsX2Tnhu1AFmslFoYX8K9CVMf00ECxhJoAhy8rOEQG1ToLu7or0bfcJAVVXENyH4rPmN//c10TKQSHW6WszGYenG30jAbIeW5mhfyonrOXtux2ETbFcwVhaDp4XpkATAIppTIwjOB72lN/QQlGGLCrYbBOzHIsQ1NILeO8kXbLWcFO78pWP/EsYn4kyIO0TQW44gM2wlHMn6vwEJW1gEWVyEDs0tu9+zhHBBNc7Q/HazDGUM/NzVgWO+c1z0X7dOtdgw2Bbbe8jNpbEXM1cDY51ecHCfB8M9fNkzzgApi4AHqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SEZchR9dKxgpCUuQb1F2gmLk7G4vUyz+66AwOrksvI=;
 b=YuofO+Z+vXHK/loF0C/bNz7VpCwv9gdIiv8rWdMUtwbsrE1B1ETdQGW6HuPkXVhc+F9HeMk2fD5v+E0tPGMHrbTYODS/MKmZW9Ys6kkYusUtYR9W3xv8AjM8kUZyBHl4tCX0qVde6gm+hPyGU8ZuJdEkzl6nb/mDQMRwu+SzR7Bzs6QkhkcZV09KMTkfzXXmX+YWUgkI8kAD4YkdWYA9CAbveCNRy5qtZQ62ZLs/7M/jN97pPVTlbuDzTGjLfn4o09n5A8q0iqE0PF+o3hTE8HFHFxg3usySqNC4ESF3Phs31NApmPAhmFqQJ9IqWWipmhGXipmHeWkX75QiKBpFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SEZchR9dKxgpCUuQb1F2gmLk7G4vUyz+66AwOrksvI=;
 b=ovfLUFcnXyGCfUJ+VS4hIjufb7Gv7kpD7YHWfvY067V8Dui4CldfJMpCA3VhWJum8gJ0bgyRafv3gpGAREPJu/Uqk6RtqbwL1WrB3lv7hY+lq88QXFcHMKQ8zVROqsbA8x+iv/RTPcPCJIrF/0iCoT5T3b9goPGH2ccOvY9I2HKC/W4R0ijBwPLzkfxUJdSczPXjEl31BSnijAYOW03PUi1yByNZgQ/gPKVIJKouJOppVZuwwqOpKK7HV2F8M7wzFOBg5mnAO1YfK68PK2garwbM11w64QeqZexk+ZZDRASH8Su3pgZUCiZucULGWcbbxJflrNpOnyhTdTjZgdA7PA==
Received: from BN9PR03CA0753.namprd03.prod.outlook.com (2603:10b6:408:13a::8)
 by MN2PR10MB4125.namprd10.prod.outlook.com (2603:10b6:208:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 08:28:21 +0000
Received: from BN3PEPF00022BD6.namprd03.prod.outlook.com
 (2603:10b6:408:13a:cafe::28) by BN9PR03CA0753.outlook.office365.com
 (2603:10b6:408:13a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 08:28:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BD6.mail.protection.outlook.com (10.167.248.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 08:28:19 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:27:25 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:27:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 03:27:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S8RPXE3478433;
	Fri, 28 Aug 2026 03:27:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B0F0F9A9C2; Fri, 28 Aug 2026 03:27:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
CC: <reatmon@ti.com>, <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <s-kapoor@ti.com>, <p-gupta5@ti.com>,
        <u-kumar1@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 03:27:25 -0500
Message-ID: <20260828082725.3643816-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260828080757.1160553-1-gehariprasath@ti.com>
References: <20260828080757.1160553-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD6:EE_|MN2PR10MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: 6433ce41-0bdd-476e-25fc-08df04de50d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8hh9P7JwavhwG0Nu8LoQ5GUdABP1NzGewvndCJFloy9ALZ2+Xl1dfICMZVpgXfZXWK9DbFFKEzzjWusE2H0GNMrWvWkMTPEkIwRDfi0Rl+0CSYck1uSiQSrIiU2dDiIv9cnU5Su12+cKGBIHe/eMvfZBrRw5OhRVKmFekSgSvSF3yL9OftERZLt+cBXkh8QAStPFCS4WjWC2UzCvvYLNbkDAJ+CtWTT74u93wrpSvJuCYxaODpvxbXIptoyGYO1+IPLBSeFkOWugXwSZ/9GOlEGO/DSRUmUHhTtPAUySsWu65cYuAbcd3a8WtnwpWrmhGub7gLQ5XYnkG8zgo4NTk9sQDntGBo7GNkX5aKhFBoET5BpAVLy7oK7zdxeHvXMjJM+xhEhpHj9ediy5CROgmzFT1K8ZzCCLUgNS6S/4VGbNGuqQPJ4FEwxT3I5SUdogl6rJp3WsI5dBfO0J5CbCXR4kC2NwIZgWuAcW1RBvlxVdqHEZarGW4D1WtKxnHey/qBgKINMAmLhvKItwA3BEEXocoAYJSurxj0w1XJpVUSs33CZoF6P4iagkOyx5p0FGKBHCE9EaqQBaGg/jGyvcSpSpX4yjEJMg4pE7WnFcT/A9QV2tOwusWDmFH5FnB2GxYEFpCMxwnhNQyshCh62x3P/RBER0kcyKj2SrZ2m6iRslRgg6V0on4kUdU7zBR56POiYIlyfvOMxtZCK3FpODfA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IqudF5t26V3n05NGxrFifF1FlqrxJ6MbjbTEcvtYc3bHA0kKpeCDdPJ6n+kDH16in19TSYCJvoEfVr/frNgwZRXq5lBHupCNEZHjvUjqwKEFZVSMtFOUbUwgQ7YeXDZg2izrFHnxk+ohPRlG38ciDQqdUhzwxAnM7d/AW8zutz78wj46LeYw1e8WXOGeiz5L87xzQcM76B3DsTW7kFJZgv66PBOfcM9tFg3UzLMEZ+U6CegUy5UZXl4+n/G0mcyeSnE9e3EK3oFZD9PbNr+l1KT/3j3gaQ5KhWiHNdOvlspBDU+oMm2Pk3oKSbGSuCj7x9kQ1qaBBLBWqO7lnzO+0lDEBX07EfsB2lOfJ8yZv/BAokrsV1YJXaDPion9on+RkrtkzSEyQjLBzA0QEUeKzaN+ZvOQMFwiCLLSEWsLan0gDwn2+CL1B8iPNK8pGKAg
X-Exchange-RoutingPolicyChecked: 
	bZHMjPLDa+cqarjaqFGlHieSt80ElvqtVEPJvWIw3pFuleaCvY/GLhU/rOv9Pzii/zhdkX4YD0uZyuYSRmVGFWf+1j5zxEgp/EVg/RKBBM56ngB5IbM9dcsaIvJsOM8xJRgUkTw36cmPMcOjpZNLaY4ERrlsLgFpxsjz7wdJCD2cVRPjyzs/Aku2S0EKB+gNa2YFDcimvfUFhSQI7nRvQGh508N3Vz0xzu/0Iv32fwbVzuL5zIzQP+FBD0/hVgt70YIH/MAr/ndPfkwSjBhJeSJ24fxK+NL/kANWDrHr+wLvgeG7Muwk96snWHxs4RxIcQ7BiGbSjrIQseKddOePyA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:28:19.4165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6433ce41-0bdd-476e-25fc-08df04de50d7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4125
X-Proofpoint-GUID: NbFFKAQZrnGeY4brhzrcCe7sudnRzb-p
X-Proofpoint-ORIG-GUID: NbFFKAQZrnGeY4brhzrcCe7sudnRzb-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3MSBTYWx0ZWRfX9jj3mEhqdWSu
 TqRS41IszaENhqdV24BfSXoZyugj98Xwop4foDkgXJxjenOiox0gTYLpvuNUpP8OwqxXRHZ3vs+
 BwewakMWVwI9S/Or8uTewcz7Yq519PDq6EAA+ee+KHOOU23kECkT0zIjzCYk5obnD4ouc32DGmW
 WAokUV23C9AglBD5UB8YNRba075Sieb6fFEx+rHPLTVXKktjKdYZgX3SQfCd20GvbpiYMRx0xFh
 hp7RmM7lN8TUsCoqZ+f1GTJFC/1JoMCW66iPewgsyTzI9svaj2pWsHa0GkDysjVC1l4MyzAGbM/
 6pt8rhrXTFnvA1jfjADUFcGF4zgZJ9vlB0Y6mfyTrk6nhFNWqITUBPVHB5dRQE3Hom9X0/ODSXe
 pR1SkVeyS3R4fZZOTxKmyE7kRX22yqnof2tF7DUVzPn8vTOiMA1YS6nHABB8ACSDr1NSQv5JZDu
 arFUuB3kymE2G9z8a1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3MSBTYWx0ZWRfX+2Rd0jsPtXdx
 kvne/tMIWJeEd9FJCmCOZ4kgCD16xzojXKemsO593ZhW99uwqrEz0p/Gjr4j6iGor2lsZ2XBKF3
 f9Q6W6aYB2l0jciIYbRt6LYPXY2DHBM=
X-Authority-Analysis: v=2.4 cv=L6gtheT8 c=1 sm=1 tr=0 ts=6a9146a7 cx=c_pps
 a=2plZotBPgSoI6Rnih3N6KA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=nrBokKTXjNqfbvFcs3kA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280071
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 08:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20297

meta-ti / na / 20260828080757.1160553-1-gehariprasath

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
- Submitter: From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
- Date: Date: Fri, 28 Aug 2026 13:37:57 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6cd9de66050632ece1bcbd63cdb66b395cc0ce95

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202608190946
- Commit SHA: ef43a90c91d5a9754b2f28f09debd553fbc6a2d5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed




