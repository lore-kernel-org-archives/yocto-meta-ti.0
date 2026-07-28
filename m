Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D4BC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:16:52 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12355.1785248206632310668
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 07:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=U8f32Ivd;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=NZAN83nS;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66SDOhGw1360443;
	Tue, 28 Jul 2026 09:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OBlvBJOmc+18lldRuAhq+1dlc6owg4w/wQGCaitVb
	Ec=; b=U8f32IvdyFHRLz6B2hB0ZzoCZgvHaxybo9nXWMJmymlx5XF5P3Wv0lDYy
	htTKIHvvW1D0qm8LDwwRKwMkCqjM/Jz6nPE0fU9B9Mm6CRQD5HCxAB+KdMz53GCB
	LAlaLgO7BnUwv3hCkqUkKzyvTRhRjJtzvj0XfXWlmfpT1B/HaHowfOyLbiWOnVt4
	3sS9DDOQ2uJUmuVeYoCCGIynLuRqxkM3Nl63GQtTdKldMfunne1dQbTdyYaTHkx7
	nkdcMTv+cuIxGlQ1/MqdrGxdx2Qz0DdczSLcXLvBCi+/g0iQEg+HIX1KvByzI2zN
	6AAO3qYIwNGRwqXzOjbWEHrBTZmCA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fpsdk1qar-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 09:16:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGRJsnTEWfn1+mUg8o/BVZn7/SUfFRbaVct/ugTM8kzoY/mJIEvNyCaGxFOOXHVmrEvpTDGd9oeRwwiNXKqJ2X8OfPbgUPxfRYQPFJhu7SrMz6OH38h6jqVshdpamheqv9whA8xTq60Db9VrftNVqbW3soovhjo27dTePUi7LepF5hpd6qBa9axpDhqNIhhMjzC6V7ctV5VdGGnk39nVdZSLIra5UvNxzhUQa2zduh1AUUNrCcNO4ecGcLt/ZEROwnIrcggZEuRaRrtp3uqrguUVxqsDwSmzdARvtsKFhcTPzZFB5AlLCWQ3uB5yoWjMnCZtCSTo4z5mL1R4ZR6RjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBlvBJOmc+18lldRuAhq+1dlc6owg4w/wQGCaitVbEc=;
 b=I+T9oU/qmuZgV3PYJT2wmijG5Iff7z6NnuZLlddbX/+Z8NCik/ldJ/Jo8X6n1U6YDL0fcrQG9LD4cMBI9UXwVy95qO2OWOcKMI+IRhjcCXS+55SrwSc7MZQdABSAQQCI68QoY0/E5m3zcTMmxesbf1TS++tlLRhu/yj/4hkqaQXby6P8JSIP1QKZMrOhOs58AelgWct4yIefHw0YgLlVhGdMKZ0XBYF/aigiUQxgnR0qbXdrOf75heNEOQgP1szK3XyKbP04xudV4urfQwk9OQIB0a6m2sQbj5Y6HLNQ4p+7J9pMz4viFiB8wnNDyRNniAFAM3seLar+BzFt1oqjiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBlvBJOmc+18lldRuAhq+1dlc6owg4w/wQGCaitVbEc=;
 b=NZAN83nSWkuu1wZ6I11g7oQxNJZkESGarrm2+/uB8xhxdIdEQW2m/X4EioYVsN5/egfpxihX2wwspyaUel6VDjQTd4ZLgG/xloU6U4e5d95yhlbB3l75Nyy6pQk9FtOG/Ud+Khx4WhB1zrgN+cCKo0vWiENCMoq+HTG+MuF3vSXM2ZyL0krFRl9N2fivCIdTQ7f8T5BAB/buI1IFyKub+rAYqQ4FKE2rdJm9LSNpcpN7WwGKDZOHUk9/9Kwln++7k17PC/8Yk1Y4Fs/+fcvR3ZMViDIo0c014jJsKdo33cUws5F7DJbfkLwO03CyR7lKLAmLRqf72egcDrvgcWksqg==
Received: from BN0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:408:e6::30)
 by CY8PR10MB6609.namprd10.prod.outlook.com (2603:10b6:930:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 14:16:42 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::21) by BN0PR03CA0025.outlook.office365.com
 (2603:10b6:408:e6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend
 Transport; Tue, 28 Jul 2026 14:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Tue, 28 Jul 2026 14:16:40 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:16:09 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:16:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 09:16:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SEG8Wl2831979;
	Tue, 28 Jul 2026 09:16:08 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A55ED9ACF4; Tue, 28 Jul 2026 09:16:08 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: =?UTF-8?q?Re=3A=20=5Bmeta-ti=5D=5Bmaster/wrynose=5D=5BPATCH=201/2=5D=20=3D=3FUTF-8=3Fq=3Fpackagegroup-ti-co=3F=3D=20=3D=3FUTF-8=3Fq=3Fre-initramfs=3A=3DC2=3DA0Move=3D20the=3D20inclusion=3D20of=3D20initramfs-modu=3F=3D=20=3D=3FUTF-8=3Fq=3Fle-netsetup=3F=3D?=
Date: Tue, 28 Jul 2026 09:16:08 -0500
Message-ID: <20260728141608.3901647-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260728141051.2851131-1-reatmon@ti.com>
References: <20260728141051.2851131-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|CY8PR10MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdee791-181c-40a3-ed57-08deecb2d836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8ePM2Q1czHQ2rA7+rvsYVNmmXmaxbYNx5LohNsZAXEx3s1dwUJ0GeLB+iDzqttiWvdkqovvb950Cg1vOBhmzqz4H9G+o1dJtvk4miSy30N35bAr9gQbGug+nGVgBnNdaHxju+PpLjlzbaSbeujKNt5VDs4fX8OwNEPu0A5UxRNXNxJfVQxF15SQKeVCVBh4Ph0EFVqdycHWx2jxN1tw7z3mtGxhhkRJyTubUN0PUpCJojweSgAC2mvi/I9vycIoY6Ner2zaM/Yre2vvxI8mTuB9K13crH4h+xPhIEMuVmUmK5qKjvdRRn5fLWO78Ng6yf4ZoiGD8FxMFScsYgj0VEpodLVPe3+YT2AE1kYzQfyJgSBXPdd8/xAWrvoin3zMvA3MlXohqSPCgSGTimK+s7witV4D80PJ1+VBNdFxIjUEd+9DyDoHnHrzIt6drGPdvf0INLRw/QgmfFj+8f9zGMs46HpHcbfSg8VYapsA7dN+zDY0jM8G77JCBf0wXB5f2eD5jbgJYwFGZUlQbc45uC1fWIqKCuNHP+AbreNpLR0yCTvzfZ27rUPdbwhN2XCWAWP71B5rtEiuBmSsJWhHKZ8GqldfrMoZTYWHXRjwVQBIYY9sqTPgx1am023xzv4kxPfi+RbBnDqdj6UhEvK9yG0PqFZbTPvwQCRacyIVmE+P4nV6hHMMAAr2B5L+LQNi5C4iw4N+2x/5GvAGolnQsrg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aQhx9UuamWOEjJH5BTnwhS50OaQJsiccXoC3x1506UOiyEcGyIeeoiDqZ16/hlXytYY4Dttbnz09r3d4+dGNFGrdf1so9c2ceF5hPPY9U2TYGFkIVcALBaHU5aeQU115Zuvfp76zk7jdnIXdfe/2GvkrSWRRc7U+wU8Ys35YV1VFEk0lTdxJq7qSCvuRURgACwMHDAVTJjhPL3tr7UT22EEJFz8qka/iQ1r0AAt5mMF6IWKo183GyurMELd9aPOoGHk5kBiw2KGgoHKaz1PVTKo/90+JTwAUmHKl/twdY6FtsZD3QAOPXV+9g61lowadPAwteLS/ka7UY8MtZR8+QKXaD33ZabvGvW5EKPznkwyLPOBokDkMSlWs5ONvhLOJgaanKQaLjQEvZ/8vSiV7Fr2ZfKPiVeGVn4BS86g1JWbHD89mjQYluOKf/tZ+7yvk
X-Exchange-RoutingPolicyChecked: 
	qycOlgSXT3AkrdS7lMCoiAdZDqrh1Zc4reO9T+lot2zUmoDh9/JKB58NwsOOwS+KK5WJtAovDCKPK9lrZd6FT9n6R0P5ugyiT2c9XmiZ2YPw9IKqaL7LFlFpEEPftfi4t5M//Z6I5bY6Dhts+Mo6soOMTDJj5bfLEZAt5MFAvX8EXhxiI0CITWXmSjRKPXE/Dyi8CHiXZrLbjUw8Qoy6XnQPa0Ob5M9goIsobeuPQ9cUBCHl0NtrTyu5p1CkuoEnqJEf2G6assBV1LF30p3g/RxnZ7Yva+jN17VksPZ8+f8yBolIF8MraubYOFZ1xKTGihYyrGe7fgG//QcDgm0Xyg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:16:40.7825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdee791-181c-40a3-ed57-08deecb2d836
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6609
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX9niyM7ONdOUw
 KiOJJO5CFeFKJoFrKYKr4mBGKYiw02v7G2yaw2Y2nuqXw1r2/JdyTEWGP7MNFO9NmP+aPf9EiR9
 IBh4U8AWm+QH1n2diJLSefniK2oLQ+A=
X-Authority-Analysis: v=2.4 cv=e9M2j6p/ c=1 sm=1 tr=0 ts=6a68b9cd cx=c_pps
 a=JPuSXJPnATmcGobPKBfcew==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kDeZMpuwydtpxam39mrOkGAi3UQ=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=5KLPUuaC_9wA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=8lMGzrT385Tl5sL8k_YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfXy5JAg/3ncZ3S
 GTd4KLBXyvcmxb0pZmZ2QlcAV2PVAp/7O78AwnrF8Vs3FzEB/3WP9OjKo+HzuJjNbfWyCaOESOI
 pyu8Xpa5a6mLU1KdXBmr19ks97+Lbdi6MKoYLxJw01410ofwThK7FDbCvpR2X4ZkwM35KBwSh0N
 ZlBWbY/SsLhNSYGuR/I9oRMgZO+tRDyef4hut39dClD6MsY0AeR+H2Wv7apbYx6+UPSyL+81fLj
 N1SPJ6mmATA8rSjp+t7D5XtxH7n4cPN6GwH3j+0mEzvWzobZ7vk00BnCpytc79AN5NYanVT9u4E
 NwLT8H77s2aO2gljfX2ErpXSYVMXBr1Uzi6bWek6T+M5+l8OOKhRRnC4rW+I73nS+Pb2nfigdCZ
 3zBdlr6zjBlljPaq4JuI4A9JNmLHGjCJ16wNbj+4j+DDScATp4fb8aBO3D25kGffz1QbwujJbee
 MFygM1dHPXiJgfLpDPg==
X-Proofpoint-GUID: QJBfhGCaR6QwJyJZqRNwtRhAWAogPwAv
X-Proofpoint-ORIG-GUID: QJBfhGCaR6QwJyJZqRNwtRhAWAogPwAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280126
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 66SDOhGw1360443
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 14:16:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20198

meta-ti / na / 20260728141051.2851131-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-ti][master/wrynose][PATCH 1/2] packagegroup-ti-core-initramf=
s:=C2=A0Move the inclusion of initramfs-module-netsetup
    ERROR: Commit message too long (> 80 chars): =3D?UTF-8?q?packagegroup=
-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D20inclusion=3D=
20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D. (COMMIT-MESSAGE-=
1)
        patch:90
            Subject: [meta-ti][master/wrynose][PATCH 1/2] =3D?UTF-8?q?pac=
kagegroup-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D20i=
nclusion=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D
   =20
    WARN: Commit message does not include file/recipe name: =3D?UTF-8?q?p=
ackagegroup-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D2=
0inclusion=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D. (CO=
MMIT-MESSAGE-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctopr=
oject.org/g/meta-ti/wiki/40887




