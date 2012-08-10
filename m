Return-Path: <Tim.Verstraete@medecbenelux.be>
Received: from mail.medecbenelux.be (mail.medecbenelux.be [81.83.14.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CE20E013BB
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2012 01:34:42 -0700 (PDT)
Received: from SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407]) by
	SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407%10]) with mapi
	id 14.01.0355.002; Fri, 10 Aug 2012 10:34:40 +0200
From: Tim Verstraete <Tim.Verstraete@medecbenelux.be>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti / pandaboard] SGX / powervr drivers
Thread-Index: Ac120jazpUfmqaE5RC+wNpDHhdRckQ==
Date: Fri, 10 Aug 2012 08:34:39 +0000
Message-ID: <4439C3C0562087488F139C696CD862A71321053E@SBS-MEDEC.medecbenelux.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2002:5153:ef2:0:8194:a0c6:23da:d964]
MIME-Version: 1.0
Subject: [meta-ti / pandaboard] SGX / powervr drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2012 08:34:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4439C3C0562087488F139C696CD862A71321053ESBSMEDECmedecbe_"

--_000_4439C3C0562087488F139C696CD862A71321053ESBSMEDECmedecbe_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

i am using a pandaboard with meta-ti and i see that in meta-ti we have the =
following:

=B7        Root/recipes-bsp/powervrdrivers

o   Omap3-sgx-modules

o   Omap3 bb file

=B7        Root/recipes-graphics/

o   Libgles

=A7  Libgles-omap3.inc

=A7  Libgles-omap3

=A7  Libgles-omap3 recipe

o   Omapfbplay

o   Xorgxserver

Now I have 2 questions about this ...

=B7        why would we need 2 locations for this since when I look in the =
recipe they use the same source binary but handle it different, is this one=
 recipe for driver and one recipe for opengles library? Why not do it in on=
e shot?

=B7        If I want to generate such setup for omap4 for pandaboard I woul=
d need to make 2 recipes again but this time for the omap4 processor

Thanks in advances for replying and confirming my thoughts ;-)

Kind regards,

Tim


--_000_4439C3C0562087488F139C696CD862A71321053ESBSMEDECmedecbe_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:807161706;
	mso-list-type:hybrid;
	mso-list-template-ids:-988140700 68354049 68354051 68354053 68354049 68354=
051 68354053 68354049 68354051 68354053;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1743403425;
	mso-list-type:hybrid;
	mso-list-template-ids:411986420 68354049 68354051 68354053 68354049 683540=
51 68354053 68354049 68354051 68354053;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
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
<body lang=3D"NL" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">i am using a pandaboard with me=
ta-ti and i see that in meta-ti we have the following:<o:p></o:p></span></p=
>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l1 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Sym=
bol"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quot;Tim=
es New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Root/recipes-bsp/powerv=
rdrivers<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l1 level2 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Courie=
r New&quot;"><span style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &qu=
ot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Omap3-sgx-modules<o:p><=
/o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l1 level2 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Courie=
r New&quot;"><span style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &qu=
ot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Omap3 bb file<o:p></o:p=
></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l1 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Sym=
bol"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quot;Tim=
es New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Root/recipes-graphics/<=
o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l1 level2 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Courie=
r New&quot;"><span style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &qu=
ot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Libgles<o:p></o:p></spa=
n></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:108.0pt;text-indent:-18.=
0pt;mso-list:l1 level3 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Wingdings"><=
span style=3D"mso-list:Ignore">=A7<span style=3D"font:7.0pt &quot;Times New=
 Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Libgles-omap3.inc<o:p><=
/o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:108.0pt;text-indent:-18.=
0pt;mso-list:l1 level3 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Wingdings"><=
span style=3D"mso-list:Ignore">=A7<span style=3D"font:7.0pt &quot;Times New=
 Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Libgles-omap3<o:p></o:p=
></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:108.0pt;text-indent:-18.=
0pt;mso-list:l1 level3 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Wingdings"><=
span style=3D"mso-list:Ignore">=A7<span style=3D"font:7.0pt &quot;Times New=
 Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Libgles-omap3 recipe<o:=
p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l1 level2 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Courie=
r New&quot;"><span style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &qu=
ot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Omapfbplay<o:p></o:p></=
span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:72.0pt;text-indent:-18.0=
pt;mso-list:l1 level2 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Courie=
r New&quot;"><span style=3D"mso-list:Ignore">o<span style=3D"font:7.0pt &qu=
ot;Times New Roman&quot;">&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Xorgxserver<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Now I have 2 questions about th=
is &#8230; <o:p>
</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo2"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Sym=
bol"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quot;Tim=
es New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">why would we need 2 loc=
ations for this since when I look in the recipe they use the same source bi=
nary but handle it different, is this one recipe for driver and one recipe =
for opengles library? Why not do it
 in one shot?<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo2"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Sym=
bol"><span style=3D"mso-list:Ignore">=B7<span style=3D"font:7.0pt &quot;Tim=
es New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">If I want to generate s=
uch setup for omap4 for pandaboard I would need to make 2 recipes again but=
 this time for the omap4 processor<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks in advances for replying=
 and confirming my thoughts ;-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Kind regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tim<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_4439C3C0562087488F139C696CD862A71321053ESBSMEDECmedecbe_--
