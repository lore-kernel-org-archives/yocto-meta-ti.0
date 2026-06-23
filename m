Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDB6CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 16:11:21 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25280.1782231076321883621
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 09:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=mc6pZgo+;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Ub6Ih0JZ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65NBWKEt4060602;
	Tue, 23 Jun 2026 11:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CgKw39gTr5h9LZA3HCmewnxQ3zi2mRQrFcUTH6VeP
	vk=; b=mc6pZgo+Wa3pB1DMdmrCMrr9E48LBw6IwoW6FmlqSEr/AO09QnghmDPHt
	FhBd0SVbXVEs7VIVD2NurSnk1e4L3OY24CeSl3Pm//qEzdWyU6RMS+56UThh9CWn
	duhie52U4+zle0nn7cEcqvMhRhmg38KxlK3Q3vgTGyfKAXJuq47GK75k7Z8EURZJ
	COGA0ChiWvzReogTV6dMpRGot8dkyk7afVtOsm8plIUKrHk+6k3YufsGZFhrXwkZ
	Ia3e7r2BFtQ411Y93q05f36xqu6ur2qFiLOILh2jT3q9OHebACMRoaXzq1Wfa2uA
	n/HQ3Y1p3XnDKBJ+5hd9nAccYHqiA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
	by m0384305.ppops.net (PPS) with ESMTPS id 4eypttahaj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 11:11:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/Jjl9PAPVMNtQCaN2gSBqByqKhVptUMEjibW1hGkN2HFMrhjH+fnkVVLsLasr0SYJ+LaqMuTET+qnvhBLuK9d8ZD0kO6vTJ2X9X5sAzEs1zTLgZG3/o1Fyy2rcIEjiacHP3Pe2cX/1ljSjrk7LvDCxKCZ+kB1feBZV2gWJJpNJqBveJgc8A2qNoVCKhnNhaJy41DGkq1d7qj+kylT1jD38+pxIiB7Ym1d0t/6UYo57cBfvzaV5GSsRb4Py0xbsMeyoUzoD+OcWtm0a+ctXyWV5CmBN/v0eSg1rJYuHjYKGKbtN9u5xwwQgPu3rTmyrH2deaEAWR4cg8MF9MUEsTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgKw39gTr5h9LZA3HCmewnxQ3zi2mRQrFcUTH6VePvk=;
 b=m/int71K0Y7Vu+lsJF7WsTq1WuLAYdk5dyDJSNI5l4AXUKjQcp43cDnQVMJFKUj92TqCXdMT45l7i48p/w5GxDYHE75sS0VrruFTKSVakfwwElqcSb3dGugn3BJOMjk1rNAxqiZAfEPkJlvcUBEuT4l+qrYB7szwiCw+6DwFgPViP9afgvoz/YXr9Cvx0jfBBuAVdSy5/CB1Qh70TebgSzbdedVC9tD7KconBkyPupW6/VGRFUXxzm/KplT/0TzNv8+xGr/MsT5/vtgx+5p8SA5+uPXzlaNWglLGF0QNScV6Irybyf7OF8sFO00NNyr6kVDXgFfMnU34iU+2VNbZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgKw39gTr5h9LZA3HCmewnxQ3zi2mRQrFcUTH6VePvk=;
 b=Ub6Ih0JZ5Lx/qlx2BTL1iBHphiTV9ymhvWGKDGzmXwALWyTz5bTajouXO1Fuq0ux8k8ofiSupu4hNGIYf6IxUWA5bc2FappQEZ5dLbmlu22WT2mQplHPc5sXAQPhsDBMdR0L40ichZBD86kmfN9PV443EpuFwt1z75xZ1J577K8=
Received: from BY5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:1e0::29)
 by IA1PR10MB6759.namprd10.prod.outlook.com (2603:10b6:208:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 16:11:08 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::26) by BY5PR03CA0019.outlook.office365.com
 (2603:10b6:a03:1e0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 23 Jun 2026 16:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 16:11:07 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 11:11:05 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 11:11:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 11:11:05 -0500
Received: from [10.249.65.70] ([10.249.65.70])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NGB5v63228021;
	Tue, 23 Jun 2026 11:11:05 -0500
Message-ID: <9408e916-cde1-4e31-bcb5-e3694dc8f7f7@ti.com>
Date: Tue, 23 Jun 2026 11:11:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v3 1/2] mesa-pvr: Add versioned
 mesa.inc copies from oe-core
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
CC: Andrew Davis <afd@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260623150317.1127756-1-a-christidis@ti.com>
 <20260623150317.1127756-2-a-christidis@ti.com>
 <275ad764-f9c8-48f5-81f6-2b8559810837@ti.com>
 <32b1097c-3662-471f-bd85-8a2c8ff9deeb@ti.com>
 <20260623155614.GA10186@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260623155614.GA10186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|IA1PR10MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 247a0854-f217-4607-8e45-08ded14208db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|12006099003|22082099003|20052099010|18002099003|3023799007|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	oHL7iJHssMOb/vI9UPf3lX+joRoCv0SntNf+tgmRx0HiWCZ2+FTgnRRNqM/WmxOdzdpmcQWuqV915EJ4ghdjgXYzSkgCXnu2zsnuoTMG3KwPqkdoN2KzGqsDFLTu1naEnbTORvYgEzpdbWIxCBVkqvkSbevQaA68vRwzi8knoH5O/llxlb+5Jnm0vL7l+jGpL6ZmX67tJDVJxz8UBJX7ezF7KR68nsPc8IFsHjQlVMSlgiuhGBjOD68i78zL78xmAr4E+nIlYpMbpzSmVMZaR0oXfTp/8dABqz9oNIupfA460EpoVq/vBvrOQTgVIAzYAhVn9MBI6ZjTufD8+tUwlluiZ8K0Ocqldrn5i+uWYOKzUAM29IqZy8aNdP5LamfrcOU17TTFYEsvA+Z3ocTEP0BwwMsWROr/X80x0WSziAelSOrDv2UWp/ougkiLgB3Axe86e4MQ37BEP3CvIR90UDvov1p8n2hGqM9DwSv0N5qmPIQP/PeMaLCn74QKZbvYYWoJ/7xoEzePUzdsrrhSciD8gKU7Ky3JEfMBrzw1pA+3BgJpFLyTJ8uxx/xbFnqKDEHXhq2mmkVmygCur77p9xkdQ/zJgHFOxrXFgopw59GHoy6Zelv1QcbdUqHJa78USTh+7P4i5qa0FXgcMi36KQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(12006099003)(22082099003)(20052099010)(18002099003)(3023799007)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ch/m5I2PbvXn8qO+RU3P7IhimqubvCqavxZOZ4xHonprcpcFZ8MhX2cr+5WptXaKyUVDGdd6HZ9+J4R2kzZW9irZKoJV+to+4EA7x1zAjyFfgH6oqkXVdWpFPcyzWZKQQr3FnjAqSzGr0/VsHsVJ+MZBN59VKo4bYAK+Wrp2NZ1oKGmwK5ys8TwHV5Ex3xzM2i9QADFmB7dyC/fYtRU4CKtbnQMo7gvTaZRcmOY6FSuWPkFOEEQK2/cI1j84MGeq9Lt5+z92xKY5DC+3rgjDAPaDpCYsejFnDsXyZP0sAiSVhL2LGVMzlMBTOPRQZfRqLLu0BnUClLHjbXGZdr1e6gMuiHQJD49+eNKNJE1Vqm+0G+ePgVR05QtGgKm+q3OqwvhthtF3jGwu7x55Ml3+RXL7Nq9OdVO2XFbutaxicwqShqLjXisHmoXBICMhQhZZ
X-Exchange-RoutingPolicyChecked: 
	fChKqzNO8miOb1AyiMgR3dEXydAWnsqYqfiLyrPp2d7my0OwrqN4EXRLXoXxPo+2qzlR7va3LljKKIA8N+hREV199diAFvFuVDidN2Tv1yHsmPmXicZ9LmyE0OBXeplQfpTQh2d72nPTFfn2tYrVRLxEOIhn891UUBhPmGbrGSPFaBhwFqXKYdYg5IuhAnXE+sEzTwJxgfIGm0uG4VGaxdng2UmuDwa5GzzXzq4le4XAGvBofBjLSWnv++Ye+1r8etB6BNbivGO1zVZIWCvcd/ccDq5PxZqUrmX5hlDteyo1cKLeAsQumDH810H8PCdcykFDK/bTgww0uNVW+kTmQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:11:07.8480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 247a0854-f217-4607-8e45-08ded14208db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6759
X-Proofpoint-GUID: 91Sb7oKN3Iise70luys6lPtwOIORGTRR
X-Proofpoint-ORIG-GUID: 91Sb7oKN3Iise70luys6lPtwOIORGTRR
X-Authority-Analysis: v=2.4 cv=EPo2FVZC c=1 sm=1 tr=0 ts=6a3ab01e cx=c_pps
 a=dFgZiZMTwE2p932uIRmjvg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=ZpVaWaFtAAAA:8
 a=e5mUnYsNAAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=_Yz9fUW0GvJ95xzU0OUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5tn4MO8azEBWFjlAA-rn:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMyBTYWx0ZWRfXzhku7XXtHosR
 Zrk69QkImPSuLxH9w/Hq9pO4RSyYkSC9F0VkiqYBR/UaK0DiWWXldycXf1XM+hWyZ4Hk3Afdl3i
 D8+0GGw2vyv9kdNupxijM6aghMGOFyk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMyBTYWx0ZWRfXw9F28sN7hlNY
 v5KLpiimdS6DL/tS7V2aMtnJZmCtQBEeejljR9SCZjkMfBLhkW83AXvfF+KPsVHNXm9IN7jmeCr
 DOAE4KwRZS2AnkeJDdAzWfa01t/D5TZSf44VawmBrNXFAj+/gMC+nQ4gMFuSZ9pqEA/03iDMyAC
 3RxwPmfABC1kGHb0634n5WkpvTzyXA/myGEqYOjXhIk7WT6urd+cyiJVBnSyZbJ91nJK0hmTsA3
 fn4qvoNZ892uhDYQZ2nSFNMnREjppidC7wJZO1v7+8lKhohJWNzgXQe/UVKgvP/KpN7+1+LWR+n
 R0tBoIKVIiNQprC72B8/KQLMwQWqbAGpQpPEUElK8XXidFiVj3uxwakKnDkm/qg96H1gNHBP2Sj
 fIoerAMFSNulpAS7DkYjj4Xac843SfWnElK5OZoa+ngurZ4B2N4IgLDuYPghbZEHgJdddts7MW7
 xERoz5h5kBtx93Ua8zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230133
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 65NBWKEt4060602
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 16:11:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20061



On 6/23/2026 10:56 AM, Denys Dmytriyenko wrote:
> On Tue, Jun 23, 2026 at 10:45:45AM -0500, Antonios Christidis via lists=
.yoctoproject.org wrote:
>>
>> On 6/23/26 10:43 AM, Andrew Davis wrote:
>>> On 6/23/26 10:03 AM, Antonios Christidis via
>>> lists.yoctoproject.org wrote:
>>>> From: Antonios Christidis <a-christidis@ti.com>
>>>>
>>>> Add local copies of mesa.inc from oe-core, renamed with version suff=
ixes
>>>> to avoid conflicts:
>>>>
>>>> - mesa-pvr-24.inc: verbatim copy for v24.0.1 (existing content, rena=
med)
>>>
>>> Why do this at all? You delete this file in the very next patch. And =
you
>>> also make additional modifications to mesa-pvr-25.inc in the next pat=
ch
>>> when you first make use of it. Why not just merge these two patches a=
nd
>>> skip all this in-the-middle state?
>>>
>>> Andrew
>>>
>> Denys wanted to track the copy and paste from oe-core on a
>> individual patch.
>>
>> Rather than my previous approach where everything was done in 1 patch.
>=20
> Recommendation was to copy v25 from OE-Core as is, before making any ch=
anges
> to it, so it's easy to review and track changes.
>=20
> Now, the patch rather makes it backwards, as v25 is copied from v24 wit=
h 50%
> similarity index, making this rather useless for the original purpose.
>=20
> Why do you mix v24 and v25 in the same patch, confusing git into making=
 wrong
> diff?
>=20
> And removing v24 in the next patch - shouldn't it stay for older BSPs?

Yes it should.


>=20
>>>> - mesa-pvr-25.inc: verbatim copy for v25.2.8 (new)
>>>>
>>>> The "-pvr" suffix follows the v24 naming convention. Major
>>>> version numbers
>>>> are appended to distinguish between the two.
>>>>
>>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>>> ---
>>>>  =C2=A0 .../mesa/{mesa-pvr.inc =3D> mesa-pvr-24.inc}=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 0
>>>>  =C2=A0 .../mesa/{mesa-pvr.inc =3D> mesa-pvr-25.inc}=C2=A0=C2=A0=C2=A0=
 | 353 +++++++++---------
>>>>  =C2=A0 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb=C2=A0 |=C2=A0=C2=
=A0 2 +-
>>>>  =C2=A0 3 files changed, 168 insertions(+), 187 deletions(-)
>>>>  =C2=A0 copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc =3D>
>>>> mesa-pvr-24.inc} (100%)
>>>>  =C2=A0 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc =3D>
>>>> mesa-pvr-25.inc} (50%)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>>>> b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
>>>> similarity index 100%
>>>> copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>>>> copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
>>>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>>>> b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>>>> similarity index 50%
>>>> rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>>>> rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>>>> index 5ce93d27..af674c83 100644
>>>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>>>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>>>> @@ -1,5 +1,4 @@
>>>> -# Copy of mesa.inc from OE-core before commit f9eb0468e45e
>>>> ("mesa: upgrade 24.0.7 -> 25.0.2")
>>>> -
>>>> +# Verbatim copy of mesa.inc file from commit 2c0c7c3e5b71
>>>>  =C2=A0 SUMMARY =3D "A free implementation of the OpenGL API"
>>>>  =C2=A0 DESCRIPTION =3D "Mesa is an open-source implementation of th=
e
>>>> OpenGL specification - \
>>>>  =C2=A0 a system for rendering interactive 3D graphics.=C2=A0 \
>>>> @@ -12,24 +11,22 @@ HOMEPAGE =3D "http://mesa3d.org"
>>>>  =C2=A0 BUGTRACKER =3D "https://bugs.freedesktop.org"
>>>>  =C2=A0 SECTION =3D "x11"
>>>>  =C2=A0 LICENSE =3D "MIT"
>>>> -LIC_FILES_CHKSUM =3D
>>>> "file://docs/license.rst;md5=3D63779ec98d78d823a9dc533a0735ef10"
>>>> +LIC_FILES_CHKSUM =3D
>>>> "file://docs/license.rst;md5=3Dffe678546d4337b732cfd12262e6af11"
>>>>  =C2=A0 =C2=A0 PE =3D "2"
>>>>  =C2=A0 =C2=A0 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.ta=
r.xz \
>>>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-drisw-fix-build-without-dri3.patch \
>>>> - file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
>>>> - file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>>>> - file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
>>>> - file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
>>>> + file://0001-freedreno-don-t-encode-build-path-into-binaries.patch =
\
>>>>  =C2=A0 "
>>>>  =C2=A0 -SRC_URI[sha256sum] =3D
>>>> "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
>>>> -PV =3D "24.0.7"
>>>> +SRC_URI[sha256sum] =3D
>>>> "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
>>>> +PV =3D "25.2.8"
>>>>  =C2=A0 =C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\=
d+)+)"
>>>>  =C2=A0 +S =3D "${UNPACKDIR}/mesa-${PV}"
>>>> +
>>>>  =C2=A0 #because we cannot rely on the fact that all apps will use p=
kgconfig,
>>>>  =C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>>>>  =C2=A0 do_install:append() {
>>>> @@ -38,25 +35,18 @@ do_install:append() {
>>>>  =C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'egl', =
'true',
>>>> 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e 's/^#elif defi=
ned(__unix__) &&
>>>> defined(EGL_NO_X11)$/#elif defined(__unix__) \&\&
>>>> defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG',
>>>> 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>>>>  =C2=A0=C2=A0=C2=A0 fi
>>>> +=C2=A0 # These are ICDs, apps are not supposed to link against them
>>>> +=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'true',
>>>> 'false', d)} ; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/libEGL_mesa.so $=
{D}${libdir}/libGLX_mesa.so
>>>> +=C2=A0 fi
>>>>  =C2=A0 }
>>>>  =C2=A0 -DEPENDS =3D "expat makedepend-native flex-native bison-nati=
ve
>>>> libxml2-native zlib chrpath-replacement-native
>>>> python3-mako-native gettext-native"
>>>> -DEPENDS:append:class-target =3D "
>>>> ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native',
>>>> '', d)}"
>>>> +DEPENDS =3D "expat makedepend-native flex-native bison-native
>>>> libxml2-native zlib chrpath-replacement-native
>>>> python3-mako-native gettext-native python3-pyyaml-native"
>>>>  =C2=A0 EXTRANATIVEPATH +=3D "chrpath-native"
>>>> -PROVIDES =3D " \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'opengl',
>>>> 'virtual/libgl', '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'glvnd',
>>>> 'virtual/libglx', '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'gles',
>>>> 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'vi=
rtual/egl',
>>>> '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'gbm',
>>>> 'virtual/libgbm', '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 virtual/mesa \
>>>> -=C2=A0=C2=A0=C2=A0 "
>>>>  =C2=A0 -inherit meson pkgconfig python3native gettext features_chec=
k
>>>> +inherit meson pkgconfig python3native gettext features_check rust
>>>>  =C2=A0 -BBCLASSEXTEND =3D "native nativesdk"
>>>> -
>>>> -ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
>>>> +ANY_OF_DISTRO_FEATURES =3D "opencl opengl vulkan"
>>>>  =C2=A0 =C2=A0 PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', =
'x11
>>>> wayland', d)}"
>>>>  =C2=A0 @@ -74,141 +64,141 @@ def check_buildtype(d):
>>>>  =C2=A0 MESON_BUILDTYPE =3D "${@check_buildtype(d)}"
>>>>  =C2=A0 =C2=A0 EXTRA_OEMESON =3D " \
>>>> -=C2=A0=C2=A0=C2=A0 -Dshared-glapi=3Denabled \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dglx-read-only-text=3Dtrue \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dplatforms=3D'${@",".join("${PLATFO=
RMS}".split())}' \
>>>>  =C2=A0 "
>>>>  =C2=A0 -EXTRA_OEMESON:append:class-target =3D "
>>>> ${@bb.utils.contains('PACKAGECONFIG', 'opencl',
>>>> '-Dintel-clc=3Dsystem', '', d)}"
>>>> -EXTRA_OEMESON:append:class-native =3D "
>>>> ${@bb.utils.contains('PACKAGECONFIG', 'opencl',
>>>> '-Dintel-clc=3Denabled', '', d)}"
>>>> -
>>>>  =C2=A0 def strip_comma(s):
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return s.strip(',')
>>>>  =C2=A0 -PACKAGECONFIG =3D " \
>>>> -=C2=A0=C2=A0=C2=A0 gallium \
>>>> -=C2=A0=C2=A0=C2=A0 video-codecs \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulka=
n wayland', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl'=
, 'opengl
>>>> egl gles gbm virgl', '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11 ope=
ngl',
>>>> 'dri3', '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vul=
kan',
>>>> 'dri3', '', d)} \
>>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan'=
, 'zink', '', d)} \
>>>> -"
>>>> +# skip all Rust dependencies if we are not building OpenCL"
>>>> +INHIBIT_DEFAULT_RUST_DEPS =3D
>>>> "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
>>>>  =C2=A0 -PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
>>>> +# "egl" requires "opengl"
>>>> +PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>>>>  =C2=A0 =C2=A0 # "gbm" requires "opengl"
>>>>  =C2=A0 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
>>>>  =C2=A0 -X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm
>>>> libxdamage libxfixes xrandr"
>>>> +# "gles" requires "opengl"
>>>> +PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,
>>>> -Dgles1=3Ddisabled -Dgles2=3Ddisabled"
>>>> +
>>>> +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, li=
bglvnd"
>>>> +
>>>> +PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
>>>> +
>>>> +# "opencl" also requires libclc and gallium-llvm to be present
>>>> in PKGCONFIG!
>>>> +# Be sure to enable them both for the target and for the native bui=
ld.
>>>> +PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue
>>>> -Dmesa-clc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse,
>>>> bindgen-cli-native clang"
>>>> +
>>>> +X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm
>>>> libxdamage libxfixes xrandr xorgproto libxshmfence"
>>>>  =C2=A0 # "x11" requires "opengl"
>>>>  =C2=A0 PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
>>>>  =C2=A0 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm
>>>> wayland-protocols"
>>>>  =C2=A0 -PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisable=
d,
>>>> xorgproto libxshmfence"
>>>> +# Entries for GPU vendors.
>>>> +# Some of the drivers might have extra dependencies (libclc,
>>>> gallium-llvm).
>>>> +# Check them in the individual driver settings in VULKAN_DRIVERS an=
d
>>>> +# GALLIUMDRIVERS.
>>>> +PACKAGECONFIG[amd] =3D ""
>>>> +PACKAGECONFIG[asahi] =3D ""
>>>> +PACKAGECONFIG[broadcom] =3D ""
>>>> +PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>>>> +PACKAGECONFIG[freedreno] =3D ""
>>>> +PACKAGECONFIG[imagination] =3D
>>>> "-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
>>>> +PACKAGECONFIG[intel] =3D ""
>>>> +PACKAGECONFIG[lima] =3D ""
>>>> +PACKAGECONFIG[nouveau] =3D ""
>>>> +PACKAGECONFIG[panfrost] =3D ""
>>>> +PACKAGECONFIG[svga] =3D ""
>>>> +PACKAGECONFIG[tegra] =3D ""
>>>> +PACKAGECONFIG[v3d] =3D ""
>>>> +PACKAGECONFIG[vc4] =3D ""
>>>> +PACKAGECONFIG[virgl] =3D ""
>>>> +PACKAGECONFIG[zink] =3D ""
>>>> +
>>>> +
>>>> +VULKAN_DRIVERS_SWRAST =3D ",swrast"
>>>> +# Crashes on x32
>>>> +VULKAN_DRIVERS_SWRAST:x86-x32 =3D ""
>>>>  =C2=A0 -# Vulkan drivers need dri3 enabled
>>>> -# amd could be enabled as well but requires gallium-llvm with
>>>> llvm >=3D 3.9
>>>> +# keep sorted by the driver name (rather than PKGCONFIG)
>>>>  =C2=A0 VULKAN_DRIVERS =3D ""
>>>> -VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
>>>> -VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
>>>> -# i686 is a 32 bit override for mesa-native
>>>> -VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
>>>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', ',freedreno', '', d)}"
>>>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'broadcom', ',broadcom', '', d)}"
>>>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'gallium-llvm', ',swrast', '', d)}"
>>>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'imagination', ',imagination-experimental', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd
>>>> gallium-llvm', ',amd', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi
>>>> libclc gallium-llvm', ',asahi', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'broadcom', ',broadcom', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', ',freedreno', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'imagination', ',imagination-experimental', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel
>>>> libclc gallium-llvm', ',intel', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
>>>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'panfrost libclc', ',panfrost', '', d)}"
>>>> +
>>>>  =C2=A0 PACKAGECONFIG[vulkan] =3D
>>>> "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_DRIVERS}')},
>>>> -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-headers"
>>>> +PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3D=
false"
>>>>  =C2=A0 =C2=A0 # mesa development and testing tools support, per dri=
ver
>>>> +
>>>> +# keep sorted by the driver name (rather than PKGCONFIG)
>>>>  =C2=A0 TOOLS =3D ""
>>>> -TOOLS_DEPS =3D ""
>>>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'etnaviv', ',etnaviv', '', d)}"
>>>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', ',freedreno', '', d)}"
>>>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',
>>>> ',lima', '', d)}"
>>>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'panfrost', ',panfrost', '', d)}"
>>>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'imagination', ',imagination', '', d)}"
>>>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi',
>>>> ',asahi', '', d)}"
>>>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
>>>> ',etnaviv', '', d)}"
>>>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',
>>>> ',freedreno', '', d)}"
>>>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination',
>>>> ',imagination', '', d)}"
>>>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',
>>>> ',lima', '', d)}"
>>>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost',
>>>> ',panfrost', '', d)}"
>>>>  =C2=A0 =C2=A0 # dependencies for tools.
>>>> -TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', ' ncurses libxml2 ', '', d)}"
>>>> +TOOLS_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', ' ncurses libxml2 ', '', d)}"
>>>>  =C2=A0 =C2=A0 # the fdperf tool requires libconfig (a part of meta-=
oe) so
>>>> it needs special
>>>>  =C2=A0 # treatment in addition to the usual 'freedreno tools'.
>>>>  =C2=A0 PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>>>>  =C2=A0 =C2=A0 PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('$=
{TOOLS}')},
>>>> -Dtools=3D'', ${TOOLS_DEPS}"
>>>> -
>>>> -PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
>>>> -PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd=
"
>>>> -
>>>> -# "gles" requires "opengl"
>>>> -PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,
>>>> -Dgles1=3Ddisabled -Dgles2=3Ddisabled"
>>>> -
>>>> -# "egl" requires "opengl"
>>>> -PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>>>> -
>>>> -# "opencl" requires libclc from meta-clang and spirv-tools from OE-=
Core
>>>> -OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', '-Dopencl-native=3Dtrue', '', d)}"
>>>> -PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd
>>>> -Dopencl-spirv=3Dtrue ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled
>>>> -Dopencl-spirv=3Dfalse,libclc spirv-tools python3-ply-native"
>>>> -
>>>> -PACKAGECONFIG[broadcom] =3D ""
>>>> -PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>>>> -PACKAGECONFIG[freedreno] =3D ""
>>>> -PACKAGECONFIG[kmsro] =3D ""
>>>> -PACKAGECONFIG[vc4] =3D ""
>>>> -PACKAGECONFIG[v3d] =3D ""
>>>> -PACKAGECONFIG[zink] =3D ""
>>>> -
>>>> -GALLIUMDRIVERS =3D "swrast"
>>>> -# gallium swrast was found to crash Xorg on startup in x32 qemu
>>>> -GALLIUMDRIVERS:x86-x32 =3D ""
>>>> -GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
>>>> -GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
>>>> -# i686 is a 32 bit override for mesa-native
>>>> -GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
>>>> -
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'etnaviv', ',etnaviv', '', d)}"
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', ',freedreno', '', d)}"
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'kmsro', ',kmsro', '', d)}"
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'vc4', ',vc4', '', d)}"
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'v3d', ',v3d', '', d)}"
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'zink', ',zink', '', d)}"
>>>> -
>>>> -# radeonsi requires LLVM
>>>> -GALLIUMDRIVERS_RADEONSI =3D
>>>> "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '',
>>>> d)}"
>>>> -GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
>>>> -GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
>>>> -GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
>>>> -# i686 is a 32 bit override for mesa-native
>>>> -GALLIUMDRIVERS_LLVM:append:i686 =3D ",svga"
>>>> -
>>>> -PACKAGECONFIG[r600] =3D ""
>>>> -PACKAGECONFIG[virgl] =3D ""
>>>> -
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'r600', ',r600', '', d)}"
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'virgl', ',virgl', '', d)}"
>>>> +PACKAGECONFIG[xmlconfig] =3D "-Dxmlconfig=3Denabled,
>>>> -Dxmlconfig=3Ddisabled, expat"
>>>> +
>>>> +GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
>>>> +GALLIUMDRIVERS_SOFTPIPE =3D ",softpipe"
>>>> +# gallium softpipe and llvmpipe was found to crash Xorg on
>>>> startup in x32 qemu
>>>> +GALLIUMDRIVERS_LLVMPIPE:x86-x32 =3D ""
>>>> +GALLIUMDRIVERS_SOFTPIPE:x86-x32 =3D ""
>>>> +
>>>> +# keep sorted by the driver name (rather than PKGCONFIG)
>>>> +GALLIUMDRIVERS =3D ""
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi
>>>> libclc gallium-llvm', ',asahi', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'intel', ',crocus', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'etnaviv', ',etnaviv', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'freedreno', ',freedreno', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'intel', ',i915', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel
>>>> libclc gallium-llvm', ',iris', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'lima', ',lima', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'nouveau gallium-llvm', ',nouveau', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'panfrost libclc', ',panfrost', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd
>>>> gallium-llvm', ',r300', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd',
>>>> ',r600', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd
>>>> gallium-llvm', ',radeonsi', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${GALLIUMDRIVERS_SOFTPIPE}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'svga
>>>> gallium-llvm', ',svga', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'tegra', ',tegra', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'virgl', ',virgl', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4',
>>>> ',vc4', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d',
>>>> ',v3d', '', d)}"
>>>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'zink', ',zink', '', d)}"
>>>>  =C2=A0 =C2=A0 PACKAGECONFIG[gallium] =3D
>>>> "-Dgallium-drivers=3D${@strip_comma('${GALLIUMDRIVERS}')},
>>>> -Dgallium-drivers=3D'', libdrm"
>>>>  =C2=A0 PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled
>>>> -Dshared-llvm=3Denabled, -Dllvm=3Ddisabled, llvm llvm-native
>>>> elfutils"
>>>> -PACKAGECONFIG[xa]=C2=A0 =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3D=
disabled"
>>>> -PACKAGECONFIG[va] =3D
>>>> "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,libva-initial"
>>>> -PACKAGECONFIG[vdpau] =3D
>>>> "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddisabled,libvdpau"
>>>> -
>>>> -PACKAGECONFIG[imagination] =3D
>>>> "-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
>>>> -
>>>> -PACKAGECONFIG[lima] =3D ""
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'lima', ',lima', '', d)}"
>>>>  =C2=A0 -PACKAGECONFIG[panfrost] =3D ""
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'panfrost', ',panfrost', '', d)}"
>>>> +MESA_CLC =3D "system"
>>>> +MESA_CLC:class-native =3D "enabled"
>>>> +INSTALL_MESA_CLC =3D "false"
>>>> +INSTALL_MESA_CLC:class-native =3D "true"
>>>> +MESA_NATIVE =3D "mesa-native"
>>>> +MESA_NATIVE:class-native =3D ""
>>>>  =C2=A0 -PACKAGECONFIG[tegra] =3D ""
>>>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
>>>> 'tegra', ',tegra,nouveau', '', d)}"
>>>> -
>>>> -PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3D=
false"
>>>> -
>>>> -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
>>>> +PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC}
>>>> -Dinstall-mesa-clc=3D${INSTALL_MESA_CLC}
>>>> -Dmesa-clc-bundle-headers=3Denabled,,libclc spirv-tools
>>>> spirv-llvm-translator ${MESA_NATIVE}"
>>>> +PACKAGECONFIG[va] =3D
>>>> "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,libva-initial"
>>>> +PACKAGECONFIG[vdpau] =3D
>>>> "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddisabled,libvdpau"
>>>>  =C2=A0 =C2=A0 PACKAGECONFIG[perfetto] =3D
>>>> "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libperfetto"
>>>>  =C2=A0 @@ -219,6 +209,8 @@ PACKAGECONFIG[lmsensors] =3D
>>>> "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabled,lmsensors"
>>>>  =C2=A0 VIDEO_CODECS ?=3D
>>>> "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial',
>>>> 'all', 'all_free', d)}"
>>>>  =C2=A0 PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CO=
DECS},
>>>> -Dvideo-codecs=3D''"
>>>>  =C2=A0 +PACKAGECONFIG[teflon] =3D "-Dteflon=3Dtrue, -Dteflon=3Dfals=
e"
>>>> +
>>>>  =C2=A0 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.=
g. -O2)
>>>>  =C2=A0 FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
>>>>  =C2=A0 @@ -237,75 +229,63 @@ RPROVIDES:libopencl-mesa +=3D "virtual=
-opencl-icd"
>>>>  =C2=A0 RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
>>>>  =C2=A0 RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
>>>>  =C2=A0 -RDEPENDS:libopencl-mesa +=3D
>>>> "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc
>>>> spirv-tools', '', d)}"
>>>> +RDEPENDS:libopencl-mesa +=3D
>>>> "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc', '',
>>>> d)}"
>>>>  =C2=A0 =C2=A0 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libosmesa libosmesa-dev \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libgallium \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 libgl-mesa libgl-mesa-dev \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 libglx-mesa libglx-mesa-dev \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 libglapi libglapi-dev \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 libgbm libgbm-dev \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 libgles1-mesa libgles1-mesa-dev \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 libgles2-mesa libgles2-mesa-dev \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libopencl-mesa libopencl-mesa-dev \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libxatracker libxatracker-dev \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libopencl-mesa \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libteflon \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mesa-megadriver mesa-vulkan-drivers \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mesa-vdpau-drivers mesa-tools \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "
>>>>  =C2=A0 -do_install:append () {
>>>> -=C2=A0=C2=A0=C2=A0 # Drivers never need libtool .la files
>>>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/dri/*.la
>>>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/egl/*.la
>>>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/gallium-pipe/*.la
>>>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/gbm/*.la
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 # libwayland-egl has been moved to wayland 1.15+
>>>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/libwayland-egl*
>>>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>>>> -}
>>>> -
>>>> -do_install:append:class-native () {
>>>> -=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'opencl=
', 'true',
>>>> 'false', d)}; then
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m0755 ${B}/src/=
intel/compiler/intel_clc ${D}${bindir}
>>>> -=C2=A0=C2=A0=C2=A0 fi
>>>> -}
>>>> -
>>>>  =C2=A0 # For the packages that make up the OpenGL interfaces, injec=
t
>>>> variables so that
>>>>  =C2=A0 # they don't get Debian-renamed (which would remove the -mes=
a
>>>> suffix), and
>>>>  =C2=A0 # RPROVIDEs/RCONFLICTs on the generic libgl name.
>>>>  =C2=A0 python __anonymous() {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig =3D (d.getVar('PACKAGECONF=
IG') or "").split()
>>>> +=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("MLPREFIX")
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suffix =3D ""
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "-native" in d.getVar("PN"):
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suffix =3D "=
-native"
>>>> -=C2=A0=C2=A0=C2=A0 for p in (("egl", "libegl", "libegl1"),
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("opengl", "libgl", "libgl1"),
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("glvnd", "libglx",),
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("gles", "libgles1", "libglesv1-cm1"),
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("gles", "libgles2", "libglesv2-2", "libgles3"),
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("opencl", "libopencl",)):
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not p[0] in pkgconfig=
:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
continue
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("M=
LPREFIX")
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fullp =3D mlprefix + p[1=
] + "-mesa" + suffix
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("M=
LPREFIX")
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs =3D " " + " ".join(=
mlprefix + x + suffix for x in p[1:])
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("DEBIAN_NOAUTON=
AME:" + fullp, "1")
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RREPLACES:"=
 + fullp, pkgs)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RPROVIDES:"=
 + fullp, pkgs)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RCONFLICTS:=
" + fullp, pkgs)
>>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 for p in ("libegl", "libgl", "libglx", "=
libgles1",
>>>> "libgles2", "libgles3", "libopencl"):
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fullp =3D mlprefix + p +=
 "-mesa" + suffix
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar(=
"RRECOMMENDS:" + fullp, "
>>>> ${MLPREFIX}mesa-megadriver" + suffix)
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # For -dev, the =
first element is both the Debian and
>>>> original name
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fullp =3D mlprefix + p[1=
] + "-mesa-dev" + suffix
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs =3D " " + mlprefix =
+ p[1] + "-dev" + suffix
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("DEBIAN_NOAUTON=
AME:" + fullp, "1")
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RREPLACES:"=
 + fullp, pkgs)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RPROVIDES:"=
 + fullp, pkgs)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RCONFLICTS:=
" + fullp, pkgs)
>>>> +=C2=A0=C2=A0=C2=A0 d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" =
%
>>>> (mlprefix, suffix), "1")
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if 'glvnd' in pkgconfig:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for p in ("libegl", "lib=
glx"):
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
fullp =3D mlprefix + p + "-mesa" + suffix
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
>>>> +=C2=A0=C2=A0=C2=A0 else:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for p in (("egl", "libeg=
l", "libegl1"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("opengl", "libgl", "libgl1"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("gles", "libgles1", "libglesv1-cm1"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("gles", "libgles2", "libglesv2-2", "li=
bgles3")):
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if not p[0] in pkgconfig:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
fullp =3D mlprefix + p[1] + "-mesa" + suffix
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVar("RREPLACES:" + fullp, pkgs)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVar("RPROVIDES:" + fullp, pkgs)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVar("RCONFLICTS:" + fullp, pkgs)
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# For -dev, the first element is both the Debian
>>>> and original name
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
fullp =3D mlprefix + p[1] + "-mesa-dev" + suffix
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
pkgs =3D " " + mlprefix + p[1] + "-dev" + suffix
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVar("RREPLACES:" + fullp, pkgs)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVar("RPROVIDES:" + fullp, pkgs)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d.appendVar("RCONFLICTS:" + fullp, pkgs)
>>>>  =C2=A0 }
>>>>  =C2=A0 =C2=A0 python mesa_populate_packages() {
>>>> @@ -327,9 +307,6 @@ python mesa_populate_packages() {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RPROVIDES:%s" % lib_name, =
pkg_name)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RCONFLICTS:%s" % lib_name,=
 pkg_name)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RREPLACES:%s" % lib_name, =
pkg_name)
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 pipe_drivers_root =3D os.path.join(d.getVar('lib=
dir'),
>>>> "gallium-pipe")
>>>> -=C2=A0=C2=A0=C2=A0 do_split_packages(d, pipe_drivers_root, r'^pipe_=
(.*)\.so$',
>>>> 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
>>>>  =C2=A0 }
>>>>  =C2=A0 =C2=A0 PACKAGESPLITFUNCS =3D+ "mesa_populate_packages"
>>>> @@ -341,34 +318,38 @@ FILES:mesa-megadriver =3D "${libdir}/dri/*
>>>> ${datadir}/drirc.d"
>>>>  =C2=A0 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so
>>>> ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
>>>>  =C2=A0 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>>>>  =C2=A0 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.*
>>>> ${datadir}/glvnd/egl_vendor.d"
>>>> -FILES:libgbm =3D "${libdir}/libgbm.so.*"
>>>> +FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
>>>> +FILES:libgallium =3D "${libdir}/libgallium-*.so"
>>>>  =C2=A0 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>>>>  =C2=A0 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>>>>  =C2=A0 FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
>>>>  =C2=A0 FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
>>>> -FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.*
>>>> ${libdir}/gallium-pipe/*.so
>>>> ${sysconfdir}/OpenCL/vendors/mesa.icd"
>>>> +FILES:libopencl-mesa =3D "${libdir}/lib*OpenCL.so*
>>>> ${sysconfdir}/OpenCL/vendors/*.icd"
>>>>  =C2=A0 FILES:libglapi =3D "${libdir}/libglapi.so.*"
>>>> -FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
>>>> -FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
>>>>  =C2=A0 -FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc
>>>> ${includedir}/vulkan ${libdir}/vdpau/*.so"
>>>> +FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc
>>>> ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan
>>>> ${libdir}/vdpau/*.so"
>>>>  =C2=A0 FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ${includedir}=
/EGL
>>>> ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
>>>> -FILES:libgbm-dev =3D "${libdir}/libgbm.*
>>>> ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
>>>> -FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL
>>>> ${libdir}/pkgconfig/gl.pc"
>>>> -FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
>>>> +FILES:libgbm-dev =3D "${libdir}/libgbm.*
>>>> ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h
>>>> ${includedir}/gbm_backend_abi.h"
>>>> +FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL/*.h
>>>> ${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
>>>>  =C2=A0 FILES:libglapi-dev =3D "${libdir}/libglapi.*"
>>>>  =C2=A0 FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.*
>>>> ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
>>>>  =C2=A0 FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.*
>>>> ${includedir}/GLES2 ${includedir}/GLES3
>>>> ${libdir}/pkgconfig/glesv2.pc"
>>>> -FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
>>>> -FILES:libosmesa-dev =3D "${libdir}/libOSMesa.*
>>>> ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
>>>> -FILES:libxatracker-dev =3D "${libdir}/libxatracker.so
>>>> ${libdir}/libxatracker.la \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${includedir}/xa_tracker.h
>>>> ${includedir}/xa_composite.h ${includedir}/xa_context.h \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${libdir}/pkgconfig/xatracker.pc"
>>>> +FILES:libteflon =3D "${libdir}/libteflon.so"
>>>>  =C2=A0 # catch all to get all the tools and data
>>>>  =C2=A0 FILES:${PN}-tools =3D "${bindir} ${datadir}"
>>>>  =C2=A0 ALLOW_EMPTY:${PN}-tools =3D "1"
>>>>  =C2=A0 +# All DRI drivers are symlinks to libdril_dri.so
>>>> +INSANE_SKIP:${PN}-megadriver +=3D "dev-so"
>>>> +
>>>> +# OpenCL ICDs package also ship correspondig .so files, there
>>>> is no -dev package
>>>> +INSANE_SKIP:libopencl-mesa +=3D "dev-so"
>>>> +
>>>>  =C2=A0 # Fix upgrade path from mesa to mesa-megadriver
>>>>  =C2=A0 RREPLACES:mesa-megadriver =3D "mesa"
>>>>  =C2=A0 RCONFLICTS:mesa-megadriver =3D "mesa"
>>>>  =C2=A0 RPROVIDES:mesa-megadriver =3D "mesa"
>>>> +
>>>> +# As of May 2025 it is known that LTO breaks Mesa, for example:
>>>> +# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34318
>>>> +LTO =3D ""
>>>> diff --git
>>>> a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>>>> b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>>>> index 8ec06800..2c20a538 100644
>>>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>>>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>>>> @@ -2,7 +2,7 @@
>>>>  =C2=A0 # upstream yet. This allows us to build the shims we need
>>>> without completely
>>>>  =C2=A0 # clobbering mesa.
>>>>  =C2=A0 -require recipes-graphics/mesa/mesa-pvr.inc
>>>> +require recipes-graphics/mesa/mesa-pvr-24.inc
>>>>  =C2=A0 =C2=A0 SUMMARY +=3D " (with PowerVR for TI parts)"
>>>>
>>>>
>>>>
>>>>
>>>>
>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

