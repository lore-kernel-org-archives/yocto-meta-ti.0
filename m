Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19085E0176D
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 04:27:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PBRkNC026051;
	Fri, 25 Oct 2013 06:27:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PBRkeA019990;
	Fri, 25 Oct 2013 06:27:46 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 06:27:46 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "v.vogelhuber@DigitalEndoscopy.de" <v.vogelhuber@DigitalEndoscopy.de>
Thread-Topic: [meta-ti] State of dylan branch in meta-ti
Thread-Index: AQHO0WrLjJLZimUBo0iOPxf4qwwcAJoFSGaAgABJ3gD//60gR4AAVoqA//+tHsqAAFY/gP//rlMS
Date: Fri, 25 Oct 2013 11:27:45 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E9089EB@DLEE08.ent.ti.com>
References: <526A4413.2090801@digitalendoscopy.de>
	<20131025103033.GA13772@edge>,<526A4E00.2030505@digitalendoscopy.de>
	<B0581B5571079145BA1CD78C126DBDE72E908892@DLEE08.ent.ti.com>,
	<526A5113.5080905@digitalendoscopy.de>
	<B0581B5571079145BA1CD78C126DBDE72E908923@DLEE08.ent.ti.com>,
	<526A53E5.5080609@digitalendoscopy.de>
In-Reply-To: <526A53E5.5080609@digitalendoscopy.de>
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
X-List-Received-Date: Fri, 25 Oct 2013 11:27:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E9089EBDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E9089EBDLEE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

FILES_ti-dsplink-module is causing the problem...


Denys


-----Original Message-----
From: Volker Vogelhuber [v.vogelhuber@DigitalEndoscopy.de]
Received: Friday, 25 Oct 2013, 12:20
To: Dmytriyenko, Denys [denys@ti.com]
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] State of dylan branch in meta-ti

On 25.10.2013 13:11, Dmytriyenko, Denys wrote:
On 25.10.2013 12:58, Dmytriyenko, Denys wrote:
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


What do you mean by the wrong package name?
In the hello-mod_0.1bb script under meta-skeleton within the dylan branch o=
f the yocto repository
there is the following notice:

# Kernel module packages MUST begin with 'kernel-module-', otherwise
# multilib image generation can fail.
#
# The following line is only necessary if the recipe name does not begin
# with kernel-module-.
#
PKG_${PN} =3D "kernel-module-${PN}"

I guess because there is a new bbclass within dylan called kernel-module-sp=
lit.bbclass
that has the following lines adding dependencies automatically.

...
    if modules:
        metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE', True)
        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))

the do_split_packages method called before that code gets executed seems to=
 automatcally create
a list with kernel modules that all start with kernel-module-%s. I did not =
check what modules this method recognized. Maybe dsplinkk.ko was the only o=
ne and that's why the other modules did not
cause an error. Actually I did not spent to much time digging into the reas=
on for introducing this bbclass at all.

So to answer your question, all the module recipes within the meta-ti repos=
itory don't seem to be named with a "kernel-module-" prefix, but only the d=
splinkk.ko module result in an error.

Because they don't have to be called that. The only extra thing the new cla=
ss does is sets up the dependencies. So even when a custom module name is u=
sed, it will work fine.

Well then I don't understand why compiling the dsplink module causes an err=
or during creation of the
RootFS when not adding the RPROVIDES_${PN} +=3D "kernel-module-dsplinkk" to=
 ti-dsplink.inc

Error log follows:

 Some packages could not be installed. This may mean that you have
| requested an impossible situation or if you are using the unstable
| distribution that some required packages have not yet been created
| or been moved out of Incoming.
| The following information may help to resolve the situation:
|
| The following packages have unmet dependencies:
|  ti-dsplink : Depends: kernel-module-dsplinkk but it is not installable
| E: Unable to correct problems, you have held broken packages.

Or is that error by design to avoid people using the dsplink module within =
dylan?
As mentioned, I did not test the resulting firmware image yet, so maybe the=
re is indeed a problem with the modules, although I can't imagine why it sh=
ouldn't work as the used kernel is still the same.


--_000_B0581B5571079145BA1CD78C126DBDE72E9089EBDLEE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body bgcolor=3D"#FFFFFF">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">FILES_ti-dsplink-module is causing the problem...<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Volker Vogelhuber [v.vogelhuber@DigitalEndoscopy.de]<br>
<b>Received:</b> Friday, 25 Oct 2013, 12:20<br>
<b>To:</b> Dmytriyenko, Denys [denys@ti.com]<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] State of dylan branch in meta-ti<br>
<br>
</span></span>
<div>
<div class=3D"moz-cite-prefix">On 25.10.2013 13:11, Dmytriyenko, Denys wrot=
e:<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:=
11pt; color:black"><span style=3D"color:black"><br>
</span></span></div>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black"></span>
<blockquote type=3D"cite">
<blockquote type=3D"cite">
<div>
<div class=3D"moz-cite-prefix">On 25.10.2013 12:58, Dmytriyenko, Denys wrot=
e:<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:=
11pt; color:black"><span style=3D"color:black"><br>
</span></span></div>
<blockquote type=3D"cite">
<div>
<div class=3D"moz-cite-prefix">On 25.10.2013 12:30, Denys Dmytriyenko wrote=
:<br>
</div>
<blockquote type=3D"cite">
<blockquote type=3D"cite">
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
<pre>It's in great shape - better than ever! What you don't mention is what=
=20
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
</blockquote>
<br>
</blockquote>
<blockquote type=3D"cite">Thanks for the link, actually I did not read that=
 notice yet indeed.<br>
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
 package names as well.</blockquote>
<br>
<br>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">What do you mean by the wrong package name?<span style=3D"=
color:black"></span></span></div>
</blockquote>
In the hello-mod_0.1bb script under meta-skeleton within the dylan branch o=
f the yocto repository<br>
there is the following notice:<br>
<br>
# Kernel module packages MUST begin with 'kernel-module-', otherwise<br>
# multilib image generation can fail.<br>
#<br>
# The following line is only necessary if the recipe name does not begin<br=
>
# with kernel-module-.<br>
#<br>
PKG_${PN} =3D &quot;kernel-module-${PN}&quot;<br>
<br>
I guess because there is a new bbclass within dylan called kernel-module-sp=
lit.bbclass
<br>
that has the following lines adding dependencies automatically.<br>
<br>
...<br>
&nbsp;&nbsp;&nbsp; if modules:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; metapkg =3D d.getVar('KERNEL_MOD=
ULES_META_PACKAGE', True)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('RDEPENDS_' &#43; me=
tapkg, ' '&#43;' '.join(modules))<br>
<br>
the do_split_packages method called before that code gets executed seems to=
 automatcally create<br>
a list with kernel modules that all start with kernel-module-%s. I did not =
check what modules this method recognized. Maybe dsplinkk.ko was the only o=
ne and that's why the other modules did not<br>
cause an error. Actually I did not spent to much time digging into the reas=
on for introducing this bbclass at all.<br>
<br>
So to answer your question, all the module recipes within the meta-ti repos=
itory don't seem to be named with a &quot;kernel-module-&quot; prefix, but =
only the dsplinkk.ko module result in an error.
<br>
<br>
</div>
</blockquote>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Because they don't have to be called that. The only extra =
thing the new class does is sets up the dependencies. So even when a custom=
 module name is used, it will work
 fine.<br>
</span></blockquote>
<br>
Well then I don't understand why compiling the dsplink module causes an err=
or during creation of the
<br>
RootFS when not adding the RPROVIDES_${PN} &#43;=3D &quot;kernel-module-dsp=
linkk&quot; to ti-dsplink.inc<br>
<br>
Error log follows:<br>
<br>
&nbsp;Some packages could not be installed. This may mean that you have<br>
| requested an impossible situation or if you are using the unstable<br>
| distribution that some required packages have not yet been created<br>
| or been moved out of Incoming.<br>
| The following information may help to resolve the situation:<br>
| <br>
| The following packages have unmet dependencies:<br>
|&nbsp; ti-dsplink : Depends: kernel-module-dsplinkk but it is not installa=
ble<br>
| E: Unable to correct problems, you have held broken packages.<br>
<br>
Or is that error by design to avoid people using the dsplink module within =
dylan?<br>
As mentioned, I did not test the resulting firmware image yet, so maybe the=
re is indeed a problem with the modules, although I can't imagine why it sh=
ouldn't work as the used kernel is still the same.<br>
<br>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E9089EBDLEE08entticom_--
