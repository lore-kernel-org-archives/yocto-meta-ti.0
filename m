Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F9DC982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:22:06 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1274.1790227318165662702
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 22:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=i0c9aPyo;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Xdi1wUMa;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-garg7@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68O2Kk4Q2533783
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 00:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2VN8glKSTpXWOpKBWUllc1FCc/WrTLaARhU3XqxjK
	4U=; b=i0c9aPyoPIs3t48IIrKv/dJffz7pZPcLHx1JScGQNqu9d/KJD4K4qmuc6
	XpQnVRkk9flVZE5dFP5W/Zf+wholkJi7kZIsEVNc/MY3qvzDK0Hn/+HfB/BR9lk3
	UsxtVHZ9sh5HaCKy+wuwi9w3r9nLktZSjWoDw2UdYUv9oaH768Tzh0WrFiSz4zA7
	dpS14xRVdqVY5wHepaiCMheCV4HJMgO71gj/fkN4R32EsQpuDofpTuho2t4uhAxg
	SybuzU4i4fGlCGXecMZIly3BIgHF8zsBeoJed1wiLwDrk4459MwBaBTiIZmJ330Z
	Mqz7XbcWIK9sFYRRS02G/M9LS4Y9Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gvsbvhb7e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 00:21:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHC8GakYoZiHvyLcv4eeIQH3EUf4qEcsx4FAGc4xXX7X180aTmTYMRQwKEvo01GCp84EGkKyxUwA0DLCu/NXpHmClGJeyTw2JXZNeCJdxhssFui3hmTJcp5ROUmNTOpE0q7vJHLC1jMkc5g8A8rop15/OR65U0+XOK0invQ3weX6Y/UCdl/vUQmNwNg3r40W7bokZGPH1LTX87TAwVIkyodcx60f5F431dqxx/ac1EoJoG+pwRXE1JplQoPKanwNZ1hSQgC0K5dJD7W+Vy+/FT+FXtN19o4s00UhBla6WJCdnflfIktIaFiat9OpmlZY+vWYOCbuIXhkUYVcTcUnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VN8glKSTpXWOpKBWUllc1FCc/WrTLaARhU3XqxjK4U=;
 b=EHnnh3uo4OlXJ2Jr7KKiQQxw8GdThTgzoNs3bGRLU3kOBC68KQphIyWDm3IwUHqQDL4ex1/4RWKd54nkRz+Fbc9OCc0HHmHGSfXUx/cr8sbRvtL02dPp2Z/2mJ6gpjX8JDJUWZrXGjeij64CECcnnKO8l7LGerSm3BP5ADLqfCNT5RtKh0b3OD9m0TZTHAFuGW4UZIha12dMVs3taH8uFTkebzvLFYOgH7E3CgREkCjqKYC4UtMDXkeS9HB2OF/517yD2qkIs2b/a8/BUJJTwHKCLo6eCUggoRdGFp5dNATO28GNS5wvlMn1W8Q7MPJFNt0JBqQK1eH/eszKogPG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VN8glKSTpXWOpKBWUllc1FCc/WrTLaARhU3XqxjK4U=;
 b=Xdi1wUMaTvox2J0XhMiO8bjWfpTCd9ghRUp0Fn7vYKxIbXE33hXBhPA6e6iRwPMMgf1HxxwZq76cwa8ZYxkb5+OOP8jAzcS76tp2fQl/uPfJuGbBTg3VSVFYiwQhdUBHrnfPu+UQrq4lfilFIkGPHVT15d5UQIUF73si5ZJsVKQ=
Received: from BN9PR03CA0406.namprd03.prod.outlook.com (2603:10b6:408:111::21)
 by CO6PR10MB5571.namprd10.prod.outlook.com (2603:10b6:303:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 24 Sep
 2026 05:21:53 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::31) by BN9PR03CA0406.outlook.office365.com
 (2603:10b6:408:111::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.17 via Frontend Transport; Thu,
 24 Sep 2026 05:21:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 05:21:52 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 00:21:45 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 00:21:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 00:21:44 -0500
Received: from [10.24.68.129] (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68O5Lge93468743;
	Thu, 24 Sep 2026 00:21:43 -0500
Message-ID: <614a8806-1fa7-453d-bdd0-4203d89bb378@ti.com>
Date: Thu, 24 Sep 2026 10:51:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package
 iwlwifi-ty linux firmware images
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <danishanwar@ti.com>
References: <20260918055654.180727-1-a-garg7@ti.com>
 <aad45d5d-f696-4367-affa-f8b5a0d3c245@ti.com>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <aad45d5d-f696-4367-affa-f8b5a0d3c245@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|CO6PR10MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: c6209fbe-dc2a-4804-07e9-08df19fbbe15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|13003099007|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2rIhPU8BWnRYnfKBgdgfbA1dbbDaija6l74WDRiGjoJ27+8AKQLapvPxdmEHr/Eh6qfpTd+f1ZcaGuThXgUd7G+hb11A/unlrjdu6Z1Fy8R3JPSpVzHR3P+XPjmjUI0rSC629l65ObgBXf/MfElzjeWjyyRMHHt+ncU5OCCNjLI/YCUi1JUTD1dXd4Pmeq7LgxHjS/lM8zxga6VatzYeV1ja+j5DjVMCi8h9KZ/n5WjJsfSUhvrL9rcRy2nl9srPZ6ikXcyY4X+S9lkwsDpe/rkTHAUUw7B1UU2e+DCxbMwS7q/YqqW5OW13Vv6fai+cYw4ih09b/geJcAduIvvSxnN4tKnFS6eZQfzm8K+90Z/Kb/C+JjGiphtfYLg12kbYRlEprVm94BzN9jVPaHS3K6rbevbqVB+u0YM5MwIeTlF0lp0IulpK6ubAUyj1w3440AAsYfJMEHhPqh/x+ieZQThgaW09zUDNrjDG1SO2PKgPawH+OMcxnDK1jPDn9iEWAmMjKr0n9tmNJU4uxrZ5PwHwWwlIss/v4v+X1jdhpVgDC1lY7Ifh+NR1OOszTvIXbCgxHojrKB/hhOBi0AKMF/PYFCi+I5SdjqeK80krq4RSb5teoGzqcp6zGuKuukSQxCEY9Et4u4ZoYq2rMfm5ew==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T0o+DH1R/CWcOXUScwBkHpoaIord56yqRVKPHeSx9grHA9EqbOdQ3mzB1O6A0ncW7QsgCFY3ryy62weTg5klgCvr0ckZMP978CbFIZ+WifcRKutY6l05zH0mtP2kEo6XZqbTysDXLyg0pMl5j0WSN2hyNo1kOnsGHq07Qy5m9fHSBAK9pfZLpezawe/b3QSpbosVCjLOiurhBXJclUZ3j+z4nS0E415+kXbTjMw9CVgZMklPPKqJJ2NUwGukgsDBaGAR3ZkdG3emR1kGu5pgtal6r4I4W5VrjN1N0tXxgB3XxO8Bdcj001HvPTNSlWAZsrz84aF19nvXdiPCHcVSajalUmHu1BlGFwoXgbdEWqP/ODC4Bgutf/CeSjsEhjncqO2dZMLv0oSCaPHNRLC50vyhbgSTiUErgvSfuPYhEXm8HxxmD1pWmyYvUdk9dLHt
X-Exchange-RoutingPolicyChecked: 
	H6k22BlDKBFM4S43Y4xEeVGe2Tge6jXyfOC0H//IdFguENmCXEk32o7L4TlObVexShEZfjjMvnu10eDk9OPFLqmBVdIoTRTrnF91sWoFmVydoBTPvyOKtb5XQtD0XqdLHpecXfM67UM3QhX/xI2LECHz/vw8xZlhiTLH4/sZh7xNEYjM1cHXumr6cZ1siL2Y4wEiEiSB4lic37o/6kV/71W9YrNOSDyPGK1rHBwMu+bUkB73kT9svloBwpZK92ElGB4haXeojiiWfM+iT4qL2wuFZO0V073/XUdvRTIL8xP32U86j5uKgEQR1wB84oqHDzHKNPdFP2pK2g28/CXOjg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 05:21:52.5176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6209fbe-dc2a-4804-07e9-08df19fbbe15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5571
X-Proofpoint-GUID: 3jhkPEhjsKf2eA9Pf-6l0R4Kn7IML-kN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyMyBTYWx0ZWRfXxxe8DqQJ5KaI
 mYsdNzEwxrKSnqFc3F5YwgtiJWIJZxqCXx0vSxY2GEMeU0bbofevesp50lekLR0+oehZt8nB7Lj
 cy1QnZH3K1Mub3tziI3imWURfsG04L8=
X-Proofpoint-ORIG-GUID: 3jhkPEhjsKf2eA9Pf-6l0R4Kn7IML-kN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyMyBTYWx0ZWRfX+hvQsOGFWcBa
 lV1lvsr8s2Hu0QGMOBUKJVbCgrgLL3gfuJziWfUmaAWxWBURCzpdn+Cp6NE6MVseFQbkZBO2+YW
 1M0Tdx43ejEYMStr91eG7BK1DSGn4h9iaZiBpFq+272KwMev5ojRDNqY3mobD4qLQbMivaGxyza
 C1tCCZedhHqVUlBvdVm9+6bRX7QyBXm1iWMxB16x+hk7oIxGsHusnkya503O+BgiWmyaIRF/WJh
 rCWrM2JoWMjeGDBFsMEMv5suAty8fnQXoVhBv9NlB3IaXZWcmLxBNRZ60IrKQmZqOzJWmyH/uUY
 G8Xdoir+6DsIuJDRw1KrtKrOR9PessWMAGOWLK8Q2EpyIPsQZqriAsz4dmiGLPQB2d38UAPjiG9
 gt+DNdwZIXtsrsDHxr7svwiJo1X1H15oEwBzTPUyvh0nhWgZIu80Lhp/Dz2F73/nkUmOihz8N9V
 pPg4WbF5/7ZPbubzBhA==
X-Authority-Analysis: v=2.4 cv=QonLTlyd c=1 sm=1 tr=0 ts=6ab4b375 cx=c_pps
 a=s6FLI2cSFE2dV00WXjZlDQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=dm1JgQdl2ZYFIlBVYvoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 68O2Kk4Q2533783
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 05:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20408



On 18/09/26 20:52, Ryan Eatmon wrote:
>=20
>=20
> On 9/18/2026 12:56 AM, Aksh Garg wrote:
>> Package linux-firmware-iwlwifi-ty containing the firmware for Intel
>> AX210 WiFi card.
>=20
> Why are we including a firmware in the ti-test package?=C2=A0 Firmware =
should=20
> be controlled at the BSP level and not as something needed for testing.
>=20

This firmware was added from the intention to support the AX210 card,
which is there in the test infra for testing purpose. If the infra uses
another WiFi card in future, the firmware for that as well might need to
be added. As this firmware is just needed for testing purpose, I thought
to add this to ti-test package.

If this is not acceptable in the ti-test package, can you please guide
me what would be the appropriate place to add this firmware in this
scenario.

>=20
>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>> ---
>>
>> The patches have been posted to oe-core to add the package support for
>> iwlwifi-ty firmware to the respective branches:
>> - master: https://lists.openembedded.org/g/openembedded-core/topic/=20
>> master_patch_v2/121309633
>> - wrynose: https://lists.openembedded.org/g/openembedded-core/topic/=20
>> wrynose_patch/121309627
>>
>> =C2=A0 meta-ti-test/recipes-core/packagegroups/ti-test.bb | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/=20
>> meta-ti-test/recipes-core/packagegroups/ti-test.bb
>> index 8a348c26f6e8..9064bf276d40 100644
>> --- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
>> @@ -117,6 +117,7 @@ TI_TEST_NETWORKING =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strongswan \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcpdump \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xdp-tools-ti \
>> +=C2=A0=C2=A0=C2=A0 linux-firmware-iwlwifi-ty \
>=20
> NAK.=C2=A0 Please keep the list in alphabetical order assuming that we =
are=20
> going to take this patch.=C2=A0 Please see above question.
>=20
>=20
>> =C2=A0 "
>> =C2=A0 TI_TEST_STORAGE =3D "\
>=20


