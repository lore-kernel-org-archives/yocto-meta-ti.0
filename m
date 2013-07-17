Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78B47E0152B
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2013 06:14:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6HDE2JJ011832;
	Wed, 17 Jul 2013 08:14:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6HDE2bO006814;
	Wed, 17 Jul 2013 08:14:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 17 Jul 2013 08:14:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-ti] Which machine type to use for DaVinci DM6446 and
	TI816x?
Thread-Index: AQHOgu6uE6jMzodEHUCwj5U4VBfFHJlo2CHw
Date: Wed, 17 Jul 2013 13:14:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015965BBDC@DLEE11.ent.ti.com>
References: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
	<20130710164618.GD16407@edge>
	<CAFZh4h-W=557rBxsehQhzpgJuxk+Z5BmKeboNk2eAGnBt8vBUQ@mail.gmail.com>
In-Reply-To: <CAFZh4h-W=557rBxsehQhzpgJuxk+Z5BmKeboNk2eAGnBt8vBUQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Which machine type to use for DaVinci DM6446 and	TI816x?
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
X-List-Received-Date: Wed, 17 Jul 2013 13:14:05 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015965BBDCDLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015965BBDCDLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Brian Hutchinson
Sent: Wednesday, July 17, 2013 8:08 AM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] Which machine type to use for DaVinci DM6446 and TI8=
16x?

On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko <denys@ti.com<mailto:de=
nys@ti.com>> wrote:

DM6446 is quite different from OMAP-L138. Both AM180x and DA850 are just
derivatives of OMAP-L138.

Anyway, DM6446 is no longer supported, as it's a very old platform.


> I've always used Arago or Angstrom for DM6446 support in the past and so
> I'm not sure which .conf I should be using with meta-ti.  My gut says use
> am1808-evm.conf but I thought I should ask to be sure.
--
Denys

So how hard is it to get ti816x machine support moved up into Dylan (or mas=
ter)?  I've always had machine support for the branches I used in the past =
... now I find myself needing Dylan or even master and there is no ti816x s=
upport there.

Is it not there just because nobody had hardware to test it?  If so, I'm ga=
me to add it with some guidance :)

[CEM] Generally not too hard.  You can often start with the old arago machi=
ne and move that in with some cleanup.  Then you will need to move/create t=
he bootloader and kernel recipes as well, again looking for cleanup.  That =
should give you a basic working system.  The main issue is that someone nee=
ds to be signed up to keep those recipes working and up to date.  That is w=
hat is missing in most cases is a maitainer.

Even better, for you use I would recommend looking at commit c586bd9a66 whi=
ch is the one that removed these configs and then add back the pieces you n=
eed.


Regards,

Brian



--_000_7D46E86EC0A8354091174257B2FED1015965BBDCDLEE11entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
span.hoenzb
	{mso-style-name:hoenzb;}
span.EmailStyle18
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Brian Hutchinson<br>
<b>Sent:</b> Wednesday, July 17, 2013 8:08 AM<br>
<b>To:</b> Dmytriyenko, Denys<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] Which machine type to use for DaVinci DM6446 =
and TI816x?<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko =
&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; =
wrote:<o:p></o:p></p>
<div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">DM6446 is quite different from OMAP-L138. Both AM180=
x and DA850 are just<br>
derivatives of OMAP-L138.<br>
<br>
Anyway, DM6446 is no longer supported, as it's a very old platform.<o:p></o=
:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
<br>
&gt; I've always used Arago or Angstrom for DM6446 support in the past and =
so<br>
&gt; I'm not sure which .conf I should be using with meta-ti. &nbsp;My gut =
says use<br>
&gt; am1808-evm.conf but I thought I should ask to be sure.<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><span class=3D"hoenzb"><span style=3D"color:#888888"=
>--</span></span><span style=3D"color:#888888"><br>
<span class=3D"hoenzb">Denys</span></span><o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">So how hard is it to get ti816x machine support move=
d up into Dylan (or master)? &nbsp;I've always had machine support for the =
branches I used in the past ... now I find myself needing Dylan or even mas=
ter and there is no ti816x support there.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Is it not there just because nobody had hardware to =
test it? &nbsp;If so, I'm game to add it with some guidance :)<o:p></o:p></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] Generally not too h=
ard.&nbsp; You can often start with the old arago machine and move that in =
with some cleanup.&nbsp; Then you will need to move/create the bootloader
 and kernel recipes as well, again looking for cleanup.&nbsp; That should g=
ive you a basic working system.&nbsp; The main issue is that someone needs =
to be signed up to keep those recipes working and up to date.&nbsp; That is=
 what is missing in most cases is a maitainer.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Even better, for you use =
I would recommend looking at commit c586bd9a66 which is the one that remove=
d these configs and then add back the pieces you need.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Brian<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015965BBDCDLEE11entticom_--
