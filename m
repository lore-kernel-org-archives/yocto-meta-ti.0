Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12956.1792628787613606275
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 17:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=I/t5u8ym;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=oypPR9rR;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKcLcV2053601
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 19:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Xw23lmMF7Jr6eXU83mClLO9vhBrhYFMJg5qnabBfD
	b8=; b=I/t5u8ymxycUtGOhRuPH7pIr9E8OZRrYTEhRIdVWR7h0zTOu4JK27ENqT
	iIAxANJH7qlmQdC4R1Cc/K2+OdPqNxtoy/Vh821W+pdFBZmnAK6ENyUbtzM9WR8q
	wwFUR5u59cyWrBfl6IElLelNQmiwxEXL8EJyOz2UFmUufCdBI+gwD72pXyzFeex+
	U9aHKMW2m6vzvN4hWJI1OJpvnP4a37YNgna1qCnzAR8A4A68AcU186RScn9tiw9a
	FcYQmK5/vC0TbvzaGiievU9e6PFVkPQjmzwMddSIqG9YUwxHj02eb46Y+tJHfvoL
	4r0Anwl4n6aC/TdVitI7yqp8U7ptg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011026.outbound.protection.outlook.com [40.93.194.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hf0gdtj6n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 19:26:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS8EW/+80+JxheCKeVgFxV90ZMmWFFJ5u4rBL7da7BfTt/B5dvNTGo1ux2pW/yCSdc4BJ5oEgKxJveFoMpHFOYaH/HrJmKxMxkQtRe+BF//JBAWZR+etZ1AusJZghhaTwCqjrbWJWhHb+b0TRL3Tx+Pa6RrlquDauG7EKvx5cXG/XjSLNw1VcLfbGupagxdEa3K2716aRfJg7X+wU4/6PBw7B8Rt5jrCpSAGR154WLhfxblgxTXfQmhM82w6bbEwSVmFMKoU0gvCsecrXcxVnSplUBsRgCuoVvTkYR1HunClwsVHrvnoxmjSyHw8MQX5/zBc8Ar7kAO7MFNp7PQ3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw23lmMF7Jr6eXU83mClLO9vhBrhYFMJg5qnabBfDb8=;
 b=QsNw0rhYJrAtruWMFRZMEvJuoHXTzYvjNB/N7bIy/AIMwXIr7PtIANU1wC9QNO68JFiE5IAHXiByIfOu02WBHRKvaAsldULLPKJT7GBUPRbO8qvs4qrdrHrhTUMwQtc47sPAfDjBT0FjkOt8UHq6aTGHZ4oYBqAwEaHd7i6mia56KEAEJjqTQ5fliC/SY8vIq1HXn1euUNR7P+6YJZb6nag3Cq2AHytZeoVLCTp/xNesW7Jxg9LPIlzvI6KF/k8itLaQeWLS8rafZnnzdwR0VekKEt1u7DM20WJFYjN31uX1R8OGTczvJsMh/SjKCzTklOBiBCJ3TgWhQlXCmUZ0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw23lmMF7Jr6eXU83mClLO9vhBrhYFMJg5qnabBfDb8=;
 b=oypPR9rRTOLkIRh++tvJVaC5X4a6km53thDdT6LFNvxpOoH6BoVwRq6WoF1C2ZCNSkc+GvcXNpmPAaHM9wl74qkJimhtph9+2aHpdQvajXbUyQq2LHD93MzqGkm9DYi9cmdLQxXY1qmiLM6Nfbv25QOEM/dfdhTOW99c/aqTYzg=
Received: from CH2PR15CA0030.namprd15.prod.outlook.com (2603:10b6:610:51::40)
 by AT6PR10MB995309.namprd10.prod.outlook.com (2603:10b6:170:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 00:26:18 +0000
Received: from CH1PEPF0005BD5C.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::5) by CH2PR15CA0030.outlook.office365.com
 (2603:10b6:610:51::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 00:26:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0005BD5C.mail.protection.outlook.com (10.167.244.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 00:26:17 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 19:25:57 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 19:25:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 19:25:56 -0500
Received: from [10.249.66.236] ([10.249.66.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69M0PuWI333709;
	Wed, 21 Oct 2026 19:25:56 -0500
Message-ID: <4c0e6baf-22ea-4c60-84a3-687a30403731@ti.com>
Date: Wed, 21 Oct 2026 19:25:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH master] meta-ti-bsp: optee: Update to 4.11.0 tag
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Kamlesh Gurudasani
	<kamlesh@ti.com>, <m-chawdhry@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, "SAHU, JEEVAN KUMAR" <j-sahu@ti.com>
References: <20261021-optee-411-v1-1-1f22b982bbfd@ti.com>
 <476a1d86-d6e6-4870-ae83-f07962315c64@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <476a1d86-d6e6-4870-ae83-f07962315c64@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5C:EE_|AT6PR10MB995309:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ff446c-6c6e-4fcd-3923-08df2fd316ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|261021123027099003|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003|261021121427099003|3023799007;
X-Microsoft-Antispam-Message-Info: D/GqXgZ+OgbG0WUkOWjudzJGP0hCTeO+8CEAeMF2Lq0ZEN3SlUl53tALK02o1LDMpP0PqpmjO9n4foCejc5wfXysuyNCrTl4OnjiSpf+UfWKGoSIlVYpuIgPvX/nfwayBnbrk+yf0X6Q4esQFXTGEAC9sH7C43wXDkQ1vONWT5yQNo2PsQYsUdeYbXrDab1J7bISuvgzkoSV6MI3deMwnHmIHlui33ronrsoMl7a+2rD3UpHMRUkNDvZ3R0NgRzEmHXxe44lJxfXwcdiCfnSiiytttRZYE5igLiN0jPSWi1lejSKHvlXZgm7ZVEujOEmHTNdzYrhVoonL8Kpi9hrj9p2CdNsLWcohPPo8o4qGVg9aQCpm8a6glxzf91AktqcZes/J2ahmAwxp4Nd7eGViIqz4+/Pj3q3XLazNuq/yWrUTSD8nrUsVsOSm1Fs/VQEN2c6NOlrYSpXelQtu88UrXJ6ZsDLYMrkRN2O7cW7QWuDPX4i8kWi4moR3tsVE3BynTjoyA1oRU34/z5sQnX8sRLKf9E9M49nsNaK3eSFVHYlUDL2Oys9f2AZmCZ0UT3HweZqj8cR6aKf2wJK0Nq9BQbeItiJDrAYOYczx8AIO5QizuGBbR+mQYEuLEZmRVZG2I3bVJNfAhOzOM8qbSUo9keyDb5pvVroEPFNYoLNtKlY3L01vgwo8XAAhSFFduXhYQPjiWRC1B8cEbIlRcu8aw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(261021123027099003)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OZLXMpPF0VMjCakShx4TrxIA6zJ0RhPdM7is47EhZ8MSaQZaGHA3pxXXSdWLZmFyYC6GRNkqk6j57viiVP6WuUnAzw1stJ7l3tOQhIoPg8HdkcPeyJviqeYQQu91zTQUnKZkWn+yoR9VUHAH66wq6QFhe5x5UbEwaHALJR7Jj6htKZSwrNC6pmLntSZ1hIlqFKjQAt1BXu1KzSn1GJCzYtejB2GXMzV1HSGImzeVyg1psLWhD8mn7yRJmW7uLgK0elcaQPjAavTPFGszubNXCyh+ZvpBmw8GofmoN24KjQdirj2xugDufPochZbVmWty/UX6gOMvcAuh7bb+8W21R3cjJNmbSCnWzZoYHK1UKPobBx9c8GJfOhE94R8XXCkcnejLghEBA4UEV8wkU0aypoQWk0BwN1KHLjLgVeR9w/vD0weOB3vV7MDC8S5Qarj/
X-Exchange-RoutingPolicyChecked: 3vl+YpW7vKwHwhxLVxjzeQtqYU83yGXb+syfU7j+X+RonuTPgZ7J0x+r8+BrCmBiJ2ukxFC3aZ0dW3tWXDuQN6G/gkIHD2Nh50qTkxPUeYVmuFfTuW6ksCxRsusYW/M3HK8I+Qj8oWUAjTH5e5NYwHJ0TJ3BiDlJUQL8ezEJT+5wNZwUyqXRGuTcnGzbwuqtQ8/2AtAknzqmDAQAd99gfvcwkrQ9JJ0ym/mTcGe987vJQt5fUuMemV+HuuoqE4/tHsJvSYMYx5vfFOebeLGTDDO7buygJGdyLnAfg26usK6XEcjGbXS63PJEfQYFCmZXUSoGViLSySbVl1PM2J89RA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 00:26:17.8212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ff446c-6c6e-4fcd-3923-08df2fd316ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0005BD5C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR10MB995309
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwMSBTYWx0ZWRfX+usczCZupvXc
 VRinWNtYM7mx3D8m1ELX+y+q+a9EgURQ1oQp7uRHwGOON2JRTckDiyu97ZKXSvAcFhpC+usiYvo
 MUlg9WJWhHxRzf3SXzX4RKd+dtSTTTE=
X-Proofpoint-ORIG-GUID: 0UPSxsZK7vs6Ph5b75xtn4AfZZCoe_Kv
X-Proofpoint-GUID: 0UPSxsZK7vs6Ph5b75xtn4AfZZCoe_Kv
X-Authority-Analysis: v=2.4 cv=JuhkP84C c=1 sm=1 tr=0 ts=6ad95831 cx=c_pps
 a=HGE+/hAEzspoXCOliImplg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ME977MHjIIkKM6FSZQEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwMSBTYWx0ZWRfX4xSlWLVtBv5R
 ENbGvZ0wT7/cBNxZUoUBmTQTfpPoiS2Ey3Xt1L/GfqR2dBpIhBOB6bHq5pWKxchqjx1yKoKCWmA
 byG3nkuRgP/GXD5NX9/74sInCU7IjClAdhhqkducf6VBkgnQ+3wYVQdkDp4noludMkX//3S4xW7
 Cs3WC6gwq4X+4n0AAEK5gzt7LVJQqTXLfMp//3HxzG9xIsnDMjPDOLElRsA3U7Ko/MYcYkZyDuY
 EEHelIO3vNewg2G2vPuKwXSi86JGhFtj7QuIUiEUGKFI9WjFI1aBNEIdzquzY78+FAiowxb5spi
 JAxSO24Pug1w0QwpMQR1s/J4wC5VjpXTgFdYvhgq0TGBa352jqnDTxRxuKqy6HWIM1rQRZ5BMbj
 isz3xOEtEEsk9T72D01jFIAeImztZfaUBHx3gHyawG7OmuNQvchhRAkpPAyvgSqSsHjHyNabMXm
 t8Zc7qWTbggnF5bUiqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220001
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 69LKcLcV2053601
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 00:26:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20480



On 10/21/2026 6:01 PM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 10/21/2026 9:06 AM, Kamlesh Gurudasani wrote:
>> Update optee_os, optee_test, optee_client, optee_examples and=20
>> optee_ftpm to
>> 4.11.0 tag.
>=20
> why only master?
> Is this expected to be picked on wrynose as well or you will send a=20
> seperate fix for that?

It's fine.  It applies to both.


>>
>> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=C2=
=A0=C2=A0 | 4=20
>> ++--
>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.in=
c | 4=20
>> ++--
>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc=C2=
=A0=C2=A0=C2=A0=C2=A0 | 4=20
>> ++--
>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=20
>> ++--
>> =C2=A0 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc=C2=
=A0=C2=A0=C2=A0=C2=A0 | 4=20
>> ++--
>> =C2=A0 5 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> index 7968f3fb..2418b6cb 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV =3D "4.10.0+git"
>> -SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
>> +PV =3D "4.11.0+git"
>> +SRCREV =3D "da81fb7b30781029bc9d4acfddc7c60b08deb1f3"
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> index eea7762f..10da279d 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV =3D "4.10.0+git"
>> -SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
>> +PV =3D "4.11.0+git"
>> +SRCREV =3D "71e8f3f320eef46a9369700bf30b91d67427d535"
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> index ea40ba27..1cba881c 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> @@ -1,3 +1,3 @@
>> -PV =3D "4.10.0+git"
>> +PV =3D "4.11.0+git"
>> =C2=A0 OPTEE_TA_GIT_TAG =3D "${@'branch=3Dmaster' if d.getVar('PV') =3D=
=3D 'git' or=20
>> d.getVar('PV').endswith('+git') else 'tag=3D%s;nobranch=3D1' %=20
>> d.getVar('PV')}"
>> -SRCREV_optee-ta =3D "e3b1e426a605e0537a3c3c9c24228eb22e354b80"
>> +SRCREV_optee-ta =3D "f09f4cdad21028289d4e8fc573893b75f7228dc7"
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> index 473c5282..92fe85f2 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV =3D "4.10.0+git"
>> -SRCREV =3D "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
>> +PV =3D "4.11.0+git"
>> +SRCREV =3D "f54190f22611dd5ad5d22546fd4209aa100f56bd"
>> diff --git=20
>> a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc=20
>> b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> index 8a8e9ac8..60ca3bab 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> @@ -1,4 +1,4 @@
>> =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-test:"
>> -PV =3D "4.10.0+git"
>> -SRCREV =3D "88c93e87a5c172363ee986ded036a25cafcc9d2c"
>> +PV =3D "4.11.0+git"
>> +SRCREV =3D "179740b43809069ee567d58ebd8e0f85ef8168e2"
>>
>> ---
>> base-commit: bf41b0dcd77d0c0cb56d4e2cd92c0a7ef53ce62c
>> change-id: 20261021-optee-411-292b373d1ce6
>>
>> Best regards,
>> --=20
>> Kamlesh Gurudasani <kamlesh@ti.com>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS
