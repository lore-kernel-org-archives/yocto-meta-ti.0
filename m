Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC78C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 21:13:03 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.464.1784322775796538563
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 14:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=M3nw/EAS;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NBYRL8k8;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66HK4ih61716717;
	Fri, 17 Jul 2026 16:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tU2ZIKxweWpA6Glw2oumRLJU/iDXkg3QpA+X2Cxvi
	BU=; b=M3nw/EAS2n1bxQoYHlfDljcBfJap+O9gJe7x+02rhHDCcqJCVEjX/Fj9G
	wDfYxZCmWLlMlA6DC8Bc17qgVEk877AWsh7nO7hELLRnUggR878w5olfgXAY26TP
	n04liQJU8FSn4lGA1V17xYcIB7+QB57uipvabolLAtDLCKUW6Athjg3tyKjhmqyg
	HTYzv9kDLp8RMimTuGkEHZJSp2HZDkqBFXF7LJlXDXWuysolhpk2NylT6sf9qAi4
	3J5wXdb4fHTqPG5k62gaMyczrWjZh2IQA6R2fuV7VT1B5/X1ocbc+TEYMw5nS8SZ
	WixKSptsE2sV5sgCtM56DWVgoLNyw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ffgsmc89c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 16:12:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLbFJXMIk4axtwh6gvhbl+lA3eiHAM3vMmL6j2wIzIklZ61Po/92ewUeMPbwjf6CnePQa9CAMApKXjoqIvC/HuMyJTlpq2UTxiSltUq8q+csbYLXviaQynd8dklPeIaF/tnjyzT9LOVQ2HZQbjdRt6NrOkzj7nm3EDsDH4shTMbhVFUHcR2EEBtHdW650qBxolbfJOO3pSRH32crrQfWtFpiW2IZ+DlrJ9QxGdTBllYbK9nEiibG3wjRn0uX+9BvNJa7irIA5SAjfTPjFpfQFZnw8OaJ7T5gvnNya7G2aW5HYzSzb+IiAXlPwF503MCkTS/3GVb2+dukI4pPJX3N5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU2ZIKxweWpA6Glw2oumRLJU/iDXkg3QpA+X2CxviBU=;
 b=opwInDzxtT0scZhOLqHXgeeVH7ZjXmQdH6c4g2gEWNOfGFtric2tQvg7bPj2m5nipwuYqMgJbdipLNkoXz5KArXYxzH9WgkBETLe4ivppV6/3h8XZ5ofmnsoJqxv9PfwYd9cFwYcMxZESPpPWYlkaDGBeKddyQJ7JRpuJpX/fYNB2rbJf8rVTq65ZE/KscpxL/n3hBjqNV4pmD9MZZh1x2vjHio/im3cK/PMDcHULJbqfmO6i3H1x3XDxOiIDdOwdSKqBfLWsbGSZeBCkFS0LnTp9SzYR6D3121aRdC+8rELBvIa1DPpwN+njiKfJyU5JvWO3qnAdI+q1UjTSy4eWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU2ZIKxweWpA6Glw2oumRLJU/iDXkg3QpA+X2CxviBU=;
 b=NBYRL8k8vRT3fM+k2ZTF7D8E76KO/nc47nglLxVSjehhkngEJ1lBbS/uMCB5u93OYadxUOcp4UCVu54xQf0/CKAMbAgq/v1zOaZyr32wjIr86CuvJgxsGqCEv5c557npg0jA4TUVcog3+Pqi0H/hg9OJxCFqP8ZL82pXgb2lTdsgIsCY5OTWTyKwryDKxfncvxiWmwrBtN9z6po74Pc4hLvcb2376ELXtH0lxIwiY+9HUFeOutLPIaqjSzb2nrtMu2d47ZaO34tMr5FDDfCmjuop6Rnn8RhOxk3uPblHK7gcuPg78LsHiza0XNAmDrXRWrX9BMlrF181Vl8YLiEprg==
Received: from BN0PR03CA0046.namprd03.prod.outlook.com (2603:10b6:408:e7::21)
 by MW4PR10MB5701.namprd10.prod.outlook.com (2603:10b6:303:18b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 21:12:50 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::64) by BN0PR03CA0046.outlook.office365.com
 (2603:10b6:408:e7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 21:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 21:12:48 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 16:12:48 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 16:12:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 16:12:48 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HLCmkY4064761;
	Fri, 17 Jul 2026 16:12:48 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0D70413F521; Fri, 17 Jul 2026 16:12:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.07
Date: Fri, 17 Jul 2026 16:12:48 -0500
Message-ID: <20260717211248.1868441-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260717205045.1916878-1-lcpdbld@list.ti.com>
References: <20260717205045.1916878-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|MW4PR10MB5701:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ee2ca5-06a1-49ad-1e79-08dee44827be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|13003099007|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cEKsqJVY8/cWaWSmrhyTI63IBgAFpkbm2gcXUdHip6BGNKfy5gZuHSzS3FNvDePhpsiGTOQsO8xDm02UgSOw39c6l9Z4g0z60ClEyn/4L0DcOcKxDUAqhT43YEPwNaVtfgqPGbFjx4eskxdeRyGn+8KpJWvp2wRt8WxCXL9C0qVLrejyrbtXfCh3DVaJ4cFwsyu02HUwJRWEsOQyXn0l2seEJ1CiQx20ivUPuzUcHhTCcQZU0FumObrAldcK2jOlCQVk/RxL9SF7qzTzzg7rxPCReVmliYKhi5HWLBADEUa0HfwqBjov5Z5WF20ksoz/qgSBmwCCBLWbP0yQeoNRfhNxPR+r/t3knVKfeGKOyVVVemUM5yIK5FpvWFCPpCJ/3p3M0gu1GrI6n/Nc3c9G+C88XfnaJ0dUcMvW3Y4LDMGegvlrNshbcV/R6/jwarIutc2dBKixJKCBrUFDfmYaNFt1f7e4Xj96AgX83p9alNIPRRW7TacXmYtOTCLvr06H2ZThJ6W0r84u043QRDKGA7b+L8nmq3IOhssiCWlU7/DjJVUrdidd7wdn/W6KoYJOnBMZhfMznBYW7Jh0Qa3F4TOb2eX7lAnMoBjele/1qApl0u4HmhJbpZEo2ddXHaOfprtxhpySjE1BHrm+PrG1lqjaqCe8pRnerhoKTty6USqXHJtZ/hJ0UrkCVpV8my88zKPy+HkRy52/Qnf7Kw5W3g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(13003099007)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sVQ3c1BQrEmiDYuF+A7YTXK01QXJtQU5gZq49E7D6WnOmaAQZt+aTuJkPfCL/PiLbHeVvKvN7hTWKvu3JuL0QoAJlrX/faNbhgiWFoVlu8/WcvgOT3q2Nz5n0dsae/sqjXPVSd+PsCK3e17s4mNpNuvrnqRhkthWOQRE6taNFujEzzQN794UftGBuchSRP9DcoE59UCldG41yr4K7XvNOBaW12/VaWx5FB7C9p52CYcd7fxd+iXBulhcNxmOsUNMWfBi2BtbH+V+p38Dy7e6zsqXoRhZ3h1eHi4ScmyAEoiG6GjyI9vmrgTtqyPoKAfYia9sEQx921sNf72ZCXtlP53J9J0kzRhHj1O9Kb37u6LZxpCwDfPd3wwiIUiS1Y27gLayOWf9u57vpSSKtgK1Glj5CKGXCUQoIYQPoxPfTcH585l2A7ZiJSqgEO92zLXA
X-Exchange-RoutingPolicyChecked: 
	JZNAeLBeeQeVsoBU7InkPTn+XFC1A/IljgAb2Q0b0W5/dMbDNLN/AWFRxE/kIrh44ApLOjErPYfmm60cU0HNqxbD4SsXqC4ITElK/K7/TRfOZ5nwblYNY1efK9ghmraEd9K34FnUzAXVwYvh+UpjqJV21WOZBc5D/aRgQKrQADGBqQDVqS50L0F0kNackpRrHhGSfH+FxztZ3zt7LakBxc+tSkbcRAlZszKMFs6laOygvht45PHXKMNbfiMpHNi+6id8MrohrNW28JmvsMZM3K/8hs1rQB/5iA0hLFq4zgzDGDX/+31OSX4psZkwNgayTaCKIyqOzAZzIMSzK9wQuQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 21:12:48.7632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ee2ca5-06a1-49ad-1e79-08dee44827be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5701
X-Proofpoint-GUID: Fp4eBIahbh5HR9xnT8dthFeLcidpYLGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxOCBTYWx0ZWRfX+plmuQZleOqH
 FrodPPm6UcjAU9kYkx3dwhlK1ZyFpPcq37+bdLeTNzj3MH4p1p0XH/PwgvvrmC+Zhr7XNPdkL9g
 zpv2RN9twTYWflSZpZocGJGHcdIuxXpZt1xsDx6JdUS9gjOlWLTcLUlxOGUU1//dwBetjwX4Amo
 lfe8j1vCEPxIP34wSFKMHd9VJqSYHNSv2lBtjD09NeD8Ms4BoetNDDD3p3AhVSXdXZFbBxmR6dt
 P44D2A+BDDHUsk7qoxftReTDklnlgZhm5pZHhNhFjywcM0upAkAmg2T2AvD9jDGiWCfSEsN4KML
 pU3jcao+HjHQvN5B2bqGdb+6QTMWR9vAzyWoJ93w1l+oV9OvCzXQrexxG4Jj8TB0XBDs9hcFlGs
 8sAmKJI+lzwpbzJhoZcI9H+EFGLksGGrFdUoGcaGbGPfJVERFe++wLX1P/9wyQmbyh40chATN0x
 jB/+f2UAY1ef7z75/BQ==
X-Authority-Analysis: v=2.4 cv=GJ841ONK c=1 sm=1 tr=0 ts=6a5a9ad6 cx=c_pps
 a=H5uqiIUNd+JXgmHrF8jMDA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: Fp4eBIahbh5HR9xnT8dthFeLcidpYLGm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxOCBTYWx0ZWRfX6wvpCFOAqtRX
 Cun/ssF5xelHKadFWzeGjvt19PBgQ6Shb+u07z1K7Q5HYY7jv30jgdQ2hdb6ehS0VEkEori7wc9
 8u92ktkgwj6u8zsdjrfu/n76GY+h1C0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170218
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 21:13:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20166

meta-ti / na / 20260717205045.1916878-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.07
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.07
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 17 Jul 2026 15:50:45 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f1c9ed0552560a9bf80da408d9d4cc79e7b786bb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 7f8fa3541f8d80865067315b4963ad711027c4ce

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




