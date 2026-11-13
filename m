Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.572.1794608338006934278
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 14:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=f4oLR94I;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vp7W21UW;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADLcTO02338139;
	Fri, 13 Nov 2026 16:18:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=riRsangxxb9+e4O2+ac9Y6iVzDVP16HlI8WunM+ej
	Wo=; b=f4oLR94I1OIjtAMVKSgrc+u54bZ9dxrPFwQliw+7zixh22d0SLAn42jy4
	zadC0lp5VZlhbPBU/EJtMMVUvpournovCENo6YTohfMELEPnCNwvr7vxr6kQXvVv
	UBBhK8JOUzgQZWqHoIpp3/FOgduCvFBvZAQ+qOybEVrFdboqQkuwmsvyqpqD2Co4
	AnzDdHMv2KFptcplemTl2eyJjNYw46+a/UGYpOkfOwNmIx0UnKf5m04lFYE+P4hP
	sUjYkg2GMRXn8OJh37wTVo2nD1xjGPCQA0nIrMVzYDWdPIcSrIl3YWdG7DTHWn0T
	FC5dW8nPH67b9yNPqqXHbfcRw44AQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hxamxr54n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 16:18:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEFuajzJy3TM5lU0Q5is9KPPrFkpqyCDDAWt5sj2nzfoO/DY5BK6+mZcjK5t1SRLZlyYIdTo+zLBlYrvXC1Cbiyj5fped6VMEmsRG06bpR4jc4FhFb7LEJ4/n3U0XVmu0DjTltEQVt6r/IH20553XzEnRkYl/j5gluWlSBZHKy5KPmQmFpHzuTmqQW8eEthAGDoUsm++1SvfZSBkhKhPhwayEeJhrPnz7doHMxTmVeOm7kLaLvEO4BPG9KMdAvKKfP3NKfd4wudjCLY3yLopuK19Lq5rZaJXRlfhR29lYNJ6RYz4ulkmxAgTgX0jKqRMzZ3KKcBqyjwcIa72r2qPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riRsangxxb9+e4O2+ac9Y6iVzDVP16HlI8WunM+ejWo=;
 b=Ti5Vx1tKPspbnYeOhnrNN5uFQ6y29uwUYe6mRUM2iheYq6uMEVtF3ZwGbkHOLxZDakKiycLNUJayFDiIxfTXfq1b4K30zXb+xRqXVvumAwViotMmek9X/LLNwmUy43Tm9D9HbtIeSfuarXs3/WW484atn5novmZag6A/sbujBKi27PAlDt+/OGagmUPdhD62r+lUhzLi4yvd20GpjPdQFyZ+F/jMV5EKe6Suzz2HblA1Qjjio9QMpmbReXclBQb6qolvFtDRi9MVW6SJYqzRddkwsqsYjfm7rrr1VURtJP7jyK1JGVsz8NO2ThAg79r28JsYQyR9HQ5I0SXQQRCFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riRsangxxb9+e4O2+ac9Y6iVzDVP16HlI8WunM+ejWo=;
 b=vp7W21UW9ibqqYDbFQLtoz4KRRJRHeyZyGWb03xSuQJ1ZXAE/QDNgHCUJ3F20Q62bq7UiGSnjyc50sECQfYsVHpkVA88+q8c4hBv6wOrICqOtzZqpV5Syub52+iVZTtoyhAtGXtONfYQv/FGYwMeoCB4cN+1LlUys8cx/yAamDoBFCr7Sfaqe8gpklwzPBaU0VEMJ2HaRyzMOaXDZu3q1paOY67nMvoeLft6gvRhcuZuQV/wD1aTvmp3Ekfpfd8KLLNCKZVoFkFiI1D0BBosAKIOkInEQlp4ZxsSOWr7ubBLzGnS4cUkNI14y+r1oOcOEph2rSnNVlOPTXtIDPe1oQ==
Received: from PH7P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::12)
 by DM6PR10MB4332.namprd10.prod.outlook.com (2603:10b6:5:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 22:18:51 +0000
Received: from MW3PEPF00001657.namprd21.prod.outlook.com
 (2603:10b6:510:32a:cafe::a9) by PH7P221CA0029.outlook.office365.com
 (2603:10b6:510:32a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 22:18:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW3PEPF00001657.mail.protection.outlook.com (10.167.249.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Fri, 13 Nov 2026 22:18:49 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 16:18:21 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 16:18:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 16:18:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADMILsS4056010;
	Fri, 13 Nov 2026 16:18:21 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9AECF9ACF4; Fri, 13 Nov 2026 16:18:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
Date: Fri, 13 Nov 2026 16:18:20 -0600
Message-ID: <20261113221820.2817888-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261113215739.4178373-1-denis@denix.org>
References: <20261113215739.4178373-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001657:EE_|DM6PR10MB4332:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7fda1f-66d2-4d42-c2c6-08df41d417ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|261022105027099003|261026140227099003|261028144727099003|261026135527099003|261009223027099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: K5vlO1GKUEyLUWYttiseQKBbD5kT7yxhzclXq6ktrvXgProJmVl0jyICLMrhcbmlbJaY1hAPIYhnhlRPRVqmaIe+bhQvxgkhsolCE/ZlngtrPJETqq7RDYRcQ69bKRzDEQpkdFmkYAIbYurWNb89XPBt7ZSPUS2yfIadJGtaDlqrLX5E6UDeziAA1PS0cN9w78Z3gUHGD5WGena0gQHF0tvLXp2hQXlfK71bDFAJbrFpiZh7vuBGJ7MFHOTBvi82wYVsjhHlBrvwHF0qsQ5GsUplcnWgHDXvMfDx0XnQjF1uAJwUFoz/oE9KydL0xssQQ24AxwGjdftww7rdpdUNcF1mqqBlU8gkTpO6Fon+/2GqYyNywDRQW01jHJQ03Gh2YtPlVdyljpiXoNqg0tkYUCgOxybyitKDZGr93zkE8rRNqViJ8uZvgXyq+hP6RxEbMp773DqNr+ZTxbmNUkAt1JPP1V/Qu2PEQHx3v8JkhG06puVGBHc8si4kUdEHHK2pUXxFjzVVVftZy+1jQG1Mp3MjqpT8rxCDUNcC5tB41NCaisakDFWXDdM/8tM49MgT8Jr9NNS7fMo/0qZrDrqUw1KJbEbLbn/xgV9AItgmva9g04DO1ieYS1CQT44kc63dIaZKDxP2ZTsVOS8/ol1B4w==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261026135527099003)(261009223027099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: izSxFkfZYNBaEUoV8odgtA52faXnvfpAPuJypzRCk3Pczd5jKANU+8ZDIS7rQzdIOskEjbddRYmaRPCPbBahdWQSXc8BL8B6hX4fU0zk6GeAQc8TWbvJFa9Rn8fd6SK6tr4mJ/KO1a6VAg2JFKj4JRS0rjjZiBgSJx4hsuX6ux5Jb2VtEIchWfawG3bfF2f17Tl705LOYktjb6lP3wl24renP3/kouVUWf2wK62Wex3UUUW6XenpftH/FzOYEYWn/OJA8USIBc2jjan06XJJNX/fgXHB4uJXyFOSWcRwSdeLopyBcT8sIFJGwNIUPDG2G2dVdGCUqRR5IT0izWOVs5evV6QVCr/lBYsoUlz3RY+AMamPlMxGtNruCGE8h0E7DQ5M+prBmJ8AQFqAzspwQ0lceSw86oIrZcDdG7/FJYGOYc/qYnTuf49BGtc5D3Qz
X-Exchange-RoutingPolicyChecked: xX2HZs1/7dekVQxfbH0veXxzzyQcwsD7Is2LOjxicLTh7C8YZxumFhqol1XRbeFCaykNTzmr/K1YgVZV2EU+ZyY7ZSkxhi47/fP41ZcGRL0ei2SM+L/m3ONk1rATvxshCy0BdhLvgLhll6Rsum873yZGwZJ3CDB6jv1kyMepq7GSSHGK2/B1++zatHqXj8nF/6rMFJIa3OM01apSIy0o4bBXVLia1/eCejMrFEPpBDaDS/CEUU0VDOa24W5kF07PvMEiltQ+gRWX6kJ69iIXwa9WbVWzioApKcpXEvzisP6kt9/h8O9M6W0QNWkhxV/RIrURohlIkccMipXmgaISkA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:18:49.8943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7fda1f-66d2-4d42-c2c6-08df41d417ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW3PEPF00001657.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4332
X-OriginatorOrg: list.ti.com
X-Proofpoint-GUID: xRFpajWZvpQXzBtIEVThNI_JAmwjjibF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4OCBTYWx0ZWRfXzfLdGkOWPs5v
 4ZmYrGgI5BNrwPPXJAAHseKfoO1tEaXsCm/Lq2rSsqzHdNHDf3K5v2Ho/yTmDqJgP46Zh3BKgs/
 DZIeSfd8M3C8yN5zm3YPN9GMfa3eW2A=
X-Proofpoint-ORIG-GUID: xRFpajWZvpQXzBtIEVThNI_JAmwjjibF
X-Authority-Analysis: v=2.4 cv=bPODs/+Z c=1 sm=1 tr=0 ts=6af78cce cx=c_pps
 a=+5nsKerQHvRPAoQt0ERV+A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8
 a=FRPX53SgWQVx-eYhwXMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4OCBTYWx0ZWRfX1YOnsgiQ/yg+
 LXxpu3g9cOO28DDBqy6TcQq8T/VYXsaXRH84LRkA6pfqnqDLFvsI3Rb/V4HK+PUnIPp3pCabdWg
 IrNQPPPb2IKG5cHjgARxQ/djStQ8JWu9J+DIc3hloJlUXeKHYT4eed+6hHR/JwEe/tP+M+p9DJs
 Np2nnODcN6+8KkCmNceLGDapkq4Vdj1SjLwrBXUH6MtVpyreEdgY3ZerCwVuJDG9ekNCCQjIk4a
 wBmXxZKE7GvIlhMLjr26yM9AA6vtujwc5xBbU6Z0VrhKBk+3OjXkEJhnsCMFGMAg1QpbRt3flbq
 iSpQcFyGcqqnVGP/3bLUA6Q08Oax+9RnGQwgfb66chOZFm+12yhk5vuXW9osb3hPUk+mwTKu3mk
 ZHn/Gm2xWFg1/iuRJ6MV+NhbM4SQtjynMYhyRWk3wFgy6xeBexsFhpNFRK//gtHwAhuTuYwK4JT
 e2VgvhppnG28JuVE1RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 22:19:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20547
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261113215739.4178373-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Fri, 13 Nov 2026 16:57:39 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3900d1cbbcc686acef53874ff398d306e1062355

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: ti-sci-fw: Allow empty SPDX deploy artifacts
- Commit SHA: b3e4f2c6efcc4cca09550f4dfa8d4b87ef5f98f8

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



