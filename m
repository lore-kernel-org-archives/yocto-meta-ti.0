Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1EAE67487
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 00:10:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50735.1766275807502387586
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 20 Dec 2025 16:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FfFFH61v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4450c23d9e=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL004n63471068;
	Sun, 21 Dec 2025 00:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=z4N1Csx2RnhlaNIlR4ddD6ueQ9X+sZ47qtzFcenDnlM=; b=FfFFH61vsAuv
	ZdJ4aOXNs35fje3qfPgKZXlwwvZBGn+K+Ig8mw5rkFYc2Pl1pTvxKYeVWrpXvTvn
	7Nw/taK7E88ZltYwnfnmiVGFXSc/WwO3EMIyENKbcCH+wM4xEFhbEFllLKmKTXql
	F9JJ/Y9xtZwtV8NbciKJzUOHUNIECu0bqa96I6s7uZP/FkX5o4ONFS2tnF1sbX7r
	0n++VBkJYQj7+tcU8xczsrA3QRqtHX+DC2WBOC0GNK1Nen46YZ9Ec26MyU6K3/3O
	qrv44JD63M7qU2NSfeykWUBoLuB2b+l1FLqE6zO17T7F6TDLtW9yC517+TcLWYa8
	imxuePMBaw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js70ndb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Dec 2025 00:10:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVoM1wwCBnN1ejb31DtFc/f35BAeG9J/pqAy2L89lSQmI5RS9w4z7Tr8dJ37romKuKKz0Tfao7c+5pHTHkJ1wHI5oNpToyPaQilnQOF8gOx+ZmGScnbcJpVcsNUe95n/HevwnBHLfRWRTtVjC6RPnQoAe76w0ZSGd1QfKAgJhbvDuikz0Tp6SwHAABsWZk4AN0nG8sKSBJDoLcHSn9MPb9J9QWUla7VPMMbg06Xice+2hoTVLmBoxtXnB8dY7/RHZS+uB129g3KQCrP1SSO1Buj263Hurg3E0CQkxtRfWSRn2FLkEKHgu4PuDns1lqeSJFBzBki9WgRcnIfIWMtV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4N1Csx2RnhlaNIlR4ddD6ueQ9X+sZ47qtzFcenDnlM=;
 b=CmG0z1HoXbmsWEppGhwRtiOA9LqgO1NzJfbhtC5yhdGsPqiEOHfe872hNVB6AGxHYkbovexMcLUdrBid1+KV4XuPBTy9rHfUCNap2o8xoD66Vhv0rbOLBJkD7nQhWtKbQzlUEMMdsvDT1jFGF4OyuGuCppmERFMgEM/8Lzu5UzQIMxOTIriq2kxAreXQ+Hgi+n8UOKWCIIfqxSUBGFFAJAcwryVMRR88W5Q/eb2/b2ZQzrEP21dJDtgWYoHMHBR35uHofiqaZKL/2UlgfYG5RCC5j/z8jbV832hOfENWsKnlV91qgkGciFO/2Vs8yhdlgdoabw92JKoR9bg+BzEgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH3PPF37A184CA6.namprd11.prod.outlook.com (2603:10b6:518:1::d15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sun, 21 Dec
 2025 00:10:03 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 00:10:03 +0000
Message-ID: <c4181c69-e719-494f-9864-563a22cd7980@windriver.com>
Date: Sun, 21 Dec 2025 08:09:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH v2] trusted-firmware-a/optee-os: Add
 LPM support on few platforms
To: reatmon@ti.com, meta-ti@lists.yoctoproject.org
References: <20251128184125.3220124-1-m-chawdhry@ti.com>
 <20251128185058.4131726-1-prc@list.ti.com>
 <281355.1766243294658107429@lists.yoctoproject.org>
 <c0dadd48-6d6b-444f-8ff9-170919398571@ti.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <c0dadd48-6d6b-444f-8ff9-170919398571@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH3PPF37A184CA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da35f3c-0ea2-4d29-d9c1-08de40254a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y0JJS2JIVTE3R3dOWDNYYis3WVV2aTNLNnBlNncyNTNST0ZLaitYc2IyalNT?=
 =?utf-8?B?VzZ3Y0o3VWdqeDlJZTF3N3k0ZVlKKzlpbzhsWDROeUJEckY0WUs1c1dNb3dv?=
 =?utf-8?B?Rm1EaDZCTTgxQ1JLSU4xSEtMUEpnOFQxVUxXUFhRYXdDSVhsMlEzSzJJbU5F?=
 =?utf-8?B?K3FTSExlQ2FvMmpVcmJDeS9sQVE0Ny9PaVhRdWJlMnpldjJMeDZ4RkFsQjR4?=
 =?utf-8?B?TFVQOU9EaVQxb3ZhY3prUFBnNUVGMEVsMmw5d09jNnhpYXpEdE94cVdZQ2FW?=
 =?utf-8?B?bnROQVFUdUQxd2RDdTNEczZsL3lhcTlIckpyZDBrSFk3d1dYMEVPUVMzWTN4?=
 =?utf-8?B?LzZTbGNtNlBKdDBWeEE3WDBKOXo5dWoxTmdrWnh3YVczQk82OWJZekcwTTRK?=
 =?utf-8?B?RzRZNm9PaCthTVprK2dtRkhrN1QvcWQrWlZ2T2JVOUxBWnhsNVdNVFRNOTBF?=
 =?utf-8?B?ZVRIVmQ5V2hKT1hDMlJsT2xUcm8yQTZyYWJVRDJZaE5yZ0dndC9zb09TK3Vr?=
 =?utf-8?B?NG1hMGxUU3NwSU1LZ0NRS3VybWUvNWdHZk9XUGNxSndRN2NiMFpGK3V3QTVm?=
 =?utf-8?B?WWNsNGtkSTlTYWZEQlZYWklURUdiY0wxdTQrVkd2RlZKbHR2d1hBTkFQcWtq?=
 =?utf-8?B?MUxkNld5U2hIZVB1NFlDS28vTGlMWmhTbGNFbWNWVFFlditSOTNLM1BxQWkz?=
 =?utf-8?B?aEQwc3Z6U2NqMThFaWNNL2VCQkZFTlJCTHkxOXg4VHJJRzJ0Zm0rMDlScjJa?=
 =?utf-8?B?NHpIK1BBcU5COE9tdW9BOU1zMUo2QUhNMVJZUTk1RzM4VXZhTGt2QW9NQlFC?=
 =?utf-8?B?aURuYm9aQmM5aHgzTFNZYkRmVEd2N2NJbW02Qmx5LzJ5YTdKbmNBb3pIUWx2?=
 =?utf-8?B?NDd1dkZsRm9BNC9aaGpzZ1QyNkZsSEVnc3pETWV0YS9RY3RJelpyM0tXYmF1?=
 =?utf-8?B?bEpWNzFkaURHYXdyb1l3ZXlSdS82U0xzTldPVTZETHVQZEdqR1hwa2pmMGtl?=
 =?utf-8?B?OE1DdlZMTTlseWszSXBrMTVZbjUycUpGdVJ4MVN3dUYrQ2Jsb2p3MkZjYjN2?=
 =?utf-8?B?eHhwTW5Jbks2d3FaS0FLN1dEN21qSDB0UVl6ZXVIV2dVTkZFRTFPNktBcWlK?=
 =?utf-8?B?bGszYTBDSEoxaGIwUCszSW8vc0VoQW1yeklId2dHMnNzNzJCUFdUL1VhVU0w?=
 =?utf-8?B?TFpNVFdyUm15STZYK2RRWXlnQUZua1hWc25ZNVNucGlQM2xQYUJBYTI3Y2hk?=
 =?utf-8?B?MU01eFVGZVNnU1hmL1BQSlRWY2s3dFhoc0xGOEM4L3B2VGczUjVTM3h6V0tO?=
 =?utf-8?B?UHNzeDBRVzJGNlQzektpM21sK0lOYU91cnc3aGJSSnJsQjhPcndFTTlPaHlB?=
 =?utf-8?B?RXJxNXlmWG05R09JTnVHU09SRDE4TVhnbjJnYmQ5YzJxUkx3ejBldjg0QzJ3?=
 =?utf-8?B?dC9aNXd3djJqVE9INkp4ZFRranhoTzlFVDVoOWw5UVNNOTZXQW9QZm1CcEtH?=
 =?utf-8?B?WE9Qd0V1eDVoUWpodktCQ3VnUVRVbERvb0dPYk1pRlZMenBvcTNacFdtNnhW?=
 =?utf-8?B?c1ZLcVVKRFd3WkRwZVUyQ0tpdEFGeCtITitVTStiK2t6OHczYTR2cHUvTlE3?=
 =?utf-8?B?VUxtaHQ0WnZ0WkJMNm91clI0K2lQN3RqRjRDcGZsZUMrWDVNck0yU3luRzFU?=
 =?utf-8?B?aW0yUjB0REZsMHhIdTZTMEFtYlBpbFl6WC9XUjk0UEpUNmJDdklSWEc0U2Fn?=
 =?utf-8?B?ck9JOWF3eklUSFl3eGhobkF2T1FRVVdtOEJ5elJMYUpqQjNJNU5XcURHaDgw?=
 =?utf-8?B?S0YxY29VaGxUV01HYUMvejZld0g5cFhRRGc4cjNqdXNZdm94Z3phTm1FQjEw?=
 =?utf-8?B?UTVjL25yeisxL0xuZ3dONHorT2x1NFF0Mkl1aUFKWTJuRXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enVHTEFNeGcvWHZzaHFiNko2bmR3Y2x1YVV4bCtrb0g3ZnZ5RG50R25COVNL?=
 =?utf-8?B?c3crMkVIcUVHOHp6QkZHQXdQZGdzTW5oZ1U1dDRNb1J4ZlVhNU1lSG0vRVBq?=
 =?utf-8?B?Q1QwRXJRNXF0SFdWeFpsM0xoalVrUUJ3SzN6alZNRFBEVm82YjBYS09sZVlD?=
 =?utf-8?B?V2YyRmhnZ0hVN202UWNtQ1d3V24wSGZTTnVlaUVHSzBVZnFJQ2UvZlVNQmF4?=
 =?utf-8?B?Slh0YVMvd0ZsVVZQQUdBeVUrK1dnODJvZ2N6dEIwSEVxYjB2WndWdXVoSVBM?=
 =?utf-8?B?WDBSMDVNMW52YUVndWlmM3pRRUxzRGJFZmU0UTQxK2ZYdG1OdDh6NEV2T2Rq?=
 =?utf-8?B?MW0yT1U2QzdFNUlVdUxmV04zY1pVOStZY2sxRW4yZEpPNmJoMzRIVGhNSHJB?=
 =?utf-8?B?cXdNRVdhMWRwUmY2UmJhSWNLWmU1djM5Q2hzdVRrb3VRZW05ZFhxbHR4d0dN?=
 =?utf-8?B?QWhzNnMzY0ROaHdpWlFCYjlySUY5Nyt6S3hZWjdFT2xzalNYc2F1ZS9rekFJ?=
 =?utf-8?B?dnpZNjZSWWhURE9zYlRZdGU3ekR1aDA2TlYwei9sR2daY0tWdEwvQUVldjVs?=
 =?utf-8?B?UmZTenRMZkR5QmtNMEVpWUZ3eVFKWmppSVg1Y2lMaGV4Q1Q2cVYyRGg1RHJk?=
 =?utf-8?B?cXhHUDlsWTVjQlh1bUY3VmdiKzlNek1WUkRiWW41NE93TlM3UDNlTlhnS3Qr?=
 =?utf-8?B?ekoyRW1pVktDQUgwS0ZqWFVxUEtnd0JFdEVIY3d6aHg2bzI2QUVNNSs3QUFB?=
 =?utf-8?B?TFJDZEtiQkY5QVFhSEV4Si9vK0NkL1pHV2VLOFAyUFZzajIrZ1U4WE1jYUVw?=
 =?utf-8?B?Y1pLSkhRUEQxdC9NM0tTOVl1bkNQWU83ZTZDRExKSG9KZm1VbThTVm5ZTjhF?=
 =?utf-8?B?U04zYS9KYTZPZ2tuRyswK2tZQW4rUmtnWmR6NTRWZHJTalczV0hTSm5zQ0xX?=
 =?utf-8?B?a0J1bXNWZkUxaVExbnlCMzI4ZFVZS2xJV3Vrb0g0R083aHZLZU9qblN2Vm5s?=
 =?utf-8?B?UDEvR2k3c292SC9BSTlFNW5FVjVrZE1yVmZjQ0JmZU5EeUJrNG1TNVhFenA5?=
 =?utf-8?B?cFpza2U4dkp5MHdra3RBZzY3Q21sTUdjbU9kNHdqS2txaVJWUHV2RUEyaUxD?=
 =?utf-8?B?Zi9iREwvUEk0bERnL1ZqNVd0NnhPM3dNQUNtRTRUaStrMDB5WG1vZlh3WVdp?=
 =?utf-8?B?dWVpV3JUUGZINVFrakpjOHdlTXZ1Q2dOelQ2WmlyWno5QXNpcjArZ0tsRkJS?=
 =?utf-8?B?OFJhRGdYSlRxQnhZWW1GdkxQZ1U5eE82YmNKanptMG40c2d0Zzg5SDY0TEw1?=
 =?utf-8?B?NWthdUNUMEIyUm9PWmJLQno3N1RmWXorZEx3dWdFK05aVXJVWndpYnV0bUdw?=
 =?utf-8?B?blIyMURLK25Qdm9EditPSnlpZkdBY0hseDNGa3pGSk40SHNueklJODFraUxr?=
 =?utf-8?B?eE9sM1lXOUw1cW0yN2RwT3IydUZvdk1odDgycjJFWUpYVE80a1VDcjQvblhQ?=
 =?utf-8?B?MG9QdjNrd2dEWDBZOCtxQ1VPOTA3QjlmeDVqMmtHN3N0RFZZOG01Qml3M292?=
 =?utf-8?B?d29wanZ6UVpNaml5M0lrOERYTFk3bldDdmxyZFV2RGNmMTNKRzQ1ekFpMkNM?=
 =?utf-8?B?VVBWTnY3SzdCQnpkblpoQ0E1cjB5bWlSVTZIS2VCVTZLbUVRUHBuc2hWMWEz?=
 =?utf-8?B?WHdKMVdBWncxbDBXaGwzaGQ0NFlGUHhrUW1VdllETjV5bVZoZlNLcDVieEc4?=
 =?utf-8?B?TmRYOU5JQ29CMU54V0JZbjIvTm9oWUk2c3JrbGdkYmlzUzhEQ1ZYczJPdUx6?=
 =?utf-8?B?NEx6UnZGekV4QTJzNFVVYStuQjEvTmFMZklPd1F0Y0FjanlKNzdLQS9tbGdz?=
 =?utf-8?B?WFNBeXZqYm04a1M5Z1lvTFVvMHNCNVFQRVJLUEtFSXNGanVrQmxNUEV0dWRu?=
 =?utf-8?B?anM1SHExeGxtTmM0VWRpQmM3UGR4cURjS1RzYXVZemh5UDNZcVpzcXp3QURt?=
 =?utf-8?B?YVhweHVwc0N3cEx1M1ltWGRwNDZzRmd0ZFlEUmRyK240RGQvM0JyeGVJa0Y1?=
 =?utf-8?B?M3o0M256K3gwN2NoZXBpRnVJN2dqSXIyREorcnhnVjFJeW43bHEvQmlTaW9x?=
 =?utf-8?B?YjZ0b2lPOTFHakREZWpEbHNTclBqTXVlN0J0endmaUtmN1lSa1JzbUQzUzdP?=
 =?utf-8?B?K2tnRkhYUkp5eWFFazlIeUdXNk50VTJOcmhEYnNBU2N2Yk5JZTlWcklHK2lm?=
 =?utf-8?B?MVZpd1gyZkhNUFdFSTd2MlRBN2R5cFowL2E2cElpTHU4NW5nZEwySjZqZDVH?=
 =?utf-8?B?SkJadnRKVEJwT3MwNWFsb25razY0OG1yUmRwT0VDQXpEMkxudlZZaEt6NnRL?=
 =?utf-8?Q?YjMryUyoX93DZEyc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da35f3c-0ea2-4d29-d9c1-08de40254a3a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 00:10:03.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRuD4lldAwxMVvNDhwdWdwDz5jn2xIBOSd+45qoq/BHbNmovoL09QVM7bbLDN+OyxADZufmLoB8vul9C9IaKcHI2Qdw9+XPku81Nyouaadg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF37A184CA6
X-Proofpoint-GUID: SpFDqYsWFCDjrMcgMvlzDFaYvziuvZs8
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=69473ade cx=c_pps
 a=cgmL7KMsZDthlzKGM6UXqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8
 a=t7CeM3EgAAAA:8 a=ANZ9y0c7dvlPAotMMfIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SpFDqYsWFCDjrMcgMvlzDFaYvziuvZs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDIxNyBTYWx0ZWRfX95+3jekQ+OqQ
 CgBskWLDgkxM9N24cPp4V5sJzn5pYAmvjCyOgUhZXl2HvBiJ59KYoY8Hx8FcGU8V698sNjMhvD0
 0ip3nhQoQo711krlvHA35RNM57YXUjOjes8sw6zJVz+7rhiQ6h7/EPJoCPjMGUigvFl6p5fSwnG
 ged2AvrFeTJhzURHWROZtuL/2VC5L2+SL3mqY3poj+wPNoHoulsH6qh7zgPLkwgq1mva0WWNe7R
 1NtyMeMQfMUwehYMnpoxcT/tAIMaGh+LqONvJrsHLiovcL378E4k7oBGFfkkXDxiJ77s4o91xc6
 GQ9AKsFsrfDX5D2GQmeFcfckWC7WgMnYSwoC6IRZP0X/pLcSp+3FFxgSg+7WfGf9eZ7QJ3YuYL+
 kdNZpHWydyAPzHCZVQmP9sYgIBajjWpI7FokHXRLPL0VgnTPx4EJvBDdafXNeJ1nuOODOsYc18w
 6xUU838FpYt2ymgUDGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200217
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BL004n63471068
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 21 Dec 2025 00:10:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19386


On 12/21/2025 1:10 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On 12/20/2025 9:08 AM, Yan, Haixiao (CN) via lists.yoctoproject.org=20
> wrote:
>> This patch failed to apply on scarthgap.
>> the version of trusted-firmware-a is 2.10.4, the patch is not=20
>> suitable for this version.
>
> The recipe in meta-ti-bsp that applies this patch, also moves the
> version to 2.13+.=C2=A0 So I'm not sure how you are trying to apply thi=
s
> patch to meta-ti scarthgap against a 2.10 trusted-firmware-a version.
>
> Clearly you are trying to do something more than taking meta-ti-bsp
> scarthgap at face value.=C2=A0 Do you have your own layer in your build=
 that
> is also changing the SRCREV of trusted-firmware-a to a version that
> might not accept these patches?
>
>

There is no 2.13+ version=C2=A0trusted-firmware-a on=C2=A0scarthgap.

https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/trusted-f=
irmware-a/trusted-firmware-a_2.10.4.bb?h=3Dscarthgap

$ bitbake-layers show-recipes trusted-firmware-a
NOTE: Starting bitbake server...
Loading cache: 100%=20
|#####################################################################|=20
Time: 0:00:02
Loaded 15169 entries from dependency cache.
=3D=3D=3D Matching recipes: =3D=3D=3D
trusted-firmware-a:
 =C2=A0 meta-arm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.10+git

$ bitbake-layers show-appends | grep trusted-firmware-a
trusted-firmware-a_2.10.4.bb:
layers/meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend
layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
 =C2=A0layers/ti-j7xxx/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
%.bbappend
trusted-firmware-a_2.10.4.bb (skipped):
layers/meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend
layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend

 =C2=A0layers/ti-j7xxx/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
%.bbappend


Thanks,

Haixiao

>> NOTE: Applying patch=20
>> '0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch'=20
>> (../layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-=
firmware-a/0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patc=
h)=20
>>
>> NOTE: Applying patch=20
>> '0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch'=20
>> (../layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-=
firmware-a/0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch)
>> ERROR: Applying patch=20
>> '0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch' on=20
>> target directory=20
>> '/build-ti/tmp-glibc/work/ti_j78xx-wrs-linux/trusted-firmware-a/2.10+g=
it/git'
>> CmdError('quilt --quiltrc=20
>> /build-ti/tmp-glibc/work/ti_j78xx-wrs-linux/trusted-firmware-a/2.10+gi=
t/recipe-sysroot-native/etc/quiltrc=20
>> push', 0, "stdout: Applying patch=20
>> 0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch
>> can't find file to patch at input line 39
>> Perhaps you used the wrong -p or --strip option?
>> The text leading up to this was:
>> --------------------------
>> |From c79ff3679a4360bb848b01d4036c365533fcf791 Mon Sep 17 00:00:00 200=
1
>> |From: Richard Genoud <richard.genoud@bootlin.com>
>> |Date: Tue, 11 Feb 2025 18:20:17 +0100
>> |Subject: [PATCH 2/3] feat(ti): add message to encrypt tfa during=20
>> suspend
>> |
>> |At suspend, BL31 with its context will be encrypted by TIFS in DDR.
>> |Encryption is needed for security matters, so that the BL31 is not
>> |modified before entering suspend or early at resume.
>> |
>> |We only need the encryption function here because the decryption=20
>> message
>> |will be send by the R5 SPL at resume.
>> |
>> |Also introduce the LPM_ENCRYPT_IMAGE cap signals that FW has the=20
>> support
>> |to encrypt the image using the TISCI_MSG_LPM_ENCRYPT tisci message.
>> |
>> |This is useful in suspend to ram cases where we would like to
>> |store the encrypted image of a secure fw instead of the original imag=
e
>> |itself in the DDR.
>> |
>> |Check for LPM_ENCRYPT_IMAGE flag in the FW capabilities, and only the=
n
>> |call encrypt.
>> |
>> |Upstream-Status: Pending
>> |
>> |Change-Id: I266472da87dd0821493019b2d9853f8886f33811
>> |Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> |Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
>> |---
>> | drivers/ti/ti_sci/ti_sci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 36 +++++++++++++++++++++++++++++
>> | drivers/ti/ti_sci/ti_sci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 7 ++++++
>> | drivers/ti/ti_sci/ti_sci_protocol.h | 32 +++++++++++++++++++++++++
>> | plat/ti/k3/common/k3_psci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 ++++++++
>> | 4 files changed, 85 insertions(+)
>> |
>> |diff --git a/drivers/ti/ti_sci/ti_sci.c b/drivers/ti/ti_sci/ti_sci.c
>> |index f0813e5b0..ee5f7166f 100644
>> |--- a/drivers/ti/ti_sci/ti_sci.c
>> |+++ b/drivers/ti/ti_sci/ti_sci.c
>> --------------------------
>> No file to patch.=C2=A0 Skipping patch.
>> 1 out of 1 hunk ignored
>> can't find file to patch at input line 83
>> Perhaps you used the wrong -p or --strip option?
>> The text leading up to this was:
>> --------------------------
>> |diff --git a/drivers/ti/ti_sci/ti_sci.h b/drivers/ti/ti_sci/ti_sci.h
>> |index 1f1963274..2afa11317 100644
>> |--- a/drivers/ti/ti_sci/ti_sci.h
>> |+++ b/drivers/ti/ti_sci/ti_sci.h
>> --------------------------
>> No file to patch.=C2=A0 Skipping patch.
>> 2 out of 2 hunks ignored
>> can't find file to patch at input line 107
>> Perhaps you used the wrong -p or --strip option?
>> The text leading up to this was:
>> --------------------------
>> |diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h=20
>> b/drivers/ti/ti_sci/ti_sci_protocol.h
>> |index bdd24622a..a165cda99 100644
>> |--- a/drivers/ti/ti_sci/ti_sci_protocol.h
>> |+++ b/drivers/ti/ti_sci/ti_sci_protocol.h
>> --------------------------
>> No file to patch.=C2=A0 Skipping patch.
>> 3 out of 3 hunks ignored
>> patching file plat/ti/k3/common/k3_psci.c
>> Hunk #2 succeeded at 269 with fuzz 1 (offset -14 lines).
>> Hunk #3 succeeded at 321 (offset -32 lines).
>> Patch 0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch=20
>> does not apply (enforce with -f)
>
> --=20
> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19385): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/19385
> Mute This Topic: https://lists.yoctoproject.org/mt/116517214/8599992
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [Haixiao.Ya=
n.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

