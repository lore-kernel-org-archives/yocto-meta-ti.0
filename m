Return-Path: <jithin.raj@nestgroup.net>
Received: from mxout-tvm.nestgroup.net (mxout-tvm.nestgroup.net
	[115.248.23.134])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9B91E0172C
	for <meta-ti@yoctoproject.org>; Tue, 12 Nov 2013 03:07:36 -0800 (PST)
Received: from mail-3.tvm.nestgroup.net ([192.168.192.79])
	by mxout-tvm.nestgroup.net (8.13.1/8.13.1) with ESMTP id rACAxKSv016806
	for <meta-ti@yoctoproject.org>; Tue, 12 Nov 2013 16:29:21 +0530
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 12 Nov 2013 16:37:28 +0530
Message-ID: <245245F712CBF74D865D90E99497849F063C52F7@mail-3.tvm.nestgroup.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [meta-ti] - eglinitialize error
Thread-Index: Ac7fl1/i8V//Lm0WRY2BVIkqjFJt6w==
From: "Jithin Raj" <jithin.raj@nestgroup.net>
To: <meta-ti@yoctoproject.org>
Subject: - eglinitialize error
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
X-List-Received-Date: Tue, 12 Nov 2013 11:07:38 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CEDF97.61587B0C"

------_=_NextPart_001_01CEDF97.61587B0C
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

=20

I am trying to build some graphics application for Pandaboard
("01_HelloAPI" from PowerVR SDK). I have generated the image (kernel and
file system) with the help of meta-ti, meta-ivi (5.0) and poky.=20

=20

While executing the application am getting "EGL Initialising error".
Please find the log below.

=20

LibEGL warning: DRI2: failed to open omap (search paths /usr/lib/dri)

LibEGL warning: DRI2: failed to open swrast(search paths /usr/lib/dri)

LibEGL warning: GLX: failed to open GLX

Error: eglInitialize() failed.

=20

Experts please suggest.

=20

Meta-ti -> master version

Meta-ivi -> 5.0

Kernel version -> 3.4.11

=20

Thanks in advance.

=20

=20

Thanks & regards

Jithin

=20

***** Confidentiality Statement/Disclaimer *****

This message and any attachments is intended for the sole use of the inte=
nded recipient. It may contain confidential information. Any unauthorized=
 use, dissemination or modification is strictly prohibited. If you are no=
t the intended recipient, please notify the sender immediately then delet=
e it from all your systems, and do not copy, use or print. Internet commu=
nications are not secure and it is the responsibility of the recipient to=
 make sure that it is virus/malicious code exempt.
The company/sender cannot be responsible for any unauthorized alterations=
 or modifications made to the contents. If you require any form of confir=
mation of the contents, please contact the company/sender. The company/se=
nder is not liable for any errors or omissions in the content of this mes=
sage.


------_=_NextPart_001_01CEDF97.61587B0C
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type"=
 CONTENT=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=
=3D"Microsoft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
=2EMsoChpDefault
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue v=
link=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal>Hi,<o:p></o:=
p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am=
 trying to build some graphics application for Pandaboard (&quot;01_Hello=
API&quot; from PowerVR SDK). I have generated the image (kernel and file =
system) with the help of meta-ti, meta-ivi (5.0) and poky. <o:p></o:p></p=
><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>While exe=
cuting the application am getting &#8220;<b>EGL Initialising error</b>&#8=
221;. Please find the log below.<o:p></o:p></p><p class=3DMsoNormal><o:p>=
&nbsp;</o:p></p><p class=3DMsoNormal><b>LibEGL warning: DRI2: failed to o=
pen omap (search paths /usr/lib/dri)<o:p></o:p></b></p><p class=3DMsoNorm=
al><b>LibEGL warning: DRI2: failed to open swrast(search paths /usr/lib/d=
ri)<o:p></o:p></b></p><p class=3DMsoNormal><b>LibEGL warning: GLX: failed=
 to open GLX<o:p></o:p></b></p><p class=3DMsoNormal><b>Error: eglInitiali=
ze() failed.<o:p></o:p></b></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p>=
<p class=3DMsoNormal>Experts please suggest.<o:p></o:p></p><p class=3DMso=
Normal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Meta-ti -&gt; master ver=
sion<o:p></o:p></p><p class=3DMsoNormal>Meta-ivi -&gt; 5.0<o:p></o:p></p>=
<p class=3DMsoNormal>Kernel version -&gt; 3.4.11<o:p></o:p></p><p class=3D=
MsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Thanks in advance.<o:=
p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNorma=
l><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><b><span style=3D'color:black=
'>Thanks &amp; regards<o:p></o:p></span></b></p><p class=3DMsoNormal><b><=
span style=3D'color:black'>Jithin<o:p></o:p></span></b></p><p class=3DMso=
Normal><o:p>&nbsp;</o:p></p></div><DIV>&nbsp;</DIV>***** Confidentiality =
Statement/Disclaimer *****<br><br>This message and any attachments is int=
ended for the sole use of the intended recipient. It may contain confiden=
tial information. Any unauthorized use, dissemination or modification is =
strictly prohibited. If you are not the intended recipient, please notify=
 the sender immediately then delete it from all your systems, and do not =
copy, use or print. Internet communications are not secure and it is the =
responsibility of the recipient to make sure that it is virus/malicious c=
ode exempt.<br>The company/sender cannot be responsible for any unauthori=
zed alterations or modifications made to the contents. If you require any=
 form of confirmation of the contents, please contact the company/sender.=
 The company/sender is not liable for any errors or omissions in the cont=
ent of this message.<br></body></html>

------_=_NextPart_001_01CEDF97.61587B0C--
