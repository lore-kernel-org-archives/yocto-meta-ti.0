Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B6CC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 13:52:42 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9416.1787061155971082972
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 06:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=UUwTGXzN;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=D8OmXcmc;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDk23O3663676;
	Tue, 18 Aug 2026 08:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=umvmo38bZW0UeN3T9nu3ZDHNR2G/JjZ1eN2mhoGZ/
	nM=; b=UUwTGXzNnCGSvj5u2eqmV72r347wsX98EjAd45Kx9pSawBKysUXeVbr1w
	zWHtWxqk+K11cADD2PHdyN9S1e9OaBlhaEpqvOJzZvlDrA5XDB3Ha7JlbdKPprRX
	fSLRydgAP23FI0v1KWN7qLNbj3eaghhZvJrBbzwGw9x/8cQeVNOYeW2DodwN2jwK
	DxSZkr6FjGWIYpxg6IxggL79DR3NkcJ+XEe0Zp7ZMgaS7M3IiS4cVkk+e4ss/BgF
	a1FqQWspa5sQBdQCDta61Wk2vNLA8mf4kpeIGxi34UwIiMPUEphG4n2ago9CQQIP
	pmRFYqChiWxSl2cixtso/uDDQ/btQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g4mpk17eg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:52:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcSmPn8JvbepJjbe8sIuY7pUsXxFTALrSM42kpw36O73ztCgj/SHdx2GsCj7BoT++plmNsKzsbyMbxAh5GGbWRKpT+vPHkfudvMHGM3YJAlhm1w+ZsweTuiEjpztjbVGKyH88yzMaDwaFQx+TP1XGfsgmUnhl7/voSzssLT7vdKQ0tJw5mJSkotxHEEWAUJay18CiuXHSY0ARGmbVstzrMtSrwGp620q9HtjoZBWA1jIKWvbu9QHtQx2CkIeFppqo1X8vgaPhz6YAgrq7SK79Tq8c3B3RODE1Je+lQQ20ava+SbWBnT21caMBuiBGIHI1UMqh5wuXdiNoSWpaMaWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umvmo38bZW0UeN3T9nu3ZDHNR2G/JjZ1eN2mhoGZ/nM=;
 b=AcwxIkEoZUx/fZp+ky6Sx+YP15SDMt/8yCiVYfgPk0rrsFFjh/lyduL0345WiNI1/57n/Ey+dM3Yf3hPVOTZdQGMYfga1a2tZko98EwGCnTuoonU4vaB89oZ4XcIiopJ67p1S+2jZl3BRyrEfqfZPm5SZW8cLB/9QvFhlzoB7A/7sDWCKAkB5Emi2weJ7lDWyuGF/PiBOcz3ma3EG48AyQwPAUUWTUv/erUU49iStPY2sJTdaQ+92hU+aS4YESxXUP4rDTFrRfIXAzi2S4A80cE2O9lNBQHa3hZ97EdnbbhrH9NDXmCGySU1SZtoHnBEay1fwOQOXy4Yf2tf3hp3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umvmo38bZW0UeN3T9nu3ZDHNR2G/JjZ1eN2mhoGZ/nM=;
 b=D8OmXcmchPRIASYhcQAdRMXGzX5IhXxQ7iOaZfHnJfzodXrlB+advcdnap31ahFBZ7yejiXsPrOSi44Giec5oq7rVQFdLREMY6RcL4uwcDkFat//6LiaDcOwh+ucbkKIZebpuULx26/qD6fkOXbuUrys5bsdcplxloP8ZNLVM2w=
Received: from SJ0PR13CA0195.namprd13.prod.outlook.com (2603:10b6:a03:2c3::20)
 by SJ2PR10MB7706.namprd10.prod.outlook.com (2603:10b6:a03:56f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 13:52:30 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::a) by SJ0PR13CA0195.outlook.office365.com
 (2603:10b6:a03:2c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 13:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 13:52:29 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 08:51:56 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 08:51:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 08:51:56 -0500
Received: from [10.249.32.188] ([10.249.32.188])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67IDpuwF1536517;
	Tue, 18 Aug 2026 08:51:56 -0500
Message-ID: <0fcd2867-b282-48b9-a6f3-f7b264826380@ti.com>
Date: Tue, 18 Aug 2026 08:51:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/wrynose][PATCH] ti-rpmsg-char: Bump up SRCREV
 to tip
To: Hari Prasath G E <gehariprasath@ti.com>, <b-padhi@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <afd@ti.com>
References: <20260814080612.982165-1-b-padhi@ti.com>
 <1316e659-0bff-4569-a867-ee43b16423d8@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1316e659-0bff-4569-a867-ee43b16423d8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|SJ2PR10MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 46023fa9-1426-44cc-9ece-08defd2ff1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|4022899009|3023799007|18002099003|22082099003|56012099006|4143699003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ekYueAksQjaO7VBZK/T0bSxc7IFkwyKbN0AFQ0s28cipvUsa+bqNfqMFSbhMUZeHrWakQolmRC2pNfJYoytqBcVW2ULvfCmbgLcjzCeyGg+g24H/BkVMsG3uuODIL83UrN9dncoY7byCC6BFa9En91jWcs9G1GY6BIR2vBBQL4HJlKIkzubFMtC+IqSpikzL/1yroouavZ14LY3LJ5FMwZJHXMlKwPQmo6FGXMnmdNDFI2ZG9bvnhMPJP/80q8v3FrP3UEy1PWQ5hzS60IVvy5L4TK8qehD++KiXBLtC5Hn5lJHPOKuP+MRBVY3KPvBl4cRbnZQrYAnSIF/P51cCmJsesCBwp30fNovUcdSxxm2Ec80Ti6jQ2jAXt/yXrevnCRxBeVIg6Klo3k6ItZFePb9D3mIU2+tyJaHZBrMSCgD0v/4J5+e0w2ky35TIZItfNdhdxIF9R/n49Dqo+3CgHCKV+ELCJtEEi+heSrtQcDLeGx3UK1S70uPY+GmWqwhzyiuIMCF8HJ1UgIpOZmsXrlDz0BvZ68N3sueras1aY/eB/K/+d5+7YEkuO6l45uuErKyaG8F5hS/6lBKTMBN6rVHsJRhW2IR80RoUX418oD/DGVsuvvNNBIOQDdfdOrivTaINWizAfN9JTEYrmx6hwQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(4022899009)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JA2Wohlvc2g6PaL9if1D+JkMNhcdPL36TCz5EGubXzrn/qYe73vAvd62WurIpjg5XzBJLdp87VF+ykSeiSg6AjYl7HEUT4M0OkzdkSE1zDB1zkJl2OEQmlAGrJwVdUHXsJ+KluWZr2DY9wurSK1Mv/AL9hQk4agFmxd9XKl2vWuOr1Jh3xMqJFFAaLAwmQZvsi6glzO+3xgrRvpw/5smnlS0iuuvXH2iy8Mpvb/VSOMjiEMeirgHlej9LO+WRz4cPmsZlfwzIpMU01bNkw71Tg3HaLjOR/mECyj94UeeP7V8HQKjkd/Tw4roHvDtndCdTU0UyyS9aUyYeU25ZZQ/FyLuAGHQh6HK7h1FnVmyq/+/k7pRMf1tO/yfk3+jfSgO6KdonPsnW51AqJFdngAwaoQqvmUSM9sfXI3KNeTtFUJshKY+7gpTYPaPZ02QcFon
X-Exchange-RoutingPolicyChecked: 
	Qk1v679QDImTpU/lss5F4xvlOl5bZir5L+u5GenclHTsxKXL5eaSrjnIufcKFL+D7x+1heFYlZXFIPDYAi6aJNQi8/ToMuGGY6Wf6wuXyWB97K3SUHjBSY2kMFDLSeZMkVYVcaujYiUTijL7dv3IBzb5S7r2izFg4FRe5ivYzipcEusSyBcTXv5SPICCNM0nhgBk/+XpAGJ6AQODS9OHEl6JxbQ0Xc/MCZiQju04bokAnK1cPhc67AoEzxztvW8FDDTWiDpPTY6caPON2+EHWqyTcvb+341GzohFd+ZnsFG/MWQYGy2/Ys0eP0y0y2NhBqGwHexx8m1Gpi6eiJyZew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 13:52:29.4746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46023fa9-1426-44cc-9ece-08defd2ff1d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7706
X-Proofpoint-GUID: nZldsTutJiCDEVF0FF_A4z5i5epzy-AR
X-Authority-Analysis: v=2.4 cv=Ytc/gYYX c=1 sm=1 tr=0 ts=6a8463a2 cx=c_pps
 a=KcDtNT9Y7DbXMZTh6VQ3dg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=2m43vZ2sSQtDl4HYm9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMSBTYWx0ZWRfX9BkwaUrRMY9I
 zAixzONiJ76JtTniKbUrVpnaKTrbiHz6BsRiqPXxrF6Yu+hT2wWBrnTY2C0uD+++BWezgZ9ngPN
 J5QWxxhgmA16WJrC6ie/RJssqIxAe83fsDa6cMh//KjIfboz0xzuwU+5QSvVyCqpxNYpQIXPMWL
 ec9ckFSBYXWlqcFjl+6liY8F+9bezW+RSS7ydlCs/PpeaYnrg+eTRiPyyNepTuUR2ZQO0O82fDx
 Q3taaQsImZsCVUYBX94DZtPH38zqRLzQr/QtuJIxPEFJiAw+sn25DaDmW8Ok+KiRxTct9/8Q2D9
 ujgvq2BcFi8zhaGnOGYd9VHCzdCegYW6twKbwLrcMxAjoDtTqglU7hEYqbEF3o5cc4d0m4WennB
 P86jn0Bg1hd0mfoFhL9/MvaAP6SEoC6Ye62ROV6jOsGu7Vns48rG2zOgqAfSzH5a4AiqSuZ0fm8
 /W5OXUd8Iyreqx+OnoQ==
X-Proofpoint-ORIG-GUID: nZldsTutJiCDEVF0FF_A4z5i5epzy-AR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMSBTYWx0ZWRfX2MgVLp1ruQGv
 JVFF/QXPxZakVE5N61fn04n2GoOZyBTCj7GbItcSmI+ZV1N27ST+ghPBGWLsi2NWeFsN5qDvqNm
 j9R99zgLjqC8JxEvpSbxouNxWf+rDxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180101
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67IDk23O3663676
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Aug 2026 13:52:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20272



On 8/17/2026 10:23 PM, Hari Prasath G E wrote:
> On 8/14/2026 1:36 PM, Beleswar Padhi via lists.yoctoproject.org wrote:
>> Bump up SRCREV of ti-rpmsg-char project to the tip. This allows existi=
ng
>> applications to work seamlessly which require to know the allocated
>> local endpoint address from Kernel.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>=20
> Acked-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>=20
> Ryan, we need this patch for Wrynose CI/CD promotion. Could you pls=20
> apply the same ?

We moved this to being managed by the CICD flow as per the above=20
conversation.  The change was made yesterday.  We just need to get a=20
CICD promotion now.


> Regards,
> Hari
>=20
>> ---
>> =C2=A0 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb | 2 +=
-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb=
=20
>> b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
>> index a0043caf..15fe8062 100644
>> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
>> +++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
>> @@ -8,7 +8,7 @@ BRANCH =3D "master"
>> =C2=A0 SRC_URI =3D=20
>> "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=3D${PROTOCOL};b=
ranch=3D${BRANCH};"
>> =C2=A0 # 0.6.11 release
>> -SRCREV =3D "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
>> +SRCREV =3D "b1e4d172f39081db81305fa50ccaafd3ef8ae3a6"
>> =C2=A0 PV =3D "0.6.11+git"
>> =C2=A0 PR =3D "r0"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#20266):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/20266
>> Mute This Topic: https://lists.yoctoproject.org/mt/120746061/10119719
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [gehariprasath@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

