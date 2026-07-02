Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAE0C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 14:46:35 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70824.1783003594108653747
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 07:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=VCF62yPA;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=U6iv8/pP;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 662E1QtQ2612341;
	Thu, 2 Jul 2026 09:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lS8ta0j4UhANUaUwz1lDp9qWsrQjWyO3IMRhCkBz3
	TE=; b=VCF62yPAvTg/BP5nx/Zzb+2cogzLuNQw9mA31QG3lSurzXRvJz+6eYn3P
	EDrI2iPXk3J/quaG9nv1J3SftGDtb7KGVZ3qiWj6rSleSzzqooCDJgabvtPLxFEb
	RaGwtmDIOHcQnLzBV72kWpmydrKA7yB3SnrG8vXn3Yv+cxDr9RvhWLMK/nUtHmcE
	cwjMG9lZWQrw6V5IAXTpJIa7VGwuMegLOP2FowChRi5HLZnIbebAIuPMVvN3xF0x
	lntSDsx7nL1B1QWpXjfjKu4e4aTr8/MM+G3RGi9iTf33GfcXy1VC+/2QZM7soevR
	5FpOrWCsWi80etSJj4xzTOP4fWy8A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn59vfr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 09:46:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzd6Wy1qvxumZ3po/1sg9M0m/ADr90arx2RzNmCMTfK3UD8Xo7vouIIzHmFkXec+665/NZmfcaLpFWeENhnfgqgoiyTR+gGMlQRjUqnPFqGpNWNeEYXyhAs+FUAshkJHBaZaIZcyN7qtd6c+81qs9znOM3yrVNJQhwdM+FugRwq1hJ1EHNeCxwBXaWJveRQv6n4YLmvj0CIMdvVRTetzxSNF1TNRUpeI94iGi52iuOcKxb14huGny9/kZ8JeJPOB5SWmce0oIcTGcVtQEdz9ITubb6taHQ3aARtm5nTv2v7jAlG1mXyqYUSnZ62ACgXEyE8i2NlPb1iMEysENsSdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lS8ta0j4UhANUaUwz1lDp9qWsrQjWyO3IMRhCkBz3TE=;
 b=xQNJLi5ZQEoft1Y63B0lvXOIBcySwe3Khv4/Te8hdi8iOWImVBud193ubCaM+1nC8ex7Xe3xJPyTCRCa3lEXOfJ1xPvyCvWPynNAem8i7NZg+XaHZNEH1V4QMup6VugQxUCJcqOCD8wQE30PXHV1jjUrZ1wWuT+zFT7/pwDWm+tWfr9WqKBHSkCgde0HXTDzATnMscQHLN2yrFzS3qvQ44FCD133mvQvzcBWHb9wL0LRacrbRc0ZmAk9SRi7fFVi5YN55vBjksXOrGSzk2CSrWT31oXIj+rw8PxAIxWTMKR4ATdolFz46m8nYK0WHXcS9e7jCNYU95wIjgBSPxq5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lS8ta0j4UhANUaUwz1lDp9qWsrQjWyO3IMRhCkBz3TE=;
 b=U6iv8/pPs0tqHwniPldFDw3aPVBZVk8NWV1b+ca49IQ3NDLvrQ60uE5/TTxd9ZdEag4tKxQxTTyyoPC1U88/whKD45ZnN4MtbAGVmZqp/mrWnbcxSqYSrNzv3EHgyzaBQ15iyaEI/hZE8y4LVaixETMp41oDX822a1NZMizTNSI=
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by SA1PR10MB6391.namprd10.prod.outlook.com (2603:10b6:806:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 2 Jul
 2026 14:46:26 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::7a) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Thu, 2
 Jul 2026 14:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 14:46:25 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 09:46:15 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 09:46:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 09:46:14 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 662EkEZC3617120;
	Thu, 2 Jul 2026 09:46:14 -0500
Message-ID: <10cf0192-0fcb-4b1c-b95d-9f75b10a7995@ti.com>
Date: Thu, 2 Jul 2026 09:46:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH 3/3] ti-rpmsg-char: Update to
 latest with CMake support
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260624183253.1130737-1-afd@ti.com>
 <20260624183253.1130737-3-afd@ti.com>
 <1bb8ce98-4c80-48db-9af3-e145bd328210@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1bb8ce98-4c80-48db-9af3-e145bd328210@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SA1PR10MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 0803fb3f-7d9b-4bd7-19f8-08ded848b111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|18002099003|22082099003|3023799007|4143699003|56012099006|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info: 
	XtXS033OcrVd0CVYr3yZExwnDCxnsUqaVD4xDu4GV+vPFexJ8eRW62iP7RihBKQ9koyeCQ5DkLG63y8QT0rj09mnc8kxQdn44eYVdTzrSoOkuCXLVjmkLOUcuvPCj13NuQyma66Yqzwb/z+Vjht9PAnwAulsQnQnI2r+knLNWxGzVM13HgpFVCVOpMMOH4EUoYxy3GWiCRZ9JazmTJh67gP8hteijLTQZmPAvEnWTuEsukk4vttl8lH6sQ5HQU6z0It9yaDph2m+CLv0BEz+Op7sDrMK3FJQWq7LmbmYlleJMk6e7go4erXEqIDKayeHPL9N3pDauOIhqbY4dD3ZFcOgdtn0/PJMpadmA2TGafGVHtBrskyVmL2OqXzvvJ5uGp4+m2qTg9NkUBWcpfr1VOE80it3TlsZH9+hQMp4hcxtCUPuRxg/2ZIyu8u7zWdnsgq8E8HGkpAMn0HTrjos2hVJaGeRrf9tODr/8G47pFGD3m2YNWYDatIGzHD/Idq3V7s+lV3O+nIPduf64YbdXvx6FyT63SJfI7NAkH3s8Y7ReVUTRs9lT81CpZPh29F2+GOMNXO6HuToNFQlXxEIB9BA785iBaEyDT+FcFUsCU2RzRq7Y7eq/N5y13G8qHNEmxhxKxC62tl4vHKY0B9uoDsIS6vhj+qsOklwywF1YRzEnDssPoX2gUoygq5FlU3jtQKdOj+Mt0YVE6vVHDduug==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(6133799003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	85lqDhWdhPYuVWg8SwG14uYSrcyXZg7fMkwfYABVv1dMCV/1qjGKmXv/Fvgo1GILHjdIQvRcQ0XEHL7MRAuxpxDzngb/n7cTDcQsBMLzJbeRFSAAWWJ9/akOuB3FUy6wLu0OlEy0g+WskMG+wU33R9e0TIFt7or++jvDp1gPMWLPJp7g2SUK5fDbOi8DQRZNdlqSiWoJ29EoMef5o37nT88DJ1d+wUeo8KD2tcgISDCixSfD7Ofafsc7nVZET5IZsrI7M/6k11DD4TTulrEAvVPpzRDUdZhtFNx8uxk2R3hPKxs16dk+r0WxO/YKAdd6YmjWzOJLtkcIv4T64DQ6Fc021Wx5ggdMe2DClhZpC3AwN9wVlxVYTZI6Juk79mhlDV4a3znJR1jcdTb7p0Gz0Z859J6ytKI8iDuSOdAD44nckg4ZANKoZFfnsOKPCG6k
X-Exchange-RoutingPolicyChecked: 
	BlxX2hwwFvahfT2wGitJy51UHIjuBbE4Hh16vwIuy7lDJgvjn/UhDf/xNuxOhS+uSGlMu0Gx7y1cyYgqwkKovDtEePqQLMe2Ui9iXT5JJ+M/+kDgs+xOAZehiyVrhAasgmFh6ss+73ceI0KiJsIhwVYxQUfx4CvP2vkuVaZxG3Y9h1c6zw8cJedPQy0LZfOL9dRfd2lesLfzJYFbYkY4Wt/p7mPdjbUsbfffwUGCDcR+m6iZR26ONeeH431WEMPm4+jhBYzN8CANiZy5My/D8xYEmUL7k+TSuuoxE9dKkrATsdd4vAWxcjh6Yvk7hpaf5eFzMVOxidU9Y+FcSPkBzg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:46:25.1821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0803fb3f-7d9b-4bd7-19f8-08ded848b111
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6391
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1NCBTYWx0ZWRfX0fYe5gCQjYr8
 K1BmEy+NaHhPrZWPllKG4M2sSxr1+R4h3ByJZNgrjulUaxEPouSqCfQEYNR+V3WTU4Fu8aAU0cH
 2Hu6nE9tO0nphqIVEFHrHCHfAC/QJTqUKy2ICKk21n6zx4OM+hWOEpg5ymVG9YLwvSoA7p20kKN
 AisgZhcQo1JtcE6mVjmFQr4TQludmWpq/qixZGpOaG7p2pswVgitYWl14VLHH75furC8ExQbv0j
 A/veGYjz9LXA7jYXNEDFBS6u0JGhUf1IlDJ1lRaJ0VMwxMp7YgpBrclpadIi8QdNyVsm4AFwTdw
 a4PrpeHFMYqNnTEkxinklCaNBGUawRs9XJLoBOB6EcuJTUGs2nfu9bNPlru3EJf4hl5OdAn1iPV
 3ahcb1hit07CXmG56tX4n9IC8ZrFhYhg+KdVi6XZo9w6GU6j0EHMhsijWuXvZWGUDhdqEHjfxLf
 zfio+JGMnNnglBD9/Bg==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a4679c8 cx=c_pps
 a=7JMGdgN8pDCDbqlksaqmUg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=aUPNp4hhF0HvbQfUWBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1NCBTYWx0ZWRfX79eMTLN8mv7o
 gQPYWU+8/cOMCDWR+1SiqaOFg9xfT5vMU5aDm5y2dA6v3oT3nsrhjHhWNA3EHiL7UIbgau/CouT
 ce0VrHyP7JfQZNzrSwE+fwPuFHZdvsQ=
X-Proofpoint-GUID: xTQP21Sca5nwz3on2sLHu5oHLauZLy1v
X-Proofpoint-ORIG-GUID: xTQP21Sca5nwz3on2sLHu5oHLauZLy1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020154
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 662E1QtQ2612341
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jul 2026 14:46:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20122

On 7/1/26 5:15 PM, Ryan Eatmon wrote:
>=20
> Did you do a test build with this?=C2=A0 I'm getting this error for all=
 k3 platforms that depend on ti-rpmsg-char-staticdev:
>=20
> Solver encountered 1 problem(s):
> Problem 1/1:
>  =C2=A0 - package packagegroup-arago-toolchain-tisdk-target-1.0-r14.7.a=
m62axx_evm requires packagegroup-arago-addons-sdk-target, but none of the=
 providers can be installed
>  =C2=A0 - conflicting requests
>  =C2=A0 - nothing provides ti-rpmsg-char-staticdev needed by packagegro=
up-arago-addons-sdk-target-1.0-r44.0.am62axx_evm
>=20
>=20
> Either we should remove the dependency or fix the new recipe.
>=20
>=20
> I'm going to keep patch #2 from this series, but #3 needs to either fix=
 the issue, or remove the dependency.
>=20

Let's go with removing that dependency, there are very few dependencies o=
n
-staticdev packages to begin with, so dropping one of the few remaining o=
nes
seems like the right direction here. Patch sent[0]. Once that is in meta-=
arago
it should be safe to take patch #3.

As for your question on build testing, the answer is yes and no. I try to
test build what I think are relevant packages, in this case `ti-rpmsg-cha=
r`
and some dependent packages (like `ti-librpmsg-dma`) to verify they still=
 work.
Lastly I will usually do a full image build, but rarely a full SDK build
(as I don't have a spare super-computer :D), and so in this case there wa=
s
a miss on my part. I realize now that this would have failed early in the
build so simply kicking off an SDK build can find these kinds of issues
(even if I don't have the time or compute power to run the whole build).

Andrew

[0] https://lists.yoctoproject.org/g/meta-arago/message/17579

>=20
> On 6/24/2026 1:32 PM, Andrew Davis wrote:
>> This project now uses CMake. This allows us to cleanup this recipe in =
3
>> ways:
>>
>> =C2=A0 - Remove patch for includedir and libdir as CMake handles this =
correctly
>> =C2=A0 - Combine in the in the examples recipe, CMake builds the examp=
les along
>> =C2=A0=C2=A0=C2=A0 with the library in one step.
>> =C2=A0 - As there is now only one recipe, merge the .inc into the one =
.bb file
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 ...-Remove-use-of-includedir-and-libdir.patch | 44 ------------=
-------
>> =C2=A0 .../ti-rpmsg-char-examples_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ------
>> =C2=A0 .../ti-rpmsg-char/ti-rpmsg-char.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 -------
>> =C2=A0 .../ti-rpmsg-char/ti-rpmsg-char_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 20 +++++++--
>> =C2=A0 4 files changed, 17 insertions(+), 75 deletions(-)
>> =C2=A0 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpms=
g-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
>> =C2=A0 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpms=
g-char-examples_git.bb
>> =C2=A0 delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpms=
g-char.inc
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-exampl=
es/0001-examples-Remove-use-of-includedir-and-libdir.patch b/meta-ti-bsp/=
recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-=
of-includedir-and-libdir.patch
>> deleted file mode 100644
>> index 3539e8d9..00000000
>> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001=
-examples-Remove-use-of-includedir-and-libdir.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 200=
1
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Sat, 24 Oct 2020 23:46:39 -0700
>> -Subject: [PATCH] examples: Remove use of includedir and libdir
>> -
>> -These point to standard include and library paths which already are u=
sed
>> -from sysroot relative paths secondly, they use absolute paths which
>> -means we are asking to add -I/usr/include which might be ok in a nati=
ve
>> -build but not in cross build. This helps mitigate QA errors found wit=
h
>> -OE build system since it finds it adding host include and library sea=
rch
>> -paths to linker/compiler commandline
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - examples/Makefile.am | 6 +-----
>> - 1 file changed, 1 insertion(+), 5 deletions(-)
>> -
>> -diff --git a/examples/Makefile.am b/examples/Makefile.am
>> -index da34204..34ac7a8 100644
>> ---- a/examples/Makefile.am
>> -+++ b/examples/Makefile.am
>> -@@ -1,6 +1,4 @@
>> --INCLUDE =3D -I${includedir}
>> --=20
>> --AM_CFLAGS =3D -Wall -g -O2 $(INCLUDE)
>> -+AM_CFLAGS =3D -Wall -g -O2
>> -
>> - bin_PROGRAMS =3D rpmsg_char_simple rpmsg_char_benchmark
>> -
>> -@@ -8,10 +6,8 @@ bin_PROGRAMS =3D rpmsg_char_simple rpmsg_char_benchm=
ark
>> - rpmsg_char_simple_SOURCES =3D rpmsg_char_simple.c
>> - rpmsg_char_simple_CPPFLAGS =3D $(AM_CFLAGS)
>> - rpmsg_char_simple_LDADD =3D -lpthread -lti_rpmsg_char
>> --rpmsg_char_simple_LDFLAGS =3D -L${libdir}
>> -
>> - # rpmsg_char_benchmark program
>> - rpmsg_char_benchmark_SOURCES =3D rpmsg_char_benchmark.c
>> - rpmsg_char_benchmark_CPPFLAGS =3D $(AM_CFLAGS)
>> - rpmsg_char_benchmark_LDADD =3D -lpthread -lti_rpmsg_char
>> --rpmsg_char_benchmark_LDFLAGS =3D -L${libdir}
>> ---
>> -2.29.1
>> -
>> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-exampl=
es_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_g=
it.bb
>> deleted file mode 100644
>> index cbe4d7fd..00000000
>> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.=
bb
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -SUMMARY =3D "TI RPMsg Char Sample Applications and Tests"
>> -
>> -require ti-rpmsg-char.inc
>> -
>> -SRC_URI +=3D "file://0001-examples-Remove-use-of-includedir-and-libdi=
r.patch"
>> -
>> -DEPENDS =3D "ti-rpmsg-char"
>> -
>> -inherit autotools pkgconfig
>> -
>> -EXTRA_OEMAKE =3D "-C ${B}/examples"
>> -
>> -PR =3D "r0"
>> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc b/=
meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
>> deleted file mode 100644
>> index f9fb0f25..00000000
>> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -SUMMARY =3D "TI RPMsg Char Utility Library"
>> -
>> -LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D "file://${S}/src/rpmsg_char.c;beginline=3D1;endl=
ine=3D31;md5=3D71987db43a2159cff5ea00505c6fce58"
>> -
>> -PROTOCOL =3D "https"
>> -BRANCH =3D "master"
>> -SRC_URI =3D "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=3D=
${PROTOCOL};branch=3D${BRANCH};"
>> -
>> -# 0.6.11 release
>> -SRCREV =3D "dd4783422bf4fbed1015bfaa51054e40057b4f04"
>> -
>> -PV =3D "0.6.11+git"
>> -
>> -COMPATIBLE_MACHINE =3D "^(k3)$"
>> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb=
 b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
>> index 50565300..a0043caf 100644
>> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
>> +++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
>> @@ -1,9 +1,23 @@
>> =C2=A0 SUMMARY =3D "TI RPMsg Char Utility Library"
>> -require ti-rpmsg-char.inc
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://${S}/src/rpmsg_char.c;beginline=3D1;endl=
ine=3D31;md5=3D71987db43a2159cff5ea00505c6fce58"
>> -inherit autotools pkgconfig
>> +PROTOCOL =3D "https"
>> +BRANCH =3D "master"
>> +SRC_URI =3D "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=3D=
${PROTOCOL};branch=3D${BRANCH};"
>> +# 0.6.11 release
>> +SRCREV =3D "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
>> +
>> +PV =3D "0.6.11+git"
>> =C2=A0 PR =3D "r0"
>> -DISABLE_STATIC =3D ""
>> +COMPATIBLE_MACHINE =3D "^(k3)$"
>> +
>> +inherit cmake
>> +
>> +PACKAGES =3D+ "${PN}-examples"
>> +FILES:${PN}-examples +=3D "${bindir}/rpmsg_char_simple"
>> +FILES:${PN}-examples +=3D "${bindir}/rpmsg_char_benchmark"
>> +RDEPENDS:${PN}-examples +=3D "${PN}"
>=20


