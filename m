Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80FF5E00406
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 22:05:07 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7L55509008878;
	Wed, 21 Aug 2013 00:05:06 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7L552bZ019229;
	Wed, 21 Aug 2013 00:05:03 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 21 Aug 2013 13:05:01 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Thread-Topic: [meta-ti] Timeout issue
Thread-Index: Ac6diEvL1Ah5xnxST560O3gdUpr9Cv//pN0A//5emCA=
Date: Wed, 21 Aug 2013 05:05:01 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5444ACE@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D544493F@DBDE04.ent.ti.com>
	<CAP71WjyQN6a3C8qV3Wdaok4FmuX3Qic8c75X4t-PkXC7TnVp9Q@mail.gmail.com>
In-Reply-To: <CAP71WjyQN6a3C8qV3Wdaok4FmuX3Qic8c75X4t-PkXC7TnVp9Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Timeout issue
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
X-List-Received-Date: Wed, 21 Aug 2013 05:05:10 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CF956B779D819D41BBC043B7082161D5444ACEDBDE04entticom_"

--_000_CF956B779D819D41BBC043B7082161D5444ACEDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks a lot Nicholas.

Regards,
Mrinmayee

From: Nicolas Dechesne [mailto:nicolas.dechesne@linaro.org]
Sent: Tuesday, August 20, 2013 5:37 PM
To: Hingolikar, Mrinmayee
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] Timeout issue


On Tue, Aug 20, 2013 at 11:33 AM, Hingolikar, Mrinmayee <mrinmayee@ti.com<m=
ailto:mrinmayee@ti.com>> wrote:
During yocto build many times the fetch times out resulting in a fetcher fa=
ilure. The same command for fetch when run with a larger timeout for wget s=
ucceeds.
Where can we modify the arguments to wget so that the build doesn't halt du=
e to a fetcher failure?


it's defined in meta/conf/bitbake.conf as:

FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-chec=
k-certificate"

you should be able to modify the value of that variable in any of your conf=
ig file.


--_000_CF956B779D819D41BBC043B7082161D5444ACEDBDE04entticom_
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Thanks a lot Nicholas.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Regards,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Mrinmayee<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Nicolas =
Dechesne [mailto:nicolas.dechesne@linaro.org]
<br>
<b>Sent:</b> Tuesday, August 20, 2013 5:37 PM<br>
<b>To:</b> Hingolikar, Mrinmayee<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] Timeout issue<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Tue, Aug 20, 2013 at 11:33 AM, Hingolikar, Mrinma=
yee &lt;<a href=3D"mailto:mrinmayee@ti.com" target=3D"_blank">mrinmayee@ti.=
com</a>&gt; wrote:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">During yocto build many times the fetch times out resulting in a f=
etcher failure. The same command for fetch when run with a larger timeout f=
or wget succeeds.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Where can we modify the arguments to wget so that the build doesn&=
#8217;t halt due to a fetcher failure?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><br>
it's defined in meta/conf/bitbake.conf as:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">FETCHCMD_wget =3D &quot;/usr/bin/env wget -t 2 -T 30=
 -nv --passive-ftp --no-check-certificate&quot;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">you should be able to modify the value of that varia=
ble in any of your config file.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CF956B779D819D41BBC043B7082161D5444ACEDBDE04entticom_--
