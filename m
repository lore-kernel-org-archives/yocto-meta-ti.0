Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EDDC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:06:12 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36956.1786082762518492487
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hL/uQKM1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ohZEy7On;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6770GNAC2309106;
	Fri, 7 Aug 2026 01:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Zg/DRuDeybyQD48EEeMTUXetljHHqPbWq8lpdMAFZ
	tc=; b=hL/uQKM1Sp2/H1tpg8Tb/sQrrHLc85Lp93vrTyL5kwwQvzyVCRK/WNaNr
	0IQtLTJvuwx1FbnzHKwXKYyNUlB14tpDB+GY2lKB4Z/kKg7NJXmicqn8AOLy1D9T
	xZORQXNcKI/lRyLFlaZhhNMgjMUFNElg5ozSRZpKmvnfrb4U4V82pJi6VREnGWh3
	mq09QxLJhBdyqI93JpReCVRQjmMz3n2fwkJSsNhJr9u12eEuIPwqO0R8OPdUlhAx
	FdruLIKSEvKlSY7dNmFNhPuVdGJH2kuGMFaclkC024ei4+wU6PWYfwM0oL+nr5Am
	ve1WRmSZkifMdx//qQNNTYXEqO9xQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjgg12p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:06:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrXiG/VJIOrkvxU9At/GfCJW9QXcaYbAe0cFY5ep+fUTCxobDcNQfOMYHLq78UgjU8376MFzjl2Vu9atBBPT21qRbB5uj0vstv+XLRNIAD9IFjPR9kvYXvn81rhoeeRrIAR7aEOo1MRs3XYOLYC2wurg3J2Hao03EjVX7o0prLJF3SZHzq7DOtb+OXIe2M+7KHvKCs+gMVtAG4BeXYCq3mCLzwVGa2zGx8V2tQpdIe9cPbFzHZWzZUNXsWXMQiCwSqVK7zA+JJ3/4gNLAU79vAWWiLRcvTdqHdbUh6R7UBaTcctHLQgTq043BVXyOkKRHTMGo701P7nUV9Mkk+IkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zg/DRuDeybyQD48EEeMTUXetljHHqPbWq8lpdMAFZtc=;
 b=haFit72GplGWnaRMbzEloigOJduL15OCVfFPJBYnCJVb9EJZjEAmOKYLUpQJbCr22eCHCywRNR7/PiA7GtrhqiiDlRAkT4n5l6u/64pkkGtbwFLrn7m25lnon6hsQgCfSMJBbyYpHZe/Di/JBWNzsJgKbKFHUfBlnEmDFZd+Wx6mRX+aCDMgKSTt1TeBZIn+/67osoGMNGvy6Mqc66amLjbgEA9sxjltXbiuqT33PiUY0yQUxVdwGuJ5nv+7ylQxNAV+o9UNGVCEfsHJDoFeo/wFT8YWpHmfaZzVSABhvW8Awa/ksUgwLMOZgDSiAHk35bpa0lO0fjSbMTiulsE1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg/DRuDeybyQD48EEeMTUXetljHHqPbWq8lpdMAFZtc=;
 b=ohZEy7OngkpYEuKzGrgqCd+LdJT0oQOEKI9dRspU3l7Kn26a1F1T/k7q49hn+04y6oh9kg3jaHwE5XH2XWIBFdr8qlEF38HoUcGp8DYsjrs79+28i4tbmhcCS7gyhvq9eC1MCqB3k+YOJXnyuwhIwQ1iBqEnXo8qUqDN0J1LfmaZPX3mffX+vnWMdfOn+uv45gG8U7S1priyZng3Ijymc7QRcdQewSrQBy59BJ5H2svcMdXgjjbbLcEagoCYp8VxHbj2P+MYqe2M5QnDR7BM2xrJWdD09cDGsZV1rTyEAV6Hu/wVVvaDju6HcHxotbTTQInf52a7UjqZU9gTwD2lOQ==
Received: from SJ0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:a03:3a1::16)
 by PH0PR10MB5577.namprd10.prod.outlook.com (2603:10b6:510:f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 06:05:53 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::23) by SJ0PR03CA0371.outlook.office365.com
 (2603:10b6:a03:3a1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 06:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:05:52 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:05:25 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:05:25 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:05:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67765PxG1718439;
	Fri, 7 Aug 2026 01:05:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 09B4F9ACF4; Fri,  7 Aug 2026 01:05:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: Re: [meta-ti][scarthgap][PATCH 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
Date: Fri, 7 Aug 2026 01:05:25 -0500
Message-ID: <20260807060525.1664874-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260807060155.1381364-1-m-shah@ti.com>
References: <20260807060155.1381364-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|PH0PR10MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: a79f4178-097d-4118-dafd-08def449efac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|22082099003|18002099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	784Cg2y3XhVFIP7Jlp6SKHFf9zeRk+2faYXn1V8ovNdvzcQm1l6tvQ4JbdY6IduC0xQMsr3S7DL8SHQdUd1+SSCbsGE2P17lB7C3cdSZshO0K699lqHAojwDxZRh9TJn5svE0HXRwIewZxQRzJxKR9mTGcFRSXentfz0EChl9mU3MWSyc3jiOYOcuHByIKxy0HUBdzL8lsMVtiUed7nQegbVGiCo6YNbp34b8GEDprQFlHYyl32QPGz/EpXd7YKsp7AorHhd48Owmz8yNkwlDhX+iEy70l5HexMR/HuAFlgyM2kVEhzcbj9+yJ1XvPbsCueLft2NQagY0I008o5DjARyFKVzUY+xP7psNA7Oil/ihonGEt8nBcBTBG+hT0NIu+LnLnz8c+XR6N+WUOLRa9Rr1fJG7f92XmMRi7krPYinPC/nZxOQb8EgI/vhX/GvAUqOl6m0QNn0pUZAusGfFsyM4YRpYY4SmhAlsxXxUZ1nYajGcKoxIkklMkMiqdHvK6qFCatdiHP3cMfprmX9quZmwy9DAmZRigOLJsyG5j/JzVJPnRXv1rjsY/QdDzM5Agf9hJZ7rItKXyw6WcLz2wTSioEuNQXCJJsYfoMm7c8MkGMRDalLEj8WbD7wHYzwgPjYmwhTTxWr9lMRoZxzwOShL2UeiuTPVm1VMK57v0naZdA0fejMtnIhzjtw2da/2Qtj7e2UdcjIsS6MgKfxoQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8uUAFpazfEhSF8AvqzdtcPtN8rrbjKbZy2OhXG8TZwEKs2yLMvdDxoF+FbShvpF6mscLu3zmSdJ02MpR0SYbWEmDoSpOlu1E9TByu4nb1Tzfy9t7FRiItQQhLyawYLxarY/8iE865StvdN2IPfb6dPIg2hgg2varlYrLqkTe0jHRtX8uV6cqgJmOY7assTpEzVDHsh7mjNhSucXCAaQ7B6WfUe8MFwmjlqF1XyQZFmFpEMjS7VvaVt/Fz1bJ+2Fj0bOMO9fAlMw2LNI+SqocmzJxZmIwughj45JzsiYVAIdG49p/wbjB7hPjkdx/JP3GdDEmdNVp9TjAav5ET4Sdd22tySapHhwe4H7qyZK91nEy+kL7Yu+f+5wx7uaJd/QO0IaarxW/5kPiPN3xlBTxejUm4Mbi4HgwLLRRVtU1cCPgmteGA1Vi8W2QdDBU2+B7
X-Exchange-RoutingPolicyChecked: 
	SB2qB0fJrGXpOYgUipkjWiYvw0n+r1q+cM2aO/SIboKgyn4aOC3kIHkgN+vA81ew+eaQ92F2ya3j4N5ps4Te0/0EpIIolaIuVt0DGqVHVuG4zgvRaA5dXAoGE3SAE/akCrZR6Mr0IRRQxQfdaZExpTTKYO7XqNwtDj2b02DBWbx6ehhS4ecwEVsPgfSJFEPupIvbDhL4Rb9kbai+PNttddjpZcupqyZa2Vj5YcYhSoMNhSVx69LdtD0gxCQBhBFZApmp283RgkBsTp/TqkDRep6CngNib6NlYZ92Bs1j60PjdyQ+4uSceeUhHVLX1/HFVLmblgdAcUd0lHBCfqXM0Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:05:52.2751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a79f4178-097d-4118-dafd-08def449efac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5577
X-Proofpoint-ORIG-GUID: uThwjHYRqG5X0meWOpNI70dkJgr3Oasd
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a7575c8 cx=c_pps
 a=0Qqeoa/8LQ4SOC89qm8Uhg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=D3FBBtfS9Y-vgfSEgeoA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MyBTYWx0ZWRfX16BYMvF6aB7p
 sgx8m6zoodR/FLex3LUVXSFuEFNAv5W7K1YpXVCBW4ck3dNZMDXxpDQ9AedLc4E3lNw/KCez1be
 FKFdu6KZ+Anuk2lz4QMtYJa3iP4lULE=
X-Proofpoint-GUID: uThwjHYRqG5X0meWOpNI70dkJgr3Oasd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MyBTYWx0ZWRfX7BcqxnIKAa2P
 A1rXksA3DiFWFfkUb9wTQs9Z6HrXyCuI/QY0X4fXpI4KSNlLegu7Efq8hnGu/YBHVQKps/RtcYC
 /W0iCdG/Hiej+o6HcFO0zoI2ZUQ6YuC9V1Ak+ImnfA3N9V9nE2/OA0/5DKMDvQ/q7UXA78xloft
 yuueK3QQ17xgTv+BeDQlgkixD3/4vtLlMsam+dBZmH+a4mGaC6MVvFMYDE+R+aCdx7pkB1IHx61
 2x8bLKc4bbePGo+fFuKrvZgD9lUqSe6mKoRwH5CMYMMPCBGs+Np3pWtfBotXiidyQIdpfY/3jvB
 wakqo8TkQcciFuHWU5q8eLuJgEsXm5m/PtgyWiBpo+bkACGpW3t1nltdnBZdy59qI77xgSthpw7
 SXF0EV+sPsWIGshTQabzx3WG+tAyzsRGkscbPCCHBXECt/cNrABnxm0AaW95+jjE7uyXNjXp67z
 DovdycoaUhgEFCN9a4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20228

meta-ti / na / 20260807060155.1381364-1-m-shah

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH 1/4] recipes-ti: initramfs: add ti-core-initramfs image and packagegroup
    WARN: Commit message should not include directory path to recipe: recipes-ti: initramfs: add ti-core-initramfs image and packagegroup.
              recipes-ti (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH 2/4] conf: machine: k3: fix weak IMAGE_BOOT_FILES assignment
    WARN: Commit message should not include directory path to recipe: conf: machine: k3: fix weak IMAGE_BOOT_FILES assignment.
              conf
              machine (COMMIT-MESSAGE-3)
        patch
    
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
FAIL - [meta-ti][scarthgap][PATCH 3/4] recipes-ti: initramfs: add initramfs-module-netsetup for DHCP before NFS root mount
    ERROR: Commit message too long (> 80 chars): recipes-ti: initramfs: add initramfs-module-netsetup for DHCP before NFS root mount. (COMMIT-MESSAGE-1)
        patch:87
            Subject: [meta-ti][scarthgap][PATCH 3/4] recipes-ti: initramfs: add initramfs-module-netsetup for DHCP before NFS root mount
    
    WARN: Commit message should not include directory path to recipe: recipes-ti: initramfs: add initramfs-module-netsetup for DHCP before NFS root mount.
              recipes-ti (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH 4/4] recipes-ti: initramfs: add j722s CPSW proxy-client kernel modules to netsetup
    WARN: Commit message should not include directory path to recipe: recipes-ti: initramfs: add j722s CPSW proxy-client kernel modules to netsetup.
              recipes-ti (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




