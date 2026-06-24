Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682B9CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:19:43 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16722.1782332382503557610
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=dLyzyEcz;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DjZ9Yblg;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsEvT1332216;
	Wed, 24 Jun 2026 15:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AXhu6IUIwQ0jvMiwXSjrVT296uaxiaO5k+2xsJQ+R
	e0=; b=dLyzyEczgg0lTRf622LA0t2+N3NTQrJNR9tzoZtx+oSXcN4Px2hFnARrg
	GANlyewBWEDkTcreeJR+ecqYGkCTgg+1TdvP+26nClOqFSdOkGVTnpFtoGkYkVrk
	TAeEpiw69FTybP66dZ9Tnv5jm5cfmihvNxx+vo8NC5lJSIMXzWAPImKZOb8r6lpL
	sMauIeT/3yeQjTooYDJzAz+9yETm+49C8gW8AJrhTwvL5zxXEEVb3fogMkpg1pM3
	yPwHpb0APlhrY5BEOUNCeBCdtG5q/W2huAyAzrUDXZ6Gl76EdPuDhqxHy+tQpz2k
	qs4C4bR1TaP45jC9PQmLHE81mxxqw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0aspchje-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:19:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV6xLPOLfL5iShmsNjoC4VUiBnvwno34BmEv9tO/uztKhN5GPGzbuc80trKCSt89aZQxZ8kDmCT21XKwjwxdLRfWGSWMBID+1kh3P3y/BT86goyK2SBcg75Lpnzpyqmx3t+4Xe9WxTqiqy41sTtUjF+Of+agkJmfVXvKslXduVaSoqRE3a/fln1ZkWpEM3S/xb2EG3t97YCSUsFQGePqgcIaRx3yhqs6C9tcdA1yY8rAAdRq90jEcLNEnRKKgjPN3rnu+SksdXE2mWFLfi6B81W6kT67xo4EO16ZIlBp7GxqkQwq7VlkQXMvBfyByj+HWicgJTQ6DFjCLQ6pvNgcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXhu6IUIwQ0jvMiwXSjrVT296uaxiaO5k+2xsJQ+Re0=;
 b=B2+J5b9jaJPK5z2MaeleURcC/xVAlSpmtoV1mTEgco5ooz6xZ4qOseBEyZJGocM367plkxBZbHaBWiHhAPwAtes1c/2AHjERn0CCeR28eSth6f3cEluAs3ZXoJfL8UPCDcZ6D3t1Sj7+AVKZeJw5md21KKD88ZtUUUNpLjR//1Mal9bPPIpflTWop6Pf21jQr4l5Uz8rUW2DznotTW4y6VdnRD0dAS2vc9XbKISsqU4pMqFEXo14vPh1J1ss01DcNmoIM2vXAGPdTndUvLKwWvkFusV27LqQVpRvueKF6Gn5UatyahzMYnsZFBlOd6Vg8snCzE8PtS1vauFP+Yn8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXhu6IUIwQ0jvMiwXSjrVT296uaxiaO5k+2xsJQ+Re0=;
 b=DjZ9YblgItqwp2kLSh0w8cee+PaSSA+Nu+QAg3yPUpeMtnv5MgJicC4nKFBAl2vRL56Zg0B4EA7DHOi1kFcmAuMscIXY6OxzFh9E/ShZ3awrzOvv2Sf2BF/k1uNJoR/wIxn1xjBQ3Yvo0R9i8wP1WJmes4rBKg4fBc22wdGvWpw=
Received: from SA1P222CA0072.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::28)
 by BL3PR10MB6114.namprd10.prod.outlook.com (2603:10b6:208:3b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 20:19:38 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::3d) by SA1P222CA0072.outlook.office365.com
 (2603:10b6:806:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 20:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 20:19:36 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:19:33 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:19:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 15:19:33 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OKJXHt1175706;
	Wed, 24 Jun 2026 15:19:33 -0500
Message-ID: <b382a8b3-b5c5-4a63-9c11-129137747d5d@ti.com>
Date: Wed, 24 Jun 2026 15:19:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v2 2/3] ipumm-fw: Use prebuilt
 firmware from ti-linux-firmware repo
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260624195533.1152173-1-afd@ti.com>
 <20260624195533.1152173-2-afd@ti.com>
 <596d414a-053c-418f-92f9-16db0a0889de@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <596d414a-053c-418f-92f9-16db0a0889de@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|BL3PR10MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c348a7-b33c-4055-5135-08ded22de977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|22082099003|6133799003|18002099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	KHSy359cXxo6TZrsQeQ2KphiGrh2xUBMlZYftZ2jqIbmNblz8TE8aAYF2dasAV6DBKKzU+Hy2wcksRHs7YqT9OO4E4lY+ZecKMiABxFZ9XNCr6N6MSj1LXFMFbdiXK2F12nFKQmGkMjA5bqrLDWvYxhALvptlrz/dwHj5juvS5yUIUelBSjPewe2ipWAXrPp8SD1sF2Mn8v7kLlGlojbxfZp3XdDjKfWwcMKEFaAgx3KyOGHh0ri90GjLMEgj3XUf5rCADN8IV6ClX3rYLCWAO0oBSV4Ltb65yxXABQfzYq81IKAoXSOsTQvJeUZt1W5c6aU8Wxko9l8RuivkX8MIqhCu9ES8ZsKBWLePdc8qP6SL7CHRuXD97C7EwklHkzrajn8jXZwUa1it8Pt1lCS2IBN51tt+7sTiGDkH4dpJw54ZrZVJU0SLA8b+ihU96AG8SPxlTgkKbRJ3jZeEc70WBpIMg6gc8HkXDuBY+++74JSLiN2c2Qy+5ff5Fqi0BeZ80HFiQzilacQRrDOpzAaSWfceQxfDOmW0g68vvW52ML8nHr8pRkoYd4/Sfve2vy+ZOoKvtGn94YSDecQA+9hNeWOpkuXKW1ABMngq2tkqh4rUUa62aKn7DC3HnN8Ff1Ac2zErqEnocZm3NAZoSXjTQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(22082099003)(6133799003)(18002099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ldQZkPirzBtbEQSaGF5vLEA/tc4l6lwEvq2o1R5bNZ06FLs3cex6fCkLRp0Ms/lZUruzRbBAPXcggUGwbHIZ/6EHHlSj+Ogs6H8TnQeU/W3qtYcWv30sPHBg/IOhCU8ONwLE8n76bgEFQ9MxerKEYjkRJqcYvFoarnT7Moxq0ylEebc1KINwGG2vwsBoDTKDOeKjKmzmGWA51VdeTLeMb0cSn/e+x2tyTRicYoQKjJqG9LcreKRgkVCOJAYWkO/n2b8+oMQeLXlqsKUyinOfM0mm0fwIdYQWWHH23Q1chYN7kCIi4X7/BMVIXq/1wF1uBmz51TcMFb6wjRZ/Xjq4I423HqMp3H9xxWPZlPs2EhrhzMgBkAn0K8qx6/Q/K78Joua2Y1I6TzRf9ukNBiq7ss3q6rCGtiZFtuH+v1HKpjcTt6hOa19Cj1e5s5uLjmUu
X-Exchange-RoutingPolicyChecked: 
	scWeKeck6trtc2k9A/3nWZEmHee2Jln6RhDJ8RZNkWbLaU+abgnSnVnw2LC6sltFly4CarEnKlK501wGJ3BuRXtMOQ17OAKAz7R06V3EsqUFpwaD75Uk4IJ1/sy+vmFRRwTHHWXpqNr0h02+bKqGylYdJJToUQCNmLD14rBxqp1zfaV3FmdsoiPFlRydB2Kt3+taBZoImf+XUvgarzyZelJDxj/7nRipmesSw7TtM51D57H/wY12nTZAHzvK5adk1N0x/aNX+FyXv+lJZH4qyQmhcNlAxGQzmesLuJB++wKjxLwNgW/g/EZ+0EtUCFdgiXQKiiGCC3EY1elHMEMYGQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:19:36.4684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c348a7-b33c-4055-5135-08ded22de977
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6114
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3MCBTYWx0ZWRfX9RscG7cJGmUA
 0RycKfrXl1x6az+oEVBKVn/zYjQL9BnHf0eQOuvkKRaVWclh2E0ZUCrrdU4CeUGpHs/IoVbLn8A
 eJXksNsGqkyxY9nWYyYN1b5iKsmPer1woW2HgxjDnWiXv56s4dLn0DtgRRCbndxlpqqBkMP5fVG
 9sIcY01AGj8+NRTqEN5+KrMzXAyrK0mJUvqD8yOF/hGhgEBtTBTfTMj/d1amCHN8GIuuxy1BfQ4
 1QQstk6KopOWRX1I/6dDFBU6MNkc71YDY3P8I9M42bBjdL6LIFpiN+lQNDlSGrA2j3wynijYzXV
 dou5h6dsieebpvfpo/yidds8Q/W/YDjOZ4ALpe1swgg55Mh5ENErjzz+OXkXHXuafZtFaI3Iz8r
 GPN1z+huGsVugvoDPj12qPJoC58uV2QPAo1yOY1cWhE0KxIGPio1jjvbACJcfWs89f7xWRMcDAt
 a12bOUYoeLsIn9f93Ug==
X-Proofpoint-ORIG-GUID: Zo235oIhQWF9hCeRVA6yGDLUDBxG0HWm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3MCBTYWx0ZWRfX2irQLqoyOfZ2
 70o0udyoe49D/L3Ms0aZ7qdAB7HY0zgKmbp9RrTE/QFYKChy8//J2z3U8AjcDXuLU04HX7sOV7P
 MgK5sv4hfnERggtUnoXZL7+LIu0oClc=
X-Authority-Analysis: v=2.4 cv=RMCD2Yi+ c=1 sm=1 tr=0 ts=6a3c3bdc cx=c_pps
 a=F1HhE1toGRAZ88wdd1wKFg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=Iz_pSyPsZ5QoqYXloCUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: Zo235oIhQWF9hCeRVA6yGDLUDBxG0HWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240170
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 65OJsEvT1332216
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:19:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20079

On 6/24/26 3:08 PM, Ryan Eatmon wrote:
>=20
> Missing License-Update: in the commit message.
>=20
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=
#license-updates
>=20
>=20

Hmm, so in this case the license isn't changing, just moving location, wo=
uld something
like this work?:

License-Update: License text moved from source manifest to standalone fil=
e

Andrew

>=20
> On 6/24/2026 2:55 PM, Andrew Davis wrote:
>> Use a prebuilt version of this firmware from ti-linux-firmware. This
>> removes the need to build this locally.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>
>> Changes for v2:
>> =C2=A0 - Fix s/suppor/support in SUMMARY while here
>> =C2=A0 - Move PV definition to ti-linux-fw.inc like other prebuilt FWs
>>
>> =C2=A0 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc=C2=A0=C2=A0 |=C2=A0=
 1 +
>> =C2=A0 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 52 ++++---------------
>> =C2=A0 2 files changed, 10 insertions(+), 43 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/met=
a-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 126c46df..88992e60 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
>> =C2=A0 TI_PKA_FW_VERSION =3D "2.1.0"
>> =C2=A0 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
>> =C2=A0 PCM6240_FW_VERSION =3D "1.0.0.0"
>> +IPUMM_FW_VERSION =3D "3.00.15.00"
>> =C2=A0 TI_LINUX_FW_SRCREV ?=3D "ec029baad8b4b147af8331a5e099ef891e5ae1=
f4"
>> =C2=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
>> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/met=
a-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>> index 246255e3..fbc6d956 100644
>> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>> @@ -1,7 +1,7 @@
>> -SUMMARY =3D "Firmware for IPU to suppor Accelerated MM decode and enc=
ode"
>> -LICENSE =3D "TI-TSPA"
>> +SUMMARY =3D "Firmware for IPU to support Accelerated MM decode and en=
code"
>> -LIC_FILES_CHKSUM =3D "file://Texas_Instruments_ipumm_Manifest.pdf;md5=
=3D5cc572579f07af266ab57fc17d762c7f"
>> +LICENSE =3D "TI-TSPA"
>> +LIC_FILES_CHKSUM =3D "file://LICENCE.ti-tspa;md5=3Da1b59cb7ba626b9dbb=
cbf00f3fbc438a"
>> =C2=A0 COMPATIBLE_MACHINE =3D "am57xx"
>> @@ -9,59 +9,25 @@ inherit features_check
>> =C2=A0 REQUIRED_MACHINE_FEATURES =3D "mmip"
>> -SRC_URI =3D "git://git.ti.com/git/ivimm/ipumm.git;protocol=3Dhttps;br=
anch=3Dmaster"
>> -
>> -SRCREV =3D "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
>> -
>> -PV =3D "3.00.15.00"
>> -PR =3D "r7"
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> -require recipes-ti/includes/ti-paths.inc
>> +PV =3D "${IPUMM_FW_VERSION}"
>> +PR =3D "r8"
>> =C2=A0 inherit update-alternatives
>> -DEPENDS =3D "ti-xdctools-native ti-sysbios ti-codec-engine ti-framewo=
rk-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
>> -
>> -export HWVERSION =3D "ES10"
>> -export BIOSTOOLSROOT =3D "${STAGING_DIR_TARGET}/usr/share/ti"
>> -
>> -export XDCVERSION =3D "ti-xdctools-tree"
>> -export BIOSVERSION =3D "ti-sysbios-tree"
>> -export IPCVERSION =3D "ti-ipc-tree"
>> -export CEVERSION =3D "ti-codec-engine-tree"
>> -export FCVERSION =3D "ti-framework-components-tree"
>> -export XDAISVERSION =3D "ti-xdais-tree"
>> -
>> -export TMS470CGTOOLPATH =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
>> -export IPCSRC =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
>> -
>> -EXTRA_OEMAKE +=3D "XDCDIST_TREE=3D${STAGING_DIR_NATIVE}/usr/share/ti/=
${XDCVERSION}"
>> -
>> -do_configure() {
>> -=C2=A0=C2=A0=C2=A0 oe_runmake unconfig
>> -=C2=A0=C2=A0=C2=A0 oe_runmake vayu_smp_config
>> -}
>> -
>> -do_compile() {
>> -=C2=A0=C2=A0=C2=A0 oe_runmake
>> -}
>> -
>> =C2=A0 TARGET =3D "dra7-ipu2-fw.xem4"
>> -TARGET_MAP =3D "platform/ti/dce/baseimage/package/cfg/out/ipu/release=
/ipu.xem4.map"
>> =C2=A0 do_install() {
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware
>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${TARGET} ${D}${nonarch_base_=
libdir}/firmware/${TARGET}.${BPN}
>> -=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch_b=
ase_libdir}/firmware/${TARGET}.map
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/ti-=
ce-fw
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/ti-ce-fw/${TARGET} ${D}${nona=
rch_base_libdir}/firmware/ti-ce-fw/${TARGET}
>> =C2=A0 }
>> =C2=A0 ALTERNATIVE:${PN} =3D "dra7-ipu2-fw.xem4"
>> =C2=A0 ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D "${nonarch_base_li=
bdir}/firmware/${TARGET}"
>> -ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET}.${BPN}"
>> +ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/fir=
mware/ti-ce-fw/${TARGET}"
>> =C2=A0 ALTERNATIVE_PRIORITY =3D "20"
>> -FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
>> -
>> =C2=A0 # Disable the "buildpaths" check while we figure out how we are
>> =C2=A0 # going to address this issue.
>> =C2=A0 #
>=20


