Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F692CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:43:49 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17275.1782333820314485625
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=quxPt/K+;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VbJRDQdG;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsMJ81271498;
	Wed, 24 Jun 2026 15:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+5kLcH78ddsRvjFqdDYoTSbuxMQLz/EivIZFUZX+B
	fw=; b=quxPt/K+tnETUZtCczf1arhNOOPz5rPGKf/c2c7mzsW71hGJm4swG4kZL
	vX8odTC2tLsvFO9/hlBrCtzHmJ1R75ngI95+MzHY/0hSRdAavGM9S6Si+SkgKTzt
	i6XtuWME3IAAprfDZiJz/jGEtcxIr3Qc7oVeC7uORg3N7/8tNMwRsGaWetBuIKbJ
	1EbZAfk1TEO7rI5t+lnLPDVglCUa3OqkYKs4CaemeN+W4Bm9lPBkvBUpoNABFDYs
	MuD616iji0RALUfkfP541ulwI1B5gR/e5XpmmR7iu1+o1SJj+i0CmXA3ySSSDvfX
	qxzRlxolCZghKi/YgmdQCVOIKUoSA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0e5m3j3h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:43:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY9QpElVHCCfwkdSEi3QLRIaDOWd+uj0PXafE50miEzwQnVb7jfGHDpaTiren7vPI+EQLzzFXzKmJlvP4kRar6Yo50ZS4gH+v43PqVYQd9QDE0cnFzTD6QdE33hlbUAmYRi1RH3OfqlBaMvXXBVSjC+kFsv79/DF8x2RN6WGyUyQairMm/ddixLmXJoAVmN3xa/cREffa5KH7729YLFGLoc0rq4bDwvmANCunE9H44WrOr2KrfjeN3VM5GO07PKcTboLISNt6Ci5LVlPSgz+feBLTc29vD4uBtgVhVtEihc2QD7D2i/PJ4M7+vsJ2SAKoNl/CdIJeXtITVQ81MCZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5kLcH78ddsRvjFqdDYoTSbuxMQLz/EivIZFUZX+Bfw=;
 b=MMcduTBXcCYWbWTuU4FBfO9Q320Zllq/xhN/m+BFSSE5I0UblbK0lQj9TVIMoKCMiBE/O4VyGs1gU+89ncR+Gcg5ZaLvqD6eBRSsGPtf9Iuv58ixj54MHVzL+uvJfDn/cq2S6a8ZF5S9zszXeososcKdVEVaCju0Qia8+oVBxRzyszoRYcTzW/eSnUmLOU+8rwK0ZVfzJ7L3bInpZlWD1K7STaGtK2Sd9aABkMoYhNWgSy2Qcr5mRm1gyqpBtrSM2UjYBONh58hDsfATSXlcfjyRrGA3XPhMVNVj3L2wmT4rmTWnrLjWE3rfoEtEBU2qE67mqvFGC4pnKAS3LunHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5kLcH78ddsRvjFqdDYoTSbuxMQLz/EivIZFUZX+Bfw=;
 b=VbJRDQdGJ/ic3H2ANCNEjtbKMGGT14WBYZ5TyyDN9GP6jfs/7LiPC95E8TEzjzYvt4tLSLq7SlNC06RPEgtNjCW54hTzItJpWZMmJ43E923MDsMw52TjkdPLs6A8zfsbbZXWsmdvGvc4BNWdTICd5NAbKiQXEe7Ieyf7iOKStno=
Received: from MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::33)
 by DM4PR10MB7528.namprd10.prod.outlook.com (2603:10b6:8:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:43:28 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::9c) by MW4P222CA0028.outlook.office365.com
 (2603:10b6:303:114::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Wed,
 24 Jun 2026 20:43:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 20:43:26 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:42:49 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:42:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 15:42:49 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OKgnM21209855;
	Wed, 24 Jun 2026 15:42:49 -0500
Message-ID: <6604c729-7bd3-45c6-bda8-da4a0d2e5195@ti.com>
Date: Wed, 24 Jun 2026 15:42:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v2 2/3] ipumm-fw: Use prebuilt
 firmware from ti-linux-firmware repo
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260624195533.1152173-1-afd@ti.com>
 <20260624195533.1152173-2-afd@ti.com>
 <596d414a-053c-418f-92f9-16db0a0889de@ti.com>
 <b382a8b3-b5c5-4a63-9c11-129137747d5d@ti.com>
 <20260624202915.GC10186@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260624202915.GC10186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|DM4PR10MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f412e1-b0a2-463e-4898-08ded2313dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|6133799003|13003099007|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	lJTg0vut+ADBvW719bfWjoaJzoX5xd4cs8cXnC23GCfW8X4D53H2E3q7ij6LdywuhJ8Ho8NKv3HlzHiX+O2KRAJEenJ2y8ut9N2Lf2EANQv6wgTgpRLHaxcoXUsD4hCFwDpXH0BG/eoY4vq0w2+U8Dw5Op0hR+ZGDBs/5lz+nFni+1k7yWa1PBC354+hPlWRXOnleG2e8VFW+aQtTgvzlTiSx8rrV9zX5J9ZSugxNrSyDFDHHvDONH2H6zzwNPc8sZ55lv29wn5lz4xcXmnuqxCZS7pjw5RQpok3hNqgMrknhm4a0Y/eGnRqy/zN8nQ++I8PrL8bCpNmPoRWDiQk31B16xIbt9GgRIkglncEvTSm8tZrXAIV2CnOkU8rJx9CTjM/TPriQGK8JmhJOkIsCfickqNXWgMsz+L+kEYbowCqBpQ/5g2bsmw/E0wWjd0CyWr2mAaMGVAHoY58LH238asYkgUnNXoqJRPS+XaPJhHYPL/fJESAuhJIwDBg73mXqIqXdacFcA7M1OGOb7SQ8Ksk66fgE6rga5Bc4CBzh+idLyPxpWe4jQV054qVjz8F/jOp8t9eWUXZu+7ReiMyhbPonWFs6miOmKlIzQjrwo2kxASn5JPRRaTQ3SMNc4VHcQKBUR19UxmfLFNkOSKX6w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(6133799003)(13003099007)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gZyv74bvz/rSAiQsypKdix/htl9Mu1ZSh0LGAViDCb2vXZzG6J5ppIuHJNyWtYqpyMJv/NdU5fOiNcPLb6gOHkDpfkwtIJksgq21lP2pwunJb6Cqt60abJpEqi6V1qAobpwJLPqZqKJHtKC2WfRIBvDibarhBC+CgF+iWTxOdlW8iKkp0i3qk5o1GS7PNsIP0eWG+mk8n13MCijuF0UbyeUbmpg59P9H+U8LoQUdbLuTB1yFqwgbrgPoC9f8iAUMLf0TfKKfCiPCvPolDmBYoynPsdM3lbxCoMokL3aimkU/w0ct+D8v2u/vccOsx/YkeT67OlEwfedCvXgV8n97OzQLq+C5Y/+p2Zw2uvgpgEGu9ndKhrmI2g5d9X5apRG15yeqVHwX4TXt0GlSRQRk7tpyKr14c2AtlBY0JzKkZ7r6BUYNZpqXAeaNsHrbxBwq
X-Exchange-RoutingPolicyChecked: 
	mM4pXVKGtRyvEtknhgIUxZLVLcovziX2gS+DldY+sfEG3ZJ4smK7I9tdBzL4nOXskvpwqTRIXlTWyE5C8GKSxgBJi8OG5SCE3Xskzi5QWRrfTtzunCIuZH6FjAIIDIuj4mjux2U+p8A3nfFvE623FE24dS9auhgxd4IK0oAiwdI0N765XMoGV37Cgc8LUVgEsVxodkmKZj9WeXgPP60S+X3Xf5r+iOQQsayFe15b0fCBjbeLqzpF5UBOY8jIWDT7jBTDWbcksLB+stYy0n+XjFAoaLrCEaV/z1mFkpcp/QwF2BoHhniYPENvWrqHcgKWc1VMhuiU5w5U5ub3n+J8OA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:43:26.2806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f412e1-b0a2-463e-4898-08ded2313dbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7528
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a3c4178 cx=c_pps
 a=PV4nF49JPTCcgS+SffkoNA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=i5g3KlelRSqt_XGToiYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: EwrwxzlLXO83WzKPN7CNSp2U1ZrykMbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfXwumCkToN8A1F
 u3EyxtWTtxaXJt+gBZaBTae7K9EjJ1RcLy1j9VAcSs3gC3tIRlxMW9il4cYGcDu+KJjJmy9L61P
 oGQzsjjGVgZyWeEvZJv/IxVWSGwN8292KrfxMiBtzLM6mzO2hjqbL9JgDEQQ3RvK6WGhOQU084T
 a6P3ysHsiw1I06KP24xFjhCuoVrcun1d5CDLyct+qcMS4b1eVyRzUsBYpWue5nBtnX8R18zsIUC
 yqXCKDpTdfhh6XIAFRauvmMRipDUNiiPhZ9uVxKpaVR9lGe7IWHmYJUi6f16mE8q9+bIZRMT7Dd
 Fk5B0h6i5S9N6QZv74Nx9AhDpog2elBzII+OteHIrODvO48MToLpzD+AszsVoAwhoqMii5C0t0+
 cd/9A6028BSlzbXtguBb71k1gDSosZtH06tVjbGD/2m83fmqGxelgPbt4EzfNJt+NZQ5o1C925M
 p6NgPr/QWW/ZQUxJpMA==
X-Proofpoint-ORIG-GUID: EwrwxzlLXO83WzKPN7CNSp2U1ZrykMbi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfX563AcScYa0Tl
 aG7fFckkneLitBqirs0L5ndfixIQr4OFHGEgXj7fp3q66qk/uukqQay6JhbRUzdn9n1UQN99LxD
 3vDM7V6UdKP+ZobMySwQRs82Cxcd/ik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240173
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 65OJsMJ81271498
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:43:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20083

On 6/24/26 3:29 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 24, 2026 at 03:19:33PM -0500, Andrew Davis via lists.yoctop=
roject.org wrote:
>> On 6/24/26 3:08 PM, Ryan Eatmon wrote:
>>>
>>> Missing License-Update: in the commit message.
>>>
>>> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.ht=
ml#license-updates
>>>
>>>
>>
>> Hmm, so in this case the license isn't changing, just moving location,=
 would something
>> like this work?:
>>
>> License-Update: License text moved from source manifest to standalone =
file
>=20
> Aren't they both standaline files? The old one is a pdf and the new one=
 is
> presumably text?
>=20

The old one included other information, in fact it probably wasn't even t=
he
right file to use for the LIC_FILES_CHKSUM, it should have been this file=
:

https://git.ti.com/cgit/ivimm/ipumm/plain/SRAS_3443-TSPA_Click_Wrap_Licen=
se.pdf

But that is an mistake someone made many years ago.. So what we are doing=
 here
is moving the LIC_FILES_CHKSUM from the source manifest (incorrect), to t=
he
standalone TI-TSPA license file.

Andrew

>=20
>> Andrew
>>
>>>
>>> On 6/24/2026 2:55 PM, Andrew Davis wrote:
>>>> Use a prebuilt version of this firmware from ti-linux-firmware. This
>>>> removes the need to build this locally.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>
>>>> Changes for v2:
>>>>  =C2=A0 - Fix s/suppor/support in SUMMARY while here
>>>>  =C2=A0 - Move PV definition to ti-linux-fw.inc like other prebuilt =
FWs
>>>>
>>>>  =C2=A0 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc=C2=A0=C2=A0 |=C2=
=A0 1 +
>>>>  =C2=A0 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 52 ++++---------------
>>>>  =C2=A0 2 files changed, 10 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/m=
eta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> index 126c46df..88992e60 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> @@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
>>>>  =C2=A0 TI_PKA_FW_VERSION =3D "2.1.0"
>>>>  =C2=A0 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
>>>>  =C2=A0 PCM6240_FW_VERSION =3D "1.0.0.0"
>>>> +IPUMM_FW_VERSION =3D "3.00.15.00"
>>>>  =C2=A0 TI_LINUX_FW_SRCREV ?=3D "ec029baad8b4b147af8331a5e099ef891e5=
ae1f4"
>>>>  =C2=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
>>>> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/m=
eta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>>>> index 246255e3..fbc6d956 100644
>>>> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>>>> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>>>> @@ -1,7 +1,7 @@
>>>> -SUMMARY =3D "Firmware for IPU to suppor Accelerated MM decode and e=
ncode"
>>>> -LICENSE =3D "TI-TSPA"
>>>> +SUMMARY =3D "Firmware for IPU to support Accelerated MM decode and =
encode"
>>>> -LIC_FILES_CHKSUM =3D "file://Texas_Instruments_ipumm_Manifest.pdf;m=
d5=3D5cc572579f07af266ab57fc17d762c7f"
>>>> +LICENSE =3D "TI-TSPA"
>>>> +LIC_FILES_CHKSUM =3D "file://LICENCE.ti-tspa;md5=3Da1b59cb7ba626b9d=
bbcbf00f3fbc438a"
>>>>  =C2=A0 COMPATIBLE_MACHINE =3D "am57xx"
>>>> @@ -9,59 +9,25 @@ inherit features_check
>>>>  =C2=A0 REQUIRED_MACHINE_FEATURES =3D "mmip"
>>>> -SRC_URI =3D "git://git.ti.com/git/ivimm/ipumm.git;protocol=3Dhttps;=
branch=3Dmaster"
>>>> -
>>>> -SRCREV =3D "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
>>>> -
>>>> -PV =3D "3.00.15.00"
>>>> -PR =3D "r7"
>>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> -require recipes-ti/includes/ti-paths.inc
>>>> +PV =3D "${IPUMM_FW_VERSION}"
>>>> +PR =3D "r8"
>>>>  =C2=A0 inherit update-alternatives
>>>> -DEPENDS =3D "ti-xdctools-native ti-sysbios ti-codec-engine ti-frame=
work-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
>>>> -
>>>> -export HWVERSION =3D "ES10"
>>>> -export BIOSTOOLSROOT =3D "${STAGING_DIR_TARGET}/usr/share/ti"
>>>> -
>>>> -export XDCVERSION =3D "ti-xdctools-tree"
>>>> -export BIOSVERSION =3D "ti-sysbios-tree"
>>>> -export IPCVERSION =3D "ti-ipc-tree"
>>>> -export CEVERSION =3D "ti-codec-engine-tree"
>>>> -export FCVERSION =3D "ti-framework-components-tree"
>>>> -export XDAISVERSION =3D "ti-xdais-tree"
>>>> -
>>>> -export TMS470CGTOOLPATH =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
>>>> -export IPCSRC =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
>>>> -
>>>> -EXTRA_OEMAKE +=3D "XDCDIST_TREE=3D${STAGING_DIR_NATIVE}/usr/share/t=
i/${XDCVERSION}"
>>>> -
>>>> -do_configure() {
>>>> -=C2=A0=C2=A0=C2=A0 oe_runmake unconfig
>>>> -=C2=A0=C2=A0=C2=A0 oe_runmake vayu_smp_config
>>>> -}
>>>> -
>>>> -do_compile() {
>>>> -=C2=A0=C2=A0=C2=A0 oe_runmake
>>>> -}
>>>> -
>>>>  =C2=A0 TARGET =3D "dra7-ipu2-fw.xem4"
>>>> -TARGET_MAP =3D "platform/ti/dce/baseimage/package/cfg/out/ipu/relea=
se/ipu.xem4.map"
>>>>  =C2=A0 do_install() {
>>>> -=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware
>>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${TARGET} ${D}${nonarch_bas=
e_libdir}/firmware/${TARGET}.${BPN}
>>>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch=
_base_libdir}/firmware/${TARGET}.map
>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/t=
i-ce-fw
>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/ti-ce-fw/${TARGET} ${D}${no=
narch_base_libdir}/firmware/ti-ce-fw/${TARGET}
>>>>  =C2=A0 }
>>>>  =C2=A0 ALTERNATIVE:${PN} =3D "dra7-ipu2-fw.xem4"
>>>>  =C2=A0 ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D "${nonarch_base=
_libdir}/firmware/${TARGET}"
>>>> -ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET}.${BPN}"
>>>> +ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/f=
irmware/ti-ce-fw/${TARGET}"
>>>>  =C2=A0 ALTERNATIVE_PRIORITY =3D "20"
>>>> -FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
>>>> -
>>>>  =C2=A0 # Disable the "buildpaths" check while we figure out how we =
are
>>>>  =C2=A0 # going to address this issue.
>>>>  =C2=A0 #
>>>
>>


