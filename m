Return-Path: <pabigot@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50E36E0030B
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:33:00 -0800 (PST)
Received: by werf1 with SMTP id f1so997056wer.35
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=texYLsp2Bg1gjCbDJ9iXHtEy2U8bwJJ06H2xbDsvQ4I=;
	b=OFe3y42gwyBp9MC8O1FWRyQCg5L3SnHxZvlozyA2xXlK6AYndVXwDyteWI91WAPcgV
	UynxC8SXIGjAvJxFUd7tKu71ss08WSXynkZpunC4pMitVOOVJXwR6VJgninvpaG0+F4r
	6uGWhqBbgnw6+b0kB+/JY9aI4JjL+ZNnrcD5s=
MIME-Version: 1.0
Received: by 10.180.74.177 with SMTP id u17mr19920866wiv.13.1329319978731;
	Wed, 15 Feb 2012 07:32:58 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.51.69 with HTTP; Wed, 15 Feb 2012 07:32:58 -0800 (PST)
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B5E7FDB@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<4C82F39BABFE6A429733A300DEBF52240B5AC841@DNCE02.ent.ti.com>
	<CAPOJ94NTu_TMaJ_hYOvtpHmJDyQyfOythjYRtBukCeUKYgtFOw@mail.gmail.com>
	<4C82F39BABFE6A429733A300DEBF52240B5E7FDB@DNCE02.ent.ti.com>
Date: Wed, 15 Feb 2012 09:32:58 -0600
X-Google-Sender-Auth: DA1ycb998TQsS-pNze-aI7xGKeU
Message-ID: <CAPOJ94NmSoE78dKhS6kVVVNd7+SuCaJrYbsz28ZAE29ebYA91A@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: "Monk, Roger" <r-monk@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 0/4] Resubmit TI DSP build issues related to installer
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
X-List-Received-Date: Wed, 15 Feb 2012 15:33:00 -0000
Content-Type: multipart/alternative; boundary=f46d0438900b2009cd04b9026d38

--f46d0438900b2009cd04b9026d38
Content-Type: text/plain; charset=ISO-8859-1

Thanks.  I just sent the one additional change that I made on the mentioned
branch after the ones I'd previously submitted.

I'm not working BeagleBoard this week, so if there are problems due to
subsequent changes and things need to be rebased I won't be able to get to
it until next week.  I think I saw something about dmai that might conflict.

Peter

On Wed, Feb 15, 2012 at 9:11 AM, Monk, Roger <r-monk@ti.com> wrote:

> On Wed, Feb 01, 2012 at 20:41:26, Peter Bigot wrote:
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues
> > related to installer
> >
> > On Tue, Jan 31, 2012 at 6:45 PM, Monk, Roger <r-monk@ti.com> wrote:
> > > Hi Peter,
> > >
> > > On Tue, Jan 31, 2012 at 12:40:53, Peter A. Bigot wrote:
> > >> Subject: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues related
> > >> to installer
> > >>
> > >> From: "Peter A. Bigot" <bigotp@acm.org>
> > >>
> > >> This patch set re-submits the (updated) uncommitted parts of my
> > >> 27Dec2011 patch set to get gstreamer-ti and its dependencies to
> > build
> > >> in a pristine work environment.  It was left back on 29Dec2011 with:
> > >>
> > >> > I'm going to wait for Roger to get back from holidays to comment
> > on
> > >> the installer issues, I'll push the CE and dmai patches later today.
> > >>
> > >
> > > Thanks for re-basing/re-submitting - sorry this has taken a while.
> >  Your patches look good - however, I have some other failing installer
> > scenarios like these for which I have a similar, but unfortunately,
> > not the same patchset, in progress.  I hope to review yours in the
> > coming days if ok.
> >
> > That's fine.  Rather than bug everybody with update emails while the
> > two approaches are reconciled, these fixes are available at
> > https://github.com/pabigot/meta-ti/tree/ti-eula-unpack.  There you'll
> > find the corresponding change as required for omap3-sgx-modules.
> >
> > Peter
> >
>
> Thanks Peter - sorry for the delay.  Looks like I can add my patches
> separately.  I follow-up with those.
>
> You're patchset looks good to go from me - thanks for the time and effort
> you put into this.
>
> ~roger
>
>
> > >> The installer issues are:
> > >>
> > >> ti-eula-unpack spawns the installer, then writes canned input to it
> > >> to do things like set the output directory.  The function that does
> > >> this explicitly tacks a second newline on, in addition to the one
> > >> normally added by Python's print statement.
> > >>
> > >> For ti-cgt6x, the result is that a bare newline is fed to the
> > >> installer at the point where the installation directory is
> > requested,
> > >> instead of the workdir.  Hence, the default directory gets used;
> > >> for this package, that's in /opt/TI.
> > >>
> > >> For ti-xdctools, ti-edma3lld, and ti-dspbios, the bare newline also
> > >> caused the default installation directory to be requested, but for
> > >> this package that's ${HOME}/ti.  Since ti-eula-unpack overrides the
> > >> HOME environment variable to be the work directory, everything
> > >> somehow happened to work out, at least for other folks.  I don't
> > >> think that's a great solution though, so I updated the recipes to
> > >> do it "right", by changing the commands to conform to what the
> > >> current
> > installers expect.
> > >> There may be other installation recipes for other tools that need
> > the
> > >> same fixes.
> > >>
> > >> For the 31Jan2012 attempt, similar changes had to be made to
> > >> ti-codecs- omap3530.
> > >>
> > >> For the 31Jan2012 attempt, the ti-dmai build required more than
> > >> just altering the striplevel: the ${S} value had to be changed
> > >> since
> > there
> > >> was no Makefile at its original value.  There is still an issue
> > >> that prevents use of where make 3.85 produces a "Entering an
> > >> unknown directory" failure in do_install, but that's an upstream
> > >> problem: I just used make 3.81 to complete the build.
> > >>
> > >> Peter A. Bigot (4):
> > >>   ti-eula-unpack: remove extraneous newline in cmd output
> > >>   various: fix installation directories for corrected
> > >> ti-eula-unpack
> > >>   ti-codecs-omap3530: fix for corrected ti-eula-unpack
> > >>   ti-dmai_svn: correct path within svn checkout
> > >>
> > >>  recipes-ti/bios/ti-dspbios.inc                     |    3 ++-
> > >>  .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   20
> > >> ++++++++++--
> > >> --------
> > >>  recipes-ti/devtools/ti-xdctools.inc                |    3 ++-
> > >>  recipes-ti/dmai/ti-dmai_svn.bb                     |    9
> > >> ++++++---
> > >>  recipes-ti/edma3lld/ti-edma3lld.inc                |    3 ++-
> > >>  recipes-ti/includes/ti-eula-unpack.inc             |    2 +-
> > >>  6 files changed, 23 insertions(+), 17 deletions(-)
> > >>
> > >> --
> > >> 1.7.6.4
> > >>
> > >>
> > > Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL.
> > > Registered in England & Wales under company number 00574102
> > >
> > >
> Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL.
> Registered in England & Wales under company number 00574102
>
> _______________________________________________
> > >> meta-ti mailing list
> > >> meta-ti@yoctoproject.org
> > >> https://lists.yoctoproject.org/listinfo/meta-ti
> > >
> > >
> > >
>
>
>
>

--f46d0438900b2009cd04b9026d38
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks.=A0 I just sent the one additional change that I made on the mention=
ed branch after the ones I&#39;d previously submitted.<br><br>I&#39;m not w=
orking BeagleBoard this week, so if there are problems due to subsequent ch=
anges and things need to be rebased I won&#39;t be able to get to it until =
next week.=A0 I think I saw something about dmai that might conflict.<br>
<br>Peter<br><br><div class=3D"gmail_quote">On Wed, Feb 15, 2012 at 9:11 AM=
, Monk, Roger <span dir=3D"ltr">&lt;<a href=3D"mailto:r-monk@ti.com">r-monk=
@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Wed, Feb 01, 2012 at 20:41:26, Peter Bigot wrote:<br>
&gt; Cc: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt; Subject: Re: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues<br>
<div class=3D"im">&gt; related to installer<br>
&gt;<br>
&gt; On Tue, Jan 31, 2012 at 6:45 PM, Monk, Roger &lt;<a href=3D"mailto:r-m=
onk@ti.com">r-monk@ti.com</a>&gt; wrote:<br>
&gt; &gt; Hi Peter,<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Jan 31, 2012 at 12:40:53, Peter A. Bigot wrote:<br>
&gt; &gt;&gt; Subject: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues r=
elated<br>
&gt; &gt;&gt; to installer<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; From: &quot;Peter A. Bigot&quot; &lt;<a href=3D"mailto:bigotp=
@acm.org">bigotp@acm.org</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This patch set re-submits the (updated) uncommitted parts of =
my<br>
&gt; &gt;&gt; 27Dec2011 patch set to get gstreamer-ti and its dependencies =
to<br>
&gt; build<br>
&gt; &gt;&gt; in a pristine work environment. =A0It was left back on 29Dec2=
011 with:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; I&#39;m going to wait for Roger to get back from holiday=
s to comment<br>
&gt; on<br>
&gt; &gt;&gt; the installer issues, I&#39;ll push the CE and dmai patches l=
ater today.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks for re-basing/re-submitting - sorry this has taken a while=
.<br>
&gt; =A0Your patches look good - however, I have some other failing install=
er<br>
&gt; scenarios like these for which I have a similar, but unfortunately,<br=
>
&gt; not the same patchset, in progress. =A0I hope to review yours in the<b=
r>
&gt; coming days if ok.<br>
&gt;<br>
&gt; That&#39;s fine. =A0Rather than bug everybody with update emails while=
 the<br>
&gt; two approaches are reconciled, these fixes are available at<br>
&gt; <a href=3D"https://github.com/pabigot/meta-ti/tree/ti-eula-unpack" tar=
get=3D"_blank">https://github.com/pabigot/meta-ti/tree/ti-eula-unpack</a>. =
=A0There you&#39;ll<br>
&gt; find the corresponding change as required for omap3-sgx-modules.<br>
&gt;<br>
&gt; Peter<br>
&gt;<br>
<br>
</div>Thanks Peter - sorry for the delay. =A0Looks like I can add my patche=
s separately. =A0I follow-up with those.<br>
<br>
You&#39;re patchset looks good to go from me - thanks for the time and effo=
rt you put into this.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
~roger<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; &gt;&gt; The installer issues are:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ti-eula-unpack spawns the installer, then writes canned input=
 to it<br>
&gt; &gt;&gt; to do things like set the output directory. =A0The function t=
hat does<br>
&gt; &gt;&gt; this explicitly tacks a second newline on, in addition to the=
 one<br>
&gt; &gt;&gt; normally added by Python&#39;s print statement.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For ti-cgt6x, the result is that a bare newline is fed to the=
<br>
&gt; &gt;&gt; installer at the point where the installation directory is<br=
>
&gt; requested,<br>
&gt; &gt;&gt; instead of the workdir. =A0Hence, the default directory gets =
used;<br>
&gt; &gt;&gt; for this package, that&#39;s in /opt/TI.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For ti-xdctools, ti-edma3lld, and ti-dspbios, the bare newlin=
e also<br>
&gt; &gt;&gt; caused the default installation directory to be requested, bu=
t for<br>
&gt; &gt;&gt; this package that&#39;s ${HOME}/ti. =A0Since ti-eula-unpack o=
verrides the<br>
&gt; &gt;&gt; HOME environment variable to be the work directory, everythin=
g<br>
&gt; &gt;&gt; somehow happened to work out, at least for other folks. =A0I =
don&#39;t<br>
&gt; &gt;&gt; think that&#39;s a great solution though, so I updated the re=
cipes to<br>
&gt; &gt;&gt; do it &quot;right&quot;, by changing the commands to conform =
to what the<br>
&gt; &gt;&gt; current<br>
&gt; installers expect.<br>
&gt; &gt;&gt; There may be other installation recipes for other tools that =
need<br>
&gt; the<br>
&gt; &gt;&gt; same fixes.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For the 31Jan2012 attempt, similar changes had to be made to<=
br>
&gt; &gt;&gt; ti-codecs- omap3530.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For the 31Jan2012 attempt, the ti-dmai build required more th=
an<br>
&gt; &gt;&gt; just altering the striplevel: the ${S} value had to be change=
d<br>
&gt; &gt;&gt; since<br>
&gt; there<br>
&gt; &gt;&gt; was no Makefile at its original value. =A0There is still an i=
ssue<br>
&gt; &gt;&gt; that prevents use of where make 3.85 produces a &quot;Enterin=
g an<br>
&gt; &gt;&gt; unknown directory&quot; failure in do_install, but that&#39;s=
 an upstream<br>
&gt; &gt;&gt; problem: I just used make 3.81 to complete the build.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Peter A. Bigot (4):<br>
&gt; &gt;&gt; =A0 ti-eula-unpack: remove extraneous newline in cmd output<b=
r>
&gt; &gt;&gt; =A0 various: fix installation directories for corrected<br>
&gt; &gt;&gt; ti-eula-unpack<br>
&gt; &gt;&gt; =A0 ti-codecs-omap3530: fix for corrected ti-eula-unpack<br>
&gt; &gt;&gt; =A0 ti-dmai_svn: correct path within svn checkout<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; =A0recipes-ti/bios/ti-dspbios.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A03 ++-<br>
&gt; &gt;&gt; =A0.../codec-engine/<a href=3D"http://ti-codecs-omap3530_4.00=
.00.00.bb" target=3D"_blank">ti-codecs-omap3530_4.00.00.00.bb</a> =A0| =A0 =
20<br>
&gt; &gt;&gt; ++++++++++--<br>
&gt; &gt;&gt; --------<br>
&gt; &gt;&gt; =A0recipes-ti/devtools/ti-xdctools.inc =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A03 ++-<br>
&gt; &gt;&gt; =A0recipes-ti/dmai/<a href=3D"http://ti-dmai_svn.bb" target=
=3D"_blank">ti-dmai_svn.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A09<br>
&gt; &gt;&gt; ++++++---<br>
&gt; &gt;&gt; =A0recipes-ti/edma3lld/ti-edma3lld.inc =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A03 ++-<br>
&gt; &gt;&gt; =A0recipes-ti/includes/ti-eula-unpack.inc =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-<br>
&gt; &gt;&gt; =A06 files changed, 23 insertions(+), 17 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 1.7.6.4<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt; Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7=
YL.<br>
&gt; &gt; Registered in England &amp; Wales under company number 00574102<b=
r>
&gt; &gt;<br>
&gt; &gt;<br>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England &amp; Wales under company number 00574102<br>
<br>
_______________________________________________<br>
&gt; &gt;&gt; meta-ti mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproj=
ect.org</a><br>
&gt; &gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" t=
arget=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
<br>
<br>
</div></div></blockquote></div><br>

--f46d0438900b2009cd04b9026d38--
