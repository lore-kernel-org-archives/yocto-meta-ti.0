Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7042.1794394563432871049
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 02:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fz7ynqJx;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=JIwXcndA;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AB7Hsut941834;
	Wed, 11 Nov 2026 04:56:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uNoRJrv5YY3IUCS5d/reMEjN3hv2LXFhdAyrZzCvr
	q0=; b=fz7ynqJxSe7kL/XDLUWAdp7cMDcPC4c20uVp2WNwjso7b8mOOzp/9qZaX
	XjUl6Q2e8cqExkW0jLJp9CUw7mJHp082K1sJ8hC9MjscUGGI/1XbHJRtESXmzMV8
	DlXADb61/MvDuiyvGcHH88/wrj5GRL+Wie5UVgACygEcaSpiKYIRNKRD+vmmrOVy
	xSnmTgFuAJZwCLvfoC+1ZRW/i463WJH3ihokctSA55ZjEsvptvpEDhUNb7KU+Vca
	kANQzozDN6IObLbpPxlrfAdYFJ0lQWr22WSLHe148B+4mUO5BI9xTGeobjoL9DBM
	bdoGB9L9seuz1nrJJ/6g+hYgh/g5Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygthwa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:56:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeaNtzdm9QpxnZuNmGygpvNENGMMqQBcVFs/QLl8Dr6A++7mxKkNcb1eWJ5beOmH25m0T6xSct58PAMbUMp9xcn3mw90W/jtF7JIRHDecBTjlLy8CHfVjZQ+bxcuMhimmv3NCa4GfdQncJ09kzoNHzvjy/d7ujUvfL0HR67tifVsEVhV/cxK2AaucDOjhzwSZmjgM9rb6SYXWuodyRtt+/5k6LPved1YG5GiWjWbLUdPgCPJCVD7tTXu+cM74NB169WhieWTapaQPd/dCAF+zOzsL/dOYHg2HEjOnoUNiiWipKnjDT6FFx/OsA+WJsuYifXwzOzWGwdsJNNRXu2kIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNoRJrv5YY3IUCS5d/reMEjN3hv2LXFhdAyrZzCvrq0=;
 b=oxa5WY/mUCLXSV5ZlH0wlfAqpdIsoF0Sapio8BLtYdQ0yIPpEdhH3SU7zEvS6fX8mvrcFyt4DmIKtGh0SL6J7IihMrp1ElfblcdtpMUYFajQbGFkNEOQlRgJSmMl8valaZKX+U1BUydaMiq0uVWALBM8dvi07U9OXji8HbuX0pRNfw/OlYKNG4OXVkE+eM03nSwQwnOZqSK45tdZlzd0Q4BIaWhS/Avxdbuj6NdMOoW6ml8VjRHnZ33DcVT2tcUyJK3OO6VyPh4WcA3hAGUmhnCbNPie4S9IWIk8BkAMizsqsIIJHV/pEOBKL2fueaQe65wKpwkgotsUgQxKs+MfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNoRJrv5YY3IUCS5d/reMEjN3hv2LXFhdAyrZzCvrq0=;
 b=JIwXcndAC9CeLEtO0r+VCXYFfnzT9JyMZJ202faCV68z4AwDOnP0qgWrODriuXurzNiYQ6VleFszrBOTb7NqSeOB+q+HPa4Wd0gVRBITMNi8G0TnZPWWIaKwPwvsSvADYCLPWW1a5wtsgclQ8yySmk6tIHsZQpyFjNz8gMzhcaE+GlgfHI6InSsHEcJftrHaVtMxoJKx4f/df/ACujN+X8y+GdZJoux698V1HAjU641w4BCBrrLwStpQ+OtKIewuMfelGMvn+7CHQknQH5qH1dQdmZb1EOKedfsK8TQFFEyGU1NTOmTLTG0DMBdpkdCETz1buQYzlA4IPOKPVR+s9g==
Received: from MW4PR03CA0246.namprd03.prod.outlook.com (2603:10b6:303:b4::11)
 by SA1PR10MB5868.namprd10.prod.outlook.com (2603:10b6:806:231::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 10:55:56 +0000
Received: from SJ1PEPF000037B8.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::35) by MW4PR03CA0246.outlook.office365.com
 (2603:10b6:303:b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 10:55:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037B8.mail.protection.outlook.com (10.167.244.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 10:55:55 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:55:48 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:55:48 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 04:55:48 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABAtmJT3284977;
	Wed, 11 Nov 2026 04:55:48 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id B8BA02C8E; Wed, 11 Nov 2026 04:55:47 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [wrynose][PATCH v2] Revert "am62lxx-evm: Add DSI config fragments for display support"
Date: Wed, 11 Nov 2026 04:55:47 -0600
Message-ID: <20261111105547.2483336-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261111104927.3231132-1-r-sharma3@ti.com>
References: <20261111104927.3231132-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B8:EE_|SA1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 62777404-ec30-43cc-7855-08df3fe25c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|261009223027099003|10067099003|261028144727099003|261026140227099003|261022105027099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Rc9sWhbhdIhNkhVi/HQjncSsuPEnseUrRY6cweLTgeJHNy5PCULgbfPIj79fDWWh+Bo+M3bAcKsuoLs74PCVBQj/tYRkx6X6WnfdvjfKDJ2agwZ0L4Q2G94sn2pjNnWBsapXyh3CB7hNWtkSPnqiARi1Uu9TfKYC24QfqSBhvyFN4kIDQzARnmUjz5hx45VIwbyyv66/3RmgcWAH72SCYaGQ0QbRf8NseYslfXnN1QiY1VmAcXP4xg5znmC7UHqfnG9fpmZzBigaT4Q7slhknHryAxbJbbznDzCNm88NpAssyvimC5CjPO3eJpBLCbSPXLWpQfeR4WxfuVHy5by+2umZOS8J5RDK/Hgw+IqmGwwDwm6XjAWwutN6zAijYhToWskgwNtDethWT5CTzvmdHTAoHa0Ewv2LZdtn6tkXQ0mIZWceCq/QMix1viNC7QiOmvEWQrLtSsbIaynJ7MDkF9kWxAtZjdBdEiORXvMB9vjeZt0ctkUdNh5FpJGsHybjjYBjEUSLCqmvdINE3sUbY4goKn/gAAYfwcuVAfrD8B6Srpb/rSdboIF+vPdXmh3F5IcnQC/zpxKUTkZLmXxPs97bvbEr2BoNZ8Nee8mt0NnD1ptRRe9hciWrgXqkqFvOEf7ZyFwBylgau5SRzr9oaZTmRBSBW+VaDt3Y8BI5oSrvASJsUl4IIjOMnmOtidQIVfAX/xLHaARd2qyC0VpTfQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(261009223027099003)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +EMxxVTY2AMlmsbmRSRYrctcTCPZP268swk228dO5wLCC93w8MaAUFGnk2hruwzA1sSG4l1agbLsFw/OYCcqn06pKPZQ6k1KpmfAkOGNyJBjPfekTM5k297VKvnjtUObLa0G7zd6QiBsigcMRGZNQWJ29p5sP900CSY9afObPn/ogm2h7rEj9Y3j3htIlW+a8nVpu4qyvg6EFZbVoqku98uLyHvyYhGsPvYVnINiTMP/t+OmeMtEGXvA6v8bSFkpSDNp6DJnZC5zaxrfrS1sthaX0jucdgKPNaFuBy9kY12QsSbQGuv1NSDO/jXWKjk6HbvEXBLJ8Qr1aP26J0waX9eL53gm8I8PIJrXBN5Q+FExFdXxSoq3XSyiXdB+sCI6KJdjn9R6TkZBmoIBDmX+IqNJhIma0x9z9QLohIl60tBCKkWY79xwX5YUqimO9C84
X-Exchange-RoutingPolicyChecked: nR9ZzcZS3JtOsV68RAjs+B/oPFcCsstMw/Tn4cdla5xLsxXNBkc6WPZKtAGtcJtMMSPukwVU0Ts/krBd6UhmaAgraW7CtrFG07d+1f0gEqCK7BqyK+Pih9GWnY4xZXbC71ndzcYnB3GYdJ4iN/0ayptIkAhR00KAkzujHrTWk1Vq/2MrpC3EecVsxntgTcycVPXGO9w4WaHJvokGV3aPF17/jE+RhFcgpPRRc2n1uMFX310RGRAfMHTI4OSXb/HJfsruAiLcQWcuAKeCgd9noPJfRBieiImw7g39bXY9Mf6eFmSlZBndSd9S/3nzVQMAaOw4Qclcdsm98h4ZZOlL0w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:55:55.4029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62777404-ec30-43cc-7855-08df3fe25c67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5868
X-Proofpoint-GUID: EuhLmM3ngp9SHUkUffVLj9t4n2mREns5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX+bLdreOLIbbf
 iMgvqQx5vSMmlwQTucgoMVFmpdJlRJjmdeeDXvcZvGj4JFlcu40fLOcdXDNlIkoEcvmpelLP3GD
 g7qP4J14QmqoZz0yRakRuCoPypR4rkw=
X-Proofpoint-ORIG-GUID: EuhLmM3ngp9SHUkUffVLj9t4n2mREns5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX+fmEqYyXjCe+
 Bif0uL+r5ORr2dUf3vztc9bSX3Y2tvFUs6fKZ5LSFHhtP+PhMPWrm6RGe3spz+FSJ5xyOtEEIDn
 TrA4IEtqjyTvkVOmQT+hmwjJFvC+Kyj2KxkZ5U20S3XRRceJRykACwNXNJE28mAOcmy55IH9obb
 mZ4vrJi9QtlBi50oBcwfeiwdeHSagsOvxv17QLtJpv59uFctGvjyugRPYAbWq2qtiVLGLAyTm7X
 CuHUsHSn/wbn5L6NhO4EzqoJzjI7PBp6F3LGZ3QLcNL312nBxGl90bgtNVflK7HXch2Q3vPA4sv
 XEOzoVuQ3zK3p7YmIr5yVozSPzi1dygBFFPvHNhpXdVfzXD7x4e8zoL2dF6Xx3C+EIE92mNaCD1
 Y2H0JYKAY4fbQUl9sktcGt1nOFQ8r0uFVJ7M57SXjd/FileWkGesRwh51+B0mbciv4ufEqZSxCF
 0gAt9FGaVi1OvrNoCTw==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af449c1 cx=c_pps
 a=VrK8WKSpsKTEY/+VWLGgkA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=9vpPvfGotGxCy51145oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 10:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20521
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261111104927.3231132-1-r-sharma3

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
wrynose
=====================
Summary:
- Patch Series: [wrynose][PATCH v2] Revert "am62lxx-evm: Add DSI config fragments for display support"
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Wed, 11 Nov 2026 16:19:27 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fd0c24edabebdf8a06c7aa6b581130f818017cad

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Rahul Sharma <r-sharma3@ti.com>
- Commit Subject: am62lxx-evm: Add DSI config fragments for display support
- Commit SHA: ce7e8077fa980d8e634db3340f6f9e8d81a12123

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed



