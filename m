Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F29A0E0176D
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 03:58:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PAwJE6001453;
	Fri, 25 Oct 2013 05:58:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PAwJXC013701;
	Fri, 25 Oct 2013 05:58:19 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 05:58:19 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "v.vogelhuber@digitalendoscopy.de" <v.vogelhuber@digitalendoscopy.de>
Thread-Topic: [meta-ti] State of dylan branch in meta-ti
Thread-Index: AQHO0WrLjJLZimUBo0iOPxf4qwwcAJoFSGaAgABJ3gD//60gRw==
Date: Fri, 25 Oct 2013 10:58:18 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E908892@DLEE08.ent.ti.com>
References: <526A4413.2090801@digitalendoscopy.de>
	<20131025103033.GA13772@edge>,<526A4E00.2030505@digitalendoscopy.de>
In-Reply-To: <526A4E00.2030505@digitalendoscopy.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: State of dylan branch in meta-ti
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
X-List-Received-Date: Fri, 25 Oct 2013 10:58:26 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E908892DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E908892DLEE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

What do you mean by the wrong package name?


Denys


-----Original Message-----
From: Volker Vogelhuber [v.vogelhuber@digitalendoscopy.de]
Received: Friday, 25 Oct 2013, 11:55
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] State of dylan branch in meta-ti

On 25.10.2013 12:30, Denys Dmytriyenko wrote:

On Fri, Oct 25, 2013 at 12:12:35PM +0200, Volker Vogelhuber wrote:


I just checked out the dylan branch of the yocto core and the
meta-ti repository.
It seems like the state of the meta-ti branch is not yet consistent
to work out of the box.

I currently had to remove the update-modules part from the ti
recipes and had to add
RPROVIDES_${PN} +=3D "kernel-module-dsplinkk" to the ti-dsplink.inc

Did I miss something or the dylan branch just not yet in a consistent state=
?



It's in great shape - better than ever! What you don't mention is what
platform you are using. You do mention dsplink though, but that is long sin=
ce
unsupported. As a matter of fact, most of the old DSP related recipes are n=
ot
supported [1]. The new replacements are not ready yet. Other than that, it
provides great BSP support for platforms listed in the conf/ directory.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/READM=
E?h=3Ddylan


Thanks for the link, actually I did not read that notice yet indeed.
I'm currently using a TAO-3530 board from technexion.
We used to work with the denzil branch for some time, but after updating to=
 ubuntu
13.10 there were a lot of errors that I tried to fix with the dylan branch.=
 And indeed after
patching some small problems (next to the patches for the meta-ti branch), =
it does create
a rootfs image at least, but have to flash it and test if it has some addit=
ional problems.

I only wonder why the problem with the kernel-module- package name does onl=
y occure with the
dsplink and not with the e.g. libgles modules as they seem to provide wrong=
 package names as well.

Regards,
    Volker
--
Volker Vogelhuber | Softwareentwickler
PENTAX MEDICAL
Excellence in FocusTM
Tel:  +49(0)821-650566-18
v.vogelhuber@DigitalEndoscopy.de<mailto:v.vogelhuber@DigitalEndoscopy.de>
Hoya Corporation - Pentax Medical Division
Digital Endoscopy GmbH
Paul-Lenz-Str. 5
86316 Friedberg - Germany
pentaxmedical.com
Handelsregister HRB 27226
Amtsgericht Augsburg
Gesch=E4ftsf=FChrer: Michael Drexel, Marc Henzler
Sitz: Paul-Lenz-Str. 5, 86316 Friedberg, Germany
 _____________________________________
Diese E-Mail enth=E4lt vertrauliche und/oder rechtlich gesch=FCtzte Informa=
tionen. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail irrt=FC=
mlich erhalten haben, informieren Sie bitte sofort den Absender und vernich=
ten Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe =
dieser Mail ist nicht gestattet.
This e-mail may contain confidential and/or privileged information. If you =
are not the intended recipient (or have received this e-mail in error) plea=
se notify the sender immediately and destroy this e-mail. Any unauthorized =
copying, disclosure or distribution of the material in this e-mail is stric=
tly forbidden.


--_000_B0581B5571079145BA1CD78C126DBDE72E908892DLEE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body bgcolor=3D"#FFFFFF">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">What do you mean by the wrong package name?<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Volker Vogelhuber [v.vogelhuber@digitalendoscopy.de]<br>
<b>Received:</b> Friday, 25 Oct 2013, 11:55<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] State of dylan branch in meta-ti<br>
<br>
</span></span>
<div>
<div class=3D"moz-cite-prefix">On 25.10.2013 12:30, Denys Dmytriyenko wrote=
:<br>
</div>
<blockquote type=3D"cite">
<pre>On Fri, Oct 25, 2013 at 12:12:35PM &#43;0200, Volker Vogelhuber wrote:
</pre>
<blockquote type=3D"cite">
<pre>I just checked out the dylan branch of the yocto core and the
meta-ti repository.
It seems like the state of the meta-ti branch is not yet consistent
to work out of the box.

I currently had to remove the update-modules part from the ti
recipes and had to add
RPROVIDES_${PN} &#43;=3D &quot;kernel-module-dsplinkk&quot; to the ti-dspli=
nk.inc

Did I miss something or the dylan branch just not yet in a consistent state=
?
</pre>
</blockquote>
<pre>
It's in great shape - better than ever! What you don't mention is what=20
platform you are using. You do mention dsplink though, but that is long sin=
ce=20
unsupported. As a matter of fact, most of the old DSP related recipes are n=
ot=20
supported [1]. The new replacements are not ready yet. Other than that, it=
=20
provides great BSP support for platforms listed in the conf/ directory.

[1] <a class=3D"moz-txt-link-freetext" href=3D"http://git.yoctoproject.org/=
cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=3Ddylan">http://git.yoctopro=
ject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=3Ddylan</a>
</pre>
</blockquote>
Thanks for the link, actually I did not read that notice yet indeed.<br>
I'm currently using a TAO-3530 board from technexion. <br>
We used to work with the denzil branch for some time, but after updating to=
 ubuntu
<br>
13.10 there were a lot of errors that I tried to fix with the dylan branch.=
 And indeed after<br>
patching some small problems (next to the patches for the meta-ti branch), =
it does create<br>
a rootfs image at least, but have to flash it and test if it has some addit=
ional problems.<br>
<br>
I only wonder why the problem with the kernel-module- package name does onl=
y occure with the
<br>
dsplink and not with the e.g. libgles modules as they seem to provide wrong=
 package names as well.<br>
<br>
Regards,<br>
&nbsp;&nbsp;&nbsp; Volker<br>
<div class=3D"moz-signature">-- <br>
<p class=3D"MsoNormal"><b><span lang=3D"DE" style=3D"font-size:10.0pt; font=
-family:'Arial','sans-serif'; color:#404040">Volker Vogelhuber</span></b><s=
pan lang=3D"DE" style=3D"font-size:10.0pt; font-family:'Arial','sans-serif'=
; color:#404040"> | Softwareentwickler</span></p>
<p class=3D"MsoNormal"><b><span lang=3D"DE" style=3D"font-size:12.0pt; font=
-family:'serif'; color:#DA291C">PENTAX</span></b><b><span lang=3D"DE" style=
=3D"font-size:12.0pt; font-family:'serif'; color:#53565A"> MEDICA</span></b=
><b><span style=3D"font-family:'serif'; color:#53565A; font-size:12.0pt">L<=
br>
</span></b><i><span style=3D"font-size:12.0pt; font-family:'serif'; color:#=
53565A">Excellence in Focus</span></i><i><sup><span style=3D"font-size:8.0p=
t; font-family:'serif'; color:#53565A">TM</span></sup></i><span lang=3D"EN-=
GB" style=3D"font-size:7.0pt; font-family:'Arial','sans-serif'; color:#1F49=
7D"></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:9.0pt; font-=
family:'Arial','sans-serif'; color:red">Tel:&nbsp;
</span><span lang=3D"EN-GB" style=3D"font-size:9.0pt; font-family:'Arial','=
sans-serif'; color:#404040">&#43;49(0)821-650566-</span><span lang=3D"EN-GB=
" style=3D"font-size:9.0pt; font-family:'Arial','sans-serif'; color:#1F497D=
">18</span><span lang=3D"EN-GB" style=3D"font-size:12.0pt; font-family:'ser=
if'; color:#404040"></span><br>
<span lang=3D"EN-GB" style=3D"font-size:9.0pt; font-family:'Arial','sans-se=
rif'; color:#404040"><a href=3D"mailto:v.vogelhuber@DigitalEndoscopy.de"><s=
pan lang=3D"EN-US" style=3D"color:#404040; text-decoration:none">v.vogelhub=
er@DigitalEndoscopy.de</span></a></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:10.0pt; font=
-family:'Arial','sans-serif'; color:#404040">Hoya Corporation - Pentax Medi=
cal Division</span><br>
<b><span lang=3D"EN-GB" style=3D"font-size:10.0pt; font-family:'Arial','san=
s-serif'; color:#404040">Digital</span></b><b><span lang=3D"EN-GB" style=3D=
"font-size:10.0pt; font-family:'Arial','sans-serif'; color:#404040"> Endosc=
opy GmbH</span></b><span lang=3D"EN-GB" style=3D"font-size:9.0pt; font-fami=
ly:'Arial','sans-serif'; color:#404040"><br>
Paul-Lenz-Str. 5<br>
86316 Friedberg - Germany</span><span style=3D"font-family:'serif'; color:#=
E70600"><br>
pentax</span><span style=3D"font-family:'serif'; color:#0D2531">medical.com=
</span><span style=3D"font-size:5.0pt; font-family:'Arial','sans-serif'; co=
lor:#1F497D"></span><span lang=3D"DE" style=3D"font-size:8.0pt; font-family=
:'Arial','sans-serif'; color:#404040"><br>
Handelsregister HRB 27226<br>
Amtsgericht Augsburg<br>
Gesch=E4ftsf=FChrer: Michael Drexel, Marc Henzler<br>
Sitz: Paul-Lenz-Str. 5, 86316 Friedberg, Germany</span><span lang=3D"DE" st=
yle=3D"font-size:8.0pt; font-family:'Arial','sans-serif'; color:#1F497D"></=
span>
</p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"font-size:8.0pt; font-fam=
ily:'Arial','sans-serif'; color:#404040">&nbsp;</span><span lang=3D"DE" sty=
le=3D"font-size:10.0pt; font-family:'Arial','sans-serif'; color:#404040">__=
___________________________________</span><span lang=3D"DE" style=3D"font-s=
ize:8.0pt; font-family:'Arial','sans-serif'; color:#404040">&nbsp;</span>
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:8.0pt; font-=
family:'Arial','sans-serif'; color:#404040">Diese E-Mail enth=E4lt vertraul=
iche und/oder rechtlich gesch=FCtzte Informationen. Wenn Sie nicht der rich=
tige Adressat sind oder diese E-Mail irrt=FCmlich
 erhalten haben, informieren Sie bitte sofort den Absender und vernichten S=
ie diese Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe diese=
r Mail ist nicht gestattet.<br>
This e-mail may contain confidential and/or privileged information. If you =
are not the intended recipient (or have received this e-mail in error) plea=
se notify the sender immediately and destroy this e-mail. Any unauthorized =
copying, disclosure or distribution
 of the material in this e-mail is strictly forbidden.</span><span lang=3D"=
EN-GB" style=3D"color:#404040"></span></p>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E908892DLEE08entticom_--
