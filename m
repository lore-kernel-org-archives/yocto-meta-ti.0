Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6849BC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 15:31:43 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14229.1785252694254613890
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 08:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=GAdlg2P2;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=T+d0Pa6r;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66SEdmVr1511864;
	Tue, 28 Jul 2026 10:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7sxsEdrjAPj5Ptvb7lBGIROg8DaJtiYiAcSOcwx1b
	G0=; b=GAdlg2P2f7AgUm6HmeTHnPneGpKqxT62JGuFQipZXHFhmtavdFE4RhswE
	X7ACZblW+Ly5dj4O3CpOp/IYHuy+vW5AOZQ+Pko/uIJEyysJ+LHxfScBYQHCs7WE
	Za5LeZ7rEPziAEqEiOUm6XwcVZPSh0GvmeyS/+ehSYY84ce869iaRKG+xkOfwymq
	y+ZRlXKAySfwLLGvHLx1R8a/COmgKyhGltLBvIyQDe6Obha32Dl4MrLjzpCh1EL/
	iAj4iKptOcR919bOG0anQ1Km9vRNZLaTGerLoJDuOqX4lfWHY5ZUSw2UL20r30+C
	cN2uESy1s+U93hIY0DL0RvibEiPBg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fpsdk2byv-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 10:31:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr2XtCjgFU3SQSGxRkuHY7Pl8jgDhWqxdlp59CTY+IqqDEU0nDzrKK0FhLnfxlVDcrYL1Ak/X7RZa/QqSyl0qM2m8YyOJKcYOJtx6Y2x2m+w4cmCETNnEayj6GIVNu95m2U5xpFOUUH38itjyzJchwLtzgi7JZyrHfQE8k/tDnn8s35plqTvi8h4xQBZng4ISKJXTkspzWd/xah8dwTq7n9VnqTQV6J4KgsXEJOFG5o8HJBOKRdGwE+il/2j6QV3YauPWs9ApG/qIKwltZRiQziqQG+dXaUvoGlw4oLl8sJxmmrBwY6yu5nYOEKucbQekbjbMdG50apSlJiulHgUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sxsEdrjAPj5Ptvb7lBGIROg8DaJtiYiAcSOcwx1bG0=;
 b=fQCkfz4v7ZrLbOiXWr7yddkJJRuCOXz9B8AO+FtsMjcGEIASTQuXW3j8/pK20RxEhpjSYBy/HHZ1rtqkmvftK8vlFdaXHc8Jjx5iF22BEeWzfCVrKY/aBzPtVpWXQv6xkyFCpkUQ4GBh78GQ1uNiO0Dx9PnO/NGU38zW3KpjWT3hcbODdIo3OraAzB5XZLz//fctCMvuD9+pP5bwWeKvfIBOuljlUKUeLzhz8zXgZZ+NIHs9IpF5iFnLJkcqJWhdoAr+tITh3qjDuEImp+jOijjxOYGViZC+ehUWUUuNwP8hBvqCChU1CEC9+7cWzXfps2LPdW6XZ3KZSnllGPnJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sxsEdrjAPj5Ptvb7lBGIROg8DaJtiYiAcSOcwx1bG0=;
 b=T+d0Pa6riLguE9ohl53QjeqqV7R132PEZq58Mv+gYehiv9WDBGLxVIrJ032mgeF9T9ONEjUHyKuHPGOngtE5Gcjmd5ZMcy77WJWkIs1W+UgG/MhfxieJGcUSoIFHyU7ZrEWcysrIoOszwam5iJSrSrWuZdRDiDyTHh/NpcEN7NQ=
Received: from PH8PR02CA0013.namprd02.prod.outlook.com (2603:10b6:510:2d0::14)
 by MW4PR10MB6440.namprd10.prod.outlook.com (2603:10b6:303:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 15:31:23 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::47) by PH8PR02CA0013.outlook.office365.com
 (2603:10b6:510:2d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 15:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 15:31:20 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 10:31:19 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 10:31:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 10:31:19 -0500
Received: from [10.249.65.118] ([10.249.65.118])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SFVJJI2957371;
	Tue, 28 Jul 2026 10:31:19 -0500
Message-ID: <493fe05a-a15d-4995-991a-03ba9dc36fce@ti.com>
Date: Tue, 28 Jul 2026 10:31:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH 1/2]
 packagegroup-ti-core-initramfs: Move the inclusion of
 initramfs-module-netsetup
To: Denys Dmytriyenko <denis@denix.org>, <prc@list.ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260728141051.2851131-1-reatmon@ti.com>
 <20260728141608.3901647-1-prc@list.ti.com> <20260728143947.GB19759@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260728143947.GB19759@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|MW4PR10MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e489168-a4ec-4d8f-1251-08deecbd4604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|4143699003|10067099003|56012099006|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1PAD7oXROSVdmiO1l2Ch1U1EhCLiaz1SX+yUOT6lxJ3iQVinOaGJOuxm650GACZHoeajll+5/uTD4YA+grVUftWTWSgKu6wT5GTvQ3M+C2fD6Y6d7LTRVGhs6AYH1k0Lvb1RbRkgVA3TVRGY9bij7QE2yv5Gs6/Yw4978Ups1WxnBqaElEYllvWAH0utJoT6Vbrbxs12ciJV8YpagTbZfdiWW3J+RskRnJ75UeY1oUZqFiHNq71k6SNhK1pkxUFo82nq6fxPoWyAwI6QS1cQ3LP2kkoF9ovUpk3TCDCR/BhM7LAmoYIcUmSkCJG6X74xvMBf6F9aaPdbc4hyuAzwynBnHKJ+QZmAOtFGPPdRdFJ55m7tFc5V5h4TCigr/m2/UenfuBD2KAcYSwCG/9OKXJWeOFsoWdp7gVG751stcDwOOx0hZA4jAbVxZw/yqJ60qxF+XiSEJGRpi1R48yCtDvBMwJ+jW7LHvqQ1cxou4a0leeLWXJET1Mqvng8yYkz+A+TgB0E8s+E+/6FOha96l7sUNlIjA91DHjhmjIlqazMFaobIBv9A3mlNFcLQMTy4eqAjiiBd9L+NRKrTSbJQiCrTHPqWrXY27A9pIZKJT76l2Wq6yVB309lt7Q+dsXeuzOMHLbKN+2/uFlvaVQNydKcvxVm6iyRL7LLlhRreGJdbr9xa51t+sPsaBeB9N9jb0NvKUj4bgRyNkoL3WIvcvQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(4143699003)(10067099003)(56012099006)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SkDu4kK2eEafxaZ28XgD1P4ve50NV5ZPARFQWxwz5OLyAwaF83CKBViLJaBSY6RwUIlYEpIjmucQhMKGR065Lb/gskRpno8KIBF3Tf45gpGM7pFBWfDWSGPpKwsa2MYU6TFrTvZRa+2APZzveE0V4ZMIahCM4Jp8/yeNokfr1upH4cL9yKXYCyR758LvjsYcOpWNUta/sqynakn3/vh/UDU8rgQFoRsdA4cMqpGuyy98vUsXiqC5vGWLrq7g90Yc60dXgD80Ia+897pjweRYZOQ0eCDmgCgysMPUJOMH8UaEO+CAAvT+Mc4+7cqiGuXNujCoMkz3fOIsGuHFi3P1svkDfsNzQmDaheOu5LM0xm52Re7gFuIh0zMsYaNjSVWXhU/lP0qY918wpgrvfyHOUq7gwq8OX0ffQM6fTRzs53iveS2z8MOtIZ+SK+g8eFDw
X-Exchange-RoutingPolicyChecked: 
	TUlwhsoAPc2dWjsETrA1jMoTjMehMMP99ofqfrpCef7mTFaMGJyj+orpeAQfOiPumOP4mLLjUA33367I2pe6LC4HhPEQxUTT8lBrIbykp5Uh2U8sRd0OEub6nlpgP2ah/vucZ17/8ZEhD7Zdodf8wWcGFGDxAmX0++ZgdvHYXvROXJfeB1MRZzszjRQHJn/rN1Mt2Z+XeKMDo1xFHY+KLO7Fz9SCogbT0HEXGp1CGaSC2+A9fj2uq6mrQbO9ig6KvKJNvraLzI9/PfhHcOdTgzKld6N2W81ISx+gW7VxDLJ11Fe6oOf0n1eNavVGFKFJwlKWfRZTzW7VoogAJ4i1QQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:31:20.0138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e489168-a4ec-4d8f-1251-08deecbd4604
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6440
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEzOCBTYWx0ZWRfX4KWg5q2gBUbV
 CVkFjAD3G//fi9gTWlvzQGFnfREYh57hX7O8UuN906A44Vbm+5bwTJ/twMs3kI3qSkJ6m/7hMcP
 EkY1rk43mgzzTpObeb8AF8S8FOi17FA=
X-Authority-Analysis: v=2.4 cv=e9M2j6p/ c=1 sm=1 tr=0 ts=6a68cb50 cx=c_pps
 a=St7v3kIWLLX4ycmTPR678g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=MpZtCevIwDygXwIjbUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEzOCBTYWx0ZWRfX46dBKWDUmTKT
 QLDQwhy6rzJldjYozNYc4rQRi6UGFMtEE3Cgub+QP0OQa+u3WV400q732tR9qhRyQGpwZi0kda/
 piyvxjDBrH3e+5G59A4Dy6Pxw+KHinaihwl6K3FIF4Vi5nfCoM6fhsnuLz4GFoUhLId6jtfuO2M
 5Q5tlmZtSLkQs+Lxkc5hdmEjejDshLz+t9/q/MJxfzzRK7Qk6OLYaBagbcZle64aaQ+yKOOT2NF
 8usJaGKIHtrSKA+7U+24Cq1T/Y1eNK8NtJpyAo48ZIz5We+0lTxoF8Ie5/wBAd8bgjW7YGdimdI
 Qip+cM5E3qRTWZD/ZKLp1Tz6xiHX6v7Xa+dVROWGkGwDeB3gxUgSXtSE3ImoSP5eI4/qsV1eU2q
 +qJpDfVTIw7DDIXGNDlDN6551odCRYiUmqqc7Xm7GjsiyHxYB8xj3N0GhTHRBg2q7f8UP6Zt/ai
 0oXzknkWASJ1lsmjt0A==
X-Proofpoint-GUID: p4u-GwPluo0SzQrzb_1oqp5EoDlKmBX2
X-Proofpoint-ORIG-GUID: p4u-GwPluo0SzQrzb_1oqp5EoDlKmBX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280138
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 66SEdmVr1511864
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 15:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20201



On 7/28/2026 9:39 AM, Denys Dmytriyenko wrote:
> On Tue, Jul 28, 2026 at 09:16:08AM -0500, PRC Automation via lists.yoct=
oproject.org wrote:
>> meta-ti / na / 20260728141051.2851131-1-reatmon
>>
>> PRC Results: FAIL
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>    check-yocto-patches: FAIL
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> Patches
>> ----------------------------------------
>> FAIL - [meta-ti][master/wrynose][PATCH 1/2] packagegroup-ti-core-initr=
amfs:=C2=A0Move the inclusion of initramfs-module-netsetup
>>      ERROR: Commit message too long (> 80 chars): =3D?UTF-8?q?packageg=
roup-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D20inclus=
ion=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D. (COMMIT-ME=
SSAGE-1)
>=20
> Moreover, there's non-ASCII character right before "Move", hence UTF-8
> encoding - instead of a regular =3D20 whitespace, it's =3DC2=3DA0 which=
 is a
> non-breaking space.

Well.. that's just odd.  That's what git format-patch produced...  What=20
the heck...  And the actual string in git is 79 chars.  So this is all a=20
product of the email encoding.

>=20
>>          patch:90
>>              Subject: [meta-ti][master/wrynose][PATCH 1/2] =3D?UTF-8?q=
?packagegroup-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D=
20inclusion=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D
>>     =20
>>      WARN: Commit message does not include file/recipe name: =3D?UTF-8=
?q?packagegroup-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=
=3D20inclusion=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D.=
 (COMMIT-MESSAGE-2)
>>          patch
>>     =20
>>      For details on the above errors/warnings visit: https://lists.yoc=
toproject.org/g/meta-ti/wiki/40887

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

