Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEBBCE005B3
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 00:49:32 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5L7nTLQ020016;
	Fri, 21 Jun 2013 02:49:30 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5L7nQVo031567;
	Fri, 21 Jun 2013 02:49:27 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Fri, 21 Jun 2013 15:49:26 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Thread-Topic: [meta-ti] meta-ti + meta-qt5
Thread-Index: AQHObVqT/YaZ9CP6NE+JbReVJZTnfJk92rPA//+C4ACAAIgUgP//kvWAgACKc+D//35XgAAAUI6AABDdoUAAIUKBAAAW/DUQ
Date: Fri, 21 Jun 2013 07:49:25 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB54497@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
	<CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
	<CAP71WjwHYuFPa2ieAh+WbPMnYNt2AC5rx8GP-+7U2Q-RwoOBYQ@mail.gmail.com>
	<20130620045521.GR13356@edge>
	<321768C95D21724485BCE784F1BE98473EB53340@DBDE04.ent.ti.com>
	<CAP71Wjx3cAmqn1=wBAPZFbT7ARw_ha0hx=WDsp9e+QaiJcQagA@mail.gmail.com>
In-Reply-To: <CAP71Wjx3cAmqn1=wBAPZFbT7ARw_ha0hx=WDsp9e+QaiJcQagA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Fri, 21 Jun 2013 07:49:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_321768C95D21724485BCE784F1BE98473EB54497DBDE04entticom_"

--_000_321768C95D21724485BCE784F1BE98473EB54497DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

So, is Mesa providing libegl in your case ?

regards,
Prabu

From: Nicolas Dechesne [mailto:nicolas.dechesne@linaro.org]
Sent: Friday, June 21, 2013 10:21 AM
To: Sundareson, Prabindh
Cc: Dmytriyenko, Denys; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] meta-ti + meta-qt5


On Thu, Jun 20, 2013 at 1:03 AM, Sundareson, Prabindh <prabu@ti.com<mailto:=
prabu@ti.com>> wrote:
I have validated libgles-omap3 on the AMSDK 5.07 build configuration (that =
does not have X11 enabled), so what you faced may be a different issue on t=
he libgles front.

I would wait for the verbose log from Nicolas for the qt5 issue he faced,

so, my issue was related to mesa in fact !

you can read that thread if you are interested: http://lists.openembedded.o=
rg/pipermail/openembedded-core/2013-June/080205.html

basically, i was building for qemuarm, so with mesa, and it's mesa that doe=
sn't work fine if X11 is not in DISTRO.

thanks anyways for all the support/discussion.



--_000_321768C95D21724485BCE784F1BE98473EB54497DBDE04entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">So, is Mesa providing lib=
egl in your case ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">regards,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Prabu<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Nicolas =
Dechesne [mailto:nicolas.dechesne@linaro.org]
<br>
<b>Sent:</b> Friday, June 21, 2013 10:21 AM<br>
<b>To:</b> Sundareson, Prabindh<br>
<b>Cc:</b> Dmytriyenko, Denys; meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] meta-ti &#43; meta-qt5<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Thu, Jun 20, 2013 at 1:03 AM, Sundareson, Prabind=
h &lt;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&gt=
; wrote:<o:p></o:p></p>
<div id=3D":16d">
<p class=3D"MsoNormal">I have validated libgles-omap3 on the AMSDK 5.07 bui=
ld configuration (that does not have X11 enabled), so what you faced may be=
 a different issue on the libgles front.<br>
<br>
I would wait for the verbose log from Nicolas for the qt5 issue he faced,<o=
:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><br>
so, my issue was related to mesa in fact !<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">you can read that thread if you are interested:&nbsp=
;<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2013-=
June/080205.html">http://lists.openembedded.org/pipermail/openembedded-core=
/2013-June/080205.html</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">basically, i was building for qemuarm, so with mesa,=
 and it's mesa that doesn't work fine if X11 is not in DISTRO.<o:p></o:p></=
p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">thanks anyways for all the support/discussion.<o:p><=
/o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_321768C95D21724485BCE784F1BE98473EB54497DBDE04entticom_--
