Return-Path: <heiko.boettger@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F35E7543C
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 09:23:27 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.104541.1696324999033045372
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 02:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=bVv3hdEF;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: heiko.boettger@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3935u7nd028123
	for <meta-ti@lists.yoctoproject.org>; Tue, 3 Oct 2023 09:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=from:to:subject:date:message-id:content-type:mime-version; s=
	S-DKIM-20210427; bh=KqdkqvbmqnM4eWI+uGojznSh9uXuLrWrIsyaC6keXNU=; b=
	bVv3hdEFr7dx6lfcVM1wOjC1GbXvmBeM0N4tQVYb0R+fSCIag78XKmFdgZTGTKAz
	V51xGGLA8BI4qtq5jl/rhpIYYEhPMF4OUF70kxxp/vSqIJ4juTLcplUi9HsTnRkx
	BDrTohbe68Wunkz2Msg8rU4PNZ2X2Cxl+rCV9GeNR/rPSlW0C3Q+JQ+3itgomoza
	20Wt6y934D39NM26+CUs6NqJmWCGtLbQwh3on+H1t05lOjCfDot+SrOSoyEip89R
	Zngh3SDSPsaPyou8uBgmkXQcS5JPlEJWA0l9p0cdrAi6EvLk0M0Dkzv2awl9UK/o
	aZI7H8l9u6kjhHZKJL/Pjw==
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3te9t1guk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 03 Oct 2023 09:23:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsZaGvodvrOqh2dZZKgWb08edrAEe5MD4DE5GF44OcJ+ry2YAhteIkLgox7HSvR40Cu1ZN7kSuzauH3t9U1443cTCUG2Sel59ZQhL7peQUSAY6541Tlf4gjSjnpL5Qn6xq99wsISVsgg+rALtC8qaWXqqYLX3YvSDbbAqzeAOuoUVBP0XfxZU+t5V2ypxVOAhSgcwQ/FMx73GW41zfSllcjVfJJj6g1q0N2m/LMjMqJ8ZDX4cV9ek30Si+bd4FAAhtbt4DciOIpe/F10MUt1vBGjsNLELPIgkhU4Tz5sojG4H6yKpFW3DO/U4X+qxzbY67+CuckYVAMM5ckgpIYzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqdkqvbmqnM4eWI+uGojznSh9uXuLrWrIsyaC6keXNU=;
 b=HFngWaC7Ivt7KAjLi+C8qZXDSjQtg/ENcIir7sJ7bZ1wCuB8w2ThF+ODfPeCcaI9qkIEtGU2HpucaDTfAb82PJsqXdApwrXNYz52wlibwHm05IjViK8/D8D8Sd/q27sjlLwspsSHx79Z9KHYTKRBON7mZXyLFgeTFP6OjPWcuGgsHfGOtDRODVvzx8V6sqFJ7PAk+M8yvGgjItXdL5rIbHS4NvE0UC1QisPOZH41IVWzIdNr8kIAgCfJJqU0qmKe00lJHiQbpCdGBRqdKIZ2zzixFyI9Hyw6OcR5oVrphXqp2Z+fAtCDvVvwLrJlq9+mqC9l6QooxkMx1bqjW6QDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from AM9PR01MB8412.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:43f::14) by AM7PR01MB6899.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1b0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.24; Tue, 3 Oct
 2023 09:23:13 +0000
Received: from AM9PR01MB8412.eurprd01.prod.exchangelabs.com
 ([fe80::bd39:daa:27f3:b0a1]) by AM9PR01MB8412.eurprd01.prod.exchangelabs.com
 ([fe80::bd39:daa:27f3:b0a1%4]) with mapi id 15.20.6863.021; Tue, 3 Oct 2023
 09:23:13 +0000
From: "Boettger, Heiko" <Heiko.Boettger@karlstorz.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Unable to mirror meta-ti due to branch-name HEAD forbidden in git
 since Nov 2019
Thread-Topic: Unable to mirror meta-ti due to branch-name HEAD forbidden in
 git since Nov 2019
Thread-Index: AQHZ9dqy6JlPGjcHS0O+aUeLHMrcFw==
Date: Tue, 3 Oct 2023 09:23:13 +0000
Message-ID: 
 <AM9PR01MB841284A902CEE0B9B199666F97C4A@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
Accept-Language: de-CH, en-US, en-CH, de-DE
Content-Language: de-CH
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR01MB8412:EE_|AM7PR01MB6899:EE_
x-ms-office365-filtering-correlation-id: 8d8d685b-531c-4078-1431-08dbc3f25e39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 h0JhrtSFgYWvGEN1H6Y90y2HZmqcGYVPmZgpgNd6PIMYsWmw1jpMUn2JnJSx3z/mWjXyy2yGst2liUI0LiMqClfoWcYSKvPraLAUzIyB2WmK3cupv9aYiK6kqcTLldm3laReAVIEgcQUHV7a3Mn2AjAq58dsUeeNrMN/VzuTLJXpFidvflBimiY0wVDKcTidjguB5I7lTNCNBAb9ErOcZ4Xbdqd39MKV/8OkshL4iPhFXETe/7M+MiaQc9ze/Arv4d+mzzaXTUU/FW74tTR2uwHBH+cLtwSVXFaBlgw3FPhU1/K1yJ6SWWk8MZa/QCNUn95ODS4LotxfFcOKLoj7WY2qedQCq9RR6ZqD6sCUsYw3urcmrjnFPwuFxwdH6Uf68BJ+rzU3Em9oLBi88Wd5Gn+It1HBLLClEBkbLrF5DvwJ4DwjAnfjGK1YmPKRAOfL/dGxZNIYUbG+ySMTdBHw/4rx8vDaG0I/GE/81sS9SSqrtSkC9GE+MSCyvGtLGXU6/De27JSMku6SKug5sELs7dYfGR8rl1wnUJT6XQEkFKGegAAMFyeAGtr15WVPL7G1MgMaj3T813UfNIm7BssuIt4Va4P6EQzgmsFwNsQVR3AeIBLmurqhaqf1uOv0O8wk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR01MB8412.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(346002)(366004)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(5660300002)(86362001)(2906002)(4744005)(55016003)(8676002)(8936002)(6916009)(316002)(91956017)(66946007)(66446008)(66476007)(66556008)(76116006)(64756008)(41300700001)(52536014)(33656002)(26005)(166002)(122000001)(9686003)(38100700002)(38070700005)(478600001)(71200400001)(6506007)(7696005)(19627405001)(966005)(21443003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5r6KtzGdhfGTRBX52imOh8pIY7plFakVNumS1fqggtVEc6ZT4mQvrDH6X5?=
 =?iso-8859-1?Q?WdU48ML48L2TErXGUKsVtlhzuF/MvpbPgtlLgDQewxd2iJB5cmrarXUAW9?=
 =?iso-8859-1?Q?QHVFfuwnqoefmPa8/9E8eetBo3yC2sl3FfOAJhSJleP3vhSwLTePwhzpin?=
 =?iso-8859-1?Q?L/tQblvEmaGplnoeHpruFxyJbU/eRKptakKIvd3GV7PxH9z44/Bu2GY93n?=
 =?iso-8859-1?Q?kzcaOkjP9YTu8Sf3TeEbAQyDBCfkpr6dFtg8vFK4Gv9hREx/JT2YDTdHDF?=
 =?iso-8859-1?Q?q17NiRKIMRB6soMYTKmaqWZEPGDIGHJaUp21JJJQdO262ySTp6pGztRIxm?=
 =?iso-8859-1?Q?Ce7MTGaI7ZPsihJNPpm6uUitMYfqbPNN1o7ENPfaIbQnIvpNAiq9oLq7md?=
 =?iso-8859-1?Q?X/08GeRLYrOiMwQhDEuHFWLX9TZH410lTWJIVn7gc3fBsqkB6BcBMURfnO?=
 =?iso-8859-1?Q?R8ZsrvWujpZZiYrPxmKEZ6UE4qKywOJx0Qg0PKd2EWH8UHerFbe/hd7w6x?=
 =?iso-8859-1?Q?ONOAqgpqlJGx5fwbD7E0t3Tl6iXRJYxssSRGKacmbR+Tl1K3gJCIUEdUIJ?=
 =?iso-8859-1?Q?chaBih0l6Jq0SrR2sCoZ2xnmUPq7MN2IF2kWZzY2o4XoZFhNkZ7YjjOlu4?=
 =?iso-8859-1?Q?Oz6KpR6+h8h1BcjKLMosG5lzYUciE4zhM8lwsPSZYNgPI1DFcA81v/9PM3?=
 =?iso-8859-1?Q?m1K9fN1YFqL+6IT1kBBYWYMh4zHwuB8ZUO8Mncwh1rnK/vqRJxTYWyH5ae?=
 =?iso-8859-1?Q?d02NghCSLZ2daen6Ffap1j+AV7R5HsFQc2hV1B9PGofAEfFHolQleQf0A8?=
 =?iso-8859-1?Q?1E9TU1muWl6YzWcz5wzO1EjxJXemlUMwTGC4mFAVRnW6Sc2D629Te8+GPC?=
 =?iso-8859-1?Q?uuO1SN4SRjyQsq92vkYk9+5GQB2eLQ+jnmt91jhQtYbtLE76LulrrnKDLP?=
 =?iso-8859-1?Q?PpLX+RGcShCtT91Zmla8k4ejSAINhZuIgcvCS95MbBGxlZNU+oCUr7TCYY?=
 =?iso-8859-1?Q?74Xq2Fnc3XvpeZxP2KzMKcdIe4C1TeQlj2mOy40wcSmRiNxR1okLOAmhLO?=
 =?iso-8859-1?Q?/SwU4odrni4mJLO64t64F3FDa7ipmleL7qDu4l0YaMvhTZT4sefOSneBJR?=
 =?iso-8859-1?Q?GUKQ30kXYpcuQbE7DyVC++KWSSYudSoQRijnVfHgnLGWKaDmqs3QHoJKpu?=
 =?iso-8859-1?Q?8Vc2FNq2x+Ufg7VakfpOgDcen8i3LIYaZGs0oAVYBu5NU3F1B21FM5HZ0f?=
 =?iso-8859-1?Q?2svFeEskpIGv+IciFmg9yNi10LcAkyJqAZ3J8yTQ0ZZcKJJMccTY6h2n0+?=
 =?iso-8859-1?Q?tvYExG476a7TFdcBu59WIWnqz05KWR1AVY0Lk/wHCRjt4UpKwySz3Ra2za?=
 =?iso-8859-1?Q?jXRRnBc+tGweTEnNTPunlUkP8R82CCKKdXIDf/6KBN2ZkxdNoa9mGjjn3p?=
 =?iso-8859-1?Q?+j4pc8/kl9g8CYAhftr1nD1++Lm+S+h9f2t8LuqsAjkLDTaEYZCvFhvGvT?=
 =?iso-8859-1?Q?I8y1XQBMJ4wdadoBTseCO0WiGueH8e3rIYw5JU/cFdUXW0IgdjknL9AYKd?=
 =?iso-8859-1?Q?JmNiWqu0+Jad2k0captwRaw2VSV0tL04hLvbnm4oEpV6pARrYNILiNG78K?=
 =?iso-8859-1?Q?GQH5CNWi5cXcQI8jBUCQu+Gmd/XBCmRGwI49MDCMVraA5ucFHVGWUwBw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM9PR01MB841284A902CEE0B9B199666F97C4AAM9PR01MB8412eurp_"
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR01MB8412.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8d685b-531c-4078-1431-08dbc3f25e39
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 09:23:13.3276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBfIzecig7ToSx74RdBm06LPfwHudyn2sMX5nVNucOMd8pjWYlGmAxJsWMz60nj8xmVR1jL3lvxbmnfyjnbsD+JHRCRUBmpIoTnaiqO4XsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6899
X-Proofpoint-ORIG-GUID: CeldB2hMw5j6MUosFGXJsiawt8PsxsIS
X-Proofpoint-GUID: CeldB2hMw5j6MUosFGXJsiawt8PsxsIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_06,2023-10-02_01,2023-05-22_02
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Oct 2023 09:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17044

--_000_AM9PR01MB841284A902CEE0B9B199666F97C4AAM9PR01MB8412eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

there was a recent change in git that doesn't allow to use `HEAD` as a bran=
ch name . Is it possible to remove the branch? The ref HEAD should still be=
 there. No other repository seems to have such a branch and we currently fa=
ce issues mirroring the meta-ti repository where GitLab refuses to accept `=
HEAD` as a valid branch name.

See also https://docs.gitlab.com/ee/user/project/repository/branches/#error=
-ambiguous-head-branch-exists where GitLab states that this change was intr=
oduced in git 2.16.0 (around 4 years ago).

Best Regards

Heiko B=F6ttger


--_000_AM9PR01MB841284A902CEE0B9B199666F97C4AAM9PR01MB8412eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"x_elementToProof ContentPasted0" style=3D"font-size: 12pt; m=
argin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Hi,=
</span>
<div class=3D"x_elementToProof" style=3D"font-size: 12pt; margin: 0px; colo=
r: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br class=3D"ContentPasted0">
</div>
<div class=3D"x_elementToProof ContentPasted0" style=3D"font-size: 12pt; ma=
rgin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
there was a recent change in git that doesn't allow to use `HEAD` as a bran=
ch name . Is it possible to remove the branch? The ref HEAD should still be=
 there. No other repository seems to have such a branch and we currently fa=
ce issues mirroring the meta-ti
 repository where GitLab refuses to accept `HEAD` as a valid branch name.</=
div>
<div class=3D"x_elementToProof ContentPasted0" style=3D"font-size: 12pt; ma=
rgin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div class=3D"x_elementToProof ContentPasted0 ContentPasted1" style=3D"font=
-size: 12pt; margin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 2=
55, 255);">
See also&nbsp;<a href=3D"https://docs.gitlab.com/ee/user/project/repository=
/branches/#error-ambiguous-head-branch-exists" id=3D"LPlnk591922">https://d=
ocs.gitlab.com/ee/user/project/repository/branches/#error-ambiguous-head-br=
anch-exists</a>&nbsp;where GitLab states that
 this change was introduced in git 2.16.0 (around 4 years ago).</div>
<div class=3D"x_elementToProof ContentPasted0 ContentPasted1" style=3D"font=
-size: 12pt; margin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 2=
55, 255);">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"x_elementToProof ContentPasted0" style=3D"font-size: 12pt; m=
argin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><sp=
an style=3D"font-family:Arial, sans-serif;margin:0px" class=3D"ContentPaste=
d0">Best Regards</span>&nbsp;</span><br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"x_elementToProof ContentPasted0" style=3D"font-size: 12pt; m=
argin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br=
>
</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"x_elementToProof ContentPasted0" style=3D"font-size: 12pt; m=
argin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Hei=
ko B=F6ttger</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"x_elementToProof ContentPasted0" style=3D"font-size: 12pt; m=
argin: 0px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br=
>
</span></div>
</body>
</html>

--_000_AM9PR01MB841284A902CEE0B9B199666F97C4AAM9PR01MB8412eurp_--

