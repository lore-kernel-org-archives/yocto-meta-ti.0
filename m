Received: from AUS01-ME1-obe.outbound.protection.outlook.com (AUS01-ME1-obe.outbound.protection.outlook.com [40.107.136.103])
 by mx.groups.io with SMTP id smtpd.web11.28.1591675392887381882
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 21:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=FAKcn/1l;
 spf=pass (domain: gallagher.com, ip: 40.107.136.103, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmGZGsAuopKgQxjvt/X8TIdkY8V3eUSGQ5xSn1hMVb8i1CbCTiPVVFxPlK3y58IeZHU1l1dIy53P+ZpkYlEZNbNPd4UYnLHRr3u75jPIXTMBHHro8Uxzy0M7PCSwJLQpJ59r9AkQfS4bReFHlHbe6MHxn32YJLDEOiOjmS7L5PWC66QUdE0mOs5+gXf/f6nN9q1nKGB9b2FlMDLHrbU5kW+eq6D3i+1U9DnQklrTdNS3w1Iilw5+TsylxpqGFqDmMSSsFKNZvgP2ZOs9UoBYGsr1qkGDJ+AuJp6fAbVc8pXnKaUUXKlZWgmsJIOj7GVKu2vSZUREofLYupktuUskmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWDPlphvJTi8ZqdFe074z6h+4BOn2IlcB5tuc94fKFQ=;
 b=NKgthlvPQXcEWC6dwvoXzZB1mQlPlR0hrHfuA5t6vYOJnQbayXLWtS730DHTufq3qOcIVni74v/BgB8pjv3GwSQ6NbOFcbrfnXm0BMEji4j0sjRLC7Lx3TeEuKxHX9hn9XehMvtMKoT6mVBIpWCQZzUSDOB3ZzhKjC91IYLBsBYm7Xz258L4AC1NrEEnqb0BB76RWzxT2tkrsYsJ9Fg6znS9J5+v4zKHui8H/THKiO6bTw3LTfpVFQhrtc4QCpt8e8KLTaulNZN5XybbD4sZsaTfB4xUWhEI4GWpSG2NaGvME9SUCXqTcoOrOvx3LznMJfzmDOwlK6YBXHBK6nIJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWDPlphvJTi8ZqdFe074z6h+4BOn2IlcB5tuc94fKFQ=;
 b=FAKcn/1lowPJbthrriazGBKl7THX/JLGtcBkf5TF0frcjFGK/kyxWhvFpmU2FoAxZMuJ7wi27lSjkeXZ2NhUf+EGHNFF8RQ11TKGSGk3AtiOopRwCIc2/fo2MysnijUcvirKte4d05LS03/KnrWwDZpos+GVHmaCEqkeAHdaqBY=
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com (2603:10c6:0:9::17) by
 SYXPR01MB1551.ausprd01.prod.outlook.com (2603:10c6:0:36::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Tue, 9 Jun 2020 04:03:06 +0000
Received: from SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482]) by SYXPR01MB1088.ausprd01.prod.outlook.com
 ([fe80::d4bf:2e94:579a:f482%2]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 04:03:06 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: Unable to send patch
Thread-Topic: Unable to send patch
Thread-Index: AdY+Avsk2Lpx7xZiQgyjszLBQA2MHgAD9ZFQ
Date: Tue, 9 Jun 2020 04:03:06 +0000
Message-ID: 
 <SYXPR01MB10885B7104C7660C264592DBE5820@SYXPR01MB1088.ausprd01.prod.outlook.com>
References: 
 <SYXPR01MB108856737CAC7AF780F52BDFE5820@SYXPR01MB1088.ausprd01.prod.outlook.com>
In-Reply-To: 
 <SYXPR01MB108856737CAC7AF780F52BDFE5820@SYXPR01MB1088.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=gallagher.com;
x-originating-ip: [139.180.92.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bbb3637-5a41-4bd0-1db5-08d80c2a0410
x-ms-traffictypediagnostic: SYXPR01MB1551:
x-microsoft-antispam-prvs: 
 <SYXPR01MB155125A4647D668C7F5C7066E5820@SYXPR01MB1551.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3x0u6sRIsbcbBlz9hxVsTy3WRasQ2asKAyPzjVTTWhsOqY1Qjhz0g5yckhOwWtBc4jVxVWUbGybzIodh3LDQls0CwCMjTyAML6CdhVsJeK9XKunSfYV4x1xqKbIH87o2htRYeJckTqDg0aW9GZIPrqsaBYuUo0uygIdgRw6qU/u1tjmFPvJzpRcBw8wHZevMGOl1Iy4Yaw9SB8b29fB2KAdAE3ccRFAkGGJbQB80/0dAI+BKEUlRtCDpUlmEB++TqXjzPETMf2Nvrdajyi55+zVWxoSVkvzxeVNtumAUK5SE914BFhZ5quoMX3FuNcMFU5Tj3nesEseFEfAjTPCW/A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYXPR01MB1088.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39850400004)(396003)(346002)(366004)(376002)(3480700007)(76116006)(316002)(5660300002)(8676002)(52536014)(8936002)(66446008)(33656002)(9686003)(71200400001)(2906002)(26005)(64756008)(55016002)(86362001)(66946007)(66476007)(83380400001)(2940100002)(66556008)(6916009)(53546011)(186003)(7696005)(4744005)(478600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 AhAezv3Wey72kdxjEGma2RLoUsIMb+LyAn5LPT8sQriCADS6YXkJG5CVxJbsJG2i8a/uF4uavKWfXwqDdv1dGal15OBR6qeSJY0+r4RLLsKXemC4XOWEsegMZ618AvDrH9Mp6DhA+lNPczqyMDR1BarkDjC6Xog+IMH5VcXU4c7NzwkoFMSiq4Yo/Ta9j08+eUjIHRipIweB52jJnGF4b7+ha8jE92U0KmHD6SnHVTyGU+ioq3ruhph0Su1xSsqWbb+KC8+jSG7QfsEbw7z2iBDAD95Nap75G8SaUgIzkUnMVLKntcSspkOOBpdKLM0WhXKfv1Eu5dYbWC6rlzIM/rPoctaVY6tM8hHaBOpMcHgmY0TyrUU9E/qh69I2Cwy2j4spzFONo0Y3Rx4THZXm++vO3bihgLqWHi2j8OFwlPR7h5HwevCsV7IervOWZzOqqNXO9J/mDZKzIZy4HI0jmqR4JJn1iQAxLoVKhO/HI0WczDXkkDxkOz5gD5nx0IZi
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbb3637-5a41-4bd0-1db5-08d80c2a0410
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 04:03:06.8910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrpgKhn0Y4gux59B2It5ih68X6AppiQwmmsUqbVKEP5Yld1FTaQpkrSjUqurqoePlAytCDiN1VDL54BHXrrJzVDwOKqQibcKPX2p6Xs+bnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYXPR01MB1551
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SYXPR01MB10885B7104C7660C264592DBE5820SYXPR01MB1088ausp_"

--_000_SYXPR01MB10885B7104C7660C264592DBE5820SYXPR01MB1088ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It was a problem with SMTP server, all sorted now

From: Ankur Tyagi
Sent: Tuesday, 9 June 2020 2:11 PM
To: meta-ti@lists.yoctoproject.org
Subject: Unable to send patch

Hi,

When I am trying to submit my patch, I am getting following error:

5.7.1 <meta-ti@lists.yoctoproject.org<mailto:meta-ti@lists.yoctoproject.org=
>>: Recipient address rejected: Access denied

Am I blocked or something else?

Regards
Ankur


--_000_SYXPR01MB10885B7104C7660C264592DBE5820SYXPR01MB1088ausp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal">It was a problem with SMTP server, all sorted now<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"mso-fareast-languag=
e:EN-NZ">From:</span></b><span lang=3D"EN-US" style=3D"mso-fareast-language=
:EN-NZ"> Ankur Tyagi
<br>
<b>Sent:</b> Tuesday, 9 June 2020 2:11 PM<br>
<b>To:</b> meta-ti@lists.yoctoproject.org<br>
<b>Subject:</b> Unable to send patch<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
ze:9.0pt;font-family:&quot;Lucida Console&quot;">5.7.1 &lt;<a href=3D"mailt=
o:meta-ti@lists.yoctoproject.org">meta-ti@lists.yoctoproject.org</a>&gt;: R=
ecipient address rejected: Access denied<o:p></o:p></span></p>
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

--_000_SYXPR01MB10885B7104C7660C264592DBE5820SYXPR01MB1088ausp_--
