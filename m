Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C64CE01440
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 04:20:09 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62BK7aO028622
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 06:20:08 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62BK4xs031969
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 06:20:06 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 19:20:04 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: Re: [meta-ti] [PATCH] abefw: Firmware for OMAP5 ABE
Thread-Index: AQHOdnGCMSmod4FPdUur2h/Wuj5r1plPczSAgAGewoD//6RKgIAAiOjA
Date: Tue, 2 Jul 2013 11:20:04 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D543E169@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: FW: Re: [PATCH] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Tue, 02 Jul 2013 11:20:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CF956B779D819D41BBC043B7082161D543E169DBDE04entticom_"

--_000_CF956B779D819D41BBC043B7082161D543E169DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable






On 7/1/2013 9:23 PM, Denys Dmytriyenko wrote:

> On Mon, Jul 01, 2013 at 09:11:48PM +0530, Mrinmayee Hingolikar wrote:

>> * The OMAP5 Audio Backend requires a 'firmware' to enable

>>   sound. This recipe installs a prebuilt firmware. This

>>   part is a hack, as in the current form, the firmware

>>   cannot be cross-compiled. There is a plan to fix this

>>   and hopefully, this recipe is short-lived. Once the code

>>   is fixed, we should have new recipes that build the firmware

>>   and clean up this recipe.

>>

>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com><mailto:mrinmayee@=
ti.com>

>> Signed-off-by: Siddharth Heroor <heroor@ti.com><mailto:heroor@ti.com>

>> ---

>>  recipes-bsp/abefw/abefw.inc       |    8 ++++++++

>>  recipes-bsp/abefw/abefw_1.0.14.bb |   14 ++++++++++++++

> What is the reason to have it split in 2 files - inc and bb?

Reason to split because the there might be a version upgrade in the

future. And also currently it just copies the prebuilt firmware,

there should be a better recipe for this in future.

>

>

>>  2 files changed, 22 insertions(+), 0 deletions(-)

>>  create mode 100644 recipes-bsp/abefw/abefw.inc

>>  create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb

>>

>> diff --git a/recipes-bsp/abefw/abefw.inc b/recipes-bsp/abefw/abefw.inc

>> new file mode 100644

>> index 0000000..4b6e9dc

>> --- /dev/null

>> +++ b/recipes-bsp/abefw/abefw.inc

>> @@ -0,0 +1,8 @@

>> +SUMMARY =3D "Firmware for OMAP5 ABE"

>> +HOMEPAGE =3D "http://git.ti.com"<http://git.ti.com>

>> +LICENSE =3D "MIT"

>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D923db086ed9463ab3215b24d87e0=
5ec5"<file:///\\COPYING;md5=3D923db086ed9463ab3215b24d87e05ec5>

>> +

>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

>> +

>> +COMPATIBLE_MACHINE =3D "omap5-evm"

> Is it limited to omap5-evm only? What about J6/DRA7xx (or pandaboard)?

> Especially considering the repo is called omap4plus...

J6 uses McASP and it does not require this firmware. Since this release

is targetted for omap5 and J6, we limited it to omap5-evm.

>

>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw=
_1.0.14.bb

>> new file mode 100644

>> index 0000000..df68080

>> --- /dev/null

>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb

>> @@ -0,0 +1,14 @@

>> +require abefw.inc

>> +

>> +SRC_URI =3D "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=3Dgit"

>> +

>> +S =3D "${WORKDIR}/git"

>> +

>> +SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"

>> +

>> +do_install() {

>> +        mkdir -p ${D}/lib/firmware

>> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/

>> +}

>> +

>> +FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"

>> --

>> 1.7.0.4

>>

>> _______________________________________________

>> meta-ti mailing list

>> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

>> https://lists.yoctoproject.org/listinfo/meta-ti





--

Regards,

Mrinmayee





--_000_CF956B779D819D41BBC043B7082161D543E169DBDE04entticom_
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
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
	font-family:"Courier New";
	color:black;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
span.EmailStyle19
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<div>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"1" style=3D"width:.6pt">
<tbody>
<tr>
<td nowrap=3D"" valign=3D"top" style=3D"padding:0in 0in 0in 0in"></td>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
<tr>
<td nowrap=3D"" valign=3D"top" style=3D"padding:0in 0in 0in 0in"></td>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
<tr>
<td nowrap=3D"" valign=3D"top" style=3D"padding:0in 0in 0in 0in"></td>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
<tr>
<td nowrap=3D"" valign=3D"top" style=3D"padding:0in 0in 0in 0in"></td>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
<tr>
<td nowrap=3D"" valign=3D"top" style=3D"padding:0in 0in 0in 0in"></td>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
</tbody>
</table>
<pre>On 7/1/2013 9:23 PM, Denys Dmytriyenko wrote:<o:p></o:p></pre>
<pre>&gt; On Mon, Jul 01, 2013 at 09:11:48PM &#43;0530, Mrinmayee Hingolika=
r wrote:<o:p></o:p></pre>
<pre>&gt;&gt; * The OMAP5 Audio Backend requires a 'firmware' to enable<o:p=
></o:p></pre>
<pre>&gt;&gt;&nbsp;&nbsp; sound. This recipe installs a prebuilt firmware. =
This<o:p></o:p></pre>
<pre>&gt;&gt;&nbsp;&nbsp; part is a hack, as in the current form, the firmw=
are<o:p></o:p></pre>
<pre>&gt;&gt;&nbsp;&nbsp; cannot be cross-compiled. There is a plan to fix =
this<o:p></o:p></pre>
<pre>&gt;&gt;&nbsp;&nbsp; and hopefully, this recipe is short-lived. Once t=
he code<o:p></o:p></pre>
<pre>&gt;&gt;&nbsp;&nbsp; is fixed, we should have new recipes that build t=
he firmware<o:p></o:p></pre>
<pre>&gt;&gt;&nbsp;&nbsp; and clean up this recipe.<o:p></o:p></pre>
<pre>&gt;&gt;<o:p>&nbsp;</o:p></pre>
<pre>&gt;&gt; Signed-off-by: Mrinmayee Hingolikar <a href=3D"mailto:mrinmay=
ee@ti.com">&lt;mrinmayee@ti.com&gt;</a><o:p></o:p></pre>
<pre>&gt;&gt; Signed-off-by: Siddharth Heroor <a href=3D"mailto:heroor@ti.c=
om">&lt;heroor@ti.com&gt;</a><o:p></o:p></pre>
<pre>&gt;&gt; ---<o:p></o:p></pre>
<pre>&gt;&gt;&nbsp; recipes-bsp/abefw/abefw.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp;&nbsp;&nbsp; 8 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p=
></o:p></pre>
<pre>&gt;&gt;&nbsp; recipes-bsp/abefw/abefw_1.0.14.bb |&nbsp;&nbsp; 14 &#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:=
p></pre>
<pre>&gt; What is the reason to have it split in 2 files - inc and bb?<o:p>=
</o:p></pre>
<pre>Reason to split because the there might be a<span style=3D"color:#1F49=
7D"> </span>version upgrade in the<o:p></o:p></pre>
<pre>future. And also currently it just copies the prebuilt firmware,<o:p><=
/o:p></pre>
<pre>there should be a better recipe for this in future.<o:p></o:p></pre>
<pre>&gt;&nbsp; <o:p></o:p></pre>
<pre>&gt;<o:p>&nbsp;</o:p></pre>
<pre>&gt;&gt;&nbsp; 2 files changed, 22 insertions(&#43;), 0 deletions(-)<o=
:p></o:p></pre>
<pre>&gt;&gt;&nbsp; create mode 100644 recipes-bsp/abefw/abefw.inc<o:p></o:=
p></pre>
<pre>&gt;&gt;&nbsp; create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb<o:=
p></o:p></pre>
<pre>&gt;&gt;<o:p>&nbsp;</o:p></pre>
<pre>&gt;&gt; diff --git a/recipes-bsp/abefw/abefw.inc b/recipes-bsp/abefw/=
abefw.inc<o:p></o:p></pre>
<pre>&gt;&gt; new file mode 100644<o:p></o:p></pre>
<pre>&gt;&gt; index 0000000..4b6e9dc<o:p></o:p></pre>
<pre>&gt;&gt; --- /dev/null<o:p></o:p></pre>
<pre>&gt;&gt; &#43;&#43;&#43; b/recipes-bsp/abefw/abefw.inc<o:p></o:p></pre=
>
<pre>&gt;&gt; @@ -0,0 &#43;1,8 @@<o:p></o:p></pre>
<pre>&gt;&gt; &#43;SUMMARY =3D &quot;Firmware for OMAP5 ABE&quot;<o:p></o:p=
></pre>
<pre>&gt;&gt; &#43;HOMEPAGE =3D <a href=3D"http://git.ti.com">&quot;http://=
git.ti.com&quot;</a><o:p></o:p></pre>
<pre>&gt;&gt; &#43;LICENSE =3D &quot;MIT&quot;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;LIC_FILES_CHKSUM =3D <a href=3D"file:///\\COPYING;md5=3D=
923db086ed9463ab3215b24d87e05ec5">&quot;file://COPYING;md5=3D923db086ed9463=
ab3215b24d87e05ec5&quot;</a><o:p></o:p></pre>
<pre>&gt;&gt; &#43;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<o:p></o:p><=
/pre>
<pre>&gt;&gt; &#43;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;COMPATIBLE_MACHINE =3D &quot;omap5-evm&quot;<o:p></o:p><=
/pre>
<pre>&gt; Is it limited to omap5-evm only? What about J6/DRA7xx (or pandabo=
ard)? <o:p></o:p></pre>
<pre>&gt; Especially considering the repo is called omap4plus...<o:p></o:p>=
</pre>
<pre>J6 uses McASP and it does not require this firmware. Since this releas=
e<o:p></o:p></pre>
<pre>is targetted for omap5 and J6, we limited it to omap5-evm.&nbsp; <o:p>=
</o:p></pre>
<pre>&gt;<o:p>&nbsp;</o:p></pre>
<pre>&gt;&gt; diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/=
abefw/abefw_1.0.14.bb<o:p></o:p></pre>
<pre>&gt;&gt; new file mode 100644<o:p></o:p></pre>
<pre>&gt;&gt; index 0000000..df68080<o:p></o:p></pre>
<pre>&gt;&gt; --- /dev/null<o:p></o:p></pre>
<pre>&gt;&gt; &#43;&#43;&#43; b/recipes-bsp/abefw/abefw_1.0.14.bb<o:p></o:p=
></pre>
<pre>&gt;&gt; @@ -0,0 &#43;1,14 @@<o:p></o:p></pre>
<pre>&gt;&gt; &#43;require abefw.inc<o:p></o:p></pre>
<pre>&gt;&gt; &#43;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;SRC_URI =3D &quot;git://git.ti.com/glsdk/abefw-omap4plus=
.git;protocol=3Dgit&quot;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;S =3D &quot;${WORKDIR}/git&quot;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;SRCREV =3D &quot;ceccc0332264e39bdc51e54f80ea7256a3886c5=
8&quot;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;do_install() {<o:p></o:p></pre>
<pre>&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${D}=
/lib/firmware<o:p></o:p></pre>
<pre>&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/firmw=
are/omap4_abe_new ${D}/lib/firmware/<o:p></o:p></pre>
<pre>&gt;&gt; &#43;}<o:p></o:p></pre>
<pre>&gt;&gt; &#43;<o:p></o:p></pre>
<pre>&gt;&gt; &#43;FILES_${PN} &#43;=3D &quot;/lib/firmware/omap4_abe_new&q=
uot;<o:p></o:p></pre>
<pre>&gt;&gt; -- <o:p></o:p></pre>
<pre>&gt;&gt; 1.7.0.4<o:p></o:p></pre>
<pre>&gt;&gt;<o:p>&nbsp;</o:p></pre>
<pre>&gt;&gt; _______________________________________________<o:p></o:p></p=
re>
<pre>&gt;&gt; meta-ti mailing list<o:p></o:p></pre>
<pre>&gt;&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproj=
ect.org</a><o:p></o:p></pre>
<pre>&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">h=
ttps://lists.yoctoproject.org/listinfo/meta-ti</a><o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>-- <o:p></o:p></pre>
<pre>Regards,<o:p></o:p></pre>
<pre>Mrinmayee<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CF956B779D819D41BBC043B7082161D543E169DBDE04entticom_--
