Received: from AUS01-SY3-obe.outbound.protection.outlook.com (AUS01-SY3-obe.outbound.protection.outlook.com [40.107.137.99])
 by mx.groups.io with SMTP id smtpd.web12.6113.1591668652973925199
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 19:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=JOMuaH2L;
 spf=pass (domain: gallagher.com, ip: 40.107.137.99, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyVrd0dveTtnno3hpVZ55W+uU+eTnyAXaFA5hu+V31zM97ixqLT+pkBeViiAA6txsveloNRujm22BR1gO7vi3/ptqFvLVBNM9uIB/jNw4++QnpeI4O3xw8nYoNfgumDVZboPYWZii68kjCkn/Ey8bHt2Oq4AO7ih3tEtZVDQ7s2UXvqchh+UKROhNO02WDyK7Cfaoc7xHDHQxmOpkv/U6NVoRo/vXk0nl1cPjsxoUgnnADfwf20wkGS7TcERBcMf1oHqJRneSaSciuxtbFJSb9Z7dhhGONa/QYWAhPr0RKStjZUlQoFIFsn3AG9iATYg9DJVZ+SQvwJoBu6HTRUp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARH970N6YjHJVuB1AgandN1srgE4B/Bp+bjNpBHWrJ4=;
 b=fD7a4TgPgPSZj9tQk14wa8QZ1JEs9z+bNiSplYtHwmDjExEo/qrF76b6Yw6ku0eVz93MBc+Fw7QFkm5WGl+dM8fE+t/o5HqOJZfrK+Qvv8Nx3V27jq70lmpYr+TmheRuzJ6j5+GUT5rUa3qrAn2KVMWCsPZEJQEV3MHUuF9x1nDqnjvBHmg59g6O2Rm0Pwr16STboJ2pKhTmhDAb2dUsZIQWzALH7y5Mu8fVVIXFUPHLk9M3BNL01cOKTgbS2YbRgDlEyKMR5W0g1iZqeCrUc1jjk3KEMQo/5uK3W6dX69JQG17K1zwFPiP9FO8J1URi7qdRIFKDmouEas2FNdYVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARH970N6YjHJVuB1AgandN1srgE4B/Bp+bjNpBHWrJ4=;
 b=JOMuaH2LLAQXshcu0/5YWLmIzIuTcXNbMO+a6T2HDOxI9x5DHKHej8LInd6+WjVbz7a5pQ+Wd/oJbptPv0PEpjReL+IWTZLE7FunDuovn/kVPQXLW9wT7wapHd5SYEd5voL92ABixhkSK1jOcOE+bEK17Ow4vuctdggdfX7BIM8=
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com (2603:10c6:0:9::17) by
 SYXPR01MB1871.ausprd01.prod.outlook.com (2603:10c6:0:2a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Tue, 9 Jun 2020 02:10:49 +0000
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482]) by SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482%2]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 02:10:49 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Unable to send patch
Thread-Topic: Unable to send patch
Thread-Index: AdY+Avsk2Lpx7xZiQgyjszLBQA2MHg==
Date: Tue, 9 Jun 2020 02:10:49 +0000
Message-ID: 
 <SYXPR01MB108856737CAC7AF780F52BDFE5820@SYXPR01MB1088.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44c41c3a-89d2-464c-51dd-08d80c1a5466
x-ms-traffictypediagnostic: SYXPR01MB1871:
x-microsoft-antispam-prvs: 
 <SYXPR01MB18719671342798D0F4877D39E5820@SYXPR01MB1871.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UciIKSkGopB4s/RoaauyszrF9ZmkuNCqQjrR7qxe6c5IltsEtmF4a2qgMMfX2H3QVVkKRJTh5UjPM5+Essopv89ihIr7rtgiZ/CwkwzGOUPeTnKnQlvIUJCFfOoWizEduxGdxuC56HM+70D1WW3iDYDOdoHB9dC4sF+Grz0UMFLeYQ3KmjASq8CFriXtA5cHgUctxFNuPapAFywQUcSlyT3etT4aUz10QIFwflRF9tgcWf3/Vngt1ia1HZLqa07SQX/C6c2ueaWDGsb4HCud0OvpPZLTo63emab84wtr27FPYNGpoYToYUmXSPnIvzBcovc238LMoXXVDAPSrJnVGA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYXPR01MB1088.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(66446008)(316002)(7696005)(76116006)(6506007)(8676002)(5660300002)(3480700007)(66476007)(64756008)(66556008)(26005)(52536014)(8936002)(2906002)(66946007)(186003)(55016002)(71200400001)(9326002)(9686003)(33656002)(6916009)(83380400001)(558084003)(478600001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 jUH0u9xV02xfjhIg7SFoznQWYTed12dHNrUP5mm5wUbbQAvbqGUkVCQBcR/nMOI1HBEwRWgJS61X3CBnW/t7sMRZ8J+SvjN7W7D6lhT9mhVspTbR74w+wvU0Xtd8EFfH5/pFVfUUvd2ebZS4x6KWKRzQon52XJrRDn6iPWeyVUhCDxbQZlqrjywoSmDAhNYfEA07Bihlf7pXoRq3i9gLN5yG959qK5qSiDnKBo4c34eQ5M/DLw/d0fNuo6Ie3s1uzm74wAJMOocsTvU4OItzLiy9BapkWCNm4Tc7ihGMzRl5emUVofgAyQz3zCezsrloOXM7bjFJX2BVdHCljVUJ88va1seU4YwrYFi2ktkg2Cv+oiAgFdGZrE6lJqt62+gEH2iCoLorNgAqBQi1h86pmtmp/fadPmJFboDDDTgI6BGrc7QloR4pSbQqfBuB4zOWf8TXCvOs+6Fce6JHWPnJY91unE41UazA1qhj19wPNeqL83gMVXfgE7tuNhLod8oG
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c41c3a-89d2-464c-51dd-08d80c1a5466
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 02:10:49.6650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hr6YAniyRHCzv+T6Jab4URDUjS2UUToW9xtnD3/lSD0p6yjsJiPFwjyxog3DaGnO+v8NuR/nMRN8QpSnY8z6GyuEjUmDojCK7B55va4Gpgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYXPR01MB1871
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SYXPR01MB108856737CAC7AF780F52BDFE5820SYXPR01MB1088ausp_"

--_000_SYXPR01MB108856737CAC7AF780F52BDFE5820SYXPR01MB1088ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

When I am trying to submit my patch, I am getting following error:

5.7.1 <meta-ti@lists.yoctoproject.org>: Recipient address rejected: Access =
denied

Am I blocked or something else?

Regards
Ankur


--_000_SYXPR01MB108856737CAC7AF780F52BDFE5820SYXPR01MB1088ausp_
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
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-NZ" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">When I am trying to submit=
 my patch, I am getting following error:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">5.7.1 &lt;meta-ti@lists.yo=
ctoproject.org&gt;: Recipient address rejected: Access denied<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Am I blocked or something =
else?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Regards<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Ankur<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SYXPR01MB108856737CAC7AF780F52BDFE5820SYXPR01MB1088ausp_--
