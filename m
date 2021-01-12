Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7549.1610449917151573753
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 03:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ltts.com, ip: 198.145.29.25, mailfrom: irfan.shaikh@ltts.com)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (mail-eopbgr1380050.outbound.protection.outlook.com [40.107.138.50])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 08D4A38C06D0
	for <meta-ti@yoctoproject.org>; Tue, 12 Jan 2021 11:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wio4l7oqPfQPXYQestMMqXZXAHM9oTmejWIz4eHFixY3e4pHQ+aKHjyJ8gJRA93GQfiYymvJ3rZd0m2XqbkGLlT/EF4VUKSE7FeAA4Dnyla0j0e3xi1nHvCnud9bJ70U8Q+v85ja5uVj+KRhAJlVLaqY81O8/SYhatdFnKHSX3rpGexm1GQudxmjrSODAUyozOwR80icAXjyS9QWuAZnScYaCwGMPwah7INl1vdltWufEBfy085Gwaz9qRYIkBD26HB2XHnwuaHvDYpz2FE93/HalAZd5J6m1SUCQ77pon0apn0ZDBJYAmOISwp2cTlFDh+aoBTPIOPNYzy8QSU9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqvOS76P2Pg49Q4dRCswsft7Uc01ZXcx49a9BAo85uU=;
 b=Uy1DP9GGVMrIH5alEA/tpPELjQMkdtKbH3TZ6pjVVIt1EL+vmKNyRfePV+b7CQ7y+h5DZb+x3ebP/Myf1lcAp25UE6DNV8bSUuVQ+2o68TUNdXTm4G/ImNKkJ8hNZ/p5rx37dqNDb7z5dD7rHBbxVmWG+fTWucDGANqOjLX8ZFVFGfi4qtbIm2kK0LNgoDBK82+SSycmV/lRaQNX+DLn9OquXqe413+/KcU73hFcOsJQWmeUMzOH2ljatu+GHbqEa/M4NqcXz9cT4wGWgcOMQq2nwDS1xkCOhYhn5io1VEjO23lYhWSseP4zzQsGY3VcPcxsa6lOuugbJiajF+L87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
Received: from PN1PR0101MB1535.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:15::15) by PN2PR01MB4153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:11:52 +0000
Received: from PN1PR0101MB1535.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e83f:b0bc:cfb3:90b5]) by PN1PR0101MB1535.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e83f:b0bc:cfb3:90b5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan
 2021 11:11:52 +0000
From: "Irfan Khurshidalam Shaikh" <irfan.shaikh@ltts.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: ERROR: Failed to parse recipe: meta-ti/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
Thread-Topic: ERROR: Failed to parse recipe:
 meta-ti/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
Thread-Index: Adbo07azwxC90OCOSauWQW+pP9wKMQ==
Date: Tue, 12 Jan 2021 11:11:52 +0000
Message-ID: 
 <PN1PR0101MB15352B9A277326358EE33F79E6AA0@PN1PR0101MB1535.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_Enabled=True;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_SiteId=311b3378-8e8a-4b5e-a33f-e80a3d8ba60a;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_SetDate=2021-01-12T11:10:42.266Z;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_Name=General;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_ContentBits=0;MSIP_Label_4b5591f2-6b23-403d-aa5f-b6d577f5e572_Method=Standard;
authentication-results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none header.from=Ltts.com;
x-originating-ip: [182.76.79.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ce1452-a025-482c-d1a2-08d8b6eadd6a
x-ms-traffictypediagnostic: PN2PR01MB4153:
x-microsoft-antispam-prvs: 
 <PN2PR01MB415394B6C37E8E33CE09EF1CE6AA0@PN2PR01MB4153.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XP/mKZKD2EiBPqiQZ920W4Gyolzn/ud10K6ZuJmslQ9MqzaII1t4UTYj/nIW27FhZhr0oadN03+EOefgxZ/seKQvSkEw8/2Yf1vqPqYlJJ+YDymMWBCoviAqgBxv1OMaR9u8XDPATzPLKcMJ9MzPSJvkCZg/A02FNpYawuCHcUrGv5a5cxxLDbDel4KRg6ISjxjJKEpeVGptJWhmP/xib0HRgYmrIREu/PnOUhA+gQ5sgcxIA7zbBSrmNu3uStdNq+GeYzYyqsSyOR7S8Ep9OlTmZYb+WacIYcPEHfjC3HKS2MuPKQEbYItAU5wo+vPyO0J7MFYPboIYT0hHiMF5ah0dw1lkbVxzheGPcsnvZk2etihqaIygpDtPuelTke7g5OYpam+5sKPtFQp2JIV/quZZtn3kq5+gF6iUR3yMdoY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN1PR0101MB1535.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(15974865002)(83380400001)(166002)(7696005)(33656002)(6506007)(64756008)(76116006)(66476007)(26005)(55016002)(5660300002)(478600001)(66446008)(8936002)(66946007)(86362001)(8676002)(71200400001)(52536014)(186003)(6916009)(316002)(9686003)(66556008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?sApI0a9JsDsUDmVuhfesn+9EF4Eo6iZKw7MA7Lf2yCaSDcqqfGm+bHzo8+b0?=
 =?us-ascii?Q?fNfzL9l68s+e0fF1UEZA4JziI5oMlKyxoL9l40mPiRfKkbpSgwx41myRqfKH?=
 =?us-ascii?Q?aFjt8h9pvbXXTQbDSXxesp+ed7vn+W5/jnvIwg4X0H8fk1G6Rb0jdAEToBBC?=
 =?us-ascii?Q?D5GLO5/NUvw7t3ln360/orKx2KHm0gJ2dOKBjUfoGerVjB2+yIpqnbNUDFGh?=
 =?us-ascii?Q?Ck3Ri6PQvXrDRDjmeyb4vwi2I9q/G+cn4xwinNTTRQZFnhHb6DDHrfVCDGyD?=
 =?us-ascii?Q?FUwicXX6lpD4WgatsG65jP36yuXg/AsNogXElBn70cHNRCNDP/ER2jCItWLJ?=
 =?us-ascii?Q?zLQKJ0J8GMjUWiDxjD4S+kFcvxgKDe1Ndsop8IU9SrlRyKFn9yjlUny1Wrbq?=
 =?us-ascii?Q?MA5d8sKDZvnytlBJB9Af1BzUTQDhVt17lqHoStOCUqHqt70XGYR3Sc6vHcrj?=
 =?us-ascii?Q?Sb6PHqkS78Suy3y7JhZtKsZHfj/EehPBjk1JCsDNQ1fkJYYEz2KtFpMvmM9e?=
 =?us-ascii?Q?MIusrIUENHaL1vzPxENwKA8tLaKFeYYOeghGueN1DgcQ3zeVZv/kN9xN+AK9?=
 =?us-ascii?Q?LcFnkqYSbVL4bNr71p/79FDF4t0GHriHTYc4C3s9sQexbYSukG2PvwV+aHKA?=
 =?us-ascii?Q?3GXck4tNMjWXKTSQ735TGeYSm+j1kY75dkWPWHiPY47hK47SgcPBKus3ZlnI?=
 =?us-ascii?Q?1Oj7tkA3/bhdbbWkrZ5gMFc5mzR7wqV1xBqzctKj8ns3Emana/SduPG6AHUC?=
 =?us-ascii?Q?6vFu35XwMitfqzDbwm7p6K4HpovfI+DovZGT/zvRs4NMasDbr4GXebbqjN2B?=
 =?us-ascii?Q?BvMECZLf721g2qMDIOXBXr+Wsy01S5EvRWEqoMy5LjTVnFTh/bIoWytzLKdp?=
 =?us-ascii?Q?K+NMSEzfwYpBE8IlPtfWHXJIQJDM8BgpOp31l8KNNiywqnWNmgDqYR3LQOCI?=
 =?us-ascii?Q?Z7VDKpXG9o8uITULhtmW+C0br8vMMGOpw6zvDnZPIac=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN1PR0101MB1535.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ce1452-a025-482c-d1a2-08d8b6eadd6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 11:11:52.5243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8ldSioygdmj74xsC+wWi3HUyGI6tYIWFZ51nJXA+QIsya54W7KthyJSnjoM8yGUj55l5vH0Io0t0isdAt7KWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4153
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PN1PR0101MB15352B9A277326358EE33F79E6AA0PN1PR0101MB1535_"

--_000_PN1PR0101MB15352B9A277326358EE33F79E6AA0PN1PR0101MB1535_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear meta-ti team,

Any pointer to resolve the below issue ?

irfan@ubuntu:~/Genivi/GDP/genivi-dev-platform/gdp-src-build$ bitbake core-i=
mage-sato
ERROR: /home/irfan/Genivi/GDP/genivi-dev-platform/gdp-src-build/../meta-ti/=
recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb<https://ind01.safelinks.pr=
otection.outlook.com/?url=3Dhttp%3A%2F%2Fti-pdk-build-rtos_git.bb%2F&data=
=3D04%7C01%7CIrfan.Shaikh%40ltts.com%7C7b0973e2a7974c13d89208d8b6eab489%7C3=
11b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C637460466458122621%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&sdata=3Dbd3YlJ%2F9lN3yAjw94DQXFpeN7vFvcDV8A3f%2FNDmGSxc%3D&reserve=
d=3D0>: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was=
:
File: '<code>', lineno: 11, function: <module>
     0007:__anon_25__home_irfan_Genivi_GDP_genivi_dev_platform_gdp_src_buil=
d____poky_meta_classes_debian_bbclass(d)
     0008:__anon_35__home_irfan_Genivi_GDP_genivi_dev_platform_gdp_src_buil=
d____poky_meta_classes_devshell_bbclass(d)
     0009:__anon_103__home_irfan_Genivi_GDP_genivi_dev_platform_gdp_src_bui=
ld____poky_meta_classes_sstate_bbclass(d)
     0010:__anon_45__home_irfan_Genivi_GDP_genivi_dev_platform_gdp_src_buil=
d____poky_meta_classes_blacklist_bbclass(d)
 *** 0011:__anon_47__home_irfan_Genivi_GDP_genivi_dev_platform_gdp_src_buil=
d____meta_ti_classes_ti_pdk_fetch_bbclass(d)
File: '/home/irfan/Genivi/GDP/genivi-dev-platform/gdp-src-build/../meta-ti/=
classes/ti-pdk-fetch.bbclass', lineno: 44, function: __anon_47__home_irfan_=
Genivi_GDP_genivi_dev_platform_gdp_src_build____meta_ti_classes_ti_pdk_fetc=
h_bbclass
     0040:
     0041:# Make sure that ti-pdk-source is unpacked before we set up the h=
ardlinks.
     0042:python __anonymous () {
     0043:    pn =3D d.getVar('PN')
 *** 0044:    pdk_src_pn =3D d.getVar('TI_PDK_SOURCE_PN')
     0045:    if pn !=3D pdk_src_pn:
     0046:        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE=
_PN}:do_unpack')
     0047:}
Exception: TypeError: getVar() takes at least 3 arguments (2 given)

ERROR: Failed to parse recipe: /home/irfan/Genivi/GDP/genivi-dev-platform/g=
dp-src-build/../meta-ti/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb<ht=
tps://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fti-pdk-bui=
ld-rtos_git.bb%2F&data=3D04%7C01%7CIrfan.Shaikh%40ltts.com%7C7b0973e2a7974c=
13d89208d8b6eab489%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C63746046645=
8132618%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3Di%2F%2FMgGvQeO12RL76x14V1721f7Z6Vet4=
5CO26bL9zes%3D&reserved=3D0>




L&T Technology Services Ltd

www.LTTS.com

L&T Technology Services Limited (LTTS) is committed to safeguard your data =
privacy. For more information to view our commitment towards data privacy u=
nder GDPR, please visit the privacy policy on our website www.Ltts.com. Thi=
s Email may contain confidential or privileged information for the intended=
 recipient (s). If you are not the intended recipient, please do not use or=
 disseminate the information, notify the sender and delete it from your sys=
tem.

--_000_PN1PR0101MB15352B9A277326358EE33F79E6AA0PN1PR0101MB1535_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Dear me=
ta-ti team,<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Any poi=
nter to resolve the below issue ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal">irfan@ubuntu:~/Genivi/GDP/genivi-dev-platform/gdp-sr=
c-build$ bitbake core-image-sato<br>
ERROR: /home/irfan/Genivi/GDP/genivi-dev-platform/gdp-src-build/../meta-ti/=
recipes-ti/ti-pdk-build/<a href=3D"https://ind01.safelinks.protection.outlo=
ok.com/?url=3Dhttp%3A%2F%2Fti-pdk-build-rtos_git.bb%2F&amp;data=3D04%7C01%7=
CIrfan.Shaikh%40ltts.com%7C7b0973e2a7974c13d89208d8b6eab489%7C311b33788e8a4=
b5ea33fe80a3d8ba60a%7C0%7C0%7C637460466458122621%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dbd3YlJ%2F9lN3yAjw94DQXFpeN7vFvcDV8A3f%2FNDmGSxc%3D&amp;reserved=3D=
0">ti-pdk-build-rtos_git.bb</a>:
 Error executing a python function in &lt;code&gt;:<br>
<br>
The stack trace of python calls that resulted in this exception/failure was=
:<br>
File: '&lt;code&gt;', lineno: 11, function: &lt;module&gt;<br>
&nbsp; &nbsp; &nbsp;0007:__anon_25__home_irfan_Genivi_GDP_genivi_dev_platfo=
rm_gdp_src_build____poky_meta_classes_debian_bbclass(d)<br>
&nbsp; &nbsp; &nbsp;0008:__anon_35__home_irfan_Genivi_GDP_genivi_dev_platfo=
rm_gdp_src_build____poky_meta_classes_devshell_bbclass(d)<br>
&nbsp; &nbsp; &nbsp;0009:__anon_103__home_irfan_Genivi_GDP_genivi_dev_platf=
orm_gdp_src_build____poky_meta_classes_sstate_bbclass(d)<br>
&nbsp; &nbsp; &nbsp;0010:__anon_45__home_irfan_Genivi_GDP_genivi_dev_platfo=
rm_gdp_src_build____poky_meta_classes_blacklist_bbclass(d)<br>
&nbsp;*** 0011:__anon_47__home_irfan_Genivi_GDP_genivi_dev_platform_gdp_src=
_build____meta_ti_classes_ti_pdk_fetch_bbclass(d)<br>
File: '/home/irfan/Genivi/GDP/genivi-dev-platform/gdp-src-build/../meta-ti/=
classes/ti-pdk-fetch.bbclass', lineno: 44, function: __anon_47__home_irfan_=
Genivi_GDP_genivi_dev_platform_gdp_src_build____meta_ti_classes_ti_pdk_fetc=
h_bbclass<br>
&nbsp; &nbsp; &nbsp;0040:<br>
&nbsp; &nbsp; &nbsp;0041:# Make sure that ti-pdk-source is unpacked before =
we set up the hardlinks.<br>
&nbsp; &nbsp; &nbsp;0042:python __anonymous () {<br>
&nbsp; &nbsp; &nbsp;0043: &nbsp; &nbsp;pn =3D d.getVar('PN')<br>
&nbsp;*** 0044: &nbsp; &nbsp;pdk_src_pn =3D d.getVar('TI_PDK_SOURCE_PN')<br=
>
&nbsp; &nbsp; &nbsp;0045: &nbsp; &nbsp;if pn !=3D pdk_src_pn:<br>
&nbsp; &nbsp; &nbsp;0046: &nbsp; &nbsp; &nbsp; &nbsp;d.appendVarFlag('do_un=
pack', 'depends', ' ${TI_PDK_SOURCE_PN}:do_unpack')<br>
&nbsp; &nbsp; &nbsp;0047:}<br>
Exception: TypeError: getVar() takes at least 3 arguments (2 given)<br>
<br>
ERROR: Failed to parse recipe: /home/irfan/Genivi/GDP/genivi-dev-platform/g=
dp-src-build/../meta-ti/recipes-ti/ti-pdk-build/<a href=3D"https://ind01.sa=
felinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fti-pdk-build-rtos_git.bb=
%2F&amp;data=3D04%7C01%7CIrfan.Shaikh%40ltts.com%7C7b0973e2a7974c13d89208d8=
b6eab489%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C637460466458132618%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3Di%2F%2FMgGvQeO12RL76x14V1721f7Z6Vet45CO26b=
L9zes%3D&amp;reserved=3D0">ti-pdk-build-rtos_git.bb</a><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
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

--_000_PN1PR0101MB15352B9A277326358EE33F79E6AA0PN1PR0101MB1535_--
