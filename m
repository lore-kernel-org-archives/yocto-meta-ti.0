Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330A7C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 18:55:39 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30942.1784660135763797841
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 11:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=p0lhlbOw;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=a38EWQlR;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66LH5sc93627227;
	Tue, 21 Jul 2026 13:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6AujqZGBDrKtiUxFnDtnM6Jfq+eLPJ1YYnWiuMy5T
	q4=; b=p0lhlbOwZLmlQEcy4IrwRNvl1SHF8AOO/ImqpLNL2mqGdHz+W2lKYOZEa
	3rvKMfE36KDRXGzvJpjsE4saqCVUNhI385lYmZN69B9VTgVTokJKEzmm+bdZsZPb
	rziwz6YaJlF8hhskdiiJqWPsOnYC7ruzgG6RLvmId0YQAdPJPOXhc9ip3p0ybOhr
	QkYms0y1anFHXJnFVPzwTRu2gQq4hP1gORLABWQaJCtNy50bBrXBM7sUo+IB4gzv
	x0Htn3HIMjWgunc5Ceb9fSEcIN6lHQ6OARO+540no6yBoLX2C/qIl9qrejQolTeK
	tq743HrIzZ9e/18i+F49FOof1QGSQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fj869jpcx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 13:55:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9F6f+F09BvMDraBJ7x3AEKzkRfh/bLNtpMKzXSEOd+elhqBT7E74K5PaS5n6L6dQ7g3xKPoNBVeyIQnpjUi8x6kYd8O1nRGyspYvVWUms89HGrDjEX36AglD3NhM7+jthJ93RgWjfq/1X+QRU3Gjqdt3DNHK+f8pD9YlhZhNugaRcpx10/r0q0gFgI+6SCDV8fw3W5uOEagYHOy7+KcaWZuv7CzU7unS0kRI7WmYwm9gaH00xoWNqatBSw5MBkk23RzYEt2v7ONl11//46Wgb33jNn5zG9y/hjfsqQViBkrB+Q4Bl8m0l4wVIrfEUvgKawwukAlmO+Owjy92Agq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AujqZGBDrKtiUxFnDtnM6Jfq+eLPJ1YYnWiuMy5Tq4=;
 b=Hx/wTuHSJb9iDaeeNcmJ8fVulkDoaF4v02drN+UrtKMUjDvAwW5lgVVs+/QwjvQC5c4sdMbsjGgeMC7x+yq1mLWYiNzFK2hJUPpe+5A2Hp7uhlK/bbd35XuHRfLVveaaSUXgzpWGT38LyLhgxK6pb6+eDC8Dkmbm8uPz2mVbktMvV8plyg7IMWhh7vrmOVCPJGzJ1pjXE+eDgopbFG7FhVAzH7Tug7a1f8wU9jNCUsrMimbbeINX/9vLTlOL7LNL/fsvb9dFWHfFoKVdpnnSVxwEtNKv2tzlNo0/ojQ60cWpXNjtr824IllA1ytEPUJEd6ZB0wbWaJ0GLY/KDinptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AujqZGBDrKtiUxFnDtnM6Jfq+eLPJ1YYnWiuMy5Tq4=;
 b=a38EWQlRxD0hoYL0dmNaWGdeHS5flOioyTKndl/y5httEPmwxLmWRFGdjw3YQPKCCqX63HhrY4W3CJ7ebQsTyMDDHYOcIb0CGhEdx+342J2QfVSEjjL4Zx/t4K9zULACA//jrJV/CH/emLJHKuemjjMDlnJgn3vN11ys8E2sVkBIT7nJdKAuVNmKuHT6H/+R41ZEwlFXaiC+x4PdP+QuDMhegdGdSOZn72yRSwjvWut2zEJUIARBpD4jxr3v5DMBQkDMq8wd0R5fu2n5lODToCK33Yr9lYuJGdXLNzhPMO2GaW6YHNDh/VR2+Nzt+oavt+cuOXuuRyStfwy8Ei5gJg==
Received: from MN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:52f::14)
 by DS4PR10MB997623.namprd10.prod.outlook.com (2603:10b6:8:318::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 18:55:31 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::6d) by MN0PR03CA0009.outlook.office365.com
 (2603:10b6:208:52f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 18:55:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 18:55:29 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:55:24 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:55:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 13:55:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LItOY42011441;
	Tue, 21 Jul 2026 13:55:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 223CA9ACF4; Tue, 21 Jul 2026 13:55:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 13:55:24 -0500
Message-ID: <20260721185524.3744807-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721185343.3006427-1-reatmon@ti.com>
References: <20260721185343.3006427-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|DS4PR10MB997623:EE_
X-MS-Office365-Filtering-Correlation-Id: fef36a91-bee8-4cbe-bd40-08dee759a27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	K0H9QPbW6T8Mu564JzVcGIYD7imRwZtvDwt7fEy+WkBnpwm2LltymG+vE5xt7SHX+Ndz3D3KDm/+GdA4/ICwkxadu236fMUlW2SYQ/U1XDRRfDgViXQJRGyC1iikSrZojhhkV78PVPMx3p59uCTBLLtbzjnMt+AV0rNCj592NMYVMofNfPpbnHevISnhtz0WhaPRO7TKM7QEG1bhBU7+6mYRYcOI7NgYt0EWtX4wr5NcG8D2fh0+iWH8uYLqfaJpNzHoi4r0pOf+uk1bRq8Llqo8y4PSMvN8iuxeAniSmwLHH/PiPfnke03D0c5SrYB4V7eMhw//M/WL4eikuay/987Nrxl5XhpI7yomHsbB5O7JXUMhUw3hMpLZyJ/riflKArEkJS1cq8P8ppQU6Xw1qTSiCmhk9KwvGEJ1vfNwIEtfSxDBdiBSx8Ix3ZBX5/wRnbT2m6UFbIuNu+dAU/4Zn5J6kJV+NqUneM4gVmX34MTrv/PsyZuJYcGWpDjlewhzrn570f8xT41ZfQep0eJ0oqSLTyxblHUnlCtJcx6qKorm947HZDbA35K0GL6QiJc6AbhWLbvN/93Z/cxNEd8n5jhaT//Q7D52+50vnqjG3C8wsHg6Vo05xAJvkcZiqtctY0Ea8sNXOnZFSH4ML1J5DWJOneuN/ZK0rAEmRlnmEvgz28BmP1nm5uQqvWu+dPZF3w22PVfvBPb3XiOIl4RTyQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VM/3kG45s0DrCjyaRAvFvdJ3J/gd95TEqspz957czHuvdMj0l1W6x6PwBIzmMJK9njYw5ORWRdtvgY+5QIpWNMvjFkLXGhv+ykvGeE1d1+UhkSu5PvgCoDhbBRNlv2vZySTLYWjuO4FJ8UJKo0ftIN7LGlwzazzQy3JwWGB9vWuvC/K1lOWsaX32ZMaQ+kWX7yIwcz6Sue5F8xp9iv0bOF3+qwvn17RbJm26T1BLYCCg84d1DYyagkaziNximrjH6gbiBLDhXYe9bAcvUQaVAdyQdqHCjWRUCkoFJLYZlGQ5I4CtAA4susa4IXQDzVKOcV3dtUjqA3R5t7WqAUEPx7UncG6SeZ8zu9+ioHejYYSEz8okMbguvguOMqVG2Mfd6aq+294cLiWdsRcaOOgI1reCrp36Z+cZXqnqgfAOlSr+qNNDUSfFlyfqfXEBx0SS
X-Exchange-RoutingPolicyChecked: 
	QbpL1kqN7dkuC2KFfI+qWIZxN2vaLvZ+nnNdMcwnItssiogXDz09iK/uDJVRXRn9s/jlnRHbLqDuM9MSCRCd+Z05KnBDvCe0cbvTqnsjw8+ciMJ98ZwP6D2BUKEnxo0fEQoYNG4h/z9RMEZdTiacZpOiLf/y6DDJX0ty2jBFl+cApRc/4HsMuIPxo9lB+Dy8Y6jynLZEBf/qJhJv+xGT9hgxzN92GyzS45DQv/Ms3g6jRaHQlM6hwvgxVR/Lk/2R291TUzF4UDJ4nfpnb/HbxpVBRYZYXm8ICvPvy+1kGm0nDYHRshY9A9CjNCT1XYiPWpg3F5CotlujvuKAWfvyEw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:55:29.6276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef36a91-bee8-4cbe-bd40-08dee759a27c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997623
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5OSBTYWx0ZWRfX+rX+tWRD3cAf
 tvtSKjFzTFxR9KTCQ9jAesu/c7ZZHDfecQKbgnwhik7BmaS4gp4eqfioWFCkzlnDjGKUk32yxda
 jqMzBONF1oJJztJY6Ztz7VOMJbOCmwB0fbwia3ZoT9VJP8Lakhp3ixcElGaQWQx7oFo2ZuW/XUq
 V2JdyISntesKhGJ9wxIEZ5IpRsOz4XY3/rZK6rZQm6Wm+QmQeg2jCHx2rgKOzw6yhFxJwvCCJLS
 ixGr3WO9LshOWWEtVnVjhIcF1UMo743Fs+g/HQWOm420nQJEA45orIFHDvyk+Fwxp1FWE8vaUBB
 MWk/TAZh+EH3M5qBzfmPRJ3UInaFrGcZgQaSMMgp4DlUboz/wgAFd4mM6klGk2NZGrp/pOJOpot
 seWueQC4YVXMY1uJ7DnkgO08QQXQMlBou4T4aV87zBTgAs1X6lkgrOBcHtt28Hv8K0zw1diywqb
 45wKjMY6nVuOAo09Enw==
X-Authority-Analysis: v=2.4 cv=WbI8rUhX c=1 sm=1 tr=0 ts=6a5fc0a6 cx=c_pps
 a=y6Y39UqQ09MdvbCyrKLMTw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=9N0LWyPMKQHeskBcyUYA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: mz5EHKYHC9cLXC38iyCZWaGieVkg4aoA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5OSBTYWx0ZWRfX9ot2YuQXZcm0
 ZMoHhABKdRfFiNXen9J6C5lgjrInKcpJHnDY9Y4Reu7DCwj96JCczCSLuWuuiVbMurq5NpOkft+
 9wY4mAkQRCxQCmtyT8bvimHRa5xPnxE=
X-Proofpoint-GUID: mz5EHKYHC9cLXC38iyCZWaGieVkg4aoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210199
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 18:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20178

meta-ti / na / 20260721185343.3006427-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] recipes: Convert to SPDX license strings
    WARN: Commit message does not include file/recipe name: recipes: Convert to SPDX license strings. (COMMIT-MESSAGE-2)
        patch
    
    ERROR: Missing License-Update for change in LICENSE. (LICENSE-UPDATE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




