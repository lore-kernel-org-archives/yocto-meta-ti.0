Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B03DBE0098E; Wed, 30 Apr 2014 12:45:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=HTML_MESSAGE, RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
X-Greylist: delayed 170 seconds by postgrey-1.32 at yocto-www;
	Wed, 30 Apr 2014 12:45:01 PDT
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33F10E0096C
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 12:45:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3UJerGm018274;
	Wed, 30 Apr 2014 14:40:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3UJeqIG015452;
	Wed, 30 Apr 2014 14:40:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 30 Apr 2014 14:40:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Murphy, Dan"
	<dmurphy@ti.com>
Thread-Topic: Kernel Hang I2C1??
Thread-Index: Ac9kjbK9NF7l2hAPTFGOrV7u1lzpFAAHjaAA
Date: Wed, 30 Apr 2014 19:40:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFC6122@DLEE11.ent.ti.com>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10@USNYGRMBX4.raymondcorp.local>
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Kernel Hang I2C1??
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
X-List-Received-Date: Wed, 30 Apr 2014 19:45:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015CFC6122DLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015CFC6122DLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Josh,

Do you have the I2C2 entry in your DT?  There are examples in the am33xx.dt=
si file.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://e2e.ti.com<http://e2e.ti.com/>
Wiki - http://processors.wiki.ti.com/index.php/Main_Page

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Vanderpool Josh
Sent: Wednesday, April 30, 2014 9:03 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] Kernel Hang I2C1??

I have a custom board and expect to use i2c1 on the board but it appears to=
 not allow this in the kernel=85
u-boot was able to be modified to support the hardware port i2c1.  Note tha=
t that software is 1based and hardware is zero-based=85

This is the dump:
=B7        [    1.482628] ------------[ cut here ]------------
=B7        [    1.487549] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/oma=
p_device.c:888 omap_device_get_by_hwmod_name+0x94/0xb4()
=B7        [    1.498803] omap_device_get_by_hwmod_name: no omap_device for=
 i2c1
=B7        [    1.505365] Modules linked in:
=B7        [    1.508606] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.10-t=
i2013.12.01 #2
=B7        [    1.515990] Backtrace:
=B7        [    1.518595] [<c0017880>] (dump_backtrace+0x0/0x10c) from [<c0=
017a1c>] (show_stack+0x18/0x1c)
=B7        [    1.527542]  r6:c002f564 r5:00000009 r4:dd083e28 r3:00000000
=B7        [    1.533567] [<c0017a04>] (show_stack+0x0/0x1c) from [<c0580ba=
4>] (dump_stack+0x20/0x28)
=B7        [    1.542068] [<c0580b84>] (dump_stack+0x0/0x28) from [<c0046d0=
8>] (warn_slowpath_common+0x70/0x90)
=B7        [    1.551480] [<c0046c98>] (warn_slowpath_common+0x0/0x90) from=
 [<c0046dcc>] (warn_slowpath_fmt+0x38/0x40)
=B7        [    1.561528]  r8:c076b3fc r7:c0768410 r6:c0c8c9ac r5:c084df08 =
r4:c06b9fa4
=B7        [    1.568647] [<c0046d94>] (warn_slowpath_fmt+0x0/0x40) from [<=
c002f564>] (omap_device_get_by_hwmod_name+0x94/0xb4)
=B7        [    1.579523]  r3:c058be8c r2:c06b6584
=B7        [    1.583341] [<c002f4d0>] (omap_device_get_by_hwmod_name+0x0/0=
xb4) from [<c0778280>] (am33xx_pm_init+0x204/0x45c)
=B7        [    1.594120]  r4:00000000
=B7        [    1.596808] [<c077807c>] (am33xx_pm_init+


The full capture is http://pastebin.com/VyY8CQ0L

I found where roughly where there might be an issue=85pm33xx.c as line#395 =
states it can only use bus i2c1(one based(I assume this is i2c0))
Note I do not need smart reflex or sleep mode at all so any patches to work=
 around this are welcome.

Thanks

Josh Vanderpool
Electrical Engineer


Confidentiality Notice: The preceding e-mail message (including any attachm=
ents) contains information that may be confidential, protected by applicabl=
e legal privileges, or constitute non-public information. It is intended to=
 be conveyed only to the designated recipient(s). If you are not an intende=
d recipient of this message, please notify the sender by replying to this m=
essage and then delete it from your system. Use, dissemination, distributio=
n or reproduction of this message by unintended recipients is not authorize=
d and may be unlawful.

--_000_7D46E86EC0A8354091174257B2FED1015CFC6122DLEE11entticom_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1752922788;
	mso-list-template-ids:2142923300;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Josh,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Do you have the I2C2 e=
ntry in your DT?&nbsp; There are examples in the am33xx.dtsi file.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#1F497D">Since=
rely,<br>
Chase Maupin<br>
Integration Team Manager<br>
Linux Core Product Development<br>
e-mail: chase.maupin@ti.com<br>
phone: (214) 567-2950<br>
<br>
For support:<br>
Forums - <a href=3D"http://e2e.ti.com/">http://e2e.ti.com</a><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#1F497D">Wiki =
- <a href=3D"http://processors.wiki.ti.com/index.php/Main_Page">
http://processors.wiki.ti.com/index.php/Main_Page</a></span><span style=3D"=
color:#1F497D"><o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Vanderpool Josh<br>
<b>Sent:</b> Wednesday, April 30, 2014 9:03 AM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> [meta-ti] Kernel Hang I2C1??<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have a custom board and expect to use i2c1 on the =
board but it appears to not allow this in the kernel=85<o:p></o:p></p>
<p class=3D"MsoNormal">u-boot was able to be modified to support the hardwa=
re port i2c1.&nbsp; Note that that software is 1based and hardware is zero-=
based=85<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is the dump:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.48=
2628] ------------[ cut here ]------------<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.48=
7549] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/omap_device.c:888 omap_=
device_get_by_hwmod_name&#43;0x94/0xb4()<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.49=
8803] omap_device_get_by_hwmod_name: no omap_device for i2c1<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.50=
5365] Modules linked in:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.50=
8606] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.10-ti2013.12.01 #2<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.51=
5990] Backtrace:
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.51=
8595] [&lt;c0017880&gt;] (dump_backtrace&#43;0x0/0x10c) from [&lt;c0017a1c&=
gt;] (show_stack&#43;0x18/0x1c)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.52=
7542]&nbsp; r6:c002f564 r5:00000009 r4:dd083e28 r3:00000000<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.53=
3567] [&lt;c0017a04&gt;] (show_stack&#43;0x0/0x1c) from [&lt;c0580ba4&gt;] =
(dump_stack&#43;0x20/0x28)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.54=
2068] [&lt;c0580b84&gt;] (dump_stack&#43;0x0/0x28) from [&lt;c0046d08&gt;] =
(warn_slowpath_common&#43;0x70/0x90)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.55=
1480] [&lt;c0046c98&gt;] (warn_slowpath_common&#43;0x0/0x90) from [&lt;c004=
6dcc&gt;] (warn_slowpath_fmt&#43;0x38/0x40)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.56=
1528]&nbsp; r8:c076b3fc r7:c0768410 r6:c0c8c9ac r5:c084df08 r4:c06b9fa4<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.56=
8647] [&lt;c0046d94&gt;] (warn_slowpath_fmt&#43;0x0/0x40) from [&lt;c002f56=
4&gt;] (omap_device_get_by_hwmod_name&#43;0x94/0xb4)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.57=
9523]&nbsp; r3:c058be8c r2:c06b6584<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.58=
3341] [&lt;c002f4d0&gt;] (omap_device_get_by_hwmod_name&#43;0x0/0xb4) from =
[&lt;c0778280&gt;] (am33xx_pm_init&#43;0x204/0x45c)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.59=
4120]&nbsp; r4:00000000<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-list=
:l0 level1 lfo2;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-famil=
y:Symbol;color:#333333"><span style=3D"mso-list:Ignore">=B7<span style=3D"f=
ont:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0pt;=
font-family:&quot;Courier New&quot;;color:#333333">[&nbsp;&nbsp;&nbsp; 1.59=
6808] [&lt;c077807c&gt;] (am33xx_pm_init&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The full capture is <a href=3D"http://pastebin.com/V=
yY8CQ0L">http://pastebin.com/VyY8CQ0L</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I found where roughly where there might be an issue=
=85pm33xx.c as line#395 states it can only use bus i2c1(one based(I assume =
this is i2c0))<o:p></o:p></p>
<p class=3D"MsoNormal">Note I do not need smart reflex or sleep mode at all=
 so any patches to work around this are welcome.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,&quot;sans-serif&quot;;color:navy">Josh Vanderpool<br>
</span></b><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&q=
uot;sans-serif&quot;;color:gray">Electrical Engineer</span><b><span style=
=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;c=
olor:navy"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Confidentiality Notice: The preceding e-mail message (including any atta=
chments) contains information that may be confidential, protected by applic=
able legal privileges, or constitute non-public information. It is intended=
 to be conveyed only to the designated
 recipient(s). If you are not an intended recipient of this message, please=
 notify the sender by replying to this message and then delete it from your=
 system. Use, dissemination, distribution or reproduction of this message b=
y unintended recipients is not authorized
 and may be unlawful. <o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015CFC6122DLEE11entticom_--
