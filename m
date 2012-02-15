Return-Path: <r-monk@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 986B8E01370
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:11:26 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1FFBNBc027392;
	Wed, 15 Feb 2012 09:11:23 -0600
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1FFBM6b004337;
	Wed, 15 Feb 2012 09:11:23 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE73.ent.ti.com ([fe80::a454:462:d009:b2c%21]) with mapi id
	14.01.0323.003; Wed, 15 Feb 2012 16:11:23 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: Peter Bigot <bigotp@acm.org>
Thread-Topic: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues related to
	installer
Thread-Index: AQHM4SHgA9+zicKU1U+8ZRghoPx9HpY+JZIA
Date: Wed, 15 Feb 2012 15:11:21 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B5E7FDB@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<4C82F39BABFE6A429733A300DEBF52240B5AC841@DNCE02.ent.ti.com>
	<CAPOJ94NTu_TMaJ_hYOvtpHmJDyQyfOythjYRtBukCeUKYgtFOw@mail.gmail.com>
In-Reply-To: <CAPOJ94NTu_TMaJ_hYOvtpHmJDyQyfOythjYRtBukCeUKYgtFOw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.88.84]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 15 Feb 2012 15:11:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2012 at 20:41:26, Peter Bigot wrote:
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues
> related to installer
>
> On Tue, Jan 31, 2012 at 6:45 PM, Monk, Roger <r-monk@ti.com> wrote:
> > Hi Peter,
> >
> > On Tue, Jan 31, 2012 at 12:40:53, Peter A. Bigot wrote:
> >> Subject: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues related
> >> to installer
> >>
> >> From: "Peter A. Bigot" <bigotp@acm.org>
> >>
> >> This patch set re-submits the (updated) uncommitted parts of my
> >> 27Dec2011 patch set to get gstreamer-ti and its dependencies to
> build
> >> in a pristine work environment.  It was left back on 29Dec2011 with:
> >>
> >> > I'm going to wait for Roger to get back from holidays to comment
> on
> >> the installer issues, I'll push the CE and dmai patches later today.
> >>
> >
> > Thanks for re-basing/re-submitting - sorry this has taken a while.
>  Your patches look good - however, I have some other failing installer
> scenarios like these for which I have a similar, but unfortunately,
> not the same patchset, in progress.  I hope to review yours in the
> coming days if ok.
>
> That's fine.  Rather than bug everybody with update emails while the
> two approaches are reconciled, these fixes are available at
> https://github.com/pabigot/meta-ti/tree/ti-eula-unpack.  There you'll
> find the corresponding change as required for omap3-sgx-modules.
>
> Peter
>

Thanks Peter - sorry for the delay.  Looks like I can add my patches separa=
tely.  I follow-up with those.

You're patchset looks good to go from me - thanks for the time and effort y=
ou put into this.

~roger


> >> The installer issues are:
> >>
> >> ti-eula-unpack spawns the installer, then writes canned input to it
> >> to do things like set the output directory.  The function that does
> >> this explicitly tacks a second newline on, in addition to the one
> >> normally added by Python's print statement.
> >>
> >> For ti-cgt6x, the result is that a bare newline is fed to the
> >> installer at the point where the installation directory is
> requested,
> >> instead of the workdir.  Hence, the default directory gets used;
> >> for this package, that's in /opt/TI.
> >>
> >> For ti-xdctools, ti-edma3lld, and ti-dspbios, the bare newline also
> >> caused the default installation directory to be requested, but for
> >> this package that's ${HOME}/ti.  Since ti-eula-unpack overrides the
> >> HOME environment variable to be the work directory, everything
> >> somehow happened to work out, at least for other folks.  I don't
> >> think that's a great solution though, so I updated the recipes to
> >> do it "right", by changing the commands to conform to what the
> >> current
> installers expect.
> >> There may be other installation recipes for other tools that need
> the
> >> same fixes.
> >>
> >> For the 31Jan2012 attempt, similar changes had to be made to
> >> ti-codecs- omap3530.
> >>
> >> For the 31Jan2012 attempt, the ti-dmai build required more than
> >> just altering the striplevel: the ${S} value had to be changed
> >> since
> there
> >> was no Makefile at its original value.  There is still an issue
> >> that prevents use of where make 3.85 produces a "Entering an
> >> unknown directory" failure in do_install, but that's an upstream
> >> problem: I just used make 3.81 to complete the build.
> >>
> >> Peter A. Bigot (4):
> >>   ti-eula-unpack: remove extraneous newline in cmd output
> >>   various: fix installation directories for corrected
> >> ti-eula-unpack
> >>   ti-codecs-omap3530: fix for corrected ti-eula-unpack
> >>   ti-dmai_svn: correct path within svn checkout
> >>
> >>  recipes-ti/bios/ti-dspbios.inc                     |    3 ++-
> >>  .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   20
> >> ++++++++++--
> >> --------
> >>  recipes-ti/devtools/ti-xdctools.inc                |    3 ++-
> >>  recipes-ti/dmai/ti-dmai_svn.bb                     |    9
> >> ++++++---
> >>  recipes-ti/edma3lld/ti-edma3lld.inc                |    3 ++-
> >>  recipes-ti/includes/ti-eula-unpack.inc             |    2 +-
> >>  6 files changed, 23 insertions(+), 17 deletions(-)
> >>
> >> --
> >> 1.7.6.4
> >>
> >>
> > Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL.
> > Registered in England & Wales under company number 00574102
> >
> >
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> >




