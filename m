Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BC5C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:06:03 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15167.1785254755199530768
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WnxFdGC7;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=HwSBH5DM;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEeFx2078569;
	Tue, 28 Jul 2026 11:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ObsQzixG2WsCwRRwgaJo9x8pnPJPYv099xNm/sHwt
	A4=; b=WnxFdGC7tdDfzPDj/s7uIX5DMUH7HBMVi6nB0O/W+De4GLlTJhgmsDlgs
	XBDYICRM5ngBOyHSSIM3X7KzWoLS+2pdPDNKz0LgIKnVplkfjp01alN8CsInPw1B
	kq3oXzGuAvO7uv11asmNraHS+PGrZOwX97Xftf7/jpAp+qavMD4ytKL2yjFb62lj
	q13UG5y7/fPf2qe/7tjBCM8MyLKvcRsRBszwon7q7KhNzAq260sjmtAv/YUreo3d
	S66hpXUhbuAi+gAOXHdQVkdzCq8S8ZhJVsUhliUBzzYwY1KZh8A9J3cNgSQs/fQb
	+fzdwj8DEeZkFDTEPfD2MrSJV2oCw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb2rt0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 11:05:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctfJ54X+XA03txUxmmVlBZbqTDfSe2vh5RATxdLxHmlfO2/ERNRTy9AP5h6fkf8QNbMkYdgKOmryOutMHIUPaEItXBYpMrki7HBfp43atY4ISfa86UOXi6fW5xJrdXuhGDX1c5uvEp2D7sy21qBzcRLzxYMGk2vmHco2bhbx13kH3p5uQXKPQBVwcO2Ymz0bgCT+HF2lDDBZug5FKjXIqyMaEF4KBD2GpfdNojz+oslw3DkgZug8RxGmbOVQG2kO6MnMn+OM6FoePC3riHypWiy4TP7CQSBfbsWFAeYFotyoksT3zrSdKiES4YIYilyS0h/WiTjveoH3P2XLyIHY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObsQzixG2WsCwRRwgaJo9x8pnPJPYv099xNm/sHwtA4=;
 b=cRLl7kZS329802o4V3VmSIzFgxdTF51sdRVfjp76ARX/ekwlLm6lHxdvDa1gdRHT8mg3+3+qQ7C4j0Dpd/Un34PEk5eZoYcPaJbn7W4/rjQPOol2BuC9yyjZVC0k/T3OhIB7+88SqmABGBLda+HjChTAsEcUJ2+dqDEw/x/gb6Fit3MYN2qZ87KK467KNqmXGivxN2KgQJWTrnUK3nKiLaRgZIX3S9maQOreIe0TC4nqoNdnYPI20+csBR3YZGp5fYdC+jTauaOgldjB06pxsTr0sM9GyayGmomQYcIudBuCoWs+I6yjltu1DOurCc7D2cMPEc2vL7s7tCCqipsCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObsQzixG2WsCwRRwgaJo9x8pnPJPYv099xNm/sHwtA4=;
 b=HwSBH5DMT0ViPmZ6SLw+p+R6yEq5Lz6kRUmyMrP5hKOBttZbkOo+cgetRg7MJOw8e3Y3Qgs9kucQUUAzWsbELWeh9s/NoGsglMFlAn+NX8/oDVeMEuy5Fv1DaHzpED54JH8M+zSTUqNUQrnVRms3MYA3qjo3FiwGMGMMCxliROhkdzuOCWwdFGq1yp6gHO1CGyLqTuk0F4W5F9261KCFrku//QCLMJveTjoJk5gB5JNoBR2L2L5HdEfg+Qr4qFS21NkJu2fVBTEtots/kZSBG+krw4jb6k6mtLv6JdPriLmpEQoEES8RrKrW3B/UxUZjcmYc+o1/xX0RGd63KChwhA==
Received: from PH0P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::17)
 by PH0PR10MB4551.namprd10.prod.outlook.com (2603:10b6:510:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:05:47 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::29) by PH0P220CA0028.outlook.office365.com
 (2603:10b6:510:d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 16:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 16:05:47 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:05:46 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:05:46 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 11:05:46 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SG5k583001274;
	Tue, 28 Jul 2026 11:05:46 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1C0119ACF4; Tue, 28 Jul 2026 11:05:46 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 1/2] packagegroup-ti-core-initramfs: Move the inclusion of initramfs-module-netsetup
Date: Tue, 28 Jul 2026 11:05:46 -0500
Message-ID: <20260728160546.690570-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260728160205.2857025-1-reatmon@ti.com>
References: <20260728160205.2857025-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH0PR10MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f673dcd-c2ed-4ab5-91b7-08deecc2163c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SF9IFVR+UDzCvLEGMPRzGpcettaNAnfOIBg/mPltSJGqyH7sArs/4XWt54wtPej2k38dq8/bJWRMXUmqVIgxXu0TX/Id1m7xvQiRNsUVFo7DfmnPGQE3E7e+/WHDuiZ7AKpk7zPaK5y1OUIgBHFC/htqDKFmbZLkn4mNdP1YPACpFtyPBblcmeiKdB7PAUmLDCJcdEu5w8UFtNuFekVufTtBl5v2ZTcxNPtjNKHVfCqptbF+j7gaWelR/OPb3ZeZhfeVKF4Lk696I1GoWe3tjhxe4BWC52XC1Z3uQIGWCyLr/rYitV6ySjrvBINEgN0QP9DEULTYcUXcOeqEJDSKVQ8vh9nYAcMfGcuxXmtL1/kLV7SVUgkvGQx1s6bpLZWSOj583J3AMXYYn1xpXb0YVHkwcIw4y2c8BVb2HfLUYNKkoKybwa51YqZcySUVPZO0RJdfR8oIl/w7T3Tg/BFEJNc7KIheB6OKPRV3uAkHsCPwU5y+C1doFhG3V5swzcZ/BdVOKNMyxP9NzoKM4d6fkfU0n2wQUhXynG6ixUh8jtcUA7Lo9UVfHTrENxgIXx7zfc4lKNhSPDyTa3wX6AIIiZukMmfJvMzHFfaINs67pP0bfE3ywX3fRtjq1LPIbxwPybQiGjWIrFI8NFEqbg3U8XZ0uyWCLhEBtc125aJqaeOlF7ZrV8xQnQ2uWlgA1r2u9tbDpCB27pSKE7oNyusxyQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KDGGUND0xEbjnDQfcfrmDkO59QKOe1VxqH2HqHUKa6OsGrulX6fN2GIYhkkn10kJqch7q/0jWgVsCrtveX3FxSdBd5cFiTHBaNf0o+uQqnSZfsBLokR7G8h8gBDRfVqodC8oozBpI9tudKdkPys2xrG0iPpGNW3yCnDrIogBKqZP3RH++V7EnnZQbGk+LuOKNWHWxrPpyu+sZu4FbbACCbIo0WPPodfc2sZpVKQi9CgalUSH8fqiOEoelPWA58fHPWldvRI0FPxWFomxVUHGbDxlvavYKj2UpVswLKQmX9+ohFgswLiedkRFtA0MU5MCtJXiSTu1VEmvsHSoL0HJMkI/5LXdMpLjIPFHCI6acA0Bt3B4oGIuvRaSaNarzSuS761Qr5UyrAo1SNTAMHFMSN31p7Q/l066/KyDVza3SSsTqoB2synF5lvjaUKlXssC
X-Exchange-RoutingPolicyChecked: 
	WaHqZuLHK0HzRvcrZ9100Wln02bqCuGRjxGPx26mA0SN2cqISezerfNqbfFWaVB0Ex2Z5gxZ9PlnNV0CGlPyovS5Sqb0QyyWvEzFzrtytSbDGTPRotU1j2MBeuwLWM/ovlJQ9OeCwUz8jpik6y+CKj0nnIfKfTFN0I1x6zcfKSXsdy1EbmveexDyp5TRK2QAa5M3j7e1agiG7amHqMTOjdzvQ4xUNSBC5RbE9JANdyqnUH+cBW4KMSMG+fbQH5Ma+2SaXJ21VV7Mxcus1iGSEB8vnOA7bxfNE99a8CwPCmr7TtgXtfEH9/NZzaXu1rfmXMAVb4JeZ7YT69qec1T1eQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:05:47.3060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f673dcd-c2ed-4ab5-91b7-08deecc2163c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4551
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a68d361 cx=c_pps
 a=tlTDY7m+LisZJGavll/kMg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=Zr0cart3aygaFuPmn-wA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: kMSk07IAWd-4gOZx0A9insjVGUkZuIwx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MyBTYWx0ZWRfXxDVX6q6pzehw
 M7QO4KCHsBFbRNEQ2ZnxKbh6Ck45DzKuQ3cSA4EQnMJQuJgJ15J1QMXbn5hWZrKQCqFySRWdFJf
 4v5xjgcbPHGlgxqxTksZaGwG6to2r6w=
X-Proofpoint-GUID: kMSk07IAWd-4gOZx0A9insjVGUkZuIwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MyBTYWx0ZWRfXzGq+oSrOICfn
 /wzIk0E5UjcTnNbON4aDoT8JthjjAM0qE+7TkWertrmEaQFrys40wqJbgogt0aHfaJdKSi30v46
 1v/bKGlvp+vJX2BUmdFnVUFG8snyk+z+5u7aNrRw/myfQnMHInXIqFJBQfk5i+z06bVRD0XT/TE
 PSvQWUT55+osLemjDAGs8A89V6mhmlQW543/Zv8wMHHzkt7JaAz98APai/HL5GC5dGGKvmtMknM
 g1jSehIF0bSXbEGEnvBzApIRCKllDfsm7yTxEBjZfMCfZm0O5qL08qqjFiXLylf1IgABOjRzcWR
 q7Bjr5HWJQSxUeXVcNy3vOescLY5Q0Is9A9tQR0N/K2EBeg6QLnO0H2f64ilDN0wcYurXlvLa7H
 Z/VGx0L1YY/BQ2vo9hBKZUgUbfhemQFB3ApC/3W+ocv1toFIW6B75cREHQiDnivvFM6j5wIDj9K
 NJP8NjFCip0UjiiDYtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280143
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:06:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20204

meta-ti / na / 20260728160205.2857025-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v2 2/2] ti-core-initramfs: Decrease IMAGE_OVERHEAD_FACTOR
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v2 1/2] packagegroup-ti-core-initramfs: Move the inclusion of initramfs-module-netsetup
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 28 Jul 2026 11:02:04 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 0f0dabd880f9a1cfe8a095afb2ef9fa22e275112

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: mtd-utils-ti: Update SRC_URI:remove due to oe-core update
- Commit SHA: e1286bc5ef11c38c625943184c1dfae711ebf85e

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH v2 1/2] packagegroup-ti-core-initramfs: Move the inclusion of initramfs-module-netsetup
    error: patch failed: meta-ti-bsp/conf/machine/include/k3.inc:31
    error: meta-ti-bsp/conf/machine/include/k3.inc: patch does not apply
    Applying: packagegroup-ti-core-initramfs: Move the inclusion of initramfs-module-netsetup
    Patch failed at 0001 packagegroup-ti-core-initramfs: Move the inclusion of initramfs-module-netsetup




