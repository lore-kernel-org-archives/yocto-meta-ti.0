Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.121])
 by mx.groups.io with SMTP id smtpd.web12.6267.1641385048525111073
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 04:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@honeywell.com header.s=selector1 header.b=HWY3nmdU;
 spf=pass (domain: honeywell.com, ip: 40.107.244.121, mailfrom: nachiketrahul.jagade@honeywell.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7kaR9MhJg5/5ThP9zrRz+e4HS3Q9WyQu6w+tC9m5H6EMth9gDmJvTfoa38WxddF5YmzsR5afymhWiajZ4vUXfi5Aa2E2hsfLI//dCVq/VzyCRtws4ntj5sdJFJC1XoNmz0ew62dT7OZedcgbQHRn7mUQPZ61/8w06v28p2oZvzBx3ADryOHDZnYXq4k8RKFBuoKJx0E6yVVi1DOLsLKZexalsb7ld0FaFEDDReU+hDug0DFK0JGYqNo6xT474e6F5MRfezjcNGFtTOP05lSgDrctZpPyXkWocS5oHGtm8nX55fNoHcXwtHV2ngAx3B4+jesl9Qeu1svric1DAiryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqj+WJqD9TTquQR5f0njcfqAgA+EAOHK6DM7yTmzDvM=;
 b=F93GunNtX1ot7SoGoiWRmq9MwHP6Zd1npDq3Swm/27S9Umu/R80EqPWpA6KkRxlFH9Yj+a4BiYqCAPaNLpoveOPUJM0cjm2lMRImptKPcmzPaJ81rkFMu1kHxFfMwhBjfq03j/8//jPesEwaRhQnTmFZZXRk2MBZJ5FZFG10hQNr+/xVYHSNPQtF+q/XjN/3KPzkEHTEk718h7CtFpkDX76f+k1Ki1b/fUzu6kfCuh8lRH97rlnhUKCPjUCJFdpFgRPmhcRKtZwe4loZffBDaeloboX66bQjZYH2Y5aGdYd29qtrOvGYi2d7rAwU6C5Z+Vjqo9UbDDD3vBZGTRUPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=honeywell.com; dmarc=pass action=none
 header.from=honeywell.com; dkim=pass header.d=honeywell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Honeywell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqj+WJqD9TTquQR5f0njcfqAgA+EAOHK6DM7yTmzDvM=;
 b=HWY3nmdU40T1PDyY9JMlLG8jUIk8KhNxFt3gs5YMjcK6k0tA6fz2KtSmFbNY6aZ1uEMBGqKbfus4xei4D7dP0shj7GTgCwwcbxVKvpi+5iexQEgwSG0ny1Qm83kjE7z7RGBNDSuppUFayFyCJUBgSzbKHiHlmZqLsIDBpZqp1Bw=
Received: from BN7PR07MB4644.namprd07.prod.outlook.com (2603:10b6:406:f1::14)
 by BN8PR07MB5971.namprd07.prod.outlook.com (2603:10b6:408:9c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 12:17:26 +0000
Received: from BN7PR07MB4644.namprd07.prod.outlook.com
 ([fe80::edb1:dc10:64da:d4f5]) by BN7PR07MB4644.namprd07.prod.outlook.com
 ([fe80::edb1:dc10:64da:d4f5%3]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 12:17:26 +0000
From: "Jagade, Nachiket" <nachiketrahul.jagade@honeywell.com>
To: "Shanmugam, Dhinesh Kumar" <s-dhinesh@ti.com>, "Nagalikar, Shivasharan"
	<shivasharan.nagalikar@ti.com>
CC: "Ankam, Ravindra" <Ravindra.Ankam@Honeywell.com>, "Sridhara Murthy, Vinay"
	<Vinay.SridharaMurthy@Honeywell.com>, "S, Ramesh" <Ramesh.S@honeywell.com>,
	"Duttagupta, Amitsurjya" <Amitsurjya.Duttagupta@Honeywell.com>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>, "Pabolu,
 ramgopala" <RamGopala.Pabolu@Honeywell.com>
Subject: Re: [External] RE: Upgrading the components with latest version
Thread-Topic: [External] RE: Upgrading the components with latest version
Thread-Index: 
 AdZF92/zUqDjv1sTQW2DsM8WmZ/xdwAElzHAAAranRAAADIRsAAAQydwbvCmucAADDVfQA==
Date: Wed, 5 Jan 2022 12:17:26 +0000
Message-ID: 
 <BN7PR07MB464440D1FD4B8E0D4BF7089C854B9@BN7PR07MB4644.namprd07.prod.outlook.com>
References: 
 <SN1PR07MB3949E09022F41FE50476733681980@SN1PR07MB3949.namprd07.prod.outlook.com>
 <5077344257c248b6ba01053c93c463fc@ti.com>
 <SN1PR07MB3949FF8F1965891B4B2E1CA981980@SN1PR07MB3949.namprd07.prod.outlook.com>
 <MW2PR07MB413864A74AA014DEF66022228C980@MW2PR07MB4138.namprd07.prod.outlook.com>
 <f70b86612cf947d0a9997e682f09d2b7@ti.com>
 <DM5PR07MB3943DF7B09CDEA638E450171814B9@DM5PR07MB3943.namprd07.prod.outlook.com>
In-Reply-To: 
 <DM5PR07MB3943DF7B09CDEA638E450171814B9@DM5PR07MB3943.namprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Enabled=true;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SetDate=2022-01-05T12:17:21Z;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Method=Standard;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Name=d546e5e1-5d42-4630-bacd-c69bfdcbd5e8;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SiteId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ActionId=71d100c1-d8f9-48cc-8044-b39a80fef4f9;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ContentBits=0
smarttag: 4
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Honeywell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4b89838-7b0b-4c6d-7aed-08d9d045560d
x-ms-traffictypediagnostic: BN8PR07MB5971:EE_
x-microsoft-antispam-prvs: 
 <BN8PR07MB597115A175D2609578F45076854B9@BN8PR07MB5971.namprd07.prod.outlook.com>
x-antispam: TRUE
x-recptdomain: NotTLSDomain
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wzDFLDcpHudl+Z6CzZys4hc4pTarXNmgJENYFlCMcd3Ne4zsx3K9XEWTiwNaqCuEsdAjSnbpA2qTnd23FB+fb3SFGyI9StdLe/NntBD3eo4wjxm3RbL59MttuowEGNLaUFIfxssNDZdePwFS9t1VLKMSA08po/SeDDLW8ssbVTcZtUUPkJ+0Oqb7TUsXGD7GUxJXTw2sMBqfiDP8r6/5xpmOYc1MoJ2jOSz3CKMuRe8Os7JR6SSLajBlgllzY7apeAReKnSq6xA4M0OPb7/V45mUEdDVoU7p9XFp3JrHcfA+KvrUa/P5GFoqApx8zfstfLr9ZZr2JjPiTpA2gyOg3bnnWc7sz3bm/6hOK1zybMxfO9Auin9RiQH/B4/UuvJdIuQtED1FDiWJnv3TBmwSVMUsg0Njo1uajFKPMjMVBdEOV+/aJe0WmwQRiX0Y+nO4OlzR418mPTzKVA2NPT4teR564GPLHeCmyFE4Kli3XNdFvaxFq91ZJ/Y/6hxU87Yw0rQO4lSPoVs8SnNkv6oMApfWMkdqPFEslEpkbBVFqrvaDXy0Cazi0Y2XRKNeymaXNSPxDzONbD73MbICt8q0jCEtb5qaXofE0HgoYJEhUS6iymfKGlewT74BspCeFkY14GQdbrl0KxNz+T5I/rOHUVCnBXOFt6w4vDDiycw0lmj4jfDmp2SvNdjgFWN04I8kKIPhjPiDvtDR4ymKdQ2Txsh8SO+Cw7Mxf+MmxKGbsaU6O38bmFle7YqMEKZK1AkuWD/D3dviuI16O/nSrL0Up7I+Qz5cG/QvSd6UqgBBPF8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR07MB4644.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(54906003)(9326002)(26005)(110136005)(186003)(76116006)(8676002)(107886003)(52536014)(7696005)(71200400001)(4326008)(66476007)(66556008)(64756008)(66446008)(66946007)(9686003)(2906002)(6506007)(53546011)(33656002)(316002)(5660300002)(83380400001)(166002)(16799955002)(82960400001)(86362001)(55016003)(38070700005)(508600001)(966005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dKpnx0RRu3CfbUa+Iq9Ei+1+N6TbX13TThj+cEjt7ZjSU18V8iulx4cq9uWg?=
 =?us-ascii?Q?bSvnYV3BIUdmus9ydJtOGUQ2Elq6ZD2dEaaWEyBX2juwysGGFQTp33NTAnBH?=
 =?us-ascii?Q?3WPtIfNdln/82zaG42Ks2AlkDqpp3P7v6RuFVYUvGyG4uRuellQ9Ai2fF+8q?=
 =?us-ascii?Q?PgMJLUtHeFhB3Dz4BOoe+1gn2rMIheiHFImwGlMnEUotJELR20KEixJ88Kom?=
 =?us-ascii?Q?99c96rTSv658Sm6/H0bJND44f88VRiFyOHA3im2/SGaj4MJP6QlxQ9vbX/lZ?=
 =?us-ascii?Q?gUyVqBSq4Uwr4Fe7odbZbWgd3y8T7xK91k3X2jYEeu+9UY0+7yQFXG8qfTOT?=
 =?us-ascii?Q?FV3ngcnHyMQQEj3+OWHCojpQglWdDryQvrhfbmGv+l/MTyq8m+WOI2qRCiyv?=
 =?us-ascii?Q?YhAIg+UDLgv6LIWSC89FX6em2Mb9wns+MXiLdCaTe5glDLe/um9E/aN495K3?=
 =?us-ascii?Q?J0U0E9X7hMB6VnshLTWg0AorrX6etLJ62U0G37kicDGEjyKupSsmML9bSl3B?=
 =?us-ascii?Q?nSoQ3M5CAgsfo8Q1e4ret5s7AVP1A6WOh8yHrDNtr8ZkK5pMwFXxFARBhcK7?=
 =?us-ascii?Q?2+Zplgp9jsaPHhuCCwIWf2eGeYp/SItHakMcRz93UGtd6pnJd4snJHODyThz?=
 =?us-ascii?Q?Evy+3PnnhQardGAX38vIu9RMzjT/M+CQV8COYGyVQXOgiu0u6yn0pam3zW8T?=
 =?us-ascii?Q?whfb24ukyMmc+JBKGVON5orzFwps234ri9qq5NPo2QgsqAWHDrizBMFk450v?=
 =?us-ascii?Q?7F0C1DAcd5gcZteYgQRyECkX3fB2FXqdUgwfVRu20uXiMF5yg6j740QUucZM?=
 =?us-ascii?Q?uqDcsv9aVp3GwCYMLAwbu0Qxmtcgg0NKAXy4pd5waDEOOkMdaloaV/IigXyJ?=
 =?us-ascii?Q?dlmg3pwhf2rGZKc6EcV3KLFtkmoKaYogWz1HXtfGmxng10E3+Q1+Dqymwmf2?=
 =?us-ascii?Q?pVVd9oj9iNwuCV58QrvWNeZL09kwageDwxqdHO/b7I40KWSHQdNPHJSpS7C8?=
 =?us-ascii?Q?55yio2UqPXt5T0gt6Rm6k3VoyE9+H/tR7oBIThzkcDCjn2Rs1PFnhNjvHjgO?=
 =?us-ascii?Q?AxgbkJHCLyaAyEC2irC3A6RfD1VSHjis0hexRS+rc4xnWtL18w5PUCdb4Kzr?=
 =?us-ascii?Q?/x6PEvvvUd1UQFHz/iK3QjXC6Wk3knlBluoxC/i1fPYtzNPJcZxDLvi287SJ?=
 =?us-ascii?Q?5DMG5+a26HHHiLhgEyA7LZoxO857AceyFgH5liuKrhORj5HlTb72lMBsABEu?=
 =?us-ascii?Q?XKpuoYyqrZITVL8XCv0HK9jKXPdKQHxQ/EzYNN1ts96zvnSYwD3ZkycNTpdZ?=
 =?us-ascii?Q?rcGB21A1JWiVoiH5mmM+ueGxyttPlefXiQSg3KWoi2PotxipFXM9j3IJm8SW?=
 =?us-ascii?Q?GXBb2GiUZu5ak0SdwqLiaR5AnVtqlpKf9YYVJ2VyHkGXILYHZz8WF67rEDLh?=
 =?us-ascii?Q?YmUNXL4cMlADX3LCr7O3KJwNR38y50ljWs1WEJMmBIGTbosdxEDkRQqwMs52?=
 =?us-ascii?Q?x0XnaxkUb4Ia9GSE44u7wzoSG5O+TmWmE18NP3NB/wsge7Ky32PcS8ANWgLg?=
 =?us-ascii?Q?SLe+XFCdUNlf+JIpe+a/47Lwt4XeR0IO9afa+v9q/sOyytubdUraBKzTUv4z?=
 =?us-ascii?Q?yvMmwioKorwR1wnYZAKrTaFM986FuFe0ZWmF6cqrWk2i9DFole7MZydWrp7e?=
 =?us-ascii?Q?2os7O4JXqgbpPS4ikYRk+aEFxqunzkhgMn7L2KKqUCnXNsxo/rWnlEOdGXLJ?=
 =?us-ascii?Q?pdYKPDhDfg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR07MB4644.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b89838-7b0b-4c6d-7aed-08d9d045560d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2022 12:17:26.3899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9y5lsCAUSz/vASneYRufipue/2V8q+yd7DvXbFBpR/Awc2B6t+tgTrrksnSb6G6kep826Hy/q/FmR1EiNsaHL55TKmjRz0qx2BC6baoi9gJj7GUUD0JyecK9tz2ewlH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB5971
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR07MB464440D1FD4B8E0D4BF7089C854B9BN7PR07MB4644namp_"

--_000_BN7PR07MB464440D1FD4B8E0D4BF7089C854B9BN7PR07MB4644namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Shiv,


We are working on TI am335x sitara based platform.

We have adopted Yocto build as per your suggestion and created custom distr=
o which is a mix of arago and poky.

Reason is that when we last checked, arago distro did not had latest versio=
n of open source packages.

Also some layers were not available in arago and we had to resolve many dep=
endencies while compiling.

We created this custom distro long ago using Dunfell 3.1.2 branch.



Now we want to make a new distro with latest versions of all required packa=
ges.

So shall we go with 3.4 Honister or with latest dunfell release 3.1.13? Whi=
ch release has full ti support for chipset and other drivers ?

What will you suggest to achieve this?





Thanks,

Nachiket






From: Nagalikar, Shivasharan <shivasharan.nagalikar@ti.com<mailto:shivashar=
an.nagalikar@ti.com>>
Sent: Friday, June 19, 2020 6:19 PM
To: Sridhara Murthy, Vinay <Vinay.SridharaMurthy@Honeywell.com<mailto:Vinay=
.SridharaMurthy@Honeywell.com>>; Ankam, Ravindra <Ravindra.Ankam@Honeywell.=
com<mailto:Ravindra.Ankam@Honeywell.com>>
Cc: Shanmugam, Dhinesh Kumar <s-dhinesh@ti.com<mailto:s-dhinesh@ti.com>>
Subject: RE: [External] RE: Upgrading the components with latest version

Hi Ravi/Sridhara,

In that case I suggest adopt to the Yacto build and have your custom compon=
ents selected as per your requirements. Note that the SDK is provided to ca=
ter to larger set of customers for their
quick usage. If there are any specific requirements then its suggested to u=
se the Yacto.  Please see if it's very much required to migrate then only u=
pgrade as some packages may not be stable that are available in opensource.

Please refer:

https://processors.wiki.ti.com/index.php/Sitara_Linux_Training:_Getting_Sta=
rted_with_Openembedded<https://nam12.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fprocessors.wiki.ti.com%2Findex.php%2FSitara_Linux_Training=
%3A_Getting_Started_with_Openembedded&data=3D04%7C01%7CNachiketRahul.Jagade=
%40Honeywell.com%7Cbea0534eb52d457f654f08d9d010d959%7C96ece5269c7d48b08daf8=
b93c90a5d18%7C0%7C0%7C637769593045545960%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Dr3t=
bbnMbtp7ZCy9T4FhxvY21LLoGA6e46e3jyhtVshY%3D&reserved=3D0>


Best Regards, Shiv

From: Sridhara Murthy, Vinay [mailto:Vinay.SridharaMurthy@Honeywell.com]
Sent: Friday, June 19, 2020 6:08 PM
To: Ankam, Ravindra; Nagalikar, Shivasharan
Cc: Shanmugam, Dhinesh Kumar
Subject: [EXTERNAL] RE: [External] RE: Upgrading the components with latest=
 version

Hi Shiv,

If we provide a list of components, would it be possible for you to provide=
 the updated SDK packages.
Please let us know as this would accelerate for us.

Regards
Vinay


From: Ankam, Ravindra <Ravindra.Ankam@Honeywell.com<mailto:Ravindra.Ankam@H=
oneywell.com>>
Sent: Friday, June 19, 2020 6:01 PM
To: Nagalikar, Shivasharan <shivasharan.nagalikar@ti.com<mailto:shivasharan=
.nagalikar@ti.com>>
Cc: Shanmugam, Dhinesh Kumar <s-dhinesh@ti.com<mailto:s-dhinesh@ti.com>>; S=
ridhara Murthy, Vinay <Vinay.SridharaMurthy@Honeywell.com<mailto:Vinay.Srid=
haraMurthy@Honeywell.com>>
Subject: RE: [External] RE: Upgrading the components with latest version

Hi Shiv,
                Thank you for quick response. Unfortunately compiling each =
individually is complex and also we need to compile updated dependent packa=
ges as well.
As I mentioned earlier, we are using TI SDK.

Thanks and regards,
Ravi

From: Nagalikar, Shivasharan <shivasharan.nagalikar@ti.com<mailto:shivashar=
an.nagalikar@ti.com>>
Sent: Friday, June 19, 2020 12:51 PM
To: Ankam, Ravindra <Ravindra.Ankam@Honeywell.com<mailto:Ravindra.Ankam@Hon=
eywell.com>>
Cc: Shanmugam, Dhinesh Kumar <s-dhinesh@ti.com<mailto:s-dhinesh@ti.com>>; S=
ridhara Murthy, Vinay <Vinay.SridharaMurthy@Honeywell.com<mailto:Vinay.Srid=
haraMurthy@Honeywell.com>>
Subject: [External] RE: Upgrading the components with latest version

Hi Ravi,

There are two options.




  1.  If you are using the Yacto build system then you can change the bitba=
ke layers to point to updated version of the below components.
  2.  If you are using the SDK then you can download the source code of the=
 version you are looking and cross compile with the SDK provided compiler t=
ool chain.

Best Regards, Shiv


From: Ankam, Ravindra [mailto:Ravindra.Ankam@Honeywell.com]
Sent: Friday, June 19, 2020 10:45 AM
To: Nagalikar, Shivasharan
Cc: Shanmugam, Dhinesh Kumar; Sridhara Murthy, Vinay
Subject: [EXTERNAL] Upgrading the components with latest version

Hi Shiv,
                We had used the TI SDK 06.01.00.08 version. This SDK has ma=
ny components not updated with latest version.
We want to update these components to address vulnerabilities in the compon=
ents by using the latest version.
I have checked with latest TI SDK 06.03.00.106 version but both SDKs have s=
ame version for most of the components.
E.g. perl (5.24.4), zlib (3.23.1) etc.

Is there any other way to update these components?

Thanks and regards,
Ravi



--_000_BN7PR07MB464440D1FD4B8E0D4BF7089C854B9BN7PR07MB4644namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:441652142;
	mso-list-template-ids:949678626;}
@list l0:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1
	{mso-list-id:797525230;
	mso-list-template-ids:1342212338;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Shiv,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">We are working on TI am335x sitara based platform=
.<o:p></o:p></p>
<p class=3D"MsoPlainText">We have adopted Yocto build as per your suggestio=
n and created custom distro which is a mix of arago and poky.<o:p></o:p></p=
>
<p class=3D"MsoPlainText">Reason is that when we last checked, arago distro=
 did not had latest version of open source packages.<o:p></o:p></p>
<p class=3D"MsoPlainText">Also some layers were not available in arago and =
we had to resolve many dependencies while compiling.<o:p></o:p></p>
<p class=3D"MsoPlainText">We created this custom distro long ago using Dunf=
ell 3.1.2 branch.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Now we want to make a new distro with latest vers=
ions of all required packages.
<o:p></o:p></p>
<p class=3D"MsoPlainText">So shall we go with 3.4 Honister or with latest d=
unfell release 3.1.13? Which release has full ti support for chipset and ot=
her drivers ?<o:p></o:p></p>
<p class=3D"MsoPlainText">What will you suggest to achieve this?<o:p></o:p>=
</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText">Nachiket<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Nagalikar, Shivasharan &lt;<a href=3D"m=
ailto:shivasharan.nagalikar@ti.com">shivasharan.nagalikar@ti.com</a>&gt;
<br>
<b>Sent:</b> Friday, June 19, 2020 6:19 PM<br>
<b>To:</b> Sridhara Murthy, Vinay &lt;<a href=3D"mailto:Vinay.SridharaMurth=
y@Honeywell.com">Vinay.SridharaMurthy@Honeywell.com</a>&gt;; Ankam, Ravindr=
a &lt;<a href=3D"mailto:Ravindra.Ankam@Honeywell.com">Ravindra.Ankam@Honeyw=
ell.com</a>&gt;<br>
<b>Cc:</b> Shanmugam, Dhinesh Kumar &lt;<a href=3D"mailto:s-dhinesh@ti.com"=
>s-dhinesh@ti.com</a>&gt;<br>
<b>Subject:</b> RE: [External] RE: Upgrading the components with latest ver=
sion<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi Ravi/Sridhara,<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">In that case I suggest=
 adopt to the Yacto build and have your custom components selected as per y=
our requirements. Note that the SDK is provided to cater to larger set of c=
ustomers for their<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">quick usage. If there =
are any specific requirements then its suggested to use the Yacto. &nbsp;Pl=
ease see if it&#8217;s very much required to migrate then only upgrade as s=
ome packages may not be stable that are available
 in opensource.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Please refer:<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><a href=3D"https://nam12.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fprocessors.wiki.ti.com%2Findex.php%2FSitara_Linu=
x_Training%3A_Getting_Started_with_Openembedded&amp;data=3D04%7C01%7CNachik=
etRahul.Jagade%40Honeywell.com%7Cbea0534eb52d457f654f08d9d010d959%7C96ece52=
69c7d48b08daf8b93c90a5d18%7C0%7C0%7C637769593045545960%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3Dr3tbbnMbtp7ZCy9T4FhxvY21LLoGA6e46e3jyhtVshY%3D&amp;reserved=
=3D0">https://processors.wiki.ti.com/index.php/Sitara_Linux_Training:_Getti=
ng_Started_with_Openembedded</a><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Best Regards, Shiv <o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,sans-serif">From:</span></b><span style=3D"font-size:10.0pt;f=
ont-family:&quot;Tahoma&quot;,sans-serif"> Sridhara Murthy, Vinay [</span><=
a href=3D"mailto:Vinay.SridharaMurthy@Honeywell.com"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Tahoma&quot;,sans-serif">mailto:Vinay.SridharaM=
urthy@Honeywell.com</span></a><span style=3D"font-size:10.0pt;font-family:&=
quot;Tahoma&quot;,sans-serif">]
<br>
<b>Sent:</b> Friday, June 19, 2020 6:08 PM<br>
<b>To:</b> Ankam, Ravindra; Nagalikar, Shivasharan<br>
<b>Cc:</b> Shanmugam, Dhinesh Kumar<br>
<b>Subject:</b> [EXTERNAL] RE: [External] RE: Upgrading the components with=
 latest version<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Shiv,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If we provide a list of components, would it be poss=
ible for you to provide the updated SDK packages.<o:p></o:p></p>
<p class=3D"MsoNormal">Please let us know as this would accelerate for us.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Vinay<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Ankam, Ravindra &lt;<a href=3D"mailto:R=
avindra.Ankam@Honeywell.com">Ravindra.Ankam@Honeywell.com</a>&gt;
<br>
<b>Sent:</b> Friday, June 19, 2020 6:01 PM<br>
<b>To:</b> Nagalikar, Shivasharan &lt;<a href=3D"mailto:shivasharan.nagalik=
ar@ti.com">shivasharan.nagalikar@ti.com</a>&gt;<br>
<b>Cc:</b> Shanmugam, Dhinesh Kumar &lt;<a href=3D"mailto:s-dhinesh@ti.com"=
>s-dhinesh@ti.com</a>&gt;; Sridhara Murthy, Vinay &lt;<a href=3D"mailto:Vin=
ay.SridharaMurthy@Honeywell.com">Vinay.SridharaMurthy@Honeywell.com</a>&gt;=
<br>
<b>Subject:</b> RE: [External] RE: Upgrading the components with latest ver=
sion<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Shiv,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thank you for quick response. Unfort=
unately compiling each individually is complex and also we need to compile =
updated dependent packages as well.<o:p></o:p></p>
<p class=3D"MsoNormal">As I mentioned earlier, we are using TI SDK.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks and regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ravi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Nagalikar, Shivasharan &lt;<a href=3D"m=
ailto:shivasharan.nagalikar@ti.com">shivasharan.nagalikar@ti.com</a>&gt;
<br>
<b>Sent:</b> Friday, June 19, 2020 12:51 PM<br>
<b>To:</b> Ankam, Ravindra &lt;<a href=3D"mailto:Ravindra.Ankam@Honeywell.c=
om">Ravindra.Ankam@Honeywell.com</a>&gt;<br>
<b>Cc:</b> Shanmugam, Dhinesh Kumar &lt;<a href=3D"mailto:s-dhinesh@ti.com"=
>s-dhinesh@ti.com</a>&gt;; Sridhara Murthy, Vinay &lt;<a href=3D"mailto:Vin=
ay.SridharaMurthy@Honeywell.com">Vinay.SridharaMurthy@Honeywell.com</a>&gt;=
<br>
<b>Subject:</b> [External] RE: Upgrading the components with latest version=
<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi Ravi,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">There are two options.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoListParagraph"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:=
p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"color:#1F497D;mso-list:l0 level1 lfo3">If =
you are using the Yacto build system then you can change the bitbake layers=
 to point to updated version of the below components.<o:p></o:p></li><li cl=
ass=3D"MsoNormal" style=3D"color:#1F497D;mso-list:l0 level1 lfo3">If you ar=
e using the SDK then you can download the source code of the version you ar=
e looking and cross compile with the SDK provided compiler tool chain.<o:p>=
</o:p></li></ol>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Best Regards, Shiv <o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,sans-serif">From:</span></b><span style=3D"font-size:10.0pt;f=
ont-family:&quot;Tahoma&quot;,sans-serif"> Ankam, Ravindra [</span><a href=
=3D"mailto:Ravindra.Ankam@Honeywell.com"><span style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,sans-serif">mailto:Ravindra.Ankam@Honeywell.co=
m</span></a><span style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,=
sans-serif">]
<br>
<b>Sent:</b> Friday, June 19, 2020 10:45 AM<br>
<b>To:</b> Nagalikar, Shivasharan<br>
<b>Cc:</b> Shanmugam, Dhinesh Kumar; Sridhara Murthy, Vinay<br>
<b>Subject:</b> [EXTERNAL] Upgrading the components with latest version<o:p=
></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Shiv,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We had used the TI SDK 06.01.00.08 v=
ersion. This SDK has many components not updated with latest version.<o:p><=
/o:p></p>
<p class=3D"MsoNormal">We want to update these components to address vulner=
abilities in the components by using the latest version.<o:p></o:p></p>
<p class=3D"MsoNormal">I have checked with latest TI SDK 06.03.00.106 versi=
on but both SDKs have same version for most of the components.<o:p></o:p></=
p>
<p class=3D"MsoNormal">E.g. perl (5.24.4), zlib (3.23.1) etc.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any other way to update these components?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks and regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ravi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN7PR07MB464440D1FD4B8E0D4BF7089C854B9BN7PR07MB4644namp_--
