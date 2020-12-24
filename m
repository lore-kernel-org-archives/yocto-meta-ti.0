Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.42])
 by mx.groups.io with SMTP id smtpd.web10.6151.1608778507525102945
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Dec 2020 18:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: ltts.com, ip: 40.107.139.42, mailfrom: irfan.shaikh@ltts.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTJ1IQfvBbThVDSK0yJ5+RDsgvhiNcvbrH7AZH/l2UMQKPoTo91774pQFmmwhun7mVgOVt3bvVohEBg1mO5aFnU1lFLwPjMvf5CcVW7cNfDzOsuNxb4fsR3ymjWcsJfmuOdCM+yZ/yHdpCSuhvwFZR2H1j8lLZNb1laHagI+/SqvzmFm58frAI0PZsKikg1lme/m3ifjuMSzVcm8bzZWItvlXyfhX7e+FKKhueQiItdI4S1rukpmIhKo1aSmFvAT5LBbD46LbYzHxfz0YMvKUCsdS7yBYAyDQEZNvKXteHAfDiKFdhDJaWgz3WS2I3lxwtOa3tIClyYUW4wmS3Qofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkBHxQh83yPU8TFf+MrnvKDyH+k2vwcZIOsV3hOQ4UA=;
 b=nnt8f71Ii1dbdZBDZ6x9ZfIndhChzinJMrOwyw0QqxVmnfHgU2k4LzInDFmgGoFWiAf1bPl+LpOciFu67bIS/zuWgk8aVy5Mq7Ba/DswYt7dzf05PyTLbO2o3HABx7Jb/3dj+EbjiIWLAplNPi4z6ELqLP/0yD/XQxdJTr1sh/47NxBW+tGDPCsxeDvdinXSG5aSKkT6M83wZxS1sF/0/UW66vICSNg+0xxWCvmSZj25ycDR5sRJaCNlSAfMhz6gQ98gT+0WjhKdsmIsqvzF/xkXfmNdKPHoIUT6/ukQiAlakdGD7unmjBlyL9a3xDNy26l4xyOS34TY6/uNrZM0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
Received: from MA1PR01MB2363.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:3a::19)
 by MAXPR01MB4215.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 02:55:00 +0000
Received: from MA1PR01MB2363.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e8c0:fcce:5f7b:2909]) by MA1PR01MB2363.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e8c0:fcce:5f7b:2909%6]) with mapi id 15.20.3654.034; Thu, 24 Dec 2020
 02:55:00 +0000
From: irfan.shaikh@ltts.com
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Yocto build with meta-ti BSP using meta-ivi
Thread-Topic: Yocto build with meta-ti BSP using meta-ivi
Thread-Index: AQHW2Zx9Zm+OHOAmRESHmTT6S2cftw==
Date: Thu, 24 Dec 2020 02:55:00 +0000
Message-ID: 
 <MA1PR01MB23636786243A5CA7AB4CA068E6DD0@MA1PR01MB2363.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_Enabled=True;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_SiteId=311b3378-8e8a-4b5e-a33f-e80a3d8ba60a;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_SetDate=2020-12-24T02:55:00.000Z;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_Name=General;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_ContentBits=0;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_Method=Standard;
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=Ltts.com;
x-originating-ip: [20.193.137.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68d72968-481e-4d0d-eb58-08d8a7b74dee
x-ms-traffictypediagnostic: MAXPR01MB4215:
x-microsoft-antispam-prvs: 
 <MAXPR01MB421523482E3940192E6E7DB1E6DD0@MAXPR01MB4215.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ++a4J9fTcq+jGyZDHAatJz+FplFUBxoN1i4jQAsMVhAIVxdwiQVWhct8223kWkZ7Zc/4kl3oTM9SWThcOCqYbF+EyP2eGvUk/7OoXrzkLnNsxU/OxJXCIuh8SUlfdaKiubfEvx3TuHqOkdmXbr3payyZLL7Xq/wW0gcdrIerZsJ8wxZ/Qn4KrTyry2pqrlB8s2a569JXwZa8PkFmNn2l4Zo3rpOATTih1d+E3EbfM38t3zvtyPdc+vJQDLnoDsfKhqMVYLIc3SVcZDiXB9hwYUg/EOZ/IqdCmVueOm24WkEco1eU5u2ivrNfb/ho40OU3CwElFve9a+HMbdR0Q+Q95jwECxDklKkU2RjfxAUM5GiyEUN8xAT3qWbC9v1wMFhnwbIIqOs9cf3W0SoDk3vXg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB2363.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(66476007)(6916009)(26005)(6506007)(186003)(66946007)(8936002)(166002)(19627405001)(8676002)(86362001)(316002)(66556008)(7696005)(2906002)(478600001)(15974865002)(33656002)(9686003)(83380400001)(55016002)(66446008)(52536014)(91956017)(71200400001)(5660300002)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?OBtXiKD31rAfRBU/yaCKw2lFlMUSNe/S7OogI0APNCkvIuLG5HPfu5kRNa?=
 =?iso-8859-1?Q?8D22wkfIV904oO1Tdy7peyG9ZrV4xYBgkP+CelWBTz5mFENqEaZCQ2pb3q?=
 =?iso-8859-1?Q?maqqSogOqOgdHEEionIoAE9w8an341qVDUhtewx132TdTVG1h2UKOjyC6Q?=
 =?iso-8859-1?Q?00ZR6s/p5XjCjacGbTQZuEguMSKoLGA0lQUp793U88xJA9MKi0PUw5uUf/?=
 =?iso-8859-1?Q?LyPjHIJG/x3RAzOLlxR0NjOEfo8NvoqHfCstw0OFPsYXnNKEgr7KFV1mQv?=
 =?iso-8859-1?Q?ajZJL6m1xWqPY3VZzZzPfj02qGvKBqkogjyvrfMhvoeyJlr7nR2qjgPBTJ?=
 =?iso-8859-1?Q?zZ32iNxuuWhO1LeSlmxErQUgy+iarFdRbH0XxHqk2FiC/+PsVmdBwzIS6b?=
 =?iso-8859-1?Q?uhll+/3p6cSfcq2u83F7edd1x4odLZSZFCx9mAPVvncHxyelLcfwu5PcWh?=
 =?iso-8859-1?Q?ZCnIOBys97r3O7+7PYTODUfXqiCjlyDeFov8/bm/aNWry6HcuJUqvMEekj?=
 =?iso-8859-1?Q?uf6izzHjGKBV9jW5WS6rV5v3Gszt9X+d0N7bKdu2jE+Ic2FOvgTL92pi2h?=
 =?iso-8859-1?Q?KUWYaWquKhgaZOFDITY6mdMDZfiVmCZN/R/PJ1SCZ4bxfT2MI09VEbd+m8?=
 =?iso-8859-1?Q?IjQb3rLuKzbbWT34k6rVTlLsPLsSdhcRhiJpthVJ8k9ONAyLk311aAL3Y1?=
 =?iso-8859-1?Q?coj2jEdWR7rfS/atiNYNX6zuduNAt1YSioz00AIWCGLld6gCtTa6CjL2lh?=
 =?iso-8859-1?Q?etsc4GKFtrJc4G6mW5Av1oos9lH8wmdFUA07tp8s1E1KxlfugjUpo+AJu/?=
 =?iso-8859-1?Q?bcPC/SN0o0j8+qRVYFDoKcHOW8vbGAN9jzKT3CJ1OS5UZp9WzK7JTot3Fh?=
 =?iso-8859-1?Q?SpSP1HZUuvvMIeDoRB/LrSC/AnfC7KIzXRQNEFnAuAmb375vSiFHgoyNLI?=
 =?iso-8859-1?Q?o0R97zCpEXTp92K68MaL5YlrXLjVBh05gKWbIIAhn2YECWlS4rYJS/MLT9?=
 =?iso-8859-1?Q?YhfvbTuFqJ0ZbWJSg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB2363.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d72968-481e-4d0d-eb58-08d8a7b74dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2020 02:55:00.0103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+9ZeTRrcRXXmEoIppBZB2BC+Y5SuLE8TWdwEleMSFAhWApVfVYMz1tdxEuS00QCHJXIThBEkkiQTKDrVGjUsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4215
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB23636786243A5CA7AB4CA068E6DD0MA1PR01MB2363INDP_"

--_000_MA1PR01MB23636786243A5CA7AB4CA068E6DD0MA1PR01MB2363INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Everyone !

My first post here. I am facing lot of build errors and challenges to build=
 TI BSP using yocto. Can you please check on steps that i followed and poin=
t out your valuable suggestions or recommendations on the same

Questions:

  1.  Correct combination of git branches for poky, meta-ivi, meta-ti, meta=
-openembedded
  2.  Suggestion to build genivi complaint meta-ti for Jacinto-6 evm or any=
 other similar TI target.
  3.  It will be helpfully if you can also share inputs local.conf or any o=
ther machine specific configuration files needed for build dependencies.


Step 1 : source poky/oe-init-build-env

  *   ERROR: Version mismatch for meta-ivi (Resolved by moving to meta-ivi =
branch 5.0

Step 2 : bblayes.conf - My bblayes looked as below

meta, meta-poky, meta-yocto-bsp, meta-openembedded/meta-oe, meta-ivi, meta-=
ti, meta-arm/meta-arm, meta-arm/meta-arm-toolchain

Step3: bitbake -k core-image-minimal

Please help me out if anyone of you were successfully able to build genivi =
complaint meta-ti BSP for ti jacinto family. It would be helpful if you can=
 share the steps you followed for the same.

Thanks and Regards,
Irfan

L&T Technology Services Ltd

www.LTTS.com

L&T Technology Services Limited (LTTS) is committed to safeguard your data =
privacy. For more information to view our commitment towards data privacy u=
nder GDPR, please visit the privacy policy on our website www.Ltts.com. Thi=
s Email may contain confidential or privileged information for the intended=
 recipient (s). If you are not the intended recipient, please do not use or=
 disseminate the information, notify the sender and delete it from your sys=
tem.

--_000_MA1PR01MB23636786243A5CA7AB4CA068E6DD0MA1PR01MB2363INDP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello Everyone !&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
My first post here. I am facing lot of build errors and challenges to build=
 TI BSP using yocto. Can you&nbsp;please check on steps that i followed and=
 point out your valuable suggestions or recommendations on the same</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Questions:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol>
<li>Correct combination of git branches for poky, meta-ivi, meta-ti, meta-o=
penembedded</li><li>Suggestion to build genivi complaint meta-ti for Jacint=
o-6 evm or any other similar TI target.&nbsp;</li><li>It will be helpfully =
if you can also share inputs<b> local.conf</b> or any other machine specifi=
c configuration files needed for build dependencies.<br>
&nbsp;&nbsp;</li></ol>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Step 1 : source poky/oe-init-build-env</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ul>
<li>ERROR: Version mismatch for meta-ivi (Resolved by moving to meta-ivi br=
anch 5.0<br>
</li></ul>
<div>Step 2 : bblayes.conf - My bblayes looked as below</div>
<div><br>
</div>
<div>meta, meta-poky, meta-yocto-bsp, meta-openembedded/meta-oe, meta-ivi, =
meta-ti, meta-arm/meta-arm, meta-arm/meta-arm-toolchain</div>
<div><br>
</div>
<div>Step3: bitbake -k core-image-minimal</div>
<div><br>
</div>
<div><b><i>Please help me out if anyone of you were successfully able to bu=
ild genivi complaint meta-ti BSP for ti jacinto family. It would be helpful=
 if you can share the steps you followed for the same.</i></b></div>
<div><br>
</div>
<div>Thanks and Regards,</div>
<div>Irfan</div>
</div>
<p><strong>L&amp;T Technology Services Ltd</strong></p>
<p><a href=3D"" http:=3D"" www.LTTS.com=3D"" ??=3D"" target=3D"" _blank??=
=3D"">www.LTTS.com</a></p>
<p>L&amp;T Technology Services Limited (LTTS) is committed to safeguard you=
r data privacy. For more information to view our commitment towards data pr=
ivacy under GDPR, please visit the privacy policy on our website www.Ltts.c=
om. This Email may contain confidential
 or privileged information for the intended recipient (s). If you are not t=
he intended recipient, please do not use or disseminate the information, no=
tify the sender and delete it from your system.</p>
</body>
</html>

--_000_MA1PR01MB23636786243A5CA7AB4CA068E6DD0MA1PR01MB2363INDP_--
