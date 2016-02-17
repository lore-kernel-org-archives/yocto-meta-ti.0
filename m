Return-Path: <michael.bode@bshg.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 525D8E0090E; Wed, 17 Feb 2016 01:27:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_20,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [94.199.90.91 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
	*      [score: 0.0854]
X-Greylist: delayed 427 seconds by postgrey-1.32 at yocto-www;
	Wed, 17 Feb 2016 01:27:27 PST
Received: from mailout01.rmx.de (mailout01.rmx.de [94.199.90.91])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9387AE00404
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 01:27:27 -0800 (PST)
Received: from mailout02.rmx.de (unknown [172.19.21.100])
	(using TLSv1.2 with cipher AECDH-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mailout01.rmx.de (Postfix) with ESMTPS id 3q4ttT50Hgz2Sjtl
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 10:20:17 +0100 (CET)
Received: from cryptout01.retarus.com (unknown [172.19.21.78])
	by mailout02.rmx.de (Postfix) with ESMTP id 3q4ttR65STzNkw4
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 10:20:15 +0100 (CET)
Received: from cryptout01 (localhost [127.0.0.1])
	by cryptout01.retarus.com (Postfix) with ESMTP id A4AED105C56
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 10:20:14 +0100 (CET)
Received: from mailcc11.dmz2.retloc (mailcc11.retarus.de [172.19.21.11])
	by cryptout01.retarus.com (Postfix) with SMTP id 5CF06105C56
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 10:20:14 +0100 (CET)
Received: from unknown (unknown [10.128.33.225])
	by kdin03 (Postfix) with SMTP id u1H9JBSL006414;
	Wed, 17 Feb 2016 10:19:37 +0100 (CET)
Received: from MCHSWIEXMB5B.bsh.corp.bshg.com (10.128.33.238) by
	MCHSWIEXHM04.bsh.corp.bshg.com (10.128.33.225) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 17 Feb 2016 10:19:31 +0100
Received: from MCHSWIEXMB5A.bsh.corp.bshg.com (10.128.31.38) by
	MCHSWIEXMB5B.bsh.corp.bshg.com (10.128.33.238) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 17 Feb 2016 10:19:31 +0100
Received: from MCHSWIEXMB5A.bsh.corp.bshg.com ([169.254.1.25]) by
	MCHSWIEXMB5A.bsh.corp.bshg.com ([169.254.1.25]) with mapi id
	15.00.1156.000; Wed, 17 Feb 2016 10:19:30 +0100
From: "Bode, Michael (PED-DEAS)" <Michael.Bode@bshg.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Will there be a yocto jethro branch in future?
Thread-Index: AdFpZE6yuWz9ooeXQbiIZaVK1SFc2A==
Date: Wed, 17 Feb 2016 09:19:30 +0000
Message-ID: <5f4fac1f4ae841ad99a481f1ef201f1d@MCHSWIEXMB5A.bsh.corp.bshg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.128.58.195]
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: fd782ad6-06f5-4690-bfdd-57c58a3839e9
X-RMX-ID: 20160217-101936-u1H9JBSL006414-0@kdin03
X-RMX-TRACE: 2016-02-17 10:19:36 KdIn2013@kdin03/mailcc10 [0.1s]
	20160217-101936-u1H9JBSL006414-0@kdin03 0:00:00
X-RMX-TRACE: 2016-02-17 10:19:36 RmxMSO@kdin03/mailcc01 [0.1s]
	20160217-101936-u1H9JBSL006414-0@kdin03 0:00:00
X-RMX-TRACE: 2016-02-17 10:19:37 LIVERmxSTO@kdin03/mailcc12 [0.2s]
	20160217-101936-u1H9JBSL006414-0@kdin03 0:00:01
Subject: Will there be a yocto jethro branch in future?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Feb 2016 09:27:30 -0000
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_5f4fac1f4ae841ad99a481f1ef201f1dMCHSWIEXMB5Abshcorpbshg_"

--_000_5f4fac1f4ae841ad99a481f1ef201f1dMCHSWIEXMB5Abshcorpbshg_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

probably i'm not the first asking this question but i could'nt find any sta=
tement.
I'm working with meta-ti embedded into yocto environment a lot. Really a gr=
eat stuff.
From time to time I update the layers according to the yocto releases. So I=
 started from "dora" and shifted to "fido".
Now I like to update also to "jethro".
Question: "How is the policy of meta-ti integration regarding yocto release=
s?" Will there be a "jethro" branch as soon as the layer is compatible or c=
an I assume that as long as there is no "jethro" branch the meta-ti layer i=
s compatible to yocto head?
If there will be a "jethro" branch, is there a time schedule for this?
Thanks!
Michael


--_000_5f4fac1f4ae841ad99a481f1ef201f1dMCHSWIEXMB5Abshcorpbshg_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"DE">Hello,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"DE"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">probably i&#8217;m not the first asking this questio=
n but i could&#8217;nt find any statement.<o:p></o:p></p>
<p class=3D"MsoNormal">I&#8217;m working with meta-ti embedded into yocto e=
nvironment a lot. Really a great stuff.
<o:p></o:p></p>
<p class=3D"MsoNormal">From time to time I update the layers according to t=
he yocto releases. So I started from &#8220;dora&#8221; and shifted to &#82=
20;fido&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal">Now I like to update also to &#8220;jethro&#8221;.<o=
:p></o:p></p>
<p class=3D"MsoNormal">Question: &#8220;How is the policy of meta-ti integr=
ation regarding yocto releases?&#8221; Will there be a &#8220;jethro&#8221;=
 branch as soon as the layer is compatible or can I assume that as long as =
there is no &#8220;jethro&#8221; branch the meta-ti layer is compatible
 to yocto head?<o:p></o:p></p>
<p class=3D"MsoNormal">If there will be a &#8220;jethro&#8221; branch, is t=
here a time schedule for this?<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks!<o:p></o:p></p>
<p class=3D"MsoNormal">Michael<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_5f4fac1f4ae841ad99a481f1ef201f1dMCHSWIEXMB5Abshcorpbshg_--
