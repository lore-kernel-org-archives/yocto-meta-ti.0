Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C70CE00985; Wed, 30 Apr 2014 09:50:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: *  0.0 HTML_MESSAGE BODY: HTML included in message
X-Greylist: delayed 2794 seconds by postgrey-1.32 at yocto-www;
	Wed, 30 Apr 2014 09:50:06 PDT
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C73E3E00478
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 09:50:06 -0700 (PDT)
Received: from usnygrcas2.raymondcorp.local (nothing.attdns.com
	[130.1.155.195] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s3UG3Rk2003595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 11:03:30 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.252]) by usnygrcas2
	([130.1.155.199]) with mapi id 14.03.0174.001; Wed, 30 Apr 2014 12:03:27
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Kernel Hang I2C1??
Thread-Index: Ac9kjbK9NF7l2hAPTFGOrV7u1lzpFA==
Date: Wed, 30 Apr 2014 16:03:26 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.154.128.241]
MIME-Version: 1.0
X-mailWatchMessageID: 1398873810.617638.1642.3178315793
X-mailWatchContentScore: Score of 0 assigned to Content
X-mailWatchUCEScore: Score of 0 assigned to UCE
X-mailWatch: Analyzed by IntelliReach MessageScreen(tm)
Subject: Kernel Hang I2C1??
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
X-List-Received-Date: Wed, 30 Apr 2014 16:50:20 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10USNYGRMBX4raymo_"

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10USNYGRMBX4raymo_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a custom board and expect to use i2c1 on the board but it appears =
to not allow this in the kernel...
u-boot was able to be modified to support the hardware port i2c1.  Note t=
hat that software is 1based and hardware is zero-based...

This is the dump:
*         [    1.482628] ------------[ cut here ]------------
*         [    1.487549] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/om=
ap_device.c:888 omap_device_get_by_hwmod_name+0x94/0xb4()
*         [    1.498803] omap_device_get_by_hwmod_name: no omap_device fo=
r i2c1
*         [    1.505365] Modules linked in:
*         [    1.508606] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.10-=
ti2013.12.01 #2
*         [    1.515990] Backtrace:
*         [    1.518595] [<c0017880>] (dump_backtrace+0x0/0x10c) from [<c=
0017a1c>] (show_stack+0x18/0x1c)
*         [    1.527542]  r6:c002f564 r5:00000009 r4:dd083e28 r3:00000000=

*         [    1.533567] [<c0017a04>] (show_stack+0x0/0x1c) from [<c0580b=
a4>] (dump_stack+0x20/0x28)
*         [    1.542068] [<c0580b84>] (dump_stack+0x0/0x28) from [<c0046d=
08>] (warn_slowpath_common+0x70/0x90)
*         [    1.551480] [<c0046c98>] (warn_slowpath_common+0x0/0x90) fro=
m [<c0046dcc>] (warn_slowpath_fmt+0x38/0x40)
*         [    1.561528]  r8:c076b3fc r7:c0768410 r6:c0c8c9ac r5:c084df08=
 r4:c06b9fa4
*         [    1.568647] [<c0046d94>] (warn_slowpath_fmt+0x0/0x40) from [=
<c002f564>] (omap_device_get_by_hwmod_name+0x94/0xb4)
*         [    1.579523]  r3:c058be8c r2:c06b6584
*         [    1.583341] [<c002f4d0>] (omap_device_get_by_hwmod_name+0x0/=
0xb4) from [<c0778280>] (am33xx_pm_init+0x204/0x45c)
*         [    1.594120]  r4:00000000
*         [    1.596808] [<c077807c>] (am33xx_pm_init+


The full capture is http://pastebin.com/VyY8CQ0L

I found where roughly where there might be an issue...pm33xx.c as line#39=
5 states it can only use bus i2c1(one based(I assume this is i2c0))
Note I do not need smart reflex or sleep mode at all so any patches to wo=
rk around this are welcome.

Thanks

Josh Vanderpool
Electrical Engineer



Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10USNYGRMBX4raymo_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-asci=
i">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">=

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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New","serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New","serif";}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
	font-family:"Courier New","serif";
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
<p class=3D"MsoNormal">I have a custom board and expect to use i2c1 on th=
e board but it appears to not allow this in the kernel&#8230;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">u-boot was able to be modified to support the hard=
ware port i2c1.&nbsp; Note that that software is 1based and hardware is z=
ero-based&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is the dump:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.482628] ------------[ cut here ]------------<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.487549] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2=
/omap_device.c:888 omap_device_get_by_hwmod_name&#43;0x94/0xb4()<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.498803] omap_device_get_by_hwmod_name: no omap_device=
 for i2c1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.505365] Modules linked in:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.508606] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.=
10-ti2013.12.01 #2<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.515990] Backtrace:
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.518595] [&lt;c0017880&gt;] (dump_backtrace&#43;0x0/0x=
10c) from [&lt;c0017a1c&gt;] (show_stack&#43;0x18/0x1c)<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.527542]&nbsp; r6:c002f564 r5:00000009 r4:dd083e28 r3:=
00000000<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.533567] [&lt;c0017a04&gt;] (show_stack&#43;0x0/0x1c) =
from [&lt;c0580ba4&gt;] (dump_stack&#43;0x20/0x28)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.542068] [&lt;c0580b84&gt;] (dump_stack&#43;0x0/0x28) =
from [&lt;c0046d08&gt;] (warn_slowpath_common&#43;0x70/0x90)<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.551480] [&lt;c0046c98&gt;] (warn_slowpath_common&#43;=
0x0/0x90) from [&lt;c0046dcc&gt;] (warn_slowpath_fmt&#43;0x38/0x40)<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.561528]&nbsp; r8:c076b3fc r7:c0768410 r6:c0c8c9ac r5:=
c084df08 r4:c06b9fa4<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.568647] [&lt;c0046d94&gt;] (warn_slowpath_fmt&#43;0x0=
/0x40) from [&lt;c002f564&gt;] (omap_device_get_by_hwmod_name&#43;0x94/0x=
b4)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.579523]&nbsp; r3:c058be8c r2:c06b6584<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.583341] [&lt;c002f4d0&gt;] (omap_device_get_by_hwmod_=
name&#43;0x0/0xb4) from [&lt;c0778280&gt;] (am33xx_pm_init&#43;0x204/0x45=
c)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.594120]&nbsp; r4:00000000<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:0in;text-indent:-.25in;mso-li=
st:l0 level1 lfo1;background:white">
<![if !supportLists]><span lang=3D"EN" style=3D"font-size:10.0pt;font-fam=
ily:Symbol;color:#333333"><span style=3D"mso-list:Ignore">&middot;<span s=
tyle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN" style=3D"font-size:10.0p=
t;font-family:&quot;Courier New&quot;,&quot;serif&quot;;color:#333333">[&=
nbsp;&nbsp;&nbsp; 1.596808] [&lt;c077807c&gt;] (am33xx_pm_init&#43;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The full capture is <a href=3D"http://pastebin.com=
/VyY8CQ0L">http://pastebin.com/VyY8CQ0L</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I found where roughly where there might be an issu=
e&#8230;pm33xx.c as line#395 states it can only use bus i2c1(one based(I =
assume this is i2c0))<o:p></o:p></p>
<p class=3D"MsoNormal">Note I do not need smart reflex or sleep mode at a=
ll so any patches to work around this are welcome.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&qu=
ot;Arial&quot;,&quot;sans-serif&quot;;color:navy">Josh Vanderpool<br>
</span></b><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,=
&quot;sans-serif&quot;;color:gray">Electrical Engineer</span><b><span sty=
le=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quo=
t;;color:navy"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p>
Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.

<p>

</body>
</html>

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10USNYGRMBX4raymo_--
