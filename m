Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 754CDE006BC
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 10:22:25 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RIMMnR003195;
	Mon, 27 Jan 2014 12:22:22 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RIMMeK003654;
	Mon, 27 Jan 2014 12:22:22 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 27 Jan 2014 12:22:22 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: =?Windows-1252?Q?Andr=E9_Prado?= <andreprado88@gmail.com>, "Dmytriyenko,
	Denys" <denys@ti.com>
Thread-Topic: [meta-ti] Trying to build for BBB but can't fetch
	linux-ti-staging-3.12.8
Thread-Index: AQHPG4UOWFmUuJqgKk+6vY6oCVOiaJqY4lGA
Date: Mon, 27 Jan 2014 18:22:22 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015992A60A@DLEE11.ent.ti.com>
References: <CAG=2wZcTH-doyKGPCjLT+9K2R_bZTZUz1cz39BVX9WQfXnjSaQ@mail.gmail.com>
	<20140127154500.GA30525@edge>
	<CAG=2wZefN9YGvu0r624rb7nDfUYr5=Rn1hV3HCDm2xdkUeKi+A@mail.gmail.com>
	<20140127172626.GH6814@edge>
	<CAG=2wZfHf=4SBf1=oOY4i+PTxf_W4ryE8uAuQ0rS9Ds9jhdVPQ@mail.gmail.com>
In-Reply-To: <CAG=2wZfHf=4SBf1=oOY4i+PTxf_W4ryE8uAuQ0rS9Ds9jhdVPQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Trying to build for BBB but can't fetch	linux-ti-staging-3.12.8
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
X-List-Received-Date: Mon, 27 Jan 2014 18:22:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015992A60ADLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015992A60ADLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

BTW, I have seen issues before with stale .lock files.

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Andr=E9 Prado
Sent: Monday, January 27, 2014 11:27 AM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] Trying to build for BBB but can't fetch linux-ti-sta=
ging-3.12.8

Haven't tried yet, can you suggest me one so i can test it?

On Mon, Jan 27, 2014 at 3:26 PM, Denys Dmytriyenko <denys@ti.com<mailto:den=
ys@ti.com>> wrote:
On Mon, Jan 27, 2014 at 02:41:48PM -0200, Andr=E9 Prado wrote:
> Hey Denys thanks for the feedback, however i've tried to let my computer =
on
> for 2 days and the instruction do_fetch is still there.
> Anything i could do?
Do you have issues building any other recipe that clones from a git tree?


> On Mon, Jan 27, 2014 at 1:45 PM, Denys Dmytriyenko <denys@ti.com<mailto:d=
enys@ti.com>> wrote:
>
> > On Sat, Jan 25, 2014 at 10:25:54PM -0200, Andr=E9 Prado wrote:
> > > Hello i am trying to build a Yocto image for the Beaglebone black but=
 i
> > am
> > > not having any success.
> > >
> > > This task keeps running for ever: linux-ti-staging-3.12.8-r21a+
> > > gitrAUTOINC+af17c0c3a9 do_fetch
> >
> > Most probably it's just cloning the git tree, which could take some tim=
e.
> >
> >
> > > I've runned this: it clone git://
> > > git.ti.com/ti-linux-kernel/ti-linux-kernel.git<http://git.ti.com/ti-l=
inux-kernel/ti-linux-kernel.git> with success.
> > >
> > > bitbake linux-ti-staging -c cleansstate returns me this:
> > > http://pastebin.com/eAvJvTUU
> > >
> > > bitbake -v linux-ti-staging -c fetch returns me this:
> > > http://pastebin.com/5RaRPeV9
> >
> > There seems to be some kind of exception in bitbake...
> >
> >
> > > build/tmp/work/beaglebone-
> > >
> > poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a+gitrAUTOINC+af17c0c3a9/=
temp/log.do_fetch
> > > returns me this:
> > > http://pastebin.com/AmptCBFw
> > >
> > > DEBUG: Mirror fetch failure for url
> > >
> > http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-lin=
ux-kernel.ti-linux-kernel.git.tar.gz(original
> > > url: git://
> > >
> > git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3D=
ti-linux-3.12.y<http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;proto=
col=3Dgit;branch=3Dti-linux-3.12.y>
> > > )
> >
> > And this just means there are no mirrors with this file, which is
> > expected, as
> > it's a live git repository.
> >
> > --
> > Denys
> >
>
>
>
> --
> Att
> Andr=E9



--
Att
Andr=E9

--_000_7D46E86EC0A8354091174257B2FED1015992A60ADLEE11entticom_
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">BTW, I have seen issues b=
efore with stale .lock files.<o:p></o:p></span></p>
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
<b>On Behalf Of </b>Andr=E9 Prado<br>
<b>Sent:</b> Monday, January 27, 2014 11:27 AM<br>
<b>To:</b> Dmytriyenko, Denys<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] Trying to build for BBB but can't fetch linux=
-ti-staging-3.12.8<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Haven't tried yet, can you suggest me one so i can t=
est it?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Mon, Jan 27, 2014 at 3:26 PM, Denys Dmytriyenko &=
lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; w=
rote:<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On Mon, Jan 27, 2014 =
at 02:41:48PM -0200, Andr=E9 Prado wrote:<br>
&gt; Hey Denys thanks for the feedback, however i've tried to let my comput=
er on<br>
&gt; for 2 days and the instruction do_fetch is still there.<br>
&gt; Anything i could do?<o:p></o:p></p>
</div>
<p class=3D"MsoNormal">Do you have issues building any other recipe that cl=
ones from a git tree?<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><br>
<br>
&gt; On Mon, Jan 27, 2014 at 1:45 PM, Denys Dmytriyenko &lt;<a href=3D"mail=
to:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Sat, Jan 25, 2014 at 10:25:54PM -0200, Andr=E9 Prado wrote:<br=
>
&gt; &gt; &gt; Hello i am trying to build a Yocto image for the Beaglebone =
black but i<br>
&gt; &gt; am<br>
&gt; &gt; &gt; not having any success.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This task keeps running for ever: linux-ti-staging-3.12.8-r2=
1a&#43;<br>
&gt; &gt; &gt; gitrAUTOINC&#43;af17c0c3a9 do_fetch<br>
&gt; &gt;<br>
&gt; &gt; Most probably it's just cloning the git tree, which could take so=
me time.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; I've runned this: it clone git://<br>
&gt; &gt; &gt; <a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel=
.git" target=3D"_blank">
git.ti.com/ti-linux-kernel/ti-linux-kernel.git</a> with success.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; bitbake linux-ti-staging -c cleansstate returns me this:<br>
&gt; &gt; &gt; <a href=3D"http://pastebin.com/eAvJvTUU" target=3D"_blank">h=
ttp://pastebin.com/eAvJvTUU</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; bitbake -v linux-ti-staging -c fetch returns me this:<br>
&gt; &gt; &gt; <a href=3D"http://pastebin.com/5RaRPeV9" target=3D"_blank">h=
ttp://pastebin.com/5RaRPeV9</a><br>
&gt; &gt;<br>
&gt; &gt; There seems to be some kind of exception in bitbake...<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; build/tmp/work/beaglebone-<br>
&gt; &gt; &gt;<br>
&gt; &gt; poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a&#43;gitrAUTOINC&#=
43;af17c0c3a9/temp/log.do_fetch<br>
&gt; &gt; &gt; returns me this:<br>
&gt; &gt; &gt; <a href=3D"http://pastebin.com/AmptCBFw" target=3D"_blank">h=
ttp://pastebin.com/AmptCBFw</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; DEBUG: Mirror fetch failure for url<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_=
git.ti.com.ti-linux-kernel.ti-linux-kernel.git.tar.gz(original" target=3D"_=
blank">
http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-linux-k=
ernel.ti-linux-kernel.git.tar.gz(original</a><br>
&gt; &gt; &gt; url: git://<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;=
protocol=3Dgit;branch=3Dti-linux-3.12.y" target=3D"_blank">
git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3Dti-l=
inux-3.12.y</a><br>
&gt; &gt; &gt; )<br>
&gt; &gt;<br>
&gt; &gt; And this just means there are no mirrors with this file, which is=
<br>
&gt; &gt; expected, as<br>
&gt; &gt; it's a live git repository.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Att<br>
&gt; Andr=E9<o:p></o:p></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
<br>
-- <br>
Att<br>
Andr=E9 <o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015992A60ADLEE11entticom_--
