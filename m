Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.653.1792594618980875922
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 07:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=am/a5iMz;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=SlHSrw+S;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LED65A1317742;
	Wed, 21 Oct 2026 09:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QS7a0Wj4kXqzkLFY1bcaCHEKU9eNjR/hKvN3Vo3tC
	t8=; b=am/a5iMztC8RO6KHQoZ9QrDb6YZ1rkcERrSptE0wTre3a7UJUxM+iN0Ps
	2PWBBIs5Z6d4h9ZyAkw1ZJieKk+UIU9npU06cJVyin4454Yi5+En1tUihEhDagcm
	5q9lPy0U9scfejigshlZwO99pnrgZMhrRre1M5m/zBMPklyFu8gJwRO9AXhDDZmP
	RPPZzUv/5lLChjh9RuoSCqkhX4X+nSIZGTN2f0OeR8oIV5Mr8w3a+/UDBVbRlVHr
	/ZvQ3SjokSfx+5jjAxLt3P2V+53CbAbOixRMTJLhP+ooPPohW2tftNDKW0j5X2M0
	gBpqnhpXc3B4LQ0ofghPn6I/UPkcQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hecuke6s6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 09:56:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gX9KeriYTBw6WE0v4+cOJQnl4SHSj6Rh8UTq+wn/+OLLmPO/0b3Mk1RTExNkWxv8S2jvgXZghJSh1/Leg0T0EwXUQQR5+5hHbifdQUGXofEjyiSlG7+Af8JM6ENrugayAZt/JJuGy6PO6AIecMySzUads0dtGvjYpGmkQ0BZrT7viPBTxFNmcvSPD+gPICo/4X3QnrTh3O8USQnKcg9xIksfWtyp9eHmGfXoXmKtXmEzxidY7vy2bW1O+LBK/fCcr1o5z3qdLjRJYTx1+9fF7fVtj7DblzKw+p1CSTdY7tTVkcklIbKO3e5UNQPRTCjOyME2+0sNKb/t7Fgsf2yyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS7a0Wj4kXqzkLFY1bcaCHEKU9eNjR/hKvN3Vo3tCt8=;
 b=sJf83GgUk5xUTmAytc9dwHkd7J24ejBfmpXdynl+1mT+/Ck5VQIj0jolY4sEeLZ7w/KFXmQwMkAK0C1UB5mvF5X5cy6z93/G9qYTeDN4IDRwgskP9RKvM7g/MDvPdQO5x05AZfHMjnAwoJV4fjc8d3AcFQbw/YDteZe5XqaJIAhlDDoZArcli62HxyqAkASY+j/Dck511UtMLVg7pIs3lDgpC5nO62XHHscBtYGB/7d8Cw4ww03UVy4Gaa6IthDTTpi5Azm6vvcUaehST7us8yXM9868oVJYV3uAyyFnv3oUpzH9Os4rNjPFN7RqmZP7TdaT/0Vace7hEP6qaNlTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS7a0Wj4kXqzkLFY1bcaCHEKU9eNjR/hKvN3Vo3tCt8=;
 b=SlHSrw+SKxtbfL+XKnyMH1eHVG9X6Zi6QtVNuA0RjcwCTIfoC71EV/rYphQijJxeJOxNovC1lr+beYeOp4yHRL1cPwzukgVyjDTkixgt2MuslfjgE2eDoqNAjwaZectMJKepU19GXE9gfJ+SGMiS1zTnk/vhhtXI/Erm9dcC3AILPtc2mbCpXYNK3RzoKLyvEs4wHvNohyNpsKAYfKV6CytEAvAsfDHnxCGqjDqD2fs976vMneo1WZ4REyVOPOAFHYW+0TnXZ+Gf6PMucy0i6LcuVqn8M3AoLO9I3Awbfnt7jtpnPfWe6lYPA4RkP22EqEqwAOS6e1hGJVMbFQDBRg==
Received: from BY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:1d0::33)
 by SA1PR10MB7815.namprd10.prod.outlook.com (2603:10b6:806:3ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:56:50 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::50) by BY5PR04CA0023.outlook.office365.com
 (2603:10b6:a03:1d0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 21 Oct 2026 14:56:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 14:56:47 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:55:56 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:55:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 09:55:55 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LEttf72809050;
	Wed, 21 Oct 2026 09:55:55 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 561A39A9C3; Wed, 21 Oct 2026 09:55:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [PATCH 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
Date: Wed, 21 Oct 2026 09:55:55 -0500
Message-ID: <20261021145555.2106135-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261021145213.853962-1-r-sharma3@ti.com>
References: <20261021145213.853962-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|SA1PR10MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cd41e2-7f57-4286-730b-08df2f838824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|10067099003|18002099003|22082099003|13003099007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: ytDgQSYGR0ryH9GMZgeL7TNZJQJbSR75dKyjjxp6ewXT78ggpXlr7Ji/KMoKJJJIuczDV6X4oMUlttAR7rjAUC46LTZz3bA12DTNyDM0qzmCR/P2CaoS8at4S86S0xkRzj+ZEePZz2KAgZtQxo7p/BPeoTF1bxUVm9OTBFvQ3tKh7N+AGrbJ3EJ8LABFfGn9TSWPeLnELfQj7UulhWtaqd7k9f+UmEPRFertCiRyxgcBl4a9v3yicNhgODwCAe6eFgrbj/01UFFRK4fGmQMFp80zX+b/3x/vVHhJ6LbfWz9lUnUTjJGPv5/p/XBoOkBMEX+vj0cZTEBUSxHFgBl8nKkv/5tP+ABvkvrj9rR9xk+Y6vjmQGvwRaqfeQOpszFWAa1xTAk08A7TLjekkCxo5uW5iWv8cfn8KNhwDhMNUC+nush/5OsoJiEvLkxO/ts9gUQK0UcJ+sBjuK7qQbdXMFCOq1UZJO3jqd+TmHRuXi4GtuR4BkzZnU1R3gE2LBJMTdR5TdlqiDdyOgEhOWdWZpCOZx2pnPAS20W+gVLpnFI1xUhTv9LtXydoZFeJVoV98VZvQr/GJUulR67OrPy98bpVw75iyGvrHQ2oY8uJbI7b+njZQ82+3+kHPHyIUrtzJXFlfJN56ZjlvTwEmoxCFou1e/JnSG0biGdBPFKKX3Y=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(10067099003)(18002099003)(22082099003)(13003099007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T9/uw1vVXyKPTRAIRW9UpJR73PFfUgJFrxav/K3wnus/yOwn1C6bR6m/6N+dTPEkPaAVhAqfRJjBTUnafxLxkLJY1Nl8hO7Vw7smwat6MSOojklczlqUIw3L7DqKPb9yd9QmlLa3SqdhV9Iyw0hX/0YWeXs8M56E0+K2bzWd0CBPqemwLaDSJI8kt1el+fX90kaPceqnuqRa3+M2bJu8jiyDSjfVh9nZxu79tH8Sg3PmFIa1bhruI9SA6eSRvzl6RvoV8AAiPtHX7yZf3qoQxDgVCsvZ5isCZOBszVgEKQblDSz6BOPaN46dwsQtGegYO2Us2HXcq5h8WY84e0KT7xh6Yjp373/yw9HJn1e2YHTn/rPYWfzkrVH43/QL5WMDfNExSEVnIPEPcjyTX1tBZqwNioTTK0hTnTPcb9IYl3h5blrwUH1tU5v/Z0QBD9mN
X-Exchange-RoutingPolicyChecked: jnJILw+uIE6RnU2YzvyVWFX7wTSvgcHQaPEQ1rpiyxXYScEXMKpSjB18O1QTGFBCtXrhOe6Y+4c4HrRFWswQ8qIIqUSCDPbEIit8lQm6Aewoahol2NL1QBzmPTEJwMImva+bhfyF9RZ0Vtz1dkTycCCFYssM/5pAMywaEmuJarK9W+mtaMD8b0u3owv2Fs4z5kGWAU48OJX3YpvTp0aqYOAEb+uEHxPufUxPg3PqFh0wQfyR/OHoQ5xi7qRARVePi9YQlziQxsnYozHNNiZNEPcxq4Id3nI/5XUWhDwpaM2rMUOaKanKy7ykzgo3OJJIqHEQtKuLIpb5WlyJu1G2gg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:56:47.9978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cd41e2-7f57-4286-730b-08df2f838824
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7815
X-Proofpoint-ORIG-GUID: Wxs13bEfuX5m-UDpHtPbSwrUMGp6XtKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfX8AuiTPh17POv
 Tw9PlvRmwcVPOk0gBEJEYJoewIPJW+JDd3lYJSbR5xupEO7DZBp8O+m9BoWVpNwGKwvunzYYrNm
 tJn0qhEzmn+n5qAOZLhEoeC0zZT7tycQgC5xiai4Ww/v/A4ft6lWkvvcRiNjuNkD86qMDnZ8+eY
 L4a4cYsLwzGTLH6z9MPZEOQot6clR+GlAzxXuPMEIJ4B/BhG+jSnWzMWc01pfnwpihoZxSqrobr
 gEfnFWjZYbOmZHPXQuTQhY7R7E6msTGJrevI7mOL8t4D8VJF1BJ8B8+oxexiOwPCVD8mR/htzSc
 sobh54IJ0ElEG8a4Kn2n1dxyGxIXTGijsiJAcwEq3KtD+Ntg/pz/LcFUSDvJOK2m7ZALJso3tj9
 mVDJihkYL3I25HjKkX5rPIw+kBhkLj2bYNNZih0r5BI1GwGQULcoASh1NanaYQoTJaS2s3uz2wN
 hB1rsa8EMGKZrAyi+UA==
X-Proofpoint-GUID: Wxs13bEfuX5m-UDpHtPbSwrUMGp6XtKp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfX6jtzsG/SCxYd
 7cSmGHf2bkoSWi9hHw7mj3dnf3ZPm2dr0sTmf2TKma5CyA8vz+SuzGyenqnS15yTDTHPgYwh8mL
 WpBlaLs1D2eWNDgLvFBw/aGhzCyzy8M=
X-Authority-Analysis: v=2.4 cv=dfwVTnXe c=1 sm=1 tr=0 ts=6ad8d2b7 cx=c_pps
 a=aDjbMzJe6/auvryAEMJQMw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=aiFUIUhQ_bfqkH38MPsA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210059
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 14:57:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20473
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261021145213.853962-1-r-sharma3

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:79
            Subject: [PATCH 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [PATCH 2/2] am62lxx-evm: Add DSI config fragments for display support
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:80
            Subject: [PATCH 2/2] am62lxx-evm: Add DSI config fragments for display support
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Wed, 21 Oct 2026 20:22:12 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 8e9e4fc93fb2e86165f97d122e44c3c3da62624f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: Revert "k3r5: Fix mc:k3r5:libgcc build error"
- Commit SHA: 03c17fcac2fac1f2b7f77663ffba8cee77f2de8e

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend:2
            TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@' initramfs-module-dmverity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''}"
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



