Return-Path: <sudhangathan@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9167E013A8
	for <meta-ti@yoctoproject.org>; Fri, 14 Jun 2013 17:33:31 -0700 (PDT)
Received: by mail-qa0-f49.google.com with SMTP id hu16so486367qab.8
	for <meta-ti@yoctoproject.org>; Fri, 14 Jun 2013 17:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oUDTxe05omLi0PHCzcFjxDr5kpWJGmbkSbhQ8p7wOJA=;
	b=iU6+21cGe/QtIhJgroOVaPu5C6GRdYdAaONVqZ9P5YHH2rwu83XlvR3CfcQsuMTUUH
	YH29Vm3pIpcoI+CPijpk3kumi+B5c28Ei9B53QFYgz6AdBDgcWA6gI2MclWnpxAchpU5
	WActhe/PQWOmAXxvB8CEDowz6hHzvDtkN56zasI8xwtyeAvQZ85l1s5JipRGrWz0bj2G
	Rrftst4YJo+YrdZdn6k1eazJ4O31BHBAmk/EGL5WXpEKZhpU+TI4T1YNVx0TVAw/631q
	U/b4l58Eyfn3NwLXwhPqMWb/RVbS/b1YuV9IF4ortAQxEjie4I7OtaRCzt4aJmcKNJv6
	Zgug==
X-Received: by 10.229.63.197 with SMTP id c5mr1813912qci.150.1371256410410;
	Fri, 14 Jun 2013 17:33:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.88.71 with HTTP; Fri, 14 Jun 2013 17:33:10 -0700 (PDT)
In-Reply-To: <20130613182812.GC11656@denix.org>
References: <CANwz6nzC4O8bN92q2YCCLtmGKK1S9LwYPLyWR0VZZBY+EiAUtg@mail.gmail.com>
	<CAMUsWmD6F_qEm95q5y92xuP5yg3sNeBm+6GnaMQGOge3CmP8xw@mail.gmail.com>
	<CAP71Wjx=WoR6MAgGpU+nVAGt2Grnk1Y88qOepDjUeyKeX027Ug@mail.gmail.com>
	<CAGX3a99G=JzBMJ5EB8LyD0_WuvK-2sqbGT1NUDfVi5Lm5z0G4Q@mail.gmail.com>
	<20130613182812.GC11656@denix.org>
From: Sudhangathan B S <sudhangathan@gmail.com>
Date: Sat, 15 Jun 2013 06:03:10 +0530
Message-ID: <CAGX3a990Hy=_y-BrVY8RgD_6NchN2gSjBRNjvrDiz_aRsMQWQA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [yocto] yocto with meta-ti
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
X-List-Received-Date: Sat, 15 Jun 2013 00:33:32 -0000
Content-Type: multipart/alternative; boundary=047d7b2e07e73d151004df268360

--047d7b2e07e73d151004df268360
Content-Type: text/plain; charset=ISO-8859-1

Thanks a lot Denys for the knowledge... The order of the layers was indeed
important.. It worked, now building core-image-minimal.. and sato.! I now
hope switching to 2.6.32 kernel should be a cakewalk..! :)

Best,
---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------


On Thu, Jun 13, 2013 at 11:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Jun 13, 2013 at 03:22:03PM +0530, Sudhangathan B S wrote:
> > Hello all,
> >
> > I'm trying to integrate meta-ti with Yocto/poky, since I need to add the
> > 2.6.32 kernel for the beableboard image.
> >
> > Can I please know how to download the correct version, i.e. i'm using
> > danny-8.0, so for this, which version of the meta-ti and meta-oe should I
> > download, and from where.. and also after downloading where should I put
> > these folders (correct location for each)..
> >
> > I downloaded the danny branch of yocto, meta-ti, meta-oe and also the
> danny
> > branch of openembedded-core as the dependency. Is it correct.?
> >
> > Is there is weblink that I can follow..?
> >
> > For now, this is the error i'm getting..
> >
> > *danny-8.0/build$ bitbake -k core-image-minimal*
> > *Pseudo is not present but is required, building this first before the
> main
> > build*
> > *WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
> > with this version of the build system; you may possibly experience
> > unexpected failures. It is recommended that you use a tested
> distribution.*
> > *Loading cache: 100%
> >
> |################################################################################################################################|
> > ETA:  00:00:00*
> > *Loaded 22 entries from dependency cache.*
> > *ERROR: ExpansionError during parsing
> > /home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/
> > ti-local-power-manager_1.24.02.09.bb: Failure expanding variable
> FILESPATH,
> > expression was ${@base_set_filespath([
> >
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e",
> >
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
> >
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
> >
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
> >
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
> >
> "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/files",
> > "/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager"
> ],
> > d)} which triggered exception SyntaxError: EOL while scanning string
> > literal (FILESPATH, line 1)*
>
> This error is caused by including meta-yocto-bsp and meta-ti layers that
> both
> define "beagleboard" machine config. You have meta-yocto-bsp configured
> before
> meta-ti in your bblayers.conf, which takes the beagleboard definition from
> meta-yocto-bsp layer, so you can't safely use corresponding recipes from
> meta-ti. You should swap those two layers or just drop meta-yocto-bsp
> completely.
>
> --
> Denys
>
> > *ERROR: Command execution failed: Exited with 1*
> > *
> > *
> > *Summary: There was 1 WARNING message shown.*
> > *Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> > *
> >
> > I hope this is not version mismatch problem..!! may be yes..!
> >
> > ---------------------------------
> > Sudhangathan BS
> > Ph:(+91) 9731-905-205
> > ---------------------------------
> >
> >
> > On Wed, Jun 5, 2013 at 11:35 AM, Nicolas Dechesne <
> > nicolas.dechesne@linaro.org> wrote:
> >
> > >
> > > On Wed, Jun 5, 2013 at 7:55 AM, Akshay Sahota <akki.sahota@gmail.com
> >wrote:
> > >
> > >> *
> > >> BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/"
> > >>  #BBMASK = "meta-ti/recipes-misc meta-oe/recipes-graphics"
> > >> #BBMASK = "meta-oe/recipes-devtools"
> > >> #BBMASK = "meta-oe/recipes-graphics"
> > >> #
> > >> # Parallelism Options*...
> > >>
> > >>
> > >> and bblayers.conf
> > >>
> > >> *BBLAYERS ?= " \
> > >>   /home/asahota/poky-try/poky/meta \
> > >>   /home/asahota/poky-try/poky/meta-yocto \
> > >>   /home/asahota/poky-try/poky/meta-yocto-bsp \
> > >>   /home/asahota/poky-try/poky/meta-ti \
> > >>   /home/asahota/poky-try/poky/meta-openembedded/meta-oe \
> > >>   "
> > >> *
> > >>
> > >
> > > i suspect you are using wrong combination of branch/version, but you
> don't
> > > give what branch/version you are using, not cannot confirm.
> > >
> > >
> > >> *
> > >> BBLAYERS_NON_REMOVABLE ?= " \
> > >>   /home/asahota/poky-try/poky/meta \
> > >>   /home/asahota/poky-try/poky/meta-yocto \
> > >>   "*
> > >>
> > >> and the output is :
> > >> *$ bitbake -k core-image-minimal
> > >> Pseudo is not present but is required, building this first before the
> > >> main build
> > >> WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
> > >> with this version of the build system; you may possibly experience
> > >> unexpected failures. It is recommended that you use a tested
> distribution.
> > >> ERROR: ParseError at
> > >>
> /home/asahota/poky-try/poky/meta-openembedded/meta-oe/recipes-devtools/cloud9/
> > >> cloud9_0.6.bb:11: Could not inherit file classes/systemd.bbclass
> > >> *
> > >>
> > >
> > > systemd.bbclass was introduced in 'dylan' version of Yocto (aka 1.4).
> are
> > > you sure this is what you are using? to be it sounds like you are using
> > > Yocto/danny with meta-ti and meta-oe 'master' branch (or dylan branch).
> > >
> > >
> > > *ERROR: Command execution failed: Exited with 1
> > >>
> > >> Summary: There was 1 WARNING message shown.
> > >> Summary: There were 2 ERROR messages shown, returning a non-zero exit
> > >> code.
> > >> *
> > >> What is the mistake, sounds too silly.!
> > >
> > >
> > >
> > >
> > > _______________________________________________
> > > yocto mailing list
> > > yocto@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/yocto
> > >
> > >
>
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--047d7b2e07e73d151004df268360
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks a lot Denys for the knowledge... The order of the l=
ayers was indeed important.. It worked, now building core-image-minimal.. a=
nd sato.! I now hope switching to 2.6.32 kernel should be a cakewalk..! :)<=
div>

<br></div><div style>Best,</div><div class=3D"gmail_extra"><div>-----------=
----------------------<br>Sudhangathan BS<br>Ph:(+91) 9731-905-205<br>-----=
----------------------------</div>
<br><br><div class=3D"gmail_quote">On Thu, Jun 13, 2013 at 11:58 PM, Denys =
Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=
=3D"_blank">denis@denix.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">

<div class=3D"im">On Thu, Jun 13, 2013 at 03:22:03PM +0530, Sudhangathan B =
S wrote:<br>
&gt; Hello all,<br>
&gt;<br>
&gt; I&#39;m trying to integrate meta-ti with Yocto/poky, since I need to a=
dd the<br>
&gt; 2.6.32 kernel for the beableboard image.<br>
&gt;<br>
&gt; Can I please know how to download the correct version, i.e. i&#39;m us=
ing<br>
&gt; danny-8.0, so for this, which version of the meta-ti and meta-oe shoul=
d I<br>
&gt; download, and from where.. and also after downloading where should I p=
ut<br>
&gt; these folders (correct location for each)..<br>
&gt;<br>
&gt; I downloaded the danny branch of yocto, meta-ti, meta-oe and also the =
danny<br>
&gt; branch of openembedded-core as the dependency. Is it correct.?<br>
&gt;<br>
&gt; Is there is weblink that I can follow..?<br>
&gt;<br>
&gt; For now, this is the error i&#39;m getting..<br>
&gt;<br>
</div>&gt; *danny-8.0/build$ bitbake -k core-image-minimal*<br>
&gt; *Pseudo is not present but is required, building this first before the=
 main<br>
&gt; build*<br>
&gt; *WARNING: Host distribution &quot;Ubuntu 12.04.2 LTS&quot; has not bee=
n validated<br>
<div class=3D"im">&gt; with this version of the build system; you may possi=
bly experience<br>
</div>&gt; unexpected failures. It is recommended that you use a tested dis=
tribution.*<br>
&gt; *Loading cache: 100%<br>
&gt; |#####################################################################=
###########################################################|<br>
&gt; ETA: =A000:00:00*<br>
&gt; *Loaded 22 entries from dependency cache.*<br>
&gt; *ERROR: ExpansionError during parsing<br>
&gt; /home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/=
<br>
<div class=3D"im">&gt; <a href=3D"http://ti-local-power-manager_1.24.02.09.=
bb" target=3D"_blank">ti-local-power-manager_1.24.02.09.bb</a>: Failure exp=
anding variable FILESPATH,<br>
&gt; expression was ${@base_set_filespath([<br>
&gt; &quot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-ma=
nager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e&quot;,<br>
&gt; &quot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-ma=
nager/ti-local-power-manager-1_24_02_09&quot;,<br>
&gt; &quot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-ma=
nager/ti-local-power-manager&quot;,<br>
&gt; &quot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-ma=
nager/ti-local-power-manager-1_24_02_09&quot;,<br>
&gt; &quot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-ma=
nager/ti-local-power-manager&quot;,<br>
&gt; &quot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-ma=
nager/files&quot;,<br>
&gt; &quot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-ma=
nager&quot; ],<br>
&gt; d)} which triggered exception SyntaxError: EOL while scanning string<b=
r>
</div>&gt; literal (FILESPATH, line 1)*<br>
<br>
This error is caused by including meta-yocto-bsp and meta-ti layers that bo=
th<br>
define &quot;beagleboard&quot; machine config. You have meta-yocto-bsp conf=
igured before<br>
meta-ti in your bblayers.conf, which takes the beagleboard definition from<=
br>
meta-yocto-bsp layer, so you can&#39;t safely use corresponding recipes fro=
m<br>
meta-ti. You should swap those two layers or just drop meta-yocto-bsp<br>
completely.<br>
<br>
--<br>
Denys<br>
<br>
&gt; *ERROR: Command execution failed: Exited with 1*<br>
&gt; *<br>
&gt; *<br>
&gt; *Summary: There was 1 WARNING message shown.*<br>
&gt; *Summary: There were 2 ERROR messages shown, returning a non-zero exit=
 code.<br>
<div class=3D"im">&gt; *<br>
&gt;<br>
&gt; I hope this is not version mismatch problem..!! may be yes..!<br>
&gt;<br>
&gt; ---------------------------------<br>
&gt; Sudhangathan BS<br>
&gt; Ph:<a href=3D"tel:%28%2B91%29%209731-905-205" value=3D"+919731905205">=
(+91) 9731-905-205</a><br>
&gt; ---------------------------------<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Jun 5, 2013 at 11:35 AM, Nicolas Dechesne &lt;<br>
&gt; <a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro=
.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Jun 5, 2013 at 7:55 AM, Akshay Sahota &lt;<a href=3D"mail=
to:akki.sahota@gmail.com">akki.sahota@gmail.com</a>&gt;wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; *<br>
&gt; &gt;&gt; BBMASK ?=3D &quot;.*/meta-ti/recipes-(misc|bsp/formfactor|gra=
phics/mesa)/&quot;<br>
&gt; &gt;&gt; =A0#BBMASK =3D &quot;meta-ti/recipes-misc meta-oe/recipes-gra=
phics&quot;<br>
&gt; &gt;&gt; #BBMASK =3D &quot;meta-oe/recipes-devtools&quot;<br>
&gt; &gt;&gt; #BBMASK =3D &quot;meta-oe/recipes-graphics&quot;<br>
&gt; &gt;&gt; #<br>
</div>&gt; &gt;&gt; # Parallelism Options*...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; and bblayers.conf<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; *BBLAYERS ?=3D &quot; \<br>
<div class=3D"im">&gt; &gt;&gt; =A0 /home/asahota/poky-try/poky/meta \<br>
&gt; &gt;&gt; =A0 /home/asahota/poky-try/poky/meta-yocto \<br>
&gt; &gt;&gt; =A0 /home/asahota/poky-try/poky/meta-yocto-bsp \<br>
&gt; &gt;&gt; =A0 /home/asahota/poky-try/poky/meta-ti \<br>
&gt; &gt;&gt; =A0 /home/asahota/poky-try/poky/meta-openembedded/meta-oe \<b=
r>
&gt; &gt;&gt; =A0 &quot;<br>
&gt; &gt;&gt; *<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; i suspect you are using wrong combination of branch/version, but =
you don&#39;t<br>
&gt; &gt; give what branch/version you are using, not cannot confirm.<br>
&gt; &gt;<br>
&gt; &gt;<br>
</div><div class=3D"im">&gt; &gt;&gt; *<br>
&gt; &gt;&gt; BBLAYERS_NON_REMOVABLE ?=3D &quot; \<br>
&gt; &gt;&gt; =A0 /home/asahota/poky-try/poky/meta \<br>
&gt; &gt;&gt; =A0 /home/asahota/poky-try/poky/meta-yocto \<br>
&gt; &gt;&gt; =A0 &quot;*<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; and the output is :<br>
</div>&gt; &gt;&gt; *$ bitbake -k core-image-minimal<br>
<div class=3D"im">&gt; &gt;&gt; Pseudo is not present but is required, buil=
ding this first before the<br>
&gt; &gt;&gt; main build<br>
&gt; &gt;&gt; WARNING: Host distribution &quot;Ubuntu 12.04.2 LTS&quot; has=
 not been validated<br>
&gt; &gt;&gt; with this version of the build system; you may possibly exper=
ience<br>
&gt; &gt;&gt; unexpected failures. It is recommended that you use a tested =
distribution.<br>
&gt; &gt;&gt; ERROR: ParseError at<br>
&gt; &gt;&gt; /home/asahota/poky-try/poky/meta-openembedded/meta-oe/recipes=
-devtools/cloud9/<br>
&gt; &gt;&gt; <a href=3D"http://cloud9_0.6.bb:11" target=3D"_blank">cloud9_=
0.6.bb:11</a>: Could not inherit file classes/systemd.bbclass<br>
&gt; &gt;&gt; *<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; systemd.bbclass was introduced in &#39;dylan&#39; version of Yoct=
o (aka 1.4). are<br>
&gt; &gt; you sure this is what you are using? to be it sounds like you are=
 using<br>
&gt; &gt; Yocto/danny with meta-ti and meta-oe &#39;master&#39; branch (or =
dylan branch).<br>
&gt; &gt;<br>
&gt; &gt;<br>
</div>&gt; &gt; *ERROR: Command execution failed: Exited with 1<br>
<div class=3D"im">&gt; &gt;&gt;<br>
&gt; &gt;&gt; Summary: There was 1 WARNING message shown.<br>
&gt; &gt;&gt; Summary: There were 2 ERROR messages shown, returning a non-z=
ero exit<br>
&gt; &gt;&gt; code.<br>
</div><div class=3D"im">&gt; &gt;&gt; *<br>
&gt; &gt;&gt; What is the mistake, sounds too silly.!<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; yocto mailing list<br>
&gt; &gt; <a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org<=
/a><br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/yocto" target=
=3D"_blank">https://lists.yoctoproject.org/listinfo/yocto</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
</div>&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br>
</blockquote></div><br></div></div>

--047d7b2e07e73d151004df268360--
